<script>
	import '../app.css';
	import { Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';
	import { DarkMode } from 'flowbite-svelte';
	import { DiscordSolid, GithubSolid } from 'flowbite-svelte-icons';
</script>

<Navbar class="px-2 sm:px-4 py-2.5 fixed w-full z-20 top-0 start-0 border-b">
	<NavBrand href="/">
		<img src="/favicon.svg" class="me-3 h-6 sm:h-9" alt="FatMemory Logo" />
		<span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">
			FatMemory
		</span>
	</NavBrand>

	<div class="flex md:order-2">
		<DarkMode />
		<a href="/" class="m-auto px-2"><DiscordSolid /></a>
		<a href="/" class="m-auto px-2"><GithubSolid /></a>
		<NavHamburger />
	</div>

	<NavUl class="order-1">
		<NavLi href="/" active={true}>Home</NavLi>
		<NavLi href="/about">About</NavLi>
		<NavLi href="/pricing">Pricing</NavLi>
		<NavLi href="/contact">Contact</NavLi>
		<NavLi href="/explore">Explore</NavLi>
	</NavUl>
</Navbar>

<div class="pt-20 flex flex-col items-center h-screen">
	<slot />
</div>
