<script lang="ts" setup>
import Hero from '@/components/sections/hero/Hero.vue';
import About from './components/sections/about/About.vue';
import Techs from './components/sections/techs/Techs.vue';
import Links from './components/sections/links/Links.vue';
import Resume from './components/sections/resume/Resume.vue';
import Footer from './components/sections/footer/Footer.vue';

useHead({
  meta: [
    { charset: 'utf-8' },
    { name: 'viewport', content: 'width=device-width, initial-scale=1' },
  ],
  link: [
    { rel: 'icon', href: '/favicon.ico' }
  ],
  htmlAttrs: {
    lang: 'en'
  },
  bodyAttrs: {
    class: 'flex max-w-[700px] justify-center m-auto py-24', // Add one or more classes
  },
})

useSeoMeta({
  titleTemplate: 'Homepage - Gustavo Dev',
  ogImage: '/card.png',
  twitterImage: '/card.png',
  twitterCard: 'summary_large_image'
})
</script>


<template>
  <div class="flex flex-col w-full align-center justify-center gap-12 m-12">
    <!-- Hero -->
    <Hero />
    <!-- About -->
    <About />
    <!-- Techs -->
    <Techs />
    <!-- Links -->
    <Links />
    <!-- Resume -->
    <Resume />
    <!-- Footer -->
    <Footer />
  </div>
</template>
