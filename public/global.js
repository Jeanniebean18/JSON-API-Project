var hamburgerMenu = document.getElementById("hamburger");
var mobileMenu = document.getElementById("mobile_menu");


// Hamburger menu
hamburgerMenu.onclick = toggle_visibility;

function toggle_visibility() {
 
  if (mobileMenu.style.display == "block") {
    mobileMenu.style.display = "none";
  } 
  else {  mobileMenu.style.display ="block";
}
}
// Hamburger menu

// toggle pets and events


var events = document.getElementById("events");
var pets = document.getElementById("pets");

var square_button = document.getElementById("square_button");
var square_button2 = document.getElementById("square_button2");

square_button.onclick = show_events;

function show_events() {
events.style.display = "block"
pets.style.display = "none";
}
  
square_button2.onclick = show_pets;

function show_pets() {
events.style.display = "none";
pets.style.display = "block";


}




