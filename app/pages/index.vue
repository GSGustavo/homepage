<script setup>
import Hero from '@/components/sections/hero/Hero.vue';
import About from '@/components/sections/about/About.vue';
import Techs from '@/components/sections/techs/Techs.vue';
import Links from '@/components/sections/links/Links.vue';
import Resume from '@/components/sections/resume/Resume.vue';
import Footer from '@/components/sections/footer/Footer.vue';
import Blog from '@/components/sections/blog/Blog.vue';
</script>

<template>
    <div class="flex flex-col w-full align-center justify-center gap-12 m-8">
        <!-- Hero -->
        <Hero />
        <!-- Links -->
        <Links />
        <!-- About -->
        <About />
        <!-- Blog -->
        <Blog />
        <!-- Techs -->
        <Techs />
        <!-- Resume -->
        <Resume />
        <!-- Footer -->
        <Footer />
    </div>
</template>