let select = document.getElementById("select");

const onChange = () => {
  let places = document.getElementById("places");
  if (select.value === "false") {
    places.style.display = "none";
  } else {
    places.style.display = "block";
  }
};

onChange();

select.addEventListener("click", onChange);
