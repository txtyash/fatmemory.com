<script lang="ts">
	import { onMount, onDestroy } from 'svelte';
	import { fade } from 'svelte/transition';
	import { GradientButton } from 'flowbite-svelte';
	import { ArrowDownOutline } from 'flowbite-svelte-icons';

	const src = '/images/brain.gif';
	let loading = true;

	let greetings = [
		'Lists',
		'Numbers',
		'Names',
		'Faces',
		'Dates',
		'Binaries',
		'Cards',
		'Everything!'
	];
	let index = 0;
	let roller: number;

	onMount(() => {
		const img = new Image();
		img.src = src; // Force the browser to load the src, even though it's not visible yet
		img.onload = () => {
			loading = false;
		};

		roller = setInterval(() => {
			if (index < greetings.length - 1) index++;
		}, 1600);
	});

	onDestroy(() => {
		clearInterval(roller);
	});
</script>

<!-- Brain Animation -->
<div class="h-2/3">
	{#if loading}
		<img src="/images/brain-frame-one.webp" alt="blue brain" />
	{:else}
		<img src="/images/brain.gif" alt="Rotating blue brain animation" />
	{/if}
</div>

<!-- Rolling Text -->
{#key index}
	<div
		class="text-center fixed z-10 top-1/2 bottom-1/2 text-3xl sm:text-5xl text-black dark:text-white font-cuteDino"
	>
		<p>Memorize</p>
		<p transition:fade={{ duration: 369, delay: 540 }}>{greetings[index]}</p>
	</div>
{/key}

<img
	src="/images/waves.svg"
	class="h-4/5 w-full overflow-hidden object-cover z-0 bottom-0"
	alt="waves"
/>

<div class="z-10 fixed flex text-center items-center flex-col bottom-32">
	<ArrowDownOutline class="animate-bounce w-12 h-12 shadow-2xl" color="hotpink" />
	<GradientButton class="mt-4 shadow-md text-xl" color="purpleToPink">Explore</GradientButton>
</div>
