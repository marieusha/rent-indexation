<template>
  <div>
    <form @submit.prevent="onSubmit">
      <div class="form-row">
        <div class="form-group input">

          <label for="start-date">Contract start date</label>
          <input
            type="date"
            class="form-control"
            id="start-date"
            v-model="startDate"
            @blur="$v.startDate.$touch()">
        </div>
        <template v-if="$v.startDate.$error">
          <div
            class="error"
            v-if="!$v.startDate.dateBeforeToday">Invalid date, it must be before today.</div>
          <div
            class="error"
            v-if="!$v.startDate.required">This field is required</div>
        </template>

        <div class="form-group">
          <label for="signed-on">Contract signed on</label>
          <input
            type="date"
            class="form-control"
            id="signed-on"
            v-model="signedOn"
            @blur="$v.signedOn.$touch()">
        </div>
        <template v-if="$v.signedOn.$error">
          <div
            class="error"
            v-if="!$v.signedOn.dateBeforeToday">Invalid date, it must be before today.</div>
          <div
            class="error"
            v-if="!$v.signedOn.required">This field is required</div>
        </template>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="base-rent">Base rent</label>
          <input
            type="number"
            class="form-control"
            id="base-rent"
            v-model="baseRent"
            @blur="$v.baseRent.$touch()">
        </div>
        <template v-if="$v.startDate.$error">
          <div
            class="error"
            v-if="!$v.baseRent.required">This field is required</div>
        </template>

      </div>

      <div class="submit">
        <button
          class="btn btn-primary"
          type="submit">Calculate</button>
      </div>
    </form>
  </div>
</template>
<script>
  import { required, numeric } from 'vuelidate/lib/validators'
  import dayjs from 'dayjs'

  export default {
    data () {
      return {
        startDate: '',
        signedOn: '',
        baseRent: ''
      }
    },
    validations: {
      startDate: {
        required,
        dateBeforeToday: val => {
          return dayjs(val) < dayjs()
        }
      },
      signedOn: {
        required,
        dateBeforeToday: val => {
          return dayjs(val) < dayjs()
        }
      },
      baseRent: {
        required,
        numeric

      }
    },
    methods: {
      onSubmit () {
        console.log(this.$v)
        if (this.$v.$invalid) {
          return this.$v.$touch()
        }
        const formData = {
          start_date: this.startDate,
          signed_on: this.signedOn,
          base_rent: this.baseRent
        }
        console.log(formData)
        this.$emit('formSubmit', formData)
      }
    }
  }
</script>
<style>
  .error {
    color: rgb(253, 128, 128);
  }
</style>
