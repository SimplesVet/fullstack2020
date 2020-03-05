<template>
  <div id="clientes" class="container mt-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
      <h1 class="titulo">Lista de clientes</h1>
      <b-button
        variant="primary"
        size="sm"
        @click="$router.push({ path: '/clientes/form' })"
      >
        Adicionar
      </b-button>
    </div>

    <b-table striped hover :items="items">
      <template v-slot:cell()="data">
        <div class="cursor-pointer" @click="abrir(data)">{{ data.value }}</div>
      </template>
    </b-table>
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
  },

  methods: {
    abrir(data) {
      this.$router.push({ path: `/clientes/${data.item.id}/form` });
    }
  }
};
</script>

<style>
.cursor-pointer {
  cursor: pointer;
}
</style>
