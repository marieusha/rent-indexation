
const form = document.querySelector('#indexation-form');
const list = document.querySelector('#results');

const startDate = document.getElementById('start-date');
const signedOn = document.getElementById('signed-on');
const baseRent = document.getElementById('base-rent');



const insertIndexationResults = (data) => {
  data.forEach((result) => {
    const new_rent = `<li>
      New rent: ${result.new_rent}</li>
      <li>Current index: ${result.current_index}</li>
      <li>Base index: ${result.base_index}
    </li>`;
    list.insertAdjacentHTML('beforeend', new_rent);
  });
};


const inputNewForm = (event) => {
  const formData = { start_date: startDate.value, signed_on: signedOn.value, base_rent: baseRent.value };
  fetch('http://localhost:4567/v1/indexations', {
    method: "POST",
    body: JSON.stringify(formData)
  })
    .then(response => response.json())
    .then(insertIndexationResults);
};

form.addEventListener('submit', (event) => {
  event.preventDefault();
  inputNewForm(event);
});





