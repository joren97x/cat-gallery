<script setup>

    import {defineProps, ref} from 'vue'
    const p = defineProps(['color'])  
    const snackbar = ref(false)
    const text = `URL copied to clipboard.` 
    const copyUrl = async (url) => {
        await navigator.clipboard.writeText(url)
        snackbar.value = true
    } 
    const randomNum = () => {
        return Math.floor(Math.random() * 16)
    }
</script>

<template>
    <v-container>
    
        <v-row>
            <v-col 
                v-for="n in 40" 
                :key="n" 
                cols="4"
                xs="4"
                sm="3"
                md="2"
            >
                <v-hover
                    v-slot="{isHovering, props}"
                    open-delay="100"
                >
                    <v-card
                        :elevation="isHovering ? 16 : 2"
                        :class="{'on-hover' : isHovering}"
                        v-bind="props"
                        @click="copyUrl(`http://placekitten.com${p.color ? '' : '/g'}/200/300?image=${n > 16 ? String(n)[1] : n }`)"
                    >
                        <v-img 
                            :src="`http://placekitten.com${p.color ? '' : '/g'}/200/300?image=${n > 16 ? String(n)[1] : n }`" 
                            aspect-ratio="1" 
                            cover
                            :lazy-src="`http://placekitten.com${p.color ? '' : '/g'}/10/6?image=${n > 16 ? String(n)[1] : n }`"
                        >

                            <template v-slot:placeholder>
                                <v-row
                                    class="fill-height ma-0"
                                    align="center"
                                    justify="center"
                                >
                                    <v-progress-circular
                                        indeterminate
                                        color="grey-lighten-5"
                                    >
                                    </v-progress-circular>
                                </v-row>
                            </template>
                        </v-img>
                    </v-card>
                </v-hover>
            </v-col>
        </v-row>
        <v-snackbar
        v-model="snackbar"
        >
        {{ text }}

        <template v-slot:actions>
            <v-btn
            color="pink"
            variant="text"
            @click="snackbar = false"
            >
            Close
            </v-btn>
        </template>
        </v-snackbar>
    </v-container>

</template>