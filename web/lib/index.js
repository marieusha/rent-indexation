
const form = document.querySelector('#indexation-form');

const startDate = document.getElementById('#start-date');
const signedOn = document.getElementById('#signed-on');
const baseRent = document.getElementById('#base-rent');
const region = document.getElementById('input[name=RegionOptions]:checked');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  console.log(`Start date: ${startDate.value}`);
  console.log(`Contract signed on: ${signedOn.value}`);
  console.log(`Base rent: ${baseRent.value}`);
  console.log(`Region: ${region.value}`);
});

const formData = { start_date: startDate.value, signed_on: signedOn.value, base_rent: baseRent.value, region: region.value };

const inputNewForm = (event) => {
  fetch('/v1/indexations', {
    method: "POST",
    body: JSON.stringify(formData)
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
};

const input = document.querySelector("#submit");
input.addEventListener("submit", inputNewForm);
