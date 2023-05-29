import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['women', 'word', 'firstName', 'email'];
  static values = {
    word: String,
  };
  toggleGender() {
    const currentWord = this.wordTarget.innerText;
    this.wordTarget.innerText = this.wordValue;
    this.wordValue = currentWord;
    this.womenTarget.classList.toggle('d-none', this.showWomen());
    this.firstNameTarget.placeholder = this.showWomen() ? 'Jane' : 'John';
    this.emailTarget.placeholder = this._showWomen()
      ? 'janesmith@gmail.com'
      : 'johnsmith@gmail.com';
  }

  _showWomen() {
    return this.wordValue === 'MEN';
  }
}
