<template>
	<div class="flex flex-col text-center mx-auto">
		<label class="text-6xl font-extralight">Motusolve</label>

		<div class="mx-auto">
			<label>Mot à trouver</label>
			<LetterGroup v-model="wordToFind" />

			<label>Lettres existantes</label>
			<LetterGroup v-model="lettersHints" />

			<button @click="search" class="p-3 bg-amber-600 rounded text-white cursor-pointer">Lancer la recherche</button>

			<div v-if="results.length > 0">
				<label>Résultats :</label>

				<div class="flex flex-wrap">
					<label v-for="result in results" :key="result" class="p-2 m-1 rounded bg-amber-400">{{ result }}</label>
				</div>
			</div>
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
		dictionary: words.split('\r\n'),
		results: []
	}),
	methods: {
		search() {
			const pattern = this.wordToFind.map(char => (char ? char : '.')).join('');

			const regex = new RegExp(`^${pattern}$`, 'i');

			const hints = this.lettersHints.filter(Boolean);

			this.results = this.dictionary.filter(word => {
				if (word.length !== this.wordToFind.length) return false;
				if (!regex.test(word)) return false;
				return hints.every(hint => word.includes(hint));
			});
		}
	}
};
</script>
