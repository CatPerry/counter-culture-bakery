// https://www.w3schools.com/w3css/w3css_slideshow.asp
//I stronarmed the example from w3 schools bc it wasnt workign as is. Boom.

let slideIndex = 0;

function carousel() {

  let x = document.getElementsByClassName("mainimg");

  for (let i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > x.length) {
    slideIndex = 1
  }
  x[slideIndex-1].style.display = "block";
  setTimeout(carousel, 3000);
}
carousel();




// let newsletter = document.getElementsByTagName("aside");

// window.addEventListener("scroll", (event) => {
//   if (window.scrollY > 100) {
//     newsletter.classList.add("modalFadeIn");
//   }

// window.addEventListener("mainimg", (event => {
//   if (window.load = true) {
//     mainimg

//   }
// }))

// window.addEventListener("scroll", function () {
//   let header = document.querySelector("header")
//   let sticky = header.offsetTop;

//   function stickyNav() {
//     if (window.pageYOffset >= sticky) {
//       header.classList.add(".sticky")
//     } else {
//       header.classList.remove(".sticky")
//     }
//   } stickyNav()
// })

// let hamburgernav = document.querySelector(".hamburger");
// hamburgernav.addEventListener("click", function() {
//   hamburgernav.classList.toggle("is-active");
// });