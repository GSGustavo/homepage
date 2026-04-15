<script setup>
import Hero from '@/components/sections/hero/Hero.vue';

const { data: posts } = await useAsyncData('posts', () =>
    queryCollection('posts').order('date', 'DESC').all()
)

</script>
<template>
    <div class="flex flex-col w-full align-center justify-center gap-12 m-8">
        <!-- Hero -->
        <Hero />

        <div class="flex flex-col gap-4">
            <h2 class="text-xl font-black text-center">
                Blog
            </h2>

            <ul>
                <li v-for="post in posts" :key="post.path + '-blog-page'" class="mb-3">
                    <NuxtLink :to="'/blog/' + post.postId">{{ post.title }}</NuxtLink>
                    <p>{{ post.description }}</p>
                </li>
            </ul>

        </div>
    </div>
</template>