import { Controller } from '@hotwired/stimulus'
import { useTransition } from 'stimulus-use'

export default class extends Controller {
  static targets = ['toggle', 'close', 'container']

  connect() {
    useTransition(this, {
      element: this.toggleTarget,
      transitioned: false,
    })
  }

  toggle() {
    this.toggleTransition()
  }

  hide() {
    this.leave()
  }
}
