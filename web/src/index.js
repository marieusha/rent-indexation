
const url = 'http://localhost:4567/v1/indexations'
const form = document.querySelector('#indexation-form');
const list = document.querySelector('#results');
const startOver = document.getElementById("start-over");
const startDate = document.getElementById('start-date');
const signedOn = document.getElementById('signed-on');
const baseRent = document.getElementById('base-rent');

const updateForm = () => {
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      list.innerHTML = "";
      data.list.forEach((result) => {
        const newRent = `<li>Your new indexed rent is ${result.new_rent} €, with a current index of ${result.current_index} and a base index of ${result.base_index}</li>`
        list.insertAdjacentHTML("afterbegin", newRent);
      });
    });
};

const postInputForm = (input, callback) => {
  fetch(url, {
    method: "POST",
    body: JSON.stringify(input)
  }).then(response => response.json())
    .then((data) => {
      console.log(data);
      callback();
    });
};

form.addEventListener('submit', (event) => {
  event.preventDefault();
  const data = { start_date: startDate.value, signed_on: signedOn.value, base_rent: baseRent.value };
  postInputForm(data, updateForm);
});

startOver.addEventListener("click", updateForm);
document.addEventListener("DOMContentLoaded", updateForm);



