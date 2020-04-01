<template>
  <div id="app">
    <h1>Rent indexation calculator</h1>
    <router-view/>
  </div>
</template>

<script>
  import Form from '@/components/Form.vue'
  import Result from '@/components/Result.vue'

  export default {
    name: 'App',
    components: {
      'app-form': Form,
      'app-result': Result
    }
  }
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

</style>
