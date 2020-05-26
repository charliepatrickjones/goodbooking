require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';

import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
});
