<script setup lang="ts">
import Hero from '@/components/sections/hero/Hero.vue';
import { Separator } from '@/components/ui/separator';

useSeoMeta({
    title: 'Terms of Service - Gustavo Dev',
    titleTemplate: 'Terms of Service - Gustavo Dev',
    description: 'Read the terms and conditions for using this website.',
})
</script>

<template>
    <div class="flex flex-col w-full align-center justify-center gap-12 m-8">
        <Hero />

        <div class="flex flex-col gap-6">
            <NuxtLink to="/">
                <Badge variant="outline">
                    <ArrowLeft :size="14" class="mr-1" />
                    Go back
                </Badge>
            </NuxtLink>

            <div>
                <h1 class="text-2xl font-bold">Terms of Service</h1>
                <p class="text-sm text-muted-foreground mt-1">Last updated: May 26, 2026</p>
            </div>

            <Separator />

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">1. Acceptance of Terms</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    By accessing and using this website, you agree to be bound by these Terms of Service.
                    If you do not agree with any part of these terms, please do not use this site.
                    This is a personal portfolio and blog — there are no commercial transactions involved.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">2. Use of Content</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    All content on this site — including blog posts, code snippets, and written text — is authored by
                    Gustavo Silva unless otherwise stated. You are welcome to read, reference, and share the content,
                    provided that proper credit is given. Reproducing content in full without attribution is not permitted.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">3. Intellectual Property</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    The design, layout, and original content of this website are the intellectual property of Gustavo Silva.
                    Open-source code samples shared in blog posts may be freely used under the spirit of open collaboration —
                    always check for any license headers within the code before use.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">4. Disclaimer of Warranties</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This website and its content are provided on an <strong>"as is"</strong> basis without any warranties,
                    express or implied. While every effort is made to ensure accuracy, no guarantee is made that
                    the information is complete, current, or error-free. Technical articles and code examples
                    should be reviewed and tested before use in production environments.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">5. Limitation of Liability</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    Gustavo Silva shall not be held liable for any direct, indirect, incidental, or consequential
                    damages arising from the use of this website or its content. This includes, but is not limited to,
                    damages resulting from errors or omissions in technical content, loss of data, or reliance on
                    information provided here.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">6. External Links</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This site may contain links to third-party websites (e.g., GitHub, LinkedIn, YouTube).
                    These links are provided for convenience and informational purposes only.
                    No endorsement or responsibility for the content, privacy practices, or availability of those sites
                    is implied.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">7. Changes to Terms</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    These Terms of Service may be updated at any time. Continued use of the site after
                    any changes are posted constitutes your acceptance of the new terms.
                    The date at the top of this page will always reflect the most recent revision.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">8. Governing Law</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    These terms are governed by the laws of Brazil. Any disputes arising from the use of
                    this website shall be subject to the jurisdiction of the courts of Brazil.
                </p>
            </section>

            <Separator />

            <div class="flex flex-col gap-1">
                <p class="text-xs text-muted-foreground">Questions about these terms? Get in touch:</p>
                <ul class="text-xs text-muted-foreground flex flex-col gap-1 pl-1">
                    <li>
                        <span class="font-medium text-foreground">CNPJ:</span> 63.943.553/0001-06
                    </li>
                    <li>
                        <span class="font-medium text-foreground">E-mail:</span>
                        <a href="mailto:gustavogonzagasilva@outlook.com" class="underline underline-offset-4 hover:text-foreground transition-colors ml-1">gustavogonzagasilva@outlook.com</a>
                    </li>
                    <li>
                        <span class="font-medium text-foreground">Phone:</span>
                        <a href="tel:+5565998001202" class="underline underline-offset-4 hover:text-foreground transition-colors ml-1">+55 (65) 9 9800-1202</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
