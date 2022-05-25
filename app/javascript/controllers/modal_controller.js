import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['container']
 
  open() {
    this.element.children[1].setAttribute("class", "visible bg-theme-0 bg-opacity-60 overflow-y-auto overflow-x-hidden animated fadeIn fixed inset-0 flex items-center justify-center z-50 w-full md:inset-0 md:h-full")
  }
}
