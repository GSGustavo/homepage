<script lang="ts" setup>
import { Alert, AlertTitle } from '@/components/ui/alert'
import { SquareTerminal, BookOpenText } from 'lucide-vue-next';
import { Badge } from '@/components/ui/badge'
</script>

<template>
    <div class="flex flex-col gap-4 justify-center items-center">
        <Badge variant="outline">
            <BookOpenText />
            Homepage
        </Badge>
        <h1 class="scroll-m-20 text-center text-4xl font-bold tracking-tight text-balance">
            Gustavo Gonzaga da Silva
        </h1>
        <Alert class="w-max">
            <SquareTerminal />
            <AlertTitle>Software Developer</AlertTitle>
        </Alert>
    </div>
</template>