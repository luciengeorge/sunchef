import { Controller } from '@hotwired/stimulus';
import $ from 'jquery';
import slick from 'slick-carousel';

export default class extends Controller {
  static classes = ['element'];
  connect() {
    $(`.${this.elementClass}`).slick({
      infinite: true,
      mobileFirst: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      adaptiveHeight: true,
      autoplay: true,
      lazyLoad: 'ondemand',
      prevArrow: '<i class="bi bi-chevron-left"></i>',
      nextArrow: '<i class="bi bi-chevron-right"></i>',
      responsive: [
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 2,
          },
        },
        {
          breakpoint: 992,
          settings: {
            slidesToShow: 3,
          },
        },
        {
          breakpoint: 1200,
          settings: {
            slidesToShow: 3,
          },
        },
      ],
    });
  }
}
