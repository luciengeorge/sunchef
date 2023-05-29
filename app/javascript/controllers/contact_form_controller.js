import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['women', 'word', 'firstName', 'email', 'form'];
  static values = {
    word: String,
  };

  toggleGender() {
    const currentWord = this.wordTarget.innerText;
    this.wordTarget.innerText = this.wordValue;
    this.wordValue = currentWord;
    this.womenTarget.classList.toggle('d-none', !this._showWomen());
    this.firstNameTarget.placeholder = this._showWomen() ? 'Jane' : 'John';
    this.emailTarget.placeholder = this._showWomen()
      ? 'janesmith@gmail.com'
      : 'johnsmith@gmail.com';
  }

  submitEnd(event) {
    console.log();
    if (event.detail.success) {
      this.formTarget.reset();
    } else {
      event.detail.fetchResponse.response.json().then((data) => {
        this.formTarget.outerHTML = data.form;
      });
    }
  }

  _showWomen() {
    return this.wordValue === 'MEN';
  }
}
