<script setup lang='ts'>
const props = defineProps(['beats', 'name', 'bols'])
</script>

<template>
  <div :class='$style.taalContainer'>
    <h1>{{ props.name }}</h1>

    <ol :data-grid-cols='props.beats' :class='$style.taal'>
        <li v-for='(bol, index) in props.bols' :class='bol.isPlaying ? $style.bolActive : $style.bolInactive' :key='index'>
          {{ bol.bol }}
        </li>
    </ol>
    <p>{{ props }}</p>
  </div>
</template>

<style module lang='scss'>
.taalContainer {
  display: flex;
  padding: 0 3ch;
  flex-direction: column;
}

.bolInactive {
  border-bottom-color: transparent;
}

.bolActive {
  border-bottom-color: #AAB9BC;
}

.taal {
  list-style: none;
  padding: 0;
}

li {
  text-align: center;
  flex-flow: column;
  color: #768250;
  padding-top: 1.6em;
  border-bottom: 15px solid transparent;
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