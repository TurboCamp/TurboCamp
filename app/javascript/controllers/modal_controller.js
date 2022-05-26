import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['container']

  close() {
    this.element.setAttribute("class", "hidden")
  }
}
