import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Discover our best cocktails", "Enjoy", "Cheers"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
