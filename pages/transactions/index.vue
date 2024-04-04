<script setup lang="ts">
import { h, onMounted, ref } from "vue";

const data = ref<any[]>([])

function generateRandomData(numObjects) {
  const statuses = ['pending', 'processing', 'completed'];
  const emails = ['example@gmail.com', 'm@example.com', 'test@example.com', 'user@example.com'];
  
  const randomData: any[] = [];

  for (let i = 0; i < numObjects; i++) {
    const id = Math.random().toString(36).substr(2, 8);
    const amount = Math.floor(Math.random() * 500) + 50; // Random amount between 50 and 550
    const status = statuses[Math.floor(Math.random() * statuses.length)];
    const email = emails[Math.floor(Math.random() * emails.length)];

    randomData.push({ id, amount, status, email });
  }

  return data.value = randomData;
}

onMounted(() => {
  generateRandomData(10);
})

const columns: any = [
  {
    accessorKey: 'email',
    header: () => h('div', { class: 'text-left' }, 'Email'),
    cell: ({ row }: any) => {
      const email = row.getValue('email')

      return h('div', { class: 'text-left font-medium' }, email)
    }
  },{
    accessorKey: 'status',
    header: () => h('div', { class: 'text-left' }, 'Status'),
    cell: ({ row }: any) => {
      const status = row.getValue('status')

      return h('div', { class: 'text-left font-medium' }, status)
    }
  }, {
    accessorKey: 'amount',
    header: () => h('div', { class: 'text-left' }, 'Amount'),
    cell: ({ row }: any) => {
      const amount = Number.parseFloat(row.getValue('amount'))

      return h('div', { class: 'text-left font-medium' }, '$' + amount)
    }
  }, {
    accessorKey: 'id',
    header: () => h('div', { class: 'text-left' }, 'ID'),
    cell: ({ row }: any) => {
      const id = row.getValue('id')

      return h('div', { class: 'text-left font-medium' }, id)
    }
  },
]
</script>

<template>
   <div class="grid w-full gap-4">
    <header class="flex items-start justify-between">
      <div class="grow">
        <p>All your transactions</p>
        <h1>Transactions</h1>
      </div>
    </header>
    <DataTable :columns="columns" :data="data" />
  </div>
</template>