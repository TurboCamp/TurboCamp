import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['output', 'input']

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
 
  hide() {
    this.element.setAttribute('class', 'hidden')
  }
  
  cancel() {
    this.element.remove()
  }
}
