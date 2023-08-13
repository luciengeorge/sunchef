import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static values = {url: String}

  connect() {
    console.log(this.urlValue)
    const downloadingImg = new Image()
    downloadingImg.onload = () => {
      console.log('here')
      this.element.src = downloadingImg.src
    }
    downloadingImg.src = this.urlValue
  }
}
