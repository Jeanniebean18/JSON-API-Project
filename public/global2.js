var quotes = ['" The more boys I meet the more I love my dog. " - Carrie Underwood', '" Every dog has his day, unless he loses his tail, then he has a weak-end. " - June Carter Cash', 
'" The better I get to know men, the more I find myself loving dogs." - Charles de Gaulle', '" Dogs are not our whole life, but they make our lives whole. " - Roger Caras'];
var quoteOfDay = document.getElementById("quote");

var getquote = function() {

quoteOfDay.innerHTML = quotes[Math.floor(Math.random() * 4)];

}









