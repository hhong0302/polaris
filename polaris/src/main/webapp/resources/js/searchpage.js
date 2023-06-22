const likeimgswList = document.querySelectorAll(".likeimgsw");


likeimgswList.forEach(function(likeimgsw) {
  likeimgsw.addEventListener("click", function(event) {
    event.preventDefault();

 
    const likeimg1 = this.querySelector(".likeimg1");
    const likeimg2 = this.querySelector(".likeimg2");

    if (likeimg1.style.display === "none") {
      likeimg1.style.display = "block";
      likeimg2.style.display = "none";
    } else {
      likeimg1.style.display = "none";
      likeimg2.style.display = "block";
    }
  });
});