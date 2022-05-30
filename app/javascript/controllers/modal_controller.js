import { Controller } from "stimulus"


export default class extends Controller {
    
  cancel(){
    this.element.remove()
  }
}