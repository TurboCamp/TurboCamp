import { Controller } from '@hotwired/stimulus'
import { useTransition } from 'stimulus-use'

export default class extends Controller {
  static targets = ['toggle']
  
  connect() {
    useTransition(this, {
      element: this.toggleTarget,
    })
  }

  toggle() {
    this.toggleTransition()
  }

  close() {
    this.leave()
  }
}
