let currentTime = document.getElementById("currentTime");
let currentDate = document.getElementById("currentDate");

const DAYS = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

document.addEventListener("DOMContentLoaded", function () {
  setInterval(() => {
    let time = new Date();

    currentTime.textContent = time.toLocaleTimeString();
    currentDate.textContent = `${time.toLocaleDateString()} ${
      DAYS[time.getDay()]
    }`;
  }, 1000);
});
