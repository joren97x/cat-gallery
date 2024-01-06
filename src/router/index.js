import { createRouter, createWebHistory } from "vue-router"
// import Layout from '../components/Layout.vue'

const router = createRouter({
    history: createWebHistory(null),
    routes: [
        {
            path: '/cat-gallery/',
            name: 'Index',
            component: () => import('../components/Gallery.vue'),
            // meta: {layout: Layout}
        },
    ]
})

export default router