<template>
  <div>
    <AppSidebar/>
    <keep-alive>
      <AppContent/>
    </keep-alive>
  </div>
</template>

<script>
import AppSidebar from './components/AppSidebar.vue';
import AppContent from './components/AppContent.vue';

export default {
  components: {
    AppSidebar,
    AppContent
  },
  data(){
    return {
    }
  }
}
</script>