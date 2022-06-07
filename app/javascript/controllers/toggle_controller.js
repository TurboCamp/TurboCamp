import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['sidebar']

  open() {
    const sidebar = this.sidebarTarget.classList
    sidebar.add('sidebar-position')
    sidebar.replace('sidebar-close', 'sidebar-open')
  }

  close() {
    const sidebar = this.sidebarTarget.classList
    sidebar.replace('sidebar-open', 'sidebar-close')
    setTimeout(() => {
      sidebar.remove('sidebar-position')
    }, 500);
  }
}
