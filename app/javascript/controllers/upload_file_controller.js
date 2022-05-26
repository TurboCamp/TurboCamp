import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['upload_form']
  upload(e) {
    e.preventDefault()
    this.upload_formTarget.classList.remove("hidden")
  }

  submit(){
    this.upload_formTarget.classList.add("hidden")
  }
}