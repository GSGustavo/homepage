<script setup lang="ts">
import Hero from '@/components/sections/hero/Hero.vue';
import { Separator } from '@/components/ui/separator';

useSeoMeta({
    title: 'Privacy Policy - Gustavo Dev',
    titleTemplate: 'Privacy Policy - Gustavo Dev',
    description: 'Learn how this website handles your information and privacy.',
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
                <h1 class="text-2xl font-bold">Privacy Policy</h1>
                <p class="text-sm text-muted-foreground mt-1">Last updated: May 26, 2026</p>
            </div>

            <Separator />

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">1. Overview</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This website is a personal portfolio and blog maintained by Gustavo Silva. Your privacy is important.
                    This policy explains what information (if any) is collected when you visit this site and how it is used.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">2. Information Collected</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This site does <strong>not</strong> collect any personally identifiable information directly.
                    No registration, login, or contact forms are present. However, third-party services embedded or
                    linked from this site (such as GitHub or LinkedIn) may collect data according to their own privacy policies.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">3. Cookies</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This site may use minimal cookies to store your theme preference (light/dark mode).
                    No tracking or advertising cookies are used. These cookies are stored locally in your browser
                    and can be cleared at any time through your browser settings.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">4. Third-party Links</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This site contains links to external websites such as GitHub, LinkedIn, and YouTube.
                    These sites have their own privacy policies, and visiting them is subject to their terms.
                    This site takes no responsibility for the content or practices of any linked external sites.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">5. Analytics</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This site does not currently use any analytics or tracking tools. In the future, if
                    privacy-respecting analytics are added, this policy will be updated accordingly.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">6. Changes to This Policy</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    This Privacy Policy may be updated from time to time. Any changes will be reflected on this page
                    with an updated date at the top. Continued use of the site after changes constitutes acceptance
                    of the updated policy.
                </p>
            </section>

            <section class="flex flex-col gap-3">
                <h2 class="text-lg font-semibold">7. Contact</h2>
                <p class="text-sm text-muted-foreground leading-relaxed">
                    If you have any questions about this Privacy Policy, feel free to reach out through any of the channels below:
                </p>
                <ul class="text-sm text-muted-foreground flex flex-col gap-1 pl-1">
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
            </section>

            <Separator />

            <p class="text-xs text-muted-foreground">
                This policy applies solely to <strong>gustavodev.com.br</strong> and does not cover any external services or platforms.
            </p>
        </div>
    </div>
</template>
