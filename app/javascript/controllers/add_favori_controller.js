import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-favori"
export default class extends Controller {

  static values = {
    gameId: Number,
    favoriId: Number
  }

  static targets = ["cardGame"]

  createFavori() {
    console.log(this.cardGameTarget);
    const url = `/favoris?game_id=${this.gameIdValue}`;
    console.log(url);
    fetch(url, {
      method: 'POST',
      body: {id: this.gameIdValue },
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content,
        'Accept': 'text/plain'
      }
    })
    .then(response => response.text())
    .then(data => {
        this.cardGameTarget.outerHTML = data;
      })
  }

  destroyFavori() {
    const url = `/favoris/${this.favoriIdValue}`;
    fetch(url, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content,
        'Accept': 'text/plain'
      }
    })
    .then(response => response.text())
    .then(data => {
      this.cardGameTarget.outerHTML = data;
    })
  }
}
