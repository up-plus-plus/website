
var background = document.querySelector("div.parallax_background");

window.addEventListener("scroll", function(evt) {
    // console.log(evt.pageY);
    background.style.top = (evt.pageY / 2) + "px";
});