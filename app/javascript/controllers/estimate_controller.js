import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="estimate"
export default class extends Controller {
  static targets = ["addButton", "box", "cover", "manual", "game", "price"]
  static values = {
    price: Number,
  }

  connect() {
    console.log(this.priceValue);
  }

  toggleAddButton() {
    // console.log('"toggleAddButton" connected.')
    this.addButtonTarget.classList.toggle("d-none")
    // console.log(this.priceTarget.value);
    this.priceTarget.value = this.estimate()
    // console.log(estimate());
  }

  estimate() {
    this.priceValue = (
        1
        - this.dropInValue(this.boxTarget.value)
        - this.dropInValue(this.coverTarget.value)
        - this.dropInValue(this.manualTarget.value)
        - this.dropInValue(this.gameTarget.value)
      )
      * this.priceValue
    return this.priceValue
  }

  dropInValue(grade) {
    if (grade == "A") {
      return 0
    } else if (grade == "B") {
      return 0.10
    } else if (grade == "C") {
      return 0.20
    } else if (grade == "Z") {
      return 0.25
    } else {
        return 0
      }
    }
  }
