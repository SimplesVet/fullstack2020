<template>
	<div id="app">
		<b-navbar toggleable="lg" type="dark" variant="info">
			<b-navbar-brand>SimplesVet</b-navbar-brand>
		</b-navbar>

		<b-container>
			<router-view />
		</b-container>
	</div>
</template>

<style>
h1.titulo {
	font-size: 22px;
	color: #333;
}
</style>
