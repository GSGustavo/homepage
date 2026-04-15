import { defineContentConfig, defineCollection, z } from '@nuxt/content'

export default defineContentConfig({
  collections: {
    posts: defineCollection({
      type: 'page',
      source: 'posts/**/*.md',
      schema: z.object({
        postId: z.string(),
        title: z.string(),
        description: z.string(),
        date: z.string(),
        tags: z.array(z.string()).optional(),
        author: z.string(),
        authorRole: z.string(),
      })
    })
  }
})
