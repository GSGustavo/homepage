<script setup lang="ts">
import type { PaginationLastProps } from "reka-ui"
import type { HTMLAttributes } from "vue"
import type { ButtonVariants } from "@/components/ui/button"
import { reactiveOmit } from "@vueuse/core"
import { ChevronsRight } from "lucide-vue-next"
import { PaginationLast } from "reka-ui"
import { buttonVariants } from "@/components/ui/button"
import { cn } from "@/lib/utils"

const props = withDefaults(defineProps<PaginationLastProps & {
  size?: ButtonVariants["size"]
  class?: HTMLAttributes["class"]
}>(), {
  size: "default",
})

const delegatedProps = reactiveOmit(props, "class", "size")
</script>

<template>
  <PaginationLast
    data-slot="pagination-last"
    :class="cn(buttonVariants({ variant: 'ghost', size }), 'gap-1 px-2.5', props.class)"
    v-bind="delegatedProps"
  >
    <slot>
      <span class="hidden sm:block">Last</span>
      <ChevronsRight />
    </slot>
  </PaginationLast>
</template>
