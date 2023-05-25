import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['women', 'word'];
  static values = {
    word: String,
  };
  toggleGender() {
    const currentWord = this.wordTarget.innerText;
    this.wordTarget.innerText = this.wordValue;
    this.wordValue = currentWord;
    this.womenTarget.classList.toggle('d-none', this.wordValue === 'WOMEN');
  }
}
