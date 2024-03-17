<script setup>
const loading = ref(false)
</script>

<template>
  <div class="grid w-full gap-4">
    <header class="flex items-start justify-between">
      <div class="grow">
        <p>Hi, welcome back Guillaume !</p>
        <h1>Dashboard</h1>
      </div>
      <div class="w-[120px] h-[36px] bg-neutral-200"></div>
    </header>
    <main class="grid gap-4">
      <div class="flex items-center gap-4">
        <div v-for='(item, index) in 3' :key='index' class="w-[120px] h-[36px] bg-neutral-200"></div>
      </div>
      <section>
        <div class="w-full h-[360px] bg-neutral-200"></div>
      </section>
    </main>
    <footer>
      <div class="flex items-center gap-4">
        <div v-for='(item, index) in 3' :key='index' class="w-full h-[260px] bg-neutral-200"></div>
      </div>
    </footer>
  </div>
</template>
