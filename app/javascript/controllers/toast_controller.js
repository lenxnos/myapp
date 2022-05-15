// This file was created by the command: rails generate stimulus toast
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
  }

  notify({ params: { selector } }) {
    const toastEl = document.querySelector(selector)
    const toast = new bootstrap.Toast(toastEl)
    toast.show()
  }
}
