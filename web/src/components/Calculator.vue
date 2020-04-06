<template>
  <div>
    <app-form
      class="calculator-container"
      v-if="!formResult"
      @form-submit="onSubmit"/>
    <app-result
      class="calculator-container"
      v-else
      :result="formResult"
      @start-over="formResult=null"/>
  </div>
</template>

<script>

  import axios from 'axios'
  import AppForm from '@/components/Form'
  import AppResult from '@/components/Result'

  export default {
    data () {
      return {
        formResult: null
      }
    },
    methods: {
      onSubmit (formData) {
        console.log(formData)
        axios.post('http://localhost:4567/v1/indexations', formData)
          .then(res => (this.formResult = res.data))
          .catch(error => console.error(error))
      }
    },
    components: {
      AppForm,
      AppResult
    }
  }
</script>
<style>
  .calculator-container {
    background-color: white;
    border: .2em solid #d3d3d3;
    border-radius: 4px;
    padding: 5em;
    margin: 5em;
  }
</style>
