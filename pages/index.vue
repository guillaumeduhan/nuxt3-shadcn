<script setup>
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
const loading = ref(false)
const list = [
  {
    title: "Today"
  }, {
    title: "Week"
  }, {
    title: "Month"
  }, {
    title: "Year"
  }
]
// 1. make categories
let categories = ref({
  today: [
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00"
  ],
  week: [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ],
  year: [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ]
})
// 2. where we are going to save the data
let data = ref([])
// 3. the current category
let currentCategory = ref("today");
// 4. the options of charts
let options = computed(() => ({
  chart: {
    type: 'line',
    animation: {
      enabled: false
    }
  },
  title: {
    text: ''
  },
  xAxis: {
    gridLineColor: 'transparent', // remove line
    categories: categories.value[currentCategory.value]
  },
  yAxis: {
    gridLineColor: 'transparent',
    title: { // remove title
      text: ''
    }
  },
  legend: {
    enabled: false
  },
  plotOptions: {
    line: {
      marker: { // remove points
        enabled: false
      },
      dataLabels: {
        enabled: false
      },
      enableMouseTracking: false
    }
  },
  series: [{
    name: 'line',
    lineWidth: '4px',
    color: { // gradients
      linearGradient: { y1: 0, y2: 0, y3: 0, y4: 0 },
      stops: [
        [0, 'rgba(252,176,69,1)'],
        [0.33, 'rgba(253,29,29,1)'],
        [0.66, 'rgba(131,58,180,1)'],
        [1, 'rgba(29,217,93,1)'],
      ]
    },
    data: data.value
  }]
}))

// 5. a function to generate current month
function generateMonth() {
  let currentDate = new Date();
  let currentMonth = currentDate.getMonth() + 1; // Current month (1 for January, 2 for February, etc.)
  let currentYear = currentDate.getFullYear(); // Current year

  function generateMonthDates() {
    let monthDates = [];
    let daysInMonth = new Date(currentYear, currentMonth, 0).getDate();

    for (let i = 1; i <= daysInMonth; i++) {
      let dayString = ("0" + i).slice(-2); // Format day with two digits (01, 02, ..., 31)
      let monthString = ("0" + currentMonth).slice(-2); // Format month with two digits (01, 02, ..., 12)
      monthDates.push(monthString + "/" + dayString);
    }

    return monthDates;
  }

  let month = generateMonthDates();
  categories.value = ({ ...categories.value, month })
  return month;
}

// 6. a function to generate random values depending on current category
function generateRandomValue(number = 7) {
  let values = [];
  for (let j = 0; j < number + 1; j++) {
    values.push(Math.floor(Math.random() * 100));
  }
  data.value = values;
  return values;
}
// 7. a function to catch shadcn tab change + set category
const setCategory = (e) => {
  let v = e.target.innerText.toLowerCase();
  currentCategory.value = v
  if (v === 'today') generateRandomValue(24);
  if (v === 'week') generateRandomValue(7);
  if (v === 'month') generateRandomValue(31);
  if (v === 'year') generateRandomValue(365);
}

const cards = [
  {
    title: "Sales",
    progression: 12,
    amount: 1244.43,
    label: "View sales",
    description: "Sales of March 2024",
    icon: "solar:ticket-sale-outline"
  },
  {
    title: "Refunds",
    progression: 8,
    amount: 84.44,
    label: "View refunds",
    description: "Refunds since beginning of year",
    icon: "heroicons-outline:receipt-refund"
  },
  {
    title: "Payouts",
    progression: 14,
    amount: 899.99,
    label: "View payouts",
    description: "Payouts of this week",
    icon: "tabler:zoom-money"
  }
]
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
    <main class="grid w-full gap-4">
      <Tabs default-value="Today" class="w-full" @click="setCategory">
        <TabsList class="max-w-[400px]">
          <TabsTrigger v-for="item, index in list" :key="index" :value="item.title">
            {{ item.title }}
          </TabsTrigger>
        </TabsList>
        <TabsContent class="w-[100%]" v-for="item, index in  list " :key="index" :value="item.title">
          <Chart :currentCategory="currentCategory" :categories="categories" />
        </TabsContent>
      </Tabs>
    </main>
    <footer>
      <div class="grid gap-4 lg:grid-cols-3">
        <p>Cards here</p>
      </div>
    </footer>
  </div>
</template>
