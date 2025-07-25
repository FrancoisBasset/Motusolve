<template>
	<div class="flex flex-col text-center mx-auto">
		<label class="text-6xl font-extralight">Motusolve</label>

		<div class="mx-auto">
			<label>Mot à trouver</label>
			<LetterGroup v-model="wordToFind" />
			<LetterGroup v-model="lettersHints" />

			<button @click="search">Lancer la recherche</button>
		</div>
	</div>
</template>

<script>
import LetterGroup from '@/components/LetterGroup.vue';
import words from '@/assets/liste_francais.txt?raw';

export default {
	components: { LetterGroup },
	data: () => ({
		wordToFind: [],
		lettersHints: [],
		dictionary: words.split('\r\n')
	}),
	methods: {
		search() {
			const pattern = this.wordToFind.map(char => (char ? char : '.')).join('');

			const regex = new RegExp(`^${pattern}$`, 'i');

			const hints = this.lettersHints.filter(Boolean);

			const matches = this.dictionary.filter(word => {
				if (word.length !== this.wordToFind.length) return false;
				if (!regex.test(word)) return false;
				return hints.every(hint => word.includes(hint));
			});

			console.log('Résultats:', matches);
		}
	}
};
</script>
