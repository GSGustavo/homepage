<script setup lang="ts">
import GithubIcon from '~/assets/icons/GithubIcon.vue';
import { CornerDownRight } from 'lucide-vue-next';
import LinkedInIcon from '~/assets/icons/LinkedInIcon.vue';
import YoutubeIcon from '~/assets/icons/YoutubeIcon.vue';

const items = [
    {
        title: "Follow my work",
        icons: [
            {
                el: GithubIcon,
                description: "github.com/GSGustavo",
                url: "https://github.com/GSGustavo"
            },
            {
                el: LinkedInIcon,
                description: "linkedin.com/in/gustavo-gs",
                url: "https://www.linkedin.com/in/gustavo-gs/"
            },
            {
                el: YoutubeIcon,
                description: "@gustavog_silva",
                url: "https://www.youtube.com/@gustavog_silva"
            },
        ]
    },
]
</script>

<template>
    <div class="flex flex-col gap-4">
        <h2 class="text-xl font-black text-center">
            My links
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