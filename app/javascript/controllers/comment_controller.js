import { Controller } from "stimulus"


export default class extends Controller {
  static targets=["commentbtn" , "form"]

  typing(){
    this.commentbtnTarget.classList.add("hidden")
    this.formTarget.classList.remove("hidden")
  }

  submit(){
    this.commentbtnTarget.classList.remove("hidden")
    this.formTarget.classList.add("hidden")
  }
}
