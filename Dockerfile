# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.1.2
FROM ruby:${RUBY_VERSION}-slim as base

# Set production environment
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development \
    NODE_ENV=production

# Install base dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /rails

# Build stage
FROM base as build

ARG SECRET_KEY_BASE
ARG NODE_VERSION=18.x
ARG YARN_VERSION=1.22.19

# Install build dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
    libvips \
    pkg-config \
    python3 \
    shared-mime-info

# Install Node.js from official repository
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_VERSION} nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn@${YARN_VERSION}

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ $BUNDLE_PATH/ruby/*/cache $BUNDLE_PATH/ruby/*/bundler/gems/*/.git

# Copy application code
COPY . .

# Precompile assets
RUN bundle exec rails assets:precompile

# Final stage
FROM base

# Install runtime dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    libvips \
    postgresql-client \
    imagemagick && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built artifacts from build stage
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Set up non-root user
RUN useradd rails --create-home --shell /bin/bash && \
    mkdir -p /rails/tmp/cache && \
    chown -R rails:rails /rails
USER rails:rails

# Entrypoint and healthcheck
ENTRYPOINT ["/rails/bin/docker-entrypoint"]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/up || exit 1

EXPOSE 3000
CMD ["./bin/rails", "server"]