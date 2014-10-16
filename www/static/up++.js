//! UP++ Code for the www.uppp.eu website
//! Copyright: UP++ Authors
//! License: Apache 2.0

uppp = {
  "init" : function() {
      var background = document.querySelector("div.parallax_background");
      window.addEventListener("scroll", function (evt) {
          background.style.top = (evt.pageY / 2) + "px";
      });
  }
};

document.onreadystatechange = function () {
    if (document.readyState == "interactive") {
        uppp.init();
    }
};
