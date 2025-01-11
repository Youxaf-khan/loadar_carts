import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slider", "value", "finalTotal"]
  static values = { subtotal: Number }

  connect() {
    // Listen for input on the slider
    this.sliderTarget.addEventListener("input", this.updateDiscount.bind(this))
  }

  updateDiscount(event) {
    const discount = parseFloat(this.sliderTarget.value)
    this.valueTarget.textContent = `$${discount.toFixed(2)}`
    const total = Math.max(this.subtotalValue - discount, 0)
    this.finalTotalTarget.textContent = `$${total.toFixed(2)}`
  }
}
