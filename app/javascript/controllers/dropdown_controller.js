import { Controller } from '@hotwired/stimulus'
import { useTransition } from 'stimulus-use'

export default class extends Controller {
  static targets = ['toggle', 'close']

  connect() {
    useTransition(this, {
      element: this.toggleTarget,
      transitioned: false,
    })
  }

  toggle() {
    this.toggleTransition()
  }

  close(e) {
    this.leave()
  }
}
