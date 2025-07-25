<template>
	<button @click="$emit('click')" class="w-10 h-10 cursor-pointer flex items-center justify-center rounded-full border bg-white text-xl font-bold text-gray-600 hover:bg-gray-100 hover:text-gray-800 transition">+</button>
</template>

<script>
export default {
	emits: ['click']
};
</script>
