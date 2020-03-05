<template>
	<div id="clientes-form" class="container mt-4">
		<div class="d-flex align-items-center justify-content-between mb-3">
			<h1 class="titulo">Formulário de cliente</h1>
			<b-button
				variant="secondary"
				size="sm"
				@click="$router.push({ path: '/' })"
			>
				Voltar
			</b-button>
		</div>

		<b-form @submit="onSubmit($event)">
			<b-form-group label="Nome:" label-for="nome">
				<b-form-input
					id="nome"
					v-model="form.nome"
					type="text"
					required
					placeholder="Nome do cliente"
					required
				></b-form-input>
			</b-form-group>

			<b-button type="submit" variant="success" size="sm" class="mr-2">
				Salvar
			</b-button>

			<b-button @click="excluir()" variant="outline-danger" size="sm" v-if="id">
				Excluir
			</b-button>
		</b-form>
	</div>
</template>

<script>
import axios from 'axios';

export default {
	name: 'clientes-form',

	props: ['id'],

	data() {
		return {
			form: {}
		};
	},

	created() {
		if (this.id) {
			// Carregar dados
			this.obterCliente();
		}
	},

	methods: {
		async obterCliente() {
			let response = await axios.get('http://localhost/clientes', {
				id: this.id
			});

			this.form = response.data[0];
		},

		onSubmit(e) {
			e.preventDefault();

			if (!this.id) {
				this.inserir();
				return false;
			}

			this.atualizar();

			return false;
		},

		async inserir() {
			try {
				let response = await axios.post(`http://localhost/clientes`, this.form);

				this.$router.push({ path: '/' });
			} catch (erro) {
				console.error('Ocorreu um erro ao inserir o cliente: ', erro);
			}
		},

		async atualizar() {
			try {
				let response = await axios.put(
					`http://localhost/clientes/${this.id}`,
					this.form
				);

				this.$router.push({ path: '/' });
			} catch (erro) {
				console.error('Ocorreu um erro ao atualizar o cliente: ', erro);
			}
		},

		async excluir() {
			try {
				let response = await axios.delete(
					`http://localhost/clientes/${this.id}`
				);

				this.$router.push({ path: '/' });
			} catch (erro) {
				console.error('Ocorreu um erro ao exluir o cliente: ', erro);
			}
		}
	}
};
</script>
