
const url = 'http://localhost:4567/v1/indexations'
const form = document.querySelector('#indexation-form');
const list = document.querySelector('#results');
const startOver = document.getElementById("start-over");
const startDate = document.getElementById('start-date');
const signedOn = document.getElementById('signed-on');
const baseRent = document.getElementById('base-rent');

  const updateForm = (result) => {
  list.innerHTML = "";
  const newRent = `<br>Your new indexed rent is <b>${result.new_rent.toFixed(2)} €</b>, with a current index of <b>${result.current_index}</b> and a base index of <b>${result.base_index}</b>`
  list.insertAdjacentHTML("afterbegin", newRent);
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


