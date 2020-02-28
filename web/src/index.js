
const form = document.querySelector('#indexation-form');

const startDate = document.getElementById('start-date');
const signedOn = document.getElementById('signed-on');
const baseRent = document.getElementById('base-rent');

const inputNewForm = (event) => {
  const formData = { start_date: startDate.value, signed_on: signedOn.value, base_rent: baseRent.value };
  fetch('http://localhost:4567/v1/indexations', {
    method: "POST",
    body: JSON.stringify(formData)
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
};

form.addEventListener('submit', (event) => {
  event.preventDefault();
  inputNewForm(event);
});

// const input = document.querySelector("#submit");
// input.addEventListener("submit", inputNewForm);




