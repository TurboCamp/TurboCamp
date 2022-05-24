import { Controller } from "stimulus"
import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")

export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      
    })
  }
}
