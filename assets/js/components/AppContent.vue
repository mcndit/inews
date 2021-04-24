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
      <label for="filter-search" class="search-wrap input-wrap">
        <div class="input-group">
          <input id="filter-search" class="form-control" placeholder="поиск" v-model="search">
          <span class="input-group-btn"><button class="btn btn-default" type="button" @click="onSearch">поиск</button></span>
        </div>
      </label>
      <label for="filter-date-from" class="input-wrap">
        <input id="filter-date-from" class="form-control" placeholder="с" v-model="filters.date_from">
      </label>
      <label for="filter-date-to" class="input-wrap">
        <input id="filter-date-to" class="form-control" placeholder="по" v-model="filters.date_to">
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
import axios from 'axios';
import { mapState, mapGetters } from 'vuex';

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
    AppNav
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
