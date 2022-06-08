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
      uploadImage:true,
      maxHeight:"150px",
      placeholder:"Type here . . .",
      toolbar:["bold", "italic" , "strikethrough" ,"code" , "|" , "heading","heading-1","heading-2","heading-3","heading-smaller","heading-bigger","quote","|", "upload-image" ,"preview" , "|" , "undo" , "redo"]
      
    })
  }

  disconnect() {
    this.editor.toTextArea()
    this.editor.cleanup()
    this.editor = null
  }
}
