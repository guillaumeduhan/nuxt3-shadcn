export default function useHelpers() {
  let loading = ref(true);
  let open = ref(false);
  return {
    open,
    loading
  }
}