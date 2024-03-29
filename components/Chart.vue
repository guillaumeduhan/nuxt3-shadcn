<script setup>
let loading = ref(false)
let data = ref([])
let list = [
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
let props = defineProps(['categories', 'currentCategory'])

let categories = props.categories;
let currentCategory = props.currentCategory;

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
    categories: categories[currentCategory]
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
    data: toRaw(data.value)
  }]
}))

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
  categories = ({ ...categories, month })
  return month;
}

function generateRandomValue(number = 7) {
  let values = [];
  for (let j = 0; j < number + 1; j++) {
    values.push(Math.floor(Math.random() * 100));
  }
  data.value = values;
  return values;
}

// 8. on Mounted we gnerate month and random value
onMounted(() => {
  generateMonth();
  generateRandomValue(24);
})
</script>

<template>
  <highchart :options="options" />
</template>
