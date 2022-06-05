import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['output', 'input', 'container']

  readURL() {
    var input = this.inputTarget
    var output = this.outputTarget

    if (input.files && input.files[0]) {
      var reader = new FileReader()

      reader.onload = function () {
        output.src = reader.result
      }

      reader.readAsDataURL(input.files[0])
    }
  }

  cancel() {
    this.element.remove()
  }

  hide() {
    this.element.setAttribute('class', 'hidden')
  }

  close(e) {
    if (!this.containerTarget.contains(e.target)) {
      this.hide()
    }
  }
}
