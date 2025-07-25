<template>
	<div class="flex flex-col items-center text-center space-y-6">
		<h1 class="text-6xl font-extralight">Motusolve</h1>

		<div class="mx-auto bg-white p-6 rounded shadow-md space-y-4">
			<div class="space-y-2">
				<label class="block">Mot à trouver</label>
				<LetterGroup v-model="wordToFind" />
			</div>

			<div class="space-y-2">
				<label class="block">Lettres existantes</label>
				<LetterGroup v-model="lettersHints" />
			</div>

			<button @click="search" class="p-3 bg-amber-600 rounded text-white cursor-pointer hover:bg-amber-700 transition">Lancer la recherche</button>

			<div v-if="results.length > 0" class="space-y-2">
				<label class="block">Résultats :</label>

				<div class="flex flex-wrap justify-center">
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
