<template>
  <main class="app-content">
    <header class="content-header">
      <app-nav nav-type="horizontal" @on-selected="onCatSelected" :items="navbarItems" :selected="filters.category"></app-nav>
      <!--todo <section class="pagination">
        <a href="javascript:void(0);">1</a>
        <a href="javascript:void(0);">2</a>
      </section>-->
    </header>
    <section class="filters-row" v-if="newsReady">
      <label class="search-wrap input-wrap">
        <div class="input-group">
          <input class="form-control" placeholder="поиск" v-model="search">
          <span class="input-group-btn"><button class="btn btn-default" type="button" @click="onSearch">поиск</button></span>
        </div>
      </label>
      <label class="input-wrap">
        <datepicker input-class="form-control" placeholder="с" format="dd.MM.yyyy"
            calendar-button calendar-button-icon="icon-calendar2"
            v-model="filters.date_from"></datepicker>
      </label>
      <label class="input-wrap">
        <datepicker input-class="form-control" placeholder="по" format="dd.MM.yyyy"
            calendar-button calendar-button-icon="icon-calendar2"
            v-model="filters.date_to"></datepicker>
      </label>
    </section>
    <section class="news-results">
      <div class="news-results__news-card" v-for="oneNews in newsList" :key="oneNews.id"
           :style="{ backgroundImage: 'url(/public/img/' + oneNews.img + ')' }">
        <div class="news-results__news-card-content">
          <a target="_blank" :href="oneNews.url" class="news-results__news-card-title text-h2">
            <span v-html="oneNews.title"></span>
          </a>
          <div class="news-results__news-card-preview" v-html="oneNews.preview"></div>
        </div>
      </div>
    </section>
  </main>
</template>

<script>
import AppNav from 'COMPONENTS/AppNav.vue';
import { mapState, mapGetters } from 'vuex';
import Datepicker from 'vuejs-datepicker';//https://github.com/edisdev/vue-datepicker-ui

export default {
  data () {
    return {
      navbarItems: [
        { url: '', title: 'all categories', code: 'all' },
        { url: '', title: 'marketing', code: 'marketing' },
        { url: '', title: 'frontend', code: 'frontend' },
        { url: '', title: 'refactoring', code: 'refactoring' }
      ],
      search: '',
      filters: {
        search: '',
        date_from: '',
        date_to: '',
        category: 'all'
      }
    }
  },
  components: {
    AppNav,
    Datepicker
  },
  created() {
    this.getNews();
  },
  computed: {
  /*...mapState('ns', { можно и так, но правильнее через геттеры
        newsList: state => state.newsList
    }),*/
    ...mapGetters('ns', [
        'getNewsList'
     ]),
    newsList(){
      return this.getNewsList()
    },
    newsReady(){
      return typeof this.newsList !== "undefined" && this.newsList.length > 0;
    }
  },
  methods: {
    onCatSelected(cat){
      this.filters.category = cat.code;
    },
    onSearch(){
      this.filters.search = this.search;
    },
    getNews(){
      //console.log(this.getNewsList(), this.$store.getters['ns/getNewsList'](), this.$store.state.ns.newsList);

      this.$store.dispatch('ns/fetchNewsList', this.filters);
    }
  },
  watch: {
    filters: {
      handler(){
        this.getNews()
      },
      deep: true
    }
  }
}
</script>
