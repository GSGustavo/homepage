<script setup lang="ts">
import { CornerDownRight } from 'lucide-vue-next';
import PDFIcon from '~/assets/icons/PDFIcon.vue';

const items = [
    {
        title: "Preview PDF",
        icons: [
            {
                el: PDFIcon,
                description: "PDF Resume",
                url: "https://drive.google.com/file/d/1R08xwKy_7LkABTPUaaaTXhO6kBkN2Yod/view?usp=sharing"
            },
        ]
    },
]
</script>

<template>
    <div class="flex flex-col gap-4">
        <h2 class="text-xl font-black text-center">
            My resume
        </h2>

        <div class="flex flex-col gap-8">
            <div class="flex flex-col gap-4" v-for="item in items" :key="`${item.title}-el`">
                <Badge variant="outline" class="text-sm font-bold flex gap-2">
                    <CornerDownRight :size="15" />
                    {{ item.title }}
                </Badge>
                <div class="flex gap-4 items-center">
                    <TooltipProvider v-for="icon in item.icons" :key="`${item.title}-ttp`">
                        <Tooltip :key="`${item.title}-tt`">
                            <TooltipTrigger as-child :key="`${item.title}-ttt`">
                                <a :href="icon.url" target="_blank">
                                    <component :is="icon.el" class="w-10" />
                                </a>
                            </TooltipTrigger>
                            <TooltipContent :key="`${item.title}-ttc`">
                                <p>{{ icon.description }}</p>
                            </TooltipContent>
                        </Tooltip>
                    </TooltipProvider>
                </div>
            </div>
        </div>
    </div>
</template>