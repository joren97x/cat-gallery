<script setup>

    import {defineEmits} from 'vue'
    const emit = defineEmits(['changeColor'])

    const changeGallery = (color) => {
        emit('changeColor', color)
    }

</script>

<template>
    <v-navigation-drawer expand-on-hover rail>
        <v-list>
          <v-list-item
            prepend-avatar="https://i1.sndcdn.com/artworks-5aDBMLz7U2zE8hoL-D0dFww-t500x500.jpg"
            title="Joren Sumagang"
            subtitle="joren@gmailcom"
          ></v-list-item>
        </v-list>
        <v-divider />
        <v-list density="compact" nav>

            <v-list-item prepend-icon="mdi-cat" @click="changeGallery(true)" title="Cat Gallery" value="cat"/>
            <v-list-item prepend-icon="mdi-dog" @click="changeGallery(false)" title="Grayscale Cat Gallery" value="dog"/>
            

        </v-list>
    </v-navigation-drawer>

</template>
