import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sendoffer"
export default class extends Controller {
  static values = {
    id: Number
  }

  connect() {
    console.log(this.idValue);
  }

  send() {
    const url = `/products/${this.idValue}/offers`
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    console.log(url);
    fetch(url, { // Second argument allows to precise verb, headers and body
      method: "POST",
      headers: {
        "X-CSRF-TOKEN": csrfToken
      },
      body: {}}
    )
    console.log("sent fetch");
  }
}
