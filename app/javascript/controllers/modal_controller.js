import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    console.log("hello there")
  }
  static targets = ["modal"]

  open(event) {
    event.preventDefault();

    this.modalTarget.showModal();
  }

  close(event) {
    event.preventDefault();

    this.modalTarget.close();
  }
}
