import { Controller } from "stimulus"
import EasyMDE from "easymde"
import "easymde/dist/easymde.min.css"

export default class extends Controller {
  initialize() {
    this.editor = null
  }

  connect() {
    this.editor = new EasyMDE({
      element: this.element,
      spellChecker: false,
      uploadImage:true
      
    })
  }

  disconnect() {
    this.editor.toTextArea()
    this.editor.cleanup()
    this.editor = null
  }
}
