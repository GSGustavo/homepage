<script setup lang="ts">
import { ChevronLeft, ChevronRight } from 'lucide-vue-next'
import Hero from '@/components/sections/hero/Hero.vue';
import {
    Pagination,
    PaginationContent,
    PaginationEllipsis,
    PaginationItem,
    PaginationNext,
    PaginationPrevious,
} from '@/components/ui/pagination'

const PAGE_SIZE = 10

const route = useRoute()

// Página pedida na URL (?page=N). Valores inválidos voltam para 1.
const requestedPage = computed(() => {
    const value = Math.floor(Number(route.query.page))
    return Number.isFinite(value) && value >= 1 ? value : 1
})

const { data } = await useAsyncData(
    () => `blog-posts-page-${requestedPage.value}`,
    async () => {
        const total = await queryCollection('posts').count()
        const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE))
        // Página acima do total mostra a última página.
        const page = Math.min(requestedPage.value, totalPages)
        const posts = await queryCollection('posts')
            .order('date', 'DESC')
            .skip((page - 1) * PAGE_SIZE)
            .limit(PAGE_SIZE)
            .all()

        return { posts, total, totalPages, page }
    }
)

const posts = computed(() => data.value?.posts ?? [])
const total = computed(() => data.value?.total ?? 0)
const totalPages = computed(() => data.value?.totalPages ?? 1)
const currentPage = computed(() => data.value?.page ?? 1)

const pageLink = (page: number) => (page === 1 ? '/blog' : { path: '/blog', query: { page } })

</script>
<template>
    <div class="flex flex-col w-full align-center justify-center gap-12 m-8">
        <!-- Hero -->
        <Hero />

        <div class="flex flex-col gap-4">
            <h2 class="text-xl font-black text-center">
                Blog
            </h2>

            <p v-if="!posts.length" class="text-center">
                Nenhum post encontrado
            </p>

            <ul>
                <li v-for="post in posts" :key="post.path + '-blog-page'" class="mb-3">
                    <NuxtLink :to="'/blog/' + post.postId">{{ post.title }}</NuxtLink>
                    <p class="text-sm text-muted-foreground">{{ post.date }}</p>
                    <p>{{ post.description }}</p>
                </li>
            </ul>

            <Pagination v-if="totalPages > 1" :page="currentPage" :total="total" :items-per-page="PAGE_SIZE"
                :sibling-count="1" show-edges>
                <PaginationContent v-slot="{ items }">
                    <PaginationPrevious v-if="currentPage > 1" as-child>
                        <NuxtLink :to="pageLink(currentPage - 1)">
                            <ChevronLeft />
                            <span class="hidden sm:block">Previous</span>
                        </NuxtLink>
                    </PaginationPrevious>

                    <template v-for="(item, index) in items" :key="index">
                        <PaginationItem v-if="item.type === 'page'" :value="item.value"
                            :is-active="item.value === currentPage" as-child>
                            <NuxtLink :to="pageLink(item.value)">{{ item.value }}</NuxtLink>
                        </PaginationItem>
                        <PaginationEllipsis v-else :index="index" />
                    </template>

                    <PaginationNext v-if="currentPage < totalPages" as-child>
                        <NuxtLink :to="pageLink(currentPage + 1)">
                            <span class="hidden sm:block">Next</span>
                            <ChevronRight />
                        </NuxtLink>
                    </PaginationNext>
                </PaginationContent>
            </Pagination>

        </div>
    </div>
</template>
