<script setup>

    import { ref, onMounted } from 'vue'
    import axios from 'axios'
    
    const snackbar = ref(false)
    const breeds = ref(null)
    const dialog = ref(false)
    const selectedBreed = ref(null)
    const loading = ref(false)

    const copyUrl = async (url) => {
        await navigator.clipboard.writeText(url)
        snackbar.value = true
    } 

    onMounted(async() => {
        const result = await axios.get("https://api.thecatapi.com/v1/breeds")
        loading.value = false
        breeds.value = result.data
    })

    function showDialog(breed) {
        selectedBreed.value = breed
        dialog.value = true
    }

    const lemonsBreed = {
        reference_image_id: "https://drive.google.com/uc?export=view&id=1PiHewjyjRoSE4Qt5p0hGknFdDR-oLmvB",
        name: "Lemon",
        description: " cute asf, naughty, silly, goofy, not sweet ingon ang tag-iya ahahah",
        temperament: "probably the same as the description :3",
        life_span: "maybe 10 - 15",
        affection_level: "5",
        dog_friendly: "5",
        energy_level: "5",
        grooming: "5",
        intelligence: "5",
        social_needs: "5"
    }

</script>

<template>
    <v-container>
        <v-row v-if="breeds">
            <v-col cols="6" xs="6" sm="4" md="3">
                <v-card elevation="0" @click="showDialog(lemonsBreed)">
                    <v-img src="https://drive.google.com/uc?export=view&id=1PiHewjyjRoSE4Qt5p0hGknFdDR-oLmvB" aspect-ratio="1" cover>
                        <template v-slot:placeholder>
                            <v-row class="fill-height ma-0" align="center" justify="center">
                                <v-progress-circular indeterminate color="grey-lighten-5">
                                </v-progress-circular>
                            </v-row>
                        </template>
                    </v-img>
                    <v-card-title class="text-center">Lemon</v-card-title>
                </v-card>
            </v-col>
            <v-col v-for="breed in breeds" :key="breed.id" cols="6" xs="6" sm="4" md="3">
                    <v-card elevation="0" @click="showDialog(breed)">
                        <v-img :src="`https://cdn2.thecatapi.com/images/${breed.reference_image_id}.jpg`" aspect-ratio="1" cover>
                            <template v-slot:placeholder>
                                <v-row class="fill-height ma-0" align="center" justify="center">
                                    <v-progress-circular indeterminate color="grey-lighten-5">
                                    </v-progress-circular>
                                </v-row>
                            </template>
                        </v-img>
                        <v-card-title class="text-center">{{ breed.name }}</v-card-title>
                    </v-card>
            </v-col>
        </v-row>
        <v-snackbar v-model="snackbar">
            URL copied to clipboard.
        </v-snackbar>
        <v-dialog v-model="dialog">
            <v-card>
                <v-row>
                    <v-col cols="12" md="4" xs="12" sm="6" lg="4">
                        <v-card-item>
                            <v-img v-if="selectedBreed.name == 'Lemon'" class="text-center" @click="copyUrl(`https://drive.google.com/uc?export=view&id=1PiHewjyjRoSE4Qt5p0hGknFdDR-oLmvB`)" :src="`https://drive.google.com/uc?export=view&id=1PiHewjyjRoSE4Qt5p0hGknFdDR-oLmvB`" height="100%" width="100%" cover>
                            </v-img>
                            <v-img v-else class="text-center" @click="copyUrl(`https://cdn2.thecatapi.com/images/${selectedBreed.reference_image_id}.jpg`)" :src="`https://cdn2.thecatapi.com/images/${selectedBreed.reference_image_id}.jpg`" height="100%" width="100%" cover>
                                <template v-slot:placeholder>
                                    <v-row class="fill-height ma-0" align="center" justify="center">
                                        <v-progress-circular indeterminate color="grey-lighten-5"></v-progress-circular>
                                    </v-row>
                                </template>
                            </v-img>
                        </v-card-item>
                    </v-col>
                    <v-col cols="12" md="8" xs="12" sm="6" lg="8">
                        <v-card-title>
                            <v-list-item>
                                {{ selectedBreed.name }}
                                <template v-slot:append>
                                    <v-btn icon="mdi-close" variant="text" @click="dialog = false"></v-btn>
                                </template>
                            </v-list-item>
                        </v-card-title>
                        <v-card-text>
                            <p>About this cat :3</p>
                            {{ selectedBreed.description }}
                        </v-card-text>
                        <v-card-text>
                            <p>Temperament</p>
                            {{ selectedBreed.temperament }}
                        </v-card-text>
                        <v-card-text>
                            <p>Life span</p>
                            {{ selectedBreed.life_span }} years
                        </v-card-text>
                        <v-row>
                            <v-col class="text-center" cols="6" sm="6" md="4" lg="4">
                                <p>Affection level</p>
                                <v-rating
                                full-icon="mdi-cat"
                                empty-icon="mdi-circle-outline"
                                v-model="selectedBreed.affection_level"
                                readonly
                                color="orange"
                                ></v-rating>
                            </v-col>
                            <v-col class="text-center" cols="6" sm="6" md="4" lg="4">
                                <p>Dog friendly</p>
                                <v-rating
                                full-icon="mdi-cat"
                                empty-icon="mdi-circle-outline"
                                v-model="selectedBreed.dog_friendly"
                                readonly
                                color="orange"
                                ></v-rating>
                            </v-col>
                            <v-col class="text-center" cols="6" sm="6" md="4" lg="4">
                                <p>Energy level</p>
                                <v-rating
                                full-icon="mdi-cat"
                                empty-icon="mdi-circle-outline"
                                v-model="selectedBreed.energy_level"
                                readonly
                                color="orange"
                                ></v-rating>
                            </v-col>
                            <v-col class="text-center" cols="6" sm="6" md="4" lg="4">
                                <p>Grooming</p>
                                <v-rating
                                full-icon="mdi-cat"
                                empty-icon="mdi-circle-outline"
                                v-model="selectedBreed.grooming"
                                readonly
                                color="orange"
                                ></v-rating>
                            </v-col>
                            <v-col class="text-center" cols="6" sm="6" md="4" lg="4">
                                <p>Intelligence</p>
                                <v-rating
                                full-icon="mdi-cat"
                                empty-icon="mdi-circle-outline"
                                v-model="selectedBreed.intelligence"
                                readonly
                                color="orange"
                                ></v-rating>
                            </v-col>
                            <v-col class="text-center" cols="6" sm="6" md="4" lg="4">
                                <p>Social needs</p>
                                <v-rating
                                full-icon="mdi-cat"
                                empty-icon="mdi-circle-outline"
                                v-model="selectedBreed.social_needs"
                                readonly
                                color="orange"
                                ></v-rating>
                            </v-col>
                        </v-row> 
                    </v-col>
                </v-row>
            </v-card>
        </v-dialog>
    </v-container>

</template>