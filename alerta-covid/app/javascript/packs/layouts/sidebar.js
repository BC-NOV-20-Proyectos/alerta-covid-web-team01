let sidebar = document.getElementById("sidebar");
let sideHome = document.getElementById("side-item-home");
console.log(sideHome);

sideHome.addEventListener("click", () => {
  sidebar.classList.toggle("sidebar-hide");
});
