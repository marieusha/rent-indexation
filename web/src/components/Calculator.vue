<template>
  <div>
    <app-form
      class="calculator-container"
      v-if="!formResult"
      @formSubmit="onSubmit"/>
    <result
      class="calculator-container"
      v-else
      :result="formResult"
      @startOver="formResult=null"/>
  </div>
</template>

<script>

  import axios from 'axios'
  import AppForm from '@/components/Form'
  import Result from '@/components/Result'

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
          .catch(error => console.log(error))
      }
    },
    components: {
      AppForm,
      Result
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
    width:80%;
  }
</style>
