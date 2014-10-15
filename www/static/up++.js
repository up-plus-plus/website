

uppp = {
  "init" : function() {
      var background = document.querySelector("div.parallax_background");
      window.addEventListener("scroll", function (evt) {
          background.style.top = (evt.pageY / 2) + "px";
      });
  }
}

uppp.init();