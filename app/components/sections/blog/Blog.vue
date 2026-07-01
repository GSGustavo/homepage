<script setup>
const { data: lastPosts } = await useAsyncData('posts', () =>
    queryCollection('posts').order('date', 'DESC').limit(3).all()
)
</script>

<template>
    <div class="flex flex-col gap-4">
        <h2 class="text-xl font-black text-center">
            Read what I'm thinking about tech :)
        </h2>

        <NuxtLink to="/blog" class="m-auto">
            <Badge variant="outline">
                <BookOpenText />
                View All
            </Badge>
        </NuxtLink>

        <ul>
            <li v-for="post in lastPosts" :key="post.path" class="mb-3">
                <NuxtLink :to="'/blog/' + post.postId">{{ post.title }}</NuxtLink>
            </li>
        </ul>
    </div>
</template>