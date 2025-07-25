<template>
	<div class="flex flex-row gap-1">
		<Letter v-for="(letter, i) in letters" :key="letter" :letter="letter" @onChange="letter => onChange(letter, i)" @onRemove="removeLetter(i)" />
		<LetterPlus @click="addLetter" />
	</div>
</template>

<script>
import Letter from '@/components/Letter.vue';
import LetterPlus from '@/components/LetterPlus.vue';

export default {
	props: {
		modelValue: Array
	},
	components: { Letter, LetterPlus },
	data: () => ({
		letters: []
	}),
	methods: {
		addLetter() {
			this.letters.push('');
			this.$emit('update:modelValue', this.letters);
		},
		onChange(letter, position) {
			this.letters[position] = letter;
			this.$emit('update:modelValue', this.letters);
		},
		removeLetter(position) {
			this.letters.splice(position, 1);
			this.$emit('update:modelValue', this.letters);
		}
	}
};
</script>
