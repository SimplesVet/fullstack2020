<template>
  <div class="home">
    <b-table striped hover :items="items"></b-table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Home',
  data() {
    return {
      items: []
    };
  },
  components: {},
  created() {
    axios.get('http://localhost/clientes').then(response => {
      this.items = response.data;
    });
  }
};
</script>
