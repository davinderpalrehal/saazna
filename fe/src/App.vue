<template>
  <img :src='AppIcon' alt='Saazna icon' :class='$style.appIcon'>

  <TaalMetronome
    beats='8'
    name='Basic Kaida 1'
    :bols="[{ bol: 'Ge', isPlaying: true }, { bol: 'Ge', isPlaying: false }, { bol: 'Ti', isPlaying: false }, { bol: 'T', isPlaying:
  false, }, { bol: 'Ge', isPlaying: false, }, { bol: 'Ge', isPlaying: false, }, { bol: 'Ti', isPlaying: false, }, { bol:
  'T', isPlaying: false, }, { bol: 'Ke', isPlaying: false, }, { bol: 'Ke', isPlaying: false, }, { bol: 'Ti', isPlaying:
  false, }, { bol: 'T', isPlaying: false, }, { bol: 'Ge', isPlaying: false, }, { bol: 'Ge', isPlaying: false, }, { bol:
  'Ti', isPlaying: false, }, { bol: 'T', isPlaying: false, }]"
  />



  <!--  <button :class='$style.playStop' @click='togglePlay'>-->
  <!--    <img :src='isPlaying ? StopIcon : PlayIcon' alt=''>-->
  <!--  </button>-->
</template>

<script lang='ts' setup>
import { ref, watch } from 'vue';

import AppIcon from './assets/icon.png';
import TaalMetronome from './components/TaalMetronome.vue';

const isPlaying = ref(false);
const buttonBg = ref('#2AC9F0');
let playingTimer: number = 0;

// function togglePlay() {
//   isPlaying.value = !isPlaying.value;
//   let currentBeat = 0;
//   if (playingTimer) {
//     clearInterval(playingTimer);
//   } else {
//     playingTimer = setInterval(() => {
//       taals.value[0].bols[currentBeat].isPlaying = true;
//       if (currentBeat != 0) {
//         taals.value[0].bols[currentBeat - 1].isPlaying = false;
//       } else {
//         taals.value[0].bols[taals.value[0].bols.length - 1].isPlaying = false;
//       }
//       currentBeat++;
//       if (currentBeat == taals.value[0].bols.length) {
//         currentBeat = 0;
//       }
//     }, 1000);
//   }
// }

watch(isPlaying, (newState) => {
  if (newState) {
    buttonBg.value = '#F2BC40';
  } else {
    buttonBg.value = '#2AC9F0';
  }
});

</script>

<style lang='scss' module>
.appIcon {
  display: flex;
  margin: 0 auto;
}

.playStop {
  padding: 0;
  background: v-bind(buttonBg);
  border: none;
  display: flex;
  border-radius: 100%;
  width: 150px;
  height: 150px;
  align-items: center;
  justify-content: center;
  font-size: 5em;
  color: #ffffff;
  text-shadow: 0 3px 0 #888888;
  filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));

  &:active {
    outline: none;
  }
}
</style>