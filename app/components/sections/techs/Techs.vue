<script setup lang="ts">
import { CornerDownRight } from 'lucide-vue-next';
import { Badge } from '@/components/ui/badge'
import {
    Tooltip,
    TooltipContent,
    TooltipProvider,
    TooltipTrigger,
} from '@/components/ui/tooltip'
import TypescriptIcon from '~/assets/icons/TypescriptIcon.vue';
import PHPIcon from '~/assets/icons/PHPIcon.vue';
import PythonIcon from '~/assets/icons/PythonIcon.vue';
import VueIcon from '~/assets/icons/VueIcon.vue';
import NextJSIcon from '~/assets/icons/NextJSIcon.vue';
import LaravelIcon from '~/assets/icons/LaravelIcon.vue';
import FastAPIIcon from '~/assets/icons/FastAPIIcon.vue';
import GitIcon from '~/assets/icons/GitIcon.vue';
import DockerIcon from '~/assets/icons/DockerIcon.vue';
import MySQLIcon from '~/assets/icons/MySQLIcon.vue';
import PostgreSQLIcon from '~/assets/icons/PostgreSQLIcon.vue';
import MongoDBIcon from '~/assets/icons/MongoDBIcon.vue';
import NginxIcon from '~/assets/icons/NginxIcon.vue';
import LinuxIcon from '~/assets/icons/LinuxIcon.vue';

const items = [
    {
        title: "O.S",
        icons: [
            {
                el: LinuxIcon,
                description: "Linux"
            },
        ]
    },
    {
        title: "Languages",
        icons: [
            {
                el: TypescriptIcon,
                description: "TypeScript"
            },
            {
                el: PHPIcon,
                description: "PHP"
            },
            {
                el: PythonIcon,
                description: "Python"
            },
        ]
    },
    {
        title: "Proxy",
        icons: [
            {
                el: NginxIcon,
                description: "Nginx"
            },
        ]
    },
    {
        title: "Backend Stack",
        icons: [
            {
                el: FastAPIIcon,
                description: "FastAPI"
            },
            {
                el: LaravelIcon,
                description: "Laravel"
            },
        ]
    },
    {
        title: "Frontend Stack",
        icons: [
            {
                el: VueIcon,
                description: "VueJS"
            },
            {
                el: NextJSIcon,
                description: "NextJS"
            },
        ]
    },
    {
        title: "Version Control",
        icons: [
            {
                el: GitIcon,
                description: "GIT"
            },
        ]
    },
    {
        title: "DevOps/Infraestructure",
        icons: [
            {
                el: DockerIcon,
                description: "Docker"
            },
        ]
    },
    {
        title: "Databases",
        icons: [
            {
                el: MySQLIcon,
                description: "MySQL"
            },
            {
                el: PostgreSQLIcon,
                description: "PostgreSQL"
            },
            {
                el: MongoDBIcon,
                description: "MongoDB"
            },
        ]
    },
]

</script>

<template>
    <div class="flex flex-col gap-4">
        <h2 class="text-xl font-black text-center">
            Techs that I work
        </h2>
        <div class="flex flex-col gap-8">
            <div class="flex flex-col gap-4" v-for="item in items" :key="`${item.title}-el`">
                <Badge variant="outline" class="text-sm font-bold flex gap-2">
                    <CornerDownRight :size="15" />
                    {{ item.title }}
                </Badge>
                <div class="flex gap-4">
                    <TooltipProvider v-for="icon in item.icons" :key="`${item.title}-ttp`">
                        <Tooltip :key="`${item.title}-tt`">
                            <TooltipTrigger as-child :key="`${item.title}-ttt`">
                                <component :is="icon.el" class="w-10" />
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