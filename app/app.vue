<script lang="ts" setup>
import ModeToggle from './components/ModeToggle.vue';
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert'
import { SquareTerminal } from 'lucide-vue-next';

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
    class: 'h-[100vh]', // Add one or more classes
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
  <!-- <div>
    <ModeToggle/>
  </div>
  
  <Button>Click me</Button> -->


  <div class="flex w-full align-center items-center justify-center">
    <div class="flex flex-col gap-4 p-12 justify-center items-center">

      <h1 class="scroll-m-20 text-center text-4xl font-bold tracking-tight text-balance">
        Gustavo Gonzaga da Silva
      </h1>
      <Alert class="w-max">
        <SquareTerminal/>
        <AlertTitle>Software Developer</AlertTitle>
      </Alert>
    </div>
  </div>
</template>
