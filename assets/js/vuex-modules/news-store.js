import axios from 'axios';
const newsStore = {
    namespaced: true,
    state: {
        newsList: []
    },
    mutations: {
        setNews(state, n){
            state.newsList = n;
        }
    },
    getters: {
        //newsList: state => state.newsList,
        getNewsList: function (state) {
            return function () {
                //todo convert
                return state.newsList;
            }
        }
    },
    actions: {
        fetchNewsList ({ commit, state }, filters) {
        console.log('fetchNewsList', filters);

        // mock
        commit('setNews', [
            { id: 1,
                title: 'Дуа Липа спела а капелла в пустом зале для рекламы воды Evian',
                preview: 'Ассоциация простая: чистый голос &mdash; чистая вода, всё натурально и прозрачно',
                content: '<p>Ассоциация простая: чистый голос &mdash; чистая вода, всё натурально и прозрачно. Новая кампания Evian так и называется: <em>Drink True</em>.</p>' +
                '<p>Сюжет для нативной интеграции подобрали удачно: людям любопытно, как звучат голоса артистов без фонограмм. Такое видео стало бы инфоповодом и собрало просмотры даже без упоминания бренда.</p>' +
                '<p>Это гораздо интереснее, чем просить амбассадора запостить фото с продуктом и написать рекламный пост.</p>',
                author: '@LehaMSK',
                datetime: '2021-11-03 13:36:00',
                url: 'https://www.instagram.com/p/CMMnEBfnhdi/',
                img: 'news-img1.jpg'
            },
            {   id: 2,
                title: 'Симптомы токсичного маркетинга',
                preview: 'Проверьте себя &mdash; возможно, вы слишком давите на потребителей',
                content: `<h3>1. Слежка</h3><p>Не собирайте больше информации о клиентах, чем нужно для прямых задач бизнеса,
и ни в коем случае не покупайте базы.</p>
<p>Делайте ставку на first-party данные, которыми человек делится сам, оформляя заказ или регистрируясь: например, телефон и email.</p>
<p>В обмен на дополнительную информацию, вроде даты рождения, можно предложить скидку или подарок.</p>
<h3>2. Навязанные услуги</h3>
<p>Боль клиентов мобильных операторов: незаметная смена тарифа, платные подписки.
Это вызывает резкий негатив, подрывает доверие и снижает лояльность.</p>
<p>Боль клиентов мобильных операторов: незаметная смена тарифа, платные подписки. Это вызывает резкий негатив,
подрывает доверие и снижает лояльность.</p>
<h3>3. Атака контентом</h3>
<p>Вы уже три года не были в этом магазине, но они с упорством шлют сообщения типа <em>&laquo;Скидки до 30% на избранные товары! Только сегодня!&raquo;</em></p>
<p>Или скачали приложение интернет-магазина &mdash; и теперь каждый час получаете push-уведомления: <em>&laquo;Ликвидация!&raquo;</em>, <em>&laquo;Скидки сгорают!&raquo;</em></p>
<p>В первом случае для бизнеса это напрасная трата денег, во втором &mdash; выжигание клиентской базы.</p>
<h3>4. Нечестная игра</h3>
<p>Самый популярный пример &mdash; усложнённая механика отписки. Например, в письме нет ссылки на неё или нужны логин и пароль.
Верный способ собрать жалобы на спам.</p>
<p>Примеры есть и в офлайне: например, продавец техники может убедить покупателя, что без платной гарантии холодильник не примут в ремонт. Так же действуют в банках,
говоря, что без оплаты страховки не одобрят кредит.</p>
<h3>5. Нелицеприятная реклама</h3>
<p>Никогда не унижайте конкурентов. Можно подшутить над соперничеством, если уверены, что получится остроумно.
Но лучше говорить о себе, а не о других брендах.</p>
<p>Хуже прямых наездов на конкурента &mdash; только обесценивание покупателя.</p>
<p>Даже если продукт реально меняет жизнь к лучшему, нельзя указывать на то, что сейчас люди поступают
неправильно или глупо. <em>&laquo;Не хотите учить английский? Сидите дальше с копеечной зарплатой&raquo;</em>,
<em>&laquo;Мебель из IKEA &mdash; это зазорно&raquo;</em> &mdash; такие оценочные суждения могут выдавать люди, но не бренды.</p>
`,
                author: '@LehaMSK',
                datetime: '2021-11-03 13:36:00',
                url: 'https://www.instagram.com/p/CMMnEBfnhdi/',
                img: 'news-img2.jpg'
            },
            {   id: 3,
                cat: 2,
                title: 'JS classes are not &Prime;just syntactic sugar&Prime;',
                preview: 'A post that hopefully explains what’s the difference and why it matters to understand it',
                content: '',
                author: '',
                datetime: '2021-11-03 13:36:00',
                url: 'https://webreflection.medium.com/js-classes-are-not-just-syntactic-sugar-28690fedf078',
                img: 'news-img3.jpg'
            },
            {   id: 4,
                cat: 2,
                title: 'Three important things you should know about CSS :is()',
                preview: 'Back in 2019 I shared how the CSS :is() selector will simplify things when writing CSS. What I didn’t know back then, and only have learnt quite recently, are these three important facts about CSS :is()',
                content: '',
                author: '',
                datetime: '2021-11-03 13:36:00',
                url: 'https://www.bram.us/2021/03/19/three-important-things-you-should-know-about-css-is/',
                img: 'news-img8.jpg'
            }
        ]);

        //return;
        let request = {...filters};
        axios.post("/api/news", request)
            .then(response => {
                console.log(response);
                commit('setNews', response);
            })
            .catch(error => {
                console.log(error);
            });

        }
    }
};

export default newsStore;
