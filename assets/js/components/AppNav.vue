<template>
    <nav :class="{ 'app-nav_active': navbarActive }">
        <slot name="nav-header"></slot>
        <ul class="nav-items" :class="[ navTypeClass ]">
            <li class="nav-items__item" :class="{ 'nav-items__item_active': selected === oneItem.code }"
                v-for="oneItem in items">
                <template v-if="selected !== oneItem.code">
                    <a :href="oneItem.url ? oneItem.url : 'javascript:void(0);'" @click="$emit('on-selected', oneItem)">{{ oneItem.title }}</a>
                </template>
                <template v-else>
                    {{ oneItem.title }}
                </template>
            </li>
        </ul>
    </nav>
</template>

<script>
    export default {
        props: {
            navType: {
                type: String,
                default: 'main'
            },
            navbarActive: {
                type: Boolean,
                default: false
            },
            selected: null,
            items: {
                type: Array
            }
        },
        data () {
            return {

            }
        },
        computed: {
            navTypeClass(){
                switch(this.navType){
                    case 'horizontal':
                        return 'nav-items_tabs';
                        break;
                    default:
                        return 'nav-items_main';
                        break;
                }
            }
        }
    }
</script>