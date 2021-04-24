<template>
  <div>
    <AppSidebar/>
    <keep-alive>
      <AppContent/>
    </keep-alive>
  </div>
</template>

<script>
import AppSidebar from 'COMPONENTS/AppSidebar.vue';
import AppContent from 'COMPONENTS/AppContent.vue';

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