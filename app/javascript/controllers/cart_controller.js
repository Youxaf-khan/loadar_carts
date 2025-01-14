import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity"]

  increment(event) {
    event.preventDefault()
    this.updateQuantity(1)
  }

  decrement(event) {
    event.preventDefault()
    this.updateQuantity(-1)
  }

  async updateQuantity(amount) {
  const quantity = parseInt(this.quantityTarget.textContent, 10) + amount;
  if (quantity < 0) return; // Prevent quantity from going below 1

  const url = this.element.dataset.updateUrl;
  const response = await fetch(url, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
    },
    body: JSON.stringify({ cart_item: { quantity } }),
  });

  if (response.ok) {
    // Replace the cart turbo frame with the updated content
    Turbo.visit(window.location.href, { action: "replace" });
  } else {
    console.error("Failed to update quantity");
  }
}
}
