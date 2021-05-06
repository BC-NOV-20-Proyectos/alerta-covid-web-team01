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

if (currentDate && currentTime)
  setInterval(() => {
    let time = new Date();

    currentTime.textContent = time.toLocaleTimeString();
    currentDate.textContent = `${time.toLocaleDateString()} ${
      DAYS[time.getDay()]
    }`;
  }, 1000);
