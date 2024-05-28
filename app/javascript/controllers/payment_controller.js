import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="payment"
export default class extends Controller {
  static targets = ["selection", "additionalFields"];

  connect() {
    console.log("connected to payment controller..");
    this.showAdditionalFields();
  }

  showAdditionalFields() {
    const selection = this.selectionTarget.value;
    console.log(selection);
    for (let fields of this.additionalFieldsTargets) {
      console.log(fields.dataset.type);
      fields.disabled = fields.hidden = fields.dataset.type != selection;
    }
  }
}
