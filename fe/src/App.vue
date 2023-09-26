<template>
  <h1>Saazna</h1>

  <ol v-for='taal in taals' :data-grid-cols='taal.beats'>
    <li v-for='(bol, index) in taal.bols' :class='bol.isPlaying ? $style.bolActive : $style.bolInactive' :key='index'>
      {{ bol.bol }}
    </li>
  </ol>

  <div>
    Metronome
  </div>

  <button :class='$style.playStop' @click='togglePlay'>
    <img :src='isPlaying ? StopIcon : PlayIcon' alt=''>
  </button>
</template>

<script lang='ts' setup>
import { ref, watch } from 'vue';

import PlayIcon from './assets/play.svg';
import StopIcon from './assets/stop.svg';

const isPlaying = ref(false);
const buttonBg = ref('#2AC9F0');
let playingTimer: number = 0

function togglePlay() {
  isPlaying.value = !isPlaying.value;
  let currentBeat = 0
  if (playingTimer) {
    clearInterval(playingTimer)
  }
  else {
    playingTimer = setInterval(() => {
      taals.value[0].bols[currentBeat].isPlaying = true
      if (currentBeat != 0) {
        taals.value[0].bols[currentBeat - 1].isPlaying = false
      }
      else {
        taals.value[0].bols[taals.value[0].bols.length - 1].isPlaying = false
      }
      currentBeat++
      if (currentBeat == taals.value[0].bols.length) {
        currentBeat = 0
      }
    }, 1000)
  }
}

watch(isPlaying, (newState, oldState) => {
  if (newState) {
    buttonBg.value = '#F2BC40';
  } else {
    buttonBg.value = '#2AC9F0';
  }
});

const taals = ref([
  {
    beats: 8,
    bols: [
      {
        bol: 'Ge',
        num: 1,
        isPlaying: true,
      },
      {
        bol: 'Ge',
        num: 2,
        isPlaying: false,
      },
      {
        bol: 'Ti',
        num: 3,
        isPlaying: false,
      },
      {
        bol: 'T',
        num: 4,
        isPlaying: false,
      },
      {
        bol: 'Ge',
        num: 5,
        isPlaying: false,
      },
      {
        bol: 'Ge',
        num: 6,
        isPlaying: false,
      },
      {
        bol: 'Ti',
        num: 7,
        isPlaying: false,
      },
      {
        bol: 'T',
        num: 8,
        isPlaying: false,
      },
      {
        bol: 'Ke',
        num: 9,
        isPlaying: false,
      },
      {
        bol: 'Ke',
        num: 10,
        isPlaying: false,
      },
      {
        bol: 'Ti',
        num: 11,
        isPlaying: false,
      },
      {
        bol: 'T',
        num: 12,
        isPlaying: false,
      },
      {
        bol: 'Ge',
        num: 13,
        isPlaying: false,
      },
      {
        bol: 'Ge',
        num: 14,
        isPlaying: false,
      },
      {
        bol: 'Ti',
        num: 15,
        isPlaying: false,
      },
      {
        bol: 'T',
        num: 16,
        isPlaying: false,
      }],
  },
]);
</script>

<style lang='scss' module>
table {
  td {
    border: 1px solid rosybrown;
    width: 5ch;
  }
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

.bolInactive {
  border-bottom-color: transparent;
}

.bolActive {
  border-bottom-color: #AAB9BC;
}

ol, ul {
  list-style: none;

  li {
    display: flex;
    text-align: center;
    flex-flow: column;
    color: #768250;
    padding-top: 1.6em;
    border-bottom: 15px solid transparent;
  }
}

[data-grid-cols='8'] {
  display: grid;
  grid-template-columns: repeat(8, minmax(40px, 1fr));
}


[data-grid-cols='16'] {
  display: grid;
  grid-template-columns: repeat(16, minmax(40px, 1fr));
}
</style>