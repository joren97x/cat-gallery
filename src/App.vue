<script setup>
    import Sidebar from './components/Sidebar.vue'
    import Gallery from './components/Gallery.vue'
    import {ref} from 'vue'

    const colorOfGallery = ref(true)

    const changeColorScale = (color) => {
        colorOfGallery.value = color
    }

</script>

<template>
    <v-app>
        <Sidebar @changeColor="changeColorScale" />
        <v-main>
            <Gallery :color="colorOfGallery"/>
        </v-main>
    </v-app>
</template>


