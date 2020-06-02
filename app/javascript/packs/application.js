require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'slick-carousel';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';

import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
});


$('.rest-carousel').slick({
  infinite: true,
  slidesToShow: 3,
  slidesToScroll: 3,
  autoplay: true,
  autoplaySpeed: 3000
});

$('.tab-carousel').slick({
  autoplay: true,
  autoplaySpeed: 1000
});


