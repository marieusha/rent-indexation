
const form = document.querySelector('#indexation-form');

const startDate = document.querySelector('#start-date');
const signedOn = document.querySelector('#signed-on');
const baseRent = document.querySelector('#base-rent');
const region = document.querySelector('input[name=RegionOptions]:checked');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  console.log(`Start date: ${startDate.value}`);
  console.log(`Contract signed on: ${signedOn.value}`);
  console.log(`Base rent: ${baseRent.value}`);
  console.log(`Region: ${region.value}`);
});

// const inputNewForm = (event) => {
//   fetch('/v1/indexations', {
//     method: "POST",
//     body: JSON.stringify(form)
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data); // Look at local_names.default
//     });
// };

// const input = document.querySelector("#submit");
// input.addEventListener("submit", inputNewForm);
