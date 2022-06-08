import { Controller } from '@hotwired/stimulus'
import { debounce } from 'lodash.debounce'

export default class extends Controller {
  static targets = ['sidebar', 'friendbar', 'addBtn']

  open() {
    const sidebar = this.sidebarTarget.classList
    sidebar.replace('sidebar-close', 'sidebar-open')
  }

  close() {
    const sidebar = this.sidebarTarget.classList
    sidebar.replace('sidebar-open', 'sidebar-close')
  }

  toggle() {
    const friendbar = this.friendbarTarget.classList
    const addBtn = this.addBtnTarget.classList
    if (friendbar[0] == 'user-close') {
      friendbar.replace('user-close', 'user-open')
      addBtn.toggle('opacity-0')
    } else if (friendbar[0] == 'user-open') {
      friendbar.replace('user-open', 'user-close')
      addBtn.toggle('opacity-0')
    }
  }
}
