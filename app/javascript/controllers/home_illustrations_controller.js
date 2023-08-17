import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['home', 'about']

  connect() {
    setInterval(() => {
      this.homeTarget.classList.toggle('d-none')
      this.aboutTarget.classList.toggle('d-none')
    }, [500])
  }
}
