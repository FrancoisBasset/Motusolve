<template>
	<div class="relative w-10 h-10">
		<button class="absolute top-0 right-0 w-4 h-4 p-0 text-xs cursor-pointer leading-none text-red-500 hover:text-red-700" tabindex="-1" @click="$emit('onRemove')">×</button>

		<!-- input centré -->
		<input class="w-full h-full text-center outline-none uppercase border rounded" :value="letter" type="text" maxlength="1" @input="handleInput" />
	</div>
</template>

<script>
export default {
	props: ['letter'],
	methods: {
		handleInput(e) {
			this.$emit('onChange', e.target.value);

			if (e.target.value && e.target.value.length === 1) {
				this.$el.nextElementSibling?.querySelector('input')?.focus();
			}
		}
	}
};
</script>
