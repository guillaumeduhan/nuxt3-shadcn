<script setup lang="ts">
import { Badge } from '@/components/ui/badge';
import {
Card,
CardContent,
CardFooter,
CardHeader
} from '@/components/ui/card';
</script>

<template>
  <Card>
    <CardHeader>
      <div class="flex justify-between items-center">
        <p>This is a title</p>
        <Badge class="bg-green-400">+14%</Badge>
      </div>
    </CardHeader>
    <CardContent class="flex items-center justify-end border-b py-2">
      <div class="text-[48px] font-[800]">
        <span class="text-neutral-300">$</span>
        <span class="text-black">{{ '12.23' }}</span>
      </div>
    </CardContent>
    <CardFooter class="flex gap-2 py-2 px-2 items-center justify-between">
      <div class="w-8 h-8 bg-neutral-100 rounded flex items-center justify-center">
        <Icon size="20" name="lucide:arrow-left-right" color="black" />
      </div>
      <p class="grow">Here is some text</p>
      <Button variant="outline">Hello Button</Button>
    </CardFooter>
  </Card>
</template>