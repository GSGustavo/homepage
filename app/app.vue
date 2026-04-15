<script lang="ts" setup>


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
  <NuxtPage />
</template>
