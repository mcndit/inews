import Vue from 'vue';
import App from './App.vue';
import Vuex from 'vuex';
Vue.use(Vuex);
import NewsStore from 'BASE/vuex-modules/news-store.js';

export const store = new Vuex.Store({
    modules: {
        ns: NewsStore
    }
});

var app = new Vue({
    el: '#v-app',
    template: '<App/>',
    store,
    components: { App }
});
