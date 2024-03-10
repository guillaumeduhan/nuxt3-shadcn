<script setup>
const items = ref([
  {
    title: "Overview",
    icon: "ri:dashboard-line"
  },
  {
    title: "Transactions",
    icon: "lucide:arrow-left-right"
  },
  {
    title: "Your Account",
    icon: "lucide:bolt"
  },
  {
    title: "Contacts",
    icon: "lucide:square-user-round"
  },
  {
    title: "Settings",
    icon: "lucide:settings"
  }
])
</script>

<template>
  <div>
    <header class="flex items-center gap-2 p-4 hover:scale-[101%] transition cursor-pointer">
      <Logo />
      <p class="font-bold">Nuxt-Finance</p>
    </header>
    <div class="px-4 grow">
      <div class="grid gap-2">
        <div v-for='(item, index) in items' :key='index' class="flex items-center gap-2 px-2 py-1 transition rounded cursor-pointer hover:bg-neutral-100">
          <Icon size="20" :name="item.icon" color="black" />
          <span>{{ item.title }}</span>
        </div>
      </div>
    </div>
  </div>
</template>
