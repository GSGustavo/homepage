<script setup lang="ts">
import Hero from '@/components/sections/hero/Hero.vue';
import { Separator } from '@/components/ui/separator'

const route = useRoute()

const { data: post } = await useAsyncData('posts', () =>
    queryCollection('posts').where("postId", '=', route.params.id).first()
)

if (post) {
    useSeoMeta({
        titleTemplate: post.value?.title + ' - Gustavo Dev',
        title: post.value?.title,
        description: post.value?.description
    })

}

</script>

<template>
    <div class="flex flex-col w-full align-center justify-center gap-12 m-8">
        <!-- Hero -->
        <Hero />

        <template v-if="post">
            <div class="flex flex-col gap-4">

                <NuxtLink to="/">
                    <Badge variant="outline">
                        <BookOpenText />
                        Go back
                    </Badge>
                </NuxtLink>

                <h1 class="text-2xl font-bold">
                    {{ post.title }}
                </h1>
                <p>
                    {{ post.description }}
                </p>

                <Separator class="my-4" />

                <ContentRenderer :value="post" />
            </div>
        </template>

        <template v-else>
            <div class="flex flex-col">
                <p class="text-center">
                    Cannot find the requested post
                </p>
                <NuxtLink to="/blog" class="m-auto">
                    <Badge variant="outline">
                        <BookOpenText />
                        Go back
                    </Badge>
                </NuxtLink>
            </div>
        </template>

    </div>



</template>