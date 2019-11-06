
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = (dogs) => {
  let dogsArr = Object.keys(dogs);
  let dogLinks = [];

  dogsArr.forEach(dog => {
    let liTag = document.createElement("li");
    let aTag = document.createElement("a");
    aTag.innerHTML = dog;
    aTag.href = dogs[dog];
    liTag.className = "dog-link";
    liTag.appendChild(aTag);
    dogLinks.push(liTag)
  }) 
  return dogLinks;
};

attachDogLink = function() {
  const dropDown = document.querySelector(".drop-down-dog-list");
  const dogLinks = dogLinkCreator(dogs);
  dogLinks.forEach(dog => {
    dropDown.appendChild(dog);
  }) 
};

attachDogLink();

const handleEnter = () => {
  // find element that says click for more dogs
  const nav = document.getElementsByClassName("drop-down-dog-nav")[0];

  // put event listener on that element "mouseover"
  nav.addEventListener("mouseover", () => {
    const dropDown = document.getElementsByClassName("drop-down-dog-list")[0];
    dropDown.classList.add("visible");
    dropDown.classList.remove("hidden");
  });

  // inside the event listener we want to add a class to our dropdown that makes the dropdown visible 
  nav.addEventListener("mouseleave", () => {
    const dropDown = document.getElementsByClassName("drop-down-dog-list")[0];
    dropDown.classList.remove("visible");
    dropDown.classList.add("hidden");
  });
}

handleEnter();

