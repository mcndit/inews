SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Структура таблицы `prefix_news`
--

CREATE TABLE `prefix_news` (
  `id` int(11) NOT NULL,
  `category` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(2048) NOT NULL,
  `source_url` varchar(2048) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `prefix_news` (`id`, `category`, `title`, `preview`, `content`, `img`, `source_url`, `datetime`, `author`) VALUES
(1, 2, 'Дуа Липа спела а капелла в пустом зале для рекламы воды Evian', 'Ассоциация простая: чистый голос &mdash; чистая вода, всё натурально и прозрачно', '<p>Ассоциация простая: чистый голос &mdash; чистая вода, всё натурально и прозрачно. Новая кампания Evian так и называется: <em>Drink True</em>.</p><p>Сюжет для нативной интеграции подобрали удачно: людям любопытно, как звучат голоса артистов без фонограмм. Такое видео стало бы инфоповодом и собрало просмотры даже без упоминания бренда.</p><p>Это гораздо интереснее, чем просить амбассадора запостить фото с продуктом и написать рекламный пост.</p>', 'news-img1.jpg', 'https://www.instagram.com/p/CMMnEBfnhdi/', '2021-04-21 12:27:16', '@LehaMSK'),
(2, 2, 'Симптомы токсичного маркетинга', 'Проверьте себя &mdash; возможно, вы слишком давите на потребителей', '<h3>1. Слежка</h3><p>Не собирайте больше информации о клиентах, чем нужно для прямых задач бизнеса, и ни в коем случае не покупайте базы.</p><p>Делайте ставку на first-party данные, которыми человек делится сам, оформляя заказ или регистрируясь: например, телефон и email.</p><p>В обмен на дополнительную информацию, вроде даты рождения, можно предложить скидку или подарок.</p><h3>2. Навязанные услуги</h3><p>Боль клиентов мобильных операторов: незаметная смена тарифа, платные подписки. Это вызывает резкий негатив, подрывает доверие и снижает лояльность.</p><p>Боль клиентов мобильных операторов: незаметная смена тарифа, платные подписки. Это вызывает резкий негатив, подрывает доверие и снижает лояльность.</p><h3>3. Атака контентом</h3><p>Вы уже три года не были в этом магазине, но они с упорством шлют сообщения типа <em>&laquo;Скидки до 30% на избранные товары! Только сегодня!&raquo;</em></p><p>Или скачали приложение интернет-магазина &mdash; и теперь каждый час получаете push-уведомления: <em>&laquo;Ликвидация!&raquo;</em>, <em>&laquo;Скидки сгорают!&raquo;</em></p><p>В первом случае для бизнеса это напрасная трата денег, во втором &mdash; выжигание клиентской базы.</p><h3>4. Нечестная игра</h3><p>Самый популярный пример &mdash; усложнённая механика отписки. Например, в письме нет ссылки на неё или нужны логин и пароль. Верный способ собрать жалобы на спам.</p><p>Примеры есть и в офлайне: например, продавец техники может убедить покупателя, что без платной гарантии холодильник не примут в ремонт. Так же действуют в банках, говоря, что без оплаты страховки не одобрят кредит.</p><h3>5. Нелицеприятная реклама</h3><p>Никогда не унижайте конкурентов. Можно подшутить над соперничеством, если уверены, что получится остроумно. Но лучше говорить о себе, а не о других брендах.</p><p>Хуже прямых наездов на конкурента &mdash; только обесценивание покупателя.</p><p>Даже если продукт реально меняет жизнь к лучшему, нельзя указывать на то, что сейчас люди поступают неправильно или глупо. <em>&laquo;Не хотите учить английский? Сидите дальше с копеечной зарплатой&raquo;</em>, <em>&laquo;Мебель из IKEA &mdash; это зазорно&raquo;</em> &mdash; такие оценочные суждения могут выдавать люди, но не бренды.</p>', 'news-img2.jpg', 'https://www.instagram.com/p/CMMnEBfnhdi/', '2021-04-21 12:44:12', '@LehaMSK'),
(3, 1, 'JS classes are not &Prime;just syntactic sugar&Prime;', 'A post that hopefully explains what’s the difference and why it matters to understand it', '', 'news-img3.jpg', 'https://webreflection.medium.com/js-classes-are-not-just-syntactic-sugar-28690fedf078', '2021-04-21 12:44:49', ''),
(4, 1, 'Three important things you should know about CSS :is()', 'Back in 2019 I shared how the CSS :is() selector will simplify things when writing CSS. What I didn’t know back then, and only have learnt quite recently, are these three important facts about CSS :is()', '', 'news-img8.jpg', 'https://www.bram.us/2021/03/19/three-important-things-you-should-know-about-css-is/', '2021-04-21 12:45:39', ''),
(5, 1, 'Replacing let with const', 'It’s common practice to use const by default, denoting that a variable is constant and unchanging. However, it can be confusing when you want a constant variable that is conditionally defined, but otherwise unchanging.', '<p>In JavaScript, const affords a few benefits:</p><ol><li>It lets the team reviewing your code that the value is not going to change, improving confidence.</li><li>It throws an error if you attempt to change that variable, preventing accidental re-assignment.</li><li>It allows the engine to optimize for unchanging values.</li><li>It avoids side effects caused by conflicting changes.</li><li>It is more consistent with functional programming and immutable states.</li><li>There are instances of better TypeScript inference.</li></ol><p>It’s common practice to use const by default, denoting that a variable is constant and unchanging.</p>', 'news-img7.jpg', 'https://charles-stover.medium.com/replacing-let-with-const-86797b790775', '2021-04-16 12:53:13', 'Charles Stover'),
(7, 1, 'Vanilla JavaScript Code Snippets', 'Let’s look at vanilla JavaScript code snippets — resources and lightweight libraries to help you solve a problem without a large overhead or third-party dependencies', '<p>Every now and again we have to deal with legacy code, wading through dark and eerie sides of the code base, often with a vague, ambiguous and unsettling documentation — if any is provided at all. In such cases, <strong>refactoring</strong> the component seems inevitable.</p>', 'news-img7.jpg', 'https://www.smashingmagazine.com/2021/04/vanilla-javascript-code-snippets/', '2021-04-15 12:56:49', 'Vitaly Friedman'),
(8, 3, 'Декоратор', 'Декоратор &mdash; это структурный паттерн проектирования, который позволяет динамически добавлять объектам новую функциональность, оборачивая их в полезные &laquo;обёртки&raquo;.', '<p>Вы работаете над библиотекой оповещений, которую можно подключать к разнообразным программам, чтобы получать уведомления о важных событиях.</p><p>Основой библиотеки является класс Notifier с методом send, который принимает на вход строку-сообщение и высылает её всем администраторам по электронной почте. Сторонняя программа должна создать и настроить этот объект, указав кому отправлять оповещения, а затем использовать его каждый раз, когда что-то случается.</p><p>В какой-то момент стало понятно, что одних email-оповещений пользователям мало. Некоторые из них хотели бы получать извещения о критических проблемах через SMS. Другие хотели бы получать их в виде сообщений Facebook. Корпоративные пользователи хотели бы видеть сообщения в Slack.</p><p>Сначала вы добавили каждый из этих типов оповещений в программу, унаследовав их от базового класса Notifier. Теперь пользователь выбирал один из типов оповещений, который и использовался в дальнейшем.</p><p>Но затем кто-то резонно спросил, почему нельзя выбрать несколько типов оповещений сразу? Ведь если вдруг в вашем доме начался пожар, вы бы хотели получить оповещения по всем каналам, не так ли?</p><p>Вы попытались реализовать все возможные комбинации подклассов оповещений. Но после того как вы добавили первый десяток классов, стало ясно, что такой подход невероятно раздувает код программы.</p><p>Итак, нужен какой-то другой способ комбинирования поведения объектов, который не приводит к взрыву количества подклассов.</p>', 'news-img7.jpg', 'https://refactoring.guru/ru/design-patterns/decorator', '2021-04-22 13:06:20', 'refactoring.guru');


ALTER TABLE `prefix_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

ALTER TABLE `prefix_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `prefix_news`
  ADD CONSTRAINT `prefix_news_ibfk_1` FOREIGN KEY (`category`) REFERENCES `prefix_news_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
