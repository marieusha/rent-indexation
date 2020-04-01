<template>
  <div class="col text-center">
    <h4>Your indexed rent amounts to €{{ result.new_rent.toFixed(2) }}</h4>
    <br>
    <p> Base rent (€{{ result.base_rent }}) <strong>X</strong> Current index ({{ result.current_index }})</p>
    <hr>
    <p>Base index ({{ result.base_index }})</p>
    <br>
    <button
      class="btn btn-primary btn-sm"
      id="start-over"
      @click="$emit('startOver')">Start over</button>
  </div>
</template>
<script>
  export default {
    props: {
      result: {
        type: Object,
        required: true
      }
    }
  }
</script>
<style>

</style>
