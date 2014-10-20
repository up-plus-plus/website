//! UP++ Code for the www.uppp.eu website
//! Copyright: UP++ Authors
//! License: Apache 2.0

uppp = {
  "init" : function() {
      var background = document.querySelector("div.parallax_background");
      var bkg_offset = background.getBoundingClientRect().top;
      console.log(bkg_offset);
      window.addEventListener("scroll", function (evt) {
          background.style.top = bkg_offset + (evt.pageY / 2) + "px";
      });
  }
};

document.onreadystatechange = function () {
    if (document.readyState == "interactive") {
        uppp.init();
    }
};
