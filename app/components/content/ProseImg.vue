<script setup lang="ts">
import {
    DialogClose,
    DialogContent,
    DialogDescription,
    DialogOverlay,
    DialogPortal,
    DialogRoot,
    DialogTitle,
    DialogTrigger,
} from 'reka-ui'
import { Maximize, X, ZoomIn, ZoomOut } from 'lucide-vue-next'

/**
 * Substitui o ProseImg padrão do @nuxt/content: ao clicar na imagem do post
 * ela abre em tela inteira, com zoom (botões, scroll, duplo clique, teclado)
 * e arraste para mover a imagem ampliada.
 */
const props = defineProps<{
    src?: string
    alt?: string
    width?: string | number
    height?: string | number
}>()

const MIN_SCALE = 1
const MAX_SCALE = 8
const STEP = 1.25

const baseURL = useRuntimeConfig().app.baseURL

// Mesmo tratamento do ProseImg original: respeita app.baseURL em caminhos absolutos.
const refinedSrc = computed(() => {
    const src = props.src ?? ''
    if (src.startsWith('/') && !src.startsWith('//')) {
        const base = baseURL.endsWith('/') ? baseURL : baseURL + '/'
        const normalizedBase = base.startsWith('/') ? base : '/' + base
        if (normalizedBase !== '/' && !src.startsWith(normalizedBase)) {
            return normalizedBase + src.replace(/^\/+/, '')
        }
    }
    return src
})

const open = ref(false)
const scale = ref(1)
const x = ref(0)
const y = ref(0)
const dragging = ref(false)

const stage = ref<HTMLElement | null>(null)

const zoomPercent = computed(() => Math.round(scale.value * 100))
const canZoomIn = computed(() => scale.value < MAX_SCALE)
const canZoomOut = computed(() => scale.value > MIN_SCALE)

function reset() {
    scale.value = 1
    x.value = 0
    y.value = 0
}

watch(open, (isOpen) => {
    if (isOpen) reset()
})

// Aplica um novo zoom mantendo fixo o ponto (cx, cy), medido a partir do centro da tela.
function zoomTo(next: number, cx = 0, cy = 0) {
    const clamped = Math.min(MAX_SCALE, Math.max(MIN_SCALE, next))
    if (clamped === scale.value) return
    if (clamped === MIN_SCALE) {
        reset()
        return
    }
    const ratio = clamped / scale.value
    x.value = cx - (cx - x.value) * ratio
    y.value = cy - (cy - y.value) * ratio
    scale.value = clamped
}

function pointFromCenter(event: { clientX: number, clientY: number }) {
    const rect = stage.value?.getBoundingClientRect()
    if (!rect) return { cx: 0, cy: 0 }
    return {
        cx: event.clientX - (rect.left + rect.width / 2),
        cy: event.clientY - (rect.top + rect.height / 2),
    }
}

function onWheel(event: WheelEvent) {
    const { cx, cy } = pointFromCenter(event)
    zoomTo(scale.value * (event.deltaY < 0 ? STEP : 1 / STEP), cx, cy)
}

function onDoubleClick(event: MouseEvent) {
    if (scale.value > 1) {
        reset()
        return
    }
    const { cx, cy } = pointFromCenter(event)
    zoomTo(2.5, cx, cy)
}

let lastPointer: { x: number, y: number } | null = null

function onPointerDown(event: PointerEvent) {
    if (scale.value <= 1) return
    dragging.value = true
    lastPointer = { x: event.clientX, y: event.clientY }
    ;(event.currentTarget as HTMLElement).setPointerCapture(event.pointerId)
}

function onPointerMove(event: PointerEvent) {
    if (!dragging.value || !lastPointer) return
    x.value += event.clientX - lastPointer.x
    y.value += event.clientY - lastPointer.y
    lastPointer = { x: event.clientX, y: event.clientY }
}

function onPointerUp() {
    dragging.value = false
    lastPointer = null
}

function onKeydown(event: KeyboardEvent) {
    if (event.key === '+' || event.key === '=') zoomTo(scale.value * STEP)
    else if (event.key === '-') zoomTo(scale.value / STEP)
    else if (event.key === '0') reset()
}

const imageStyle = computed(() => ({
    transform: `translate(${x.value}px, ${y.value}px) scale(${scale.value})`,
    cursor: scale.value > 1 ? (dragging.value ? 'grabbing' : 'grab') : 'zoom-in',
    transition: dragging.value ? 'none' : 'transform 150ms ease-out',
}))

const toolbarButton =
    'inline-flex size-9 items-center justify-center rounded-md text-white transition-colors hover:bg-white/20 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-white/70 disabled:pointer-events-none disabled:opacity-40'
</script>

<template>
    <DialogRoot v-model:open="open">
        <DialogTrigger as-child>
            <button type="button" class="block max-w-full cursor-zoom-in" :aria-label="`Ampliar imagem${alt ? ': ' + alt : ''}`">
                <img :src="refinedSrc" :alt="alt" :width="width" :height="height" class="rounded-md border">
            </button>
        </DialogTrigger>

        <DialogPortal>
            <DialogOverlay
                class="fixed inset-0 z-50 bg-black/90 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0" />

            <DialogContent
                class="fixed inset-0 z-50 flex flex-col outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0"
                @keydown="onKeydown">
                <DialogTitle class="sr-only">{{ alt || 'Imagem do post' }}</DialogTitle>
                <DialogDescription class="sr-only">
                    Use os botões, o scroll do mouse ou as teclas + e - para dar zoom. Arraste a imagem ampliada para
                    mover. Pressione Esc para fechar.
                </DialogDescription>

                <!-- Barra de ferramentas -->
                <div class="relative z-10 flex items-center justify-end gap-1 p-3">
                    <button type="button" :class="toolbarButton" :disabled="!canZoomOut" aria-label="Diminuir zoom"
                        title="Diminuir zoom (-)" @click="zoomTo(scale / STEP)">
                        <ZoomOut class="size-5" />
                    </button>
                    <span class="w-14 text-center text-sm tabular-nums text-white" aria-live="polite">
                        {{ zoomPercent }}%
                    </span>
                    <button type="button" :class="toolbarButton" :disabled="!canZoomIn" aria-label="Aumentar zoom"
                        title="Aumentar zoom (+)" @click="zoomTo(scale * STEP)">
                        <ZoomIn class="size-5" />
                    </button>
                    <button type="button" :class="toolbarButton" :disabled="scale === 1 && x === 0 && y === 0"
                        aria-label="Restaurar tamanho" title="Restaurar tamanho (0)" @click="reset">
                        <Maximize class="size-5" />
                    </button>
                    <DialogClose :class="[toolbarButton, 'ml-2']" aria-label="Fechar" title="Fechar (Esc)">
                        <X class="size-5" />
                    </DialogClose>
                </div>

                <!-- Área da imagem. Clicar no fundo fecha, a menos que a imagem esteja ampliada. -->
                <div ref="stage" class="relative flex min-h-0 flex-1 items-center justify-center overflow-hidden px-4 pb-4"
                    @wheel.prevent="onWheel" @click.self="scale === 1 && (open = false)">
                    <img :src="refinedSrc" :alt="alt" draggable="false"
                        class="max-h-full max-w-full select-none object-contain touch-none" :style="imageStyle"
                        @dblclick="onDoubleClick" @pointerdown="onPointerDown" @pointermove="onPointerMove"
                        @pointerup="onPointerUp" @pointercancel="onPointerUp">
                </div>
            </DialogContent>
        </DialogPortal>
    </DialogRoot>
</template>
