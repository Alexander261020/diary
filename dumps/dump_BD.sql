--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO dairy;

--
-- Name: blocks; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.blocks (
    id bigint NOT NULL,
    chapter_id bigint,
    content character varying,
    comment character varying,
    link character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    number_line integer DEFAULT 1,
    subsection_id bigint
);


ALTER TABLE public.blocks OWNER TO dairy;

--
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: dairy
--

CREATE SEQUENCE public.blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blocks_id_seq OWNER TO dairy;

--
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dairy
--

ALTER SEQUENCE public.blocks_id_seq OWNED BY public.blocks.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.chapters (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    count_clicks integer DEFAULT 0
);


ALTER TABLE public.chapters OWNER TO dairy;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: dairy
--

CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapters_id_seq OWNER TO dairy;

--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dairy
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- Name: errors; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.errors (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    correct character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.errors OWNER TO dairy;

--
-- Name: errors_id_seq; Type: SEQUENCE; Schema: public; Owner: dairy
--

CREATE SEQUENCE public.errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.errors_id_seq OWNER TO dairy;

--
-- Name: errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dairy
--

ALTER SEQUENCE public.errors_id_seq OWNED BY public.errors.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dairy;

--
-- Name: subsections; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.subsections (
    id bigint NOT NULL,
    chapter_id bigint,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subsections OWNER TO dairy;

--
-- Name: subsections_id_seq; Type: SEQUENCE; Schema: public; Owner: dairy
--

CREATE SEQUENCE public.subsections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subsections_id_seq OWNER TO dairy;

--
-- Name: subsections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dairy
--

ALTER SEQUENCE public.subsections_id_seq OWNED BY public.subsections.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: dairy
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    title character varying,
    body text,
    status integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tasks OWNER TO dairy;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: dairy
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO dairy;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dairy
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: blocks id; Type: DEFAULT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.blocks ALTER COLUMN id SET DEFAULT nextval('public.blocks_id_seq'::regclass);


--
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- Name: errors id; Type: DEFAULT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.errors ALTER COLUMN id SET DEFAULT nextval('public.errors_id_seq'::regclass);


--
-- Name: subsections id; Type: DEFAULT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.subsections ALTER COLUMN id SET DEFAULT nextval('public.subsections_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-02-21 11:28:56.022144	2022-02-21 11:28:56.022144
\.


--
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.blocks (id, chapter_id, content, comment, link, created_at, updated_at, number_line, subsection_id) FROM stdin;
80	\N	Что за проект\r\nЧто под капотом\r\nкак запускать\r\nесли есть то ссылки	О чем пишем в README		2022-02-26 05:05:23.30194	2022-02-26 05:05:23.30194	2	26
88	\N	t('message.edit')	Во вьюхах		2022-02-28 08:02:06.399223	2022-02-28 08:02:06.399223	1	29
63	\N	it 'should return collection objects Subsection' do\r\n  expect(chapter1.subsections).to be_a(Subsection)\r\nend\r\nDONT WORKING	Проверка связи, chapter имеет много Subsection		2022-02-25 05:42:04.664954	2022-03-01 17:32:06.167427	2	21
61	\N	  context 'validations check' do\r\n    it { should validate_presence_of :name }\r\n  end	Проверка валидации у модели		2022-02-25 05:10:47.363305	2022-03-01 17:32:21.454378	1	21
37	\N	group :development, :test do\r\n  gem 'rspec-rails'\r\n  gem 'factory_bot_rails'\r\n  gem 'shoulda-matchers'\r\n  gem 'rails-controller-testing'\r\nend\r\n\r\nbundle	into Gemfile  недавно сказали что добавлен  gem 'rails-controller-testing'		2022-02-23 09:45:32.565844	2022-03-01 17:51:15.441493	1	16
45	\N	FactoryGirl.define do\r\n  # Название фабрики (question)\r\n  factory :question do    \r\n    # Генерируем последовательность уникальных текстов вопроса\r\n    # Параметр n гарантирует уникальность вопроса\r\n    sequence(:text) { |n| "В каком году была космическая одиссея #{n}?" }	в spec/factories		2022-02-23 10:46:47.28225	2022-02-23 10:46:47.28225	6	16
47	3001			https://www.youtube.com/watch?v=RG5mIXF_LP0	2022-02-23 11:10:41.78159	2022-02-23 11:10:41.78159	1	\N
29	3004	rails g controller nameController\r\nrails g controller nameController action1 action2	для генерации контроллера	https://guides.rubyonrails.org/command_line.html	2022-02-23 06:18:50.420621	2022-02-23 08:31:43.98129	1	\N
30	3004	rails g model nameModel\r\nrails g model nameModel title:string body:text	сгенерировать модель	https://guides.rubyonrails.org/getting_started.html	2022-02-23 06:32:50.86951	2022-02-23 08:31:55.169309	1	\N
34	3003			https://www.youtube.com/watch?v=1miSIntbx2k	2022-02-23 08:52:30.325007	2022-02-23 08:53:38.728815	1	\N
39	3003			https://goodprogrammer.ru/rails-heliodor-21/lessons/models-rspec-factory-girl/text	2022-02-23 09:52:58.973862	2022-02-23 09:52:58.973862	2	\N
40	\N	rails g rspec:install	generating folders and files for rspec		2022-02-23 09:54:41.404751	2022-02-23 09:54:41.404751	3	16
41	\N	# Вставляем после этих строк\r\nrequire 'spec_helper'\r\nrequire 'rspec/rails'\r\n\r\n# Специальные «матчеры» — методы, удобные для тестирования валидаций\r\nShoulda::Matchers.configure do |config|\r\n  config.integrate do |with|\r\n    with.test_framework :rspec\r\n    with.library :rails\r\n  end\r\nend	go into spec/rails_helper.rb		2022-02-23 10:03:25.156371	2022-02-23 10:03:25.156371	4	16
42	\N	config.include Devise::TestHelpers, type: :controller\r\nconfig.include Devise::TestHelpers, type: :view	И внутри RSpec.configure do подключаем девайзовские хелперы, они пригодятся для тестирования контроллеров:		2022-02-23 10:05:32.865264	2022-02-23 10:05:32.865264	5	16
43	3003			https://github.com/thoughtbot/factory_bot_rails	2022-02-23 10:19:54.465309	2022-02-23 10:19:54.465309	3	\N
44	\N	rails generate rspec:model nameModel		https://relishapp.com/rspec/rspec-rails/docs/generators	2022-02-23 10:26:58.002186	2022-02-23 10:31:27.425808	1	20
57	\N	FactoryBot.define do\r\n  factory :chapter do\r\n    # генерируем разделы с разными именами\r\n    sequence(:name) { |n| "Number-#{n}" }\r\n  end\r\nend\r\n	В factories		2022-02-24 13:44:34.042429	2022-02-24 13:44:34.042429	1	19
62	\N	association :chapter	добавляем ассоциацию, связь, по belongs_to		2022-02-25 05:40:44.430434	2022-02-25 05:40:44.430434	3	19
60	\N			https://www.rubydoc.info/gems/factory_bot/file/GETTING_STARTED.md	2022-02-24 14:03:11.635111	2022-02-25 05:40:53.990435	16	19
59	\N	require 'factory_bot'\r\n\r\nRSpec.configure do |config|\r\n    config.include FactoryBot::Syntax::Methods\r\nend\r\n	Создаем папку и файл (не понятно зачем):  spec/support/factory_bot.rb  и подключаем в хелпере rails_helper.rb\r\nв файле:		2022-02-24 13:58:09.51756	2022-02-25 04:26:16.734476	4	16
65	\N	rspec\r\nrspec .	обычный запуск		2022-02-25 06:26:49.562624	2022-02-25 06:26:49.562624	2	23
70	\N	context 'Anon' do\r\n  # Аноним не может смотреть игру\r\n  it 'kicks from #show' do\r\n    # Вызываем экшен\r\n    get :show, params: {id: game_w_questions.id}\r\n    # Проверяем ответ\r\n    # статус ответа не равен 200\r\n    expect(response.status).not_to eq(200)\r\n    # Devise должен отправить на логин\r\n    expect(response).to redirect_to(new_user_session_path)\r\n    # Во flash должно быть сообщение об ошибке\r\n    expect(flash[:alert]).to be\r\n  end\r\nend			2022-02-25 06:51:45.168246	2022-02-25 06:51:45.168246	2	24
66	\N	# для этого к блоку it, discripe нужно добавить:\r\nit 'should return name', fast: true do\r\nrspec --tag fast # запуск тестов с тегом fast\r\nrspec --tag "~fast" # запуск тестов исключающие тег fast	запуск через тег		2022-02-25 06:27:35.309017	2022-02-25 06:27:35.309017	3	23
67	\N		глобальные настройки в файле spec_helper.rb	https://www.youtube.com/watch?v=sjumbrDILSI	2022-02-25 06:31:38.019509	2022-02-25 06:31:38.019509	3	23
71	3003			http://rusrails.ru/a-guide-to-testing-rails-applications	2022-02-25 07:36:03.087375	2022-02-25 07:36:03.087375	4	\N
68	\N	rails g rspec:controller Games			2022-02-25 06:48:06.456896	2022-02-25 06:48:06.456896	2	20
69	\N	Что проверяем в тестах на контроллеры:\r\n\r\nоперации с моделями;\r\nответы контроллеров (редирект, код 200, 404 и так далее);\r\nвызов шаблонов.\r\nКак проверяем контроллеры:\r\n\r\nнаполняем базу нужными данными;\r\nдёргаем экшен с нужными параметрами;\r\nпроверяем с помощью методов и хелперов RSpec, что изменилось, какие данные поменялись.			2022-02-25 06:49:55.574844	2022-02-25 06:49:55.574844	1	24
72	\N	sudo -u postgres psql	получение доступа к терминалу		2022-02-25 08:58:15.069728	2022-02-25 08:58:15.069728	1	25
73	\N	\\l\r\n# с размерами\r\n \\l+ или \\list+\r\n	показать все БД		2022-02-25 08:59:42.936114	2022-02-25 09:01:01.521868	2	25
74	\N	:q	выход		2022-02-25 09:02:21.12655	2022-02-25 09:57:49.994836	22	25
76	\N	DROP ROLE role_name;	Удаление роли		2022-02-25 10:01:06.657502	2022-02-25 10:01:06.657502	5	25
75	\N	CREATE ROLE role_name WITH optional_permissions;\r\nCREATE USER davide WITH PASSWORD 'jw8s0F4';	Создание роли, обрати внимание на ; в конце!!!!!	https://postgrespro.ru/docs/postgresql/12/sql-createrole	2022-02-25 09:57:35.552657	2022-02-25 10:04:00.913637	4	25
77	\N	CREATE DATABASE "myapp" WITH OWNER = deploy;\r\nDROP DATABASE iami;\r\n			2022-02-25 10:07:01.443106	2022-02-25 10:13:21.080379	6	25
78	3001	rails css:install:bootstrap			2022-02-25 10:19:37.783826	2022-02-25 10:19:37.783826	2	\N
79	\N		По оформлению readme	https://github.com/GnuriaN/format-README	2022-02-26 04:48:26.461964	2022-02-26 05:05:29.862464	21	26
81	11	gem 'rails-i18n', '~> 7'			2022-02-26 12:09:40.71866	2022-02-26 12:09:40.71866	1	\N
83	\N	git config --global user.name "Ваше имя"\r\ngit config --global user.email "youremail@yourdomain.ru"	задать глобально имя пользователя и почту.         P.S.: все равно активность не проявляется в статусе	https://andreyex.ru/linux/kak-nastroit-imya-polzovatelya-i-adres-elektronnoj-pochty-git/	2022-02-28 04:37:26.406451	2022-02-28 04:37:26.406451	1	27
82	11	config.i18n.default_locale = :ru	в file config/application.rb, в конце перед 2 end		2022-02-26 12:16:02.941653	2022-02-28 04:38:18.843163	2	\N
84	11		добавляем файл config/locales/ru.yml		2022-02-28 04:39:25.399361	2022-02-28 04:39:25.399361	3	\N
85	3004	t.integer :step_position, :limit => 2\r\nt.integer :step_position, :limit => 3	tinyint, smallint		2022-02-28 05:29:43.223462	2022-02-28 05:29:43.223462	3	\N
87	\N	ru:\r\n  # Перевод моделей\r\n  activerecord:\r\n    # Перевод названия моделей\r\n    models:\r\n      user: "Пользователь"\r\n    # Перевод атрибутов моделей\r\n    attributes:\r\n      user:\r\n        email: "Email"\r\n\r\n  controllers:\r\n    users:\r\n      updated: "Вы обновили свой профиль"\r\n\r\n  app:\r\n    name: "Шашлыки"\r\n\r\n  error:\r\n    one: "%{count} ошибка"\r\n    few: "%{count} ошибки"\r\n    many: "%{count} ошибок"\r\n    in_form: "У Вас %{amount_error} в форме:"\r\n\r\n  message:\r\n    events: "События"\r\n    where_event: "Место проведения мероприятия:"\r\n    photo:\r\n      one: "%{count} фотография"\r\n      few: "%{count} фотографии"\r\n      many: "%{count} фотографий"\r\n      score: "Всего %{amount_photo}"\r\n\r\n  comments:\r\n    comment:\r\n      destroy_confirm: "Вы уверены, что хотите удалить этот комментарий?"\r\n\r\n  subscriptions:\r\n    subscription:\r\n      destroy_confirm: "Вы уверены, что хотите удалить эту подписку?"\r\n\r\n  in_form:\r\n    reg_new_user: "Регистрация нового пользователя"\r\n    min_symbols: "(минимум %{symbols} символов)"\r\n    sing_up: "Зарегистрироваться"\r\n    sing_in: "Авторизоваться"\r\n    remember: "Запомнить меня"\r\n    go_into: "Войти"\r\n    forgot_password: "Забыли пароль?"\r\n    restore_password: "Восстановление пароля"\r\n    send_instructions: "Сброс пароля"\r\n    leave_blank: "(оставьте пустым если не хотите менять)"\r\n    update: "Обновить"\r\n    cancel_account: "Закрыть аккаунт"\r\n    send: "Отправить"\r\n    load_photo: "Загрузить фотографию"\r\n    load: "Загрузить"\r\n	Ориентир примерно такой		2022-02-28 06:57:13.947156	2022-02-28 06:57:13.947156	1	28
89	\N	render 'events/show', alert: I18n.t('controllers.photos.error')	В контроллерах		2022-02-28 08:02:54.064832	2022-02-28 08:02:54.064832	2	29
90	12	<%= f.text_field :name, placeholder: t('chapters.input_name'), class: "mb-2" %>\r\n<%= f.text_area :comment, placeholder: 'add comment', class: "w-100" %>\r\n<%= f.number_field :number_line, class: "col-3" %>\r\n<%= f.submit "save", class: "w-100 btn btn-primary" %>			2022-02-28 08:20:47.418145	2022-02-28 08:22:39.541748	1	\N
96	16			https://github.com/carrierwaveuploader/carrierwave	2022-02-28 09:23:15.836589	2022-02-28 09:23:15.836589	2	\N
91	12	<%= hidden_field_tag :chapter_id, @chapter.id %>		https://apidock.com/rails/ActionView/Helpers/FormTagHelper/hidden_field_tag	2022-02-28 08:22:47.76266	2022-02-28 08:27:30.684706	2	\N
92	\N		Для переноса строки необходимо два пробела и энтер		2022-02-28 08:46:01.423747	2022-02-28 08:46:13.310947	3	26
93	\N	gem 'carrierwave'	Гем для работы с изображениями		2022-02-28 09:04:44.831534	2022-02-28 09:04:44.831534	1	30
94	\N	gem 'rmagick'	Гем для обработки изображений		2022-02-28 09:05:03.216056	2022-02-28 09:05:03.216056	2	30
95	16			https://goodprogrammer.ru/rails-heliodor-21/lessons/bbq-file-upload-carrierwave/text	2022-02-28 09:06:18.965274	2022-02-28 09:06:27.236784	3	\N
97	\N	gem "rolify"			2022-02-28 10:36:17.068208	2022-02-28 10:36:17.068208	1	31
98	17			https://github.com/RolifyCommunity/rolify	2022-02-28 10:36:20.359848	2022-02-28 10:36:38.124926	20	\N
99	\N	rails g rolify Role User\r\nrails g rolify:role Role User	генерируем роли		2022-02-28 10:38:43.089514	2022-02-28 10:40:13.201027	2	31
100	\N	rake db:migrate	мигрируем		2022-02-28 10:40:43.546088	2022-02-28 10:40:43.546088	3	31
101	\N	class User < ActiveRecord::Base\r\n  after_create :assign_default_role\r\n\r\n  def assign_default_role\r\n    self.add_role(:newuser) if self.roles.blank?\r\n  end\r\nend	добавить роль по умолчанию, в класс закидываем метод		2022-02-28 11:12:33.480622	2022-02-28 11:12:33.480622	1	32
102	\N	user = User.find(1)\r\nuser.add_role :admin	в консоли по видимому. Добавляем роль		2022-02-28 11:15:08.370881	2022-02-28 11:15:28.125766	2	32
103	\N	user.has_role? :admin	Проверяем роль		2022-02-28 11:33:23.225036	2022-02-28 11:33:23.225036	3	32
104	\N	bundle exec rails g migration add_avatar_to_users avatar:string\r\nbundle exec rake db:migrate	Добавляем поле аватара		2022-03-01 06:48:32.072826	2022-03-01 06:48:32.072826	3	30
105	\N	bundle exec rails g uploader Avatar	Создаем uploader с помощью генератора		2022-03-01 06:49:30.900665	2022-03-01 06:49:30.900665	4	30
106	18	ssh-keygen	генерируем ключ\r\n		2022-03-01 08:07:20.175134	2022-03-01 08:07:20.175134	1	\N
107	18	ls ~/.ssh/	проверка наличия файлов		2022-03-01 08:09:51.626841	2022-03-01 08:09:51.626841	2	\N
108	18	cat ~/.ssh/id_rsa.pub	чтение ключа		2022-03-01 08:11:08.081826	2022-03-01 08:11:08.081826	3	\N
109	\N	ssh root@178.62.199.239	вход		2022-03-01 08:42:14.499288	2022-03-01 08:42:14.499288	1	33
110	\N	adduser deploy	добавить пользователя		2022-03-01 08:45:53.524777	2022-03-01 08:45:53.524777	2	33
111	\N	adduser deploy sudo	добавить пользователя к sudo		2022-03-01 08:47:53.488917	2022-03-01 08:47:53.488917	3	33
112	\N	login\r\nname log\r\npassword	залогиниться		2022-03-01 08:52:42.210679	2022-03-01 08:52:42.210679	4	33
113	\N		установка руби	https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04	2022-03-01 09:28:22.817874	2022-03-01 09:28:22.817874	5	33
114	18	which ruby	откуда руби		2022-03-01 09:33:39.415043	2022-03-01 09:34:36.084936	4	\N
64	\N	it 'should return object Chapter' do\r\n  expect(subsection.chapter).to be_an(Chapter)\r\nend	Проверка связи, subsection принадлежит Chapter		2022-02-25 05:43:10.713701	2022-03-01 17:31:41.138026	3	21
115	\N	нужно создать: \r\nsubject { get :index }\r\nexpect(subject).to render_template("index")	Проверяем рендерится ли шаблон show (НЕ сам шаблон!)		2022-03-01 17:49:05.283153	2022-03-01 18:03:42.438407	3	24
116	\N	render_views\r\nexpect(response.body).to match /<h1>Создать раздел<\\/h1>/	проверка вьюхи контроллера		2022-03-01 18:49:32.318729	2022-03-01 18:49:32.318729	4	24
86	15	User.count- количество пользователей\r\n\r\nQuestion.where(user_id: 2) - Все вопросы, заданные пользователю c id 2\r\n\r\nQuestion.where(author_id: nil) - Все анонимные вопросы\r\n\r\nQuestion.where(answer: nil, created_at: ..5.days.ago) - Все вопросы без ответа старше 5 суток (от текущего времени)\r\n\r\nQuestion.where(created_at: 1.day.ago..).order(created_at: :desc) - Все вопросы за прошедшие сутки, отсортированные по времени (свежие в начале)\r\n\r\nUser.left_joins(:questions).where(questions: { id: nil }) - Всех пользователей, которым не задали ни одного вопроса (см. статью о JOIN в материалах урока)\r\n\r\nQuestion.order("length(text) DESC").limit(10)- 10 самых длинных вопросов, отсортированные по уменьшению длины текста\r\n\r\nQuestion.where.not(answer: nil).order(updated_at: :desc).limit(10) - 10 самых свежих ответов на вопросы (вопросов, на которые был дан ответ недавно). Найдите максимально близкое к идеалу решение, используя имеющиеся в базе модели и их поля.\r\n\r\nQuestion.where(text: "Привет! Как дела?")- Все вопросы с текстом 'Привет! Как дела?'\r\n\r\nQuestion.order(updated_at: :desc).first - последний измененный вопрос			2022-02-28 06:43:09.775479	2022-03-01 19:45:47.118567	1	\N
117	3005	chapter == @last_updated_chapter ? "warning" : "primary"	Запись if else в строку, тернарный оператор		2022-03-02 04:53:16.567875	2022-03-02 04:53:38.278873	1	\N
118	3005	nil  ||  true	Если первое значение nil или false то тогда берем второе значение		2022-03-02 04:54:28.570002	2022-03-02 04:54:28.570002	2	\N
119	3005	def method\r\n  @aa ||= сложная логика\r\nend	типа если @aa будет нил или фалс то логика выполнится только один раз и все. потом там уже будет значение и сложный метод выполняться не будет. В классах применяют чтоб по сто раз одно и тоже не считать, тем более если метод долгие какой нить		2022-03-02 04:55:26.677429	2022-03-02 04:55:26.677429	3	\N
120	20	        <% flash.each do |key, value| %>\r\n          <div class="alert alert-<%= key%>" id="win-message">\r\n            <button class="btn btn-close float-end" id="btn-close"></button>\r\n            <%= value %>\r\n          </div>\r\n        <% end %>	Using to views		2022-03-02 05:53:10.326311	2022-03-02 05:54:30.918635	2	\N
121	20	redirect_to @event, notice: I18n.t('controllers.comments.created')	передача из контроллера		2022-03-02 05:54:24.24722	2022-03-02 05:54:36.045914	1	\N
128	21	npm list webpack	проверить версию		2022-03-02 10:25:29.184297	2022-03-02 10:25:29.184297	1	\N
123	20	window.addEventListener("load", hide_window, false);\r\n\r\nfunction hide_window() {\r\n  if (document.getElementById('btn-close') !== null) {\r\n    document.getElementById('btn-close').addEventListener('click', function () {\r\n      document.getElementById('win-message').style.display = 'none';\r\n    });\r\n  }\r\n}	Для отработки кнопки добавляем js код и компелируем его		2022-03-02 06:23:52.884361	2022-03-02 06:23:52.884361	3	\N
124	3003		матчеры	https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers	2022-03-02 08:24:33.298666	2022-03-02 08:24:33.298666	5	\N
126	\N	git diff	Просмотреть изменения		2022-03-02 10:02:51.438741	2022-03-02 10:02:51.438741	2	27
127	\N	\\du	показать доступных пользователей		2022-03-02 10:13:22.912218	2022-03-02 10:13:34.744041	2	25
129	\N	rails webpacker:install	для запуска соответственно		2022-03-02 10:28:33.330758	2022-03-02 10:28:33.330758	1	45
130	\N	const { environment } = require('@rails/webpacker')\r\nvar webpack = require('webpack');\r\nenvironment.plugins.prepend('Provide', new webpack.ProvidePlugin({\r\n  $: 'jquery/src/jquery',\r\n  jQuery: 'jquery/src/jquery',\r\n  jquery: 'jquery',\r\n  'window.jQuery': 'jquery',\r\n}))\r\nmodule.exports = environment\r\n	in file config/webpack/environment.js		2022-03-02 10:30:32.107296	2022-03-02 10:30:32.107296	2	45
132	\N	app/javascript\r\nна\r\napp/frontend	меняем название папки (кому то очень надо было это)		2022-03-02 10:33:38.05528	2022-03-02 10:33:38.05528	4	45
131	\N	  source_path: app/frontend\r\n  source_entry_path: packs\r\n  public_root_path: public\r\n  public_output_path: packs\r\n  cache_path: tmp/cache/webpacker\r\n  webpack_compile_output: true	in file config/webpacker.yml добавить что то подобное,  изменяем папку сборки		2022-03-02 10:31:31.625124	2022-03-02 10:32:17.18299	3	45
133	\N		локализация device messages	https://goodprogrammer.ru/rails-heliodor-21/lessons/bbq-localization-i18n/text#lokalizuem-soobscheniya-devise	2022-03-02 12:03:31.860708	2022-03-02 12:04:13.100375	4	46
135	20	flash[:danger] = @chapter.errors[:name].first\r\n# в locales/ru.yml добавил\r\n  activerecord:\r\n    errors:\r\n      models:\r\n        chapter:\r\n          attributes:\r\n            name:\r\n              blank: "Поле 'Раздел' не может быть пустым!"\r\n              taken: "Такое название раздела уже существует!"	Передача ошибки в flash	https://api.rubyonrails.org/v6.1.3/classes/ActiveModel/Errors.html	2022-03-02 12:32:44.884362	2022-03-02 12:33:09.472816	4	\N
134	\N	flash[:danger] = @chapter.errors[:name].first\r\n# в locales/ru.yml добавил\r\n  activerecord:\r\n    errors:\r\n      models:\r\n        chapter:\r\n          attributes:\r\n            name:\r\n              blank: "Поле 'Раздел' не может быть пустым!"\r\n              taken: "Такое название раздела уже существует!"\r\n	Передача ошибки в flash	https://api.rubyonrails.org/v6.1.3/classes/ActiveModel/Errors.html	2022-03-02 12:31:32.69092	2022-03-02 12:33:28.283371	3	29
139	23		О хелперах	https://blog.kirilljohnson.com/%D1%85%D0%B5%D0%BB%D0%BF%D0%B5%D1%80%D1%8B/	2022-03-03 04:53:19.540016	2022-03-03 04:53:19.540016	1	\N
141	23	Хелперы это то что должно быть во вьюхе, но осложнено определенной логикой.			2022-03-03 04:59:12.439882	2022-03-03 04:59:22.437261	0	\N
140	23	link_to\r\nform_for	example helpers build-in rails 		2022-03-03 04:56:03.336234	2022-03-03 05:00:56.959856	2	\N
142	24		сайт для проверки рег.выражений.	https://regex101.com/	2022-03-03 05:08:35.874095	2022-03-03 05:08:35.874095	1	\N
143	24		памятка	http://www.nncron.ru/nnbackup/help/RU/add_info/regexp.htm	2022-03-03 05:23:03.151729	2022-03-03 05:23:03.151729	2	\N
144	\N	tonglsbite   -  true\r\nTONGLSBIET  - true\r\nTosdresdfs  -  true\r\nElsdflerte  -  true\r\nSTdsfETDSs  -  false\r\nT - false	/^[A-Z]?[a-z]+$|^[A-Z]{2,}$/		2022-03-03 05:28:32.893455	2022-03-03 05:28:32.893455	1	48
145	\N	ouiretoei@mail.ru - true\r\nlkjasdfj.sdfsdf@yandex.com - true\r\n342432234@gmail.com - true\r\n234asdf@lk.ru - true\r\n234a#sdf@lk.ru - false	Email     =        /^[\\w\\.]+\\@[a-z]{2,6}\\.[a-z]{2,4}$/		2022-03-03 05:33:35.184302	2022-03-03 05:33:53.002185	2	48
148	15		About  joins	http://fkn.ktu10.com/?q=node/7358	2022-03-03 06:01:04.966317	2022-03-03 06:01:12.762946	0	\N
149	25	ruby nameProject.rb	запуск приложения		2022-03-03 06:14:47.791034	2022-03-03 06:14:47.791034	1	\N
150	26	 mkdir Загрузки/папка	 создать папку		2022-03-03 06:19:12.367895	2022-03-03 06:19:12.367895	1	\N
151	26	nano файл.txt\r\nvi файл.txt\r\n> файл\r\necho "Это строка" > файл.txt\r\ncat > файл.txt	создать файл		2022-03-03 06:22:28.885312	2022-03-03 06:22:28.885312	2	\N
152	25	input = STDIN.gets.chomp\r\nputs input	Для получения и вывода строки в консоли		2022-03-03 06:24:02.694422	2022-03-03 06:24:02.694422	2	\N
153	25	ruby nameProject.rb  arg1 arg2 \r\n# попадает в массив ARGV\r\nprint ARGV\r\n# output    [arg1, arg2]	Передача аргументов при запуске приложения		2022-03-03 06:32:47.795313	2022-03-03 06:32:47.795313	3	\N
154	\N		в шаблоне осн еще нужно все перевести на pack!		2022-03-03 06:35:28.767912	2022-03-03 06:35:28.767912	5	45
156	\N	ALTER USER userName WITH SUPERUSER;	Дать права супер юзера. Обрати внимание на ; в конце!!!		2022-03-03 06:59:57.247328	2022-03-03 06:59:57.247328	1	53
157	\N		для выгрузки нужно создать нужного юзера с правами супер пользователя!		2022-03-03 07:03:20.62915	2022-03-03 07:03:20.62915	2	52
155	\N	pg_dump имя_базы > файл_дампа.sql	Лучше создавать с расширение sql!	https://postgrespro.ru/docs/postgresql/9.6/backup-dump#backup-dump-all	2022-03-03 06:47:00.7331	2022-03-03 07:03:46.776512	1	52
\.


--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.chapters (id, name, created_at, updated_at, count_clicks) FROM stdin;
3004	generator/migration	2022-02-23 06:15:23.855464	2022-02-28 05:41:22.325934	86
3002	git	2022-02-23 06:15:23.84722	2022-03-02 12:49:03.299628	40
22	Docker	2022-03-03 04:20:17.036447	2022-03-03 04:20:17.036447	0
26	commend ubuntu	2022-03-03 06:17:00.496381	2022-03-03 06:22:28.907716	3
17	Авторизация rolify	2022-02-28 10:31:41.133441	2022-03-03 04:44:24.960933	19
16	carrierwave images	2022-02-28 09:03:48.010043	2022-03-01 06:51:08.858069	9
25	Console	2022-03-03 06:04:03.186265	2022-03-03 06:34:43.011505	8
21	webpack	2022-03-02 10:21:42.930399	2022-03-03 06:34:47.233765	4
3005	string record	2022-02-23 06:15:23.85993	2022-03-02 05:31:41.071719	13
20	flash	2022-03-02 05:48:17.268405	2022-03-03 06:35:53.272976	13
3001	esbuild	2022-02-23 06:15:23.843294	2022-03-02 05:47:00.5499	14
23	Helpers	2022-03-03 04:53:02.970134	2022-03-03 05:00:56.985307	7
18	SSH	2022-03-01 08:07:02.042036	2022-03-01 09:40:48.857694	9
27	Methods	2022-03-03 06:36:33.937992	2022-03-03 06:37:32.407885	5
24	regular expressions	2022-03-03 05:02:28.161526	2022-03-03 05:38:36.54583	7
14	postgresql	2022-02-25 08:53:12.578546	2022-03-03 07:04:07.014765	19
19	Number-1	2022-03-01 16:48:31.028434	2022-03-02 10:35:51.944255	1
11	locales	2022-02-23 06:33:40.498051	2022-03-02 12:33:21.673165	88
13	EXAMPLE	2022-02-23 09:41:15.597719	2022-03-03 05:48:02.302898	213
12	elements form	2022-02-23 07:31:41.594583	2022-03-03 05:48:16.085535	15
3003	rspec	2022-02-23 06:15:23.85139	2022-03-02 12:36:53.13975	136
15	ActiveRecord	2022-02-28 06:42:05.702022	2022-03-03 06:03:47.976843	15
\.


--
-- Data for Name: errors; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.errors (id, name, description, correct, created_at, updated_at) FROM stdin;
4	проблема с node.js	Выдает что то подобное при сборе ассетов\r\nerror esbuild@0.14.21: The engine "node" is incompatible with this module. Expected version ">=12". Got "10.19.0"\r\nпроблемы при обновлении node	Получилось обновить node только через:\r\nhttps://losst.ru/ustanovka-node-js-ubuntu-18-04	2022-02-24 08:45:11.954521	2022-02-24 08:45:11.954521
5	проблема с confirm	не отрабатывал confirm	заменил: confirm: 'Are you sere?', на onclick: "return confirm('Are you sure?')"	2022-02-24 12:59:29.33776	2022-02-24 12:59:29.33776
6	error rmagick	При bundle получаю ошибку:\r\nAn error occurred while installing rmagick (4.2.4), and Bundler cannot continue.	До bundle выполнить команду:\r\nsudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev	2022-02-25 08:48:58.973758	2022-02-25 08:48:58.973758
7	rspec manifest >= 5	WARN: Unresolved or ambiguous specs during Gem::Specification.reset:\r\n      minitest (>= 5.1)\r\n      Available/installed versions of this gem:\r\n      - 5.15.0\r\n      - 5.14.4\r\n      - 5.14.2\r\nWARN: Clearing out unresolved specs. Try 'gem cleanup <gem>'\r\nPlease report a bug if this causes problems.\r\nRun options: include {:con=>true}\r\n.\r\n\r\nFinished in 0.04008 seconds (files took 1.97 seconds to load)\r\n1 example, 0 failures\r\n\r\nalexandr@alexandr-desktop:~/code/diary$ rspec --tag con\r\nWARN: Unresolved or ambiguous specs during Gem::Specification.reset:\r\n      minitest (>= 5.1)\r\n      Available/installed versions of this gem:\r\n      - 5.15.0\r\n      - 5.14.4\r\n      - 5.14.2\r\nWARN: Clearing out unresolved specs. Try 'gem cleanup <gem>'\r\nPlease report a bug if this causes problems.\r\nRun options: include {:con=>true}	gem cleanup - уборка старых версий гемов	2022-03-01 17:22:54.912539	2022-03-01 17:27:52.794262
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.schema_migrations (version) FROM stdin;
20220215171142
20220215185514
20220218080258
20220218091726
20220222061114
20220222185231
20220224071736
20220228052254
\.


--
-- Data for Name: subsections; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.subsections (id, chapter_id, name, created_at, updated_at) FROM stdin;
16	3003	install goodprogrammer	2022-02-23 09:08:05.023495	2022-02-23 10:02:17.890926
19	3003	factory_bot_rails	2022-02-23 10:10:37.659938	2022-02-23 10:10:53.947657
20	3003	generator rspec	2022-02-23 10:24:04.174159	2022-02-23 10:24:04.174159
21	3003	testing models	2022-02-23 10:50:59.839089	2022-02-23 10:50:59.839089
22	3003	Checking	2022-02-25 05:10:18.467669	2022-02-25 05:10:18.467669
23	3003	start check	2022-02-25 06:25:36.409529	2022-02-25 06:25:36.409529
24	3003	testing controllers	2022-02-25 06:45:50.352802	2022-02-25 06:45:50.352802
25	14	input	2022-02-25 08:58:00.04795	2022-02-25 08:58:00.04795
26	3002	README	2022-02-26 05:04:15.465288	2022-02-26 05:04:15.465288
27	3002	main commands	2022-02-28 04:36:05.808592	2022-02-28 04:36:05.808592
28	11	in file ru.yml	2022-02-28 06:56:53.993729	2022-02-28 06:56:53.993729
29	11	Using	2022-02-28 08:01:33.980131	2022-02-28 08:01:33.980131
30	16	install	2022-02-28 09:04:21.902079	2022-02-28 09:04:21.902079
31	17	install	2022-02-28 10:35:58.264154	2022-02-28 10:35:58.264154
32	17	Using	2022-02-28 11:11:36.013888	2022-02-28 11:11:36.013888
33	18	digitalOcean	2022-03-01 08:41:30.531856	2022-03-01 08:41:30.531856
45	21	Install to rails	2022-03-02 10:22:07.340194	2022-03-02 10:22:07.340194
46	11	device	2022-03-02 12:04:05.422878	2022-03-02 12:04:05.422878
48	24	Examples	2022-03-03 05:26:57.55392	2022-03-03 05:26:57.55392
51	27	arrays	2022-03-03 06:37:14.276097	2022-03-03 06:37:14.276097
53	14	Add grands	2022-03-03 06:57:49.646614	2022-03-03 06:57:49.646614
52	14	выгрузка БД	2022-03-03 06:46:31.274601	2022-03-03 07:03:59.3795
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: dairy
--

COPY public.tasks (id, title, body, status, created_at, updated_at) FROM stdin;
5	git hub профиль	\N	0	2022-02-28 06:51:20.197735	2022-02-28 06:51:20.197735
6	Разобраться с dump БД	\N	0	2022-02-28 07:17:34.490723	2022-02-28 08:37:41.651632
4	localies	\N	1	2022-02-28 06:38:41.981312	2022-02-28 08:50:40.394888
8	carrierwave	\N	0	2022-02-28 08:51:11.351928	2022-02-28 08:51:11.351928
12	pundit	\N	0	2022-02-28 11:15:45.834722	2022-02-28 11:15:45.834722
14	Docker	\N	0	2022-03-01 05:27:56.294966	2022-03-01 05:27:56.294966
11	rolify	\N	1	2022-02-28 10:31:51.273257	2022-03-01 05:46:31.860891
10	Админка	\N	1	2022-02-28 08:59:56.463082	2022-03-01 05:46:36.898341
13	passwords	\N	1	2022-02-28 11:19:21.188086	2022-03-02 09:39:05.992268
9	rspec	\N	1	2022-02-28 08:53:46.285368	2022-03-02 12:37:39.602319
7	Уточнить про хелперы	\N	1	2022-02-28 07:19:57.38235	2022-03-03 04:59:44.633608
15	Methods	\N	0	2022-03-03 05:01:35.660124	2022-03-03 05:01:35.660124
17	Ajax	\N	0	2022-03-03 05:37:34.96532	2022-03-03 05:37:34.96532
16	regular expressions	\N	1	2022-03-03 05:02:21.254128	2022-03-03 05:37:37.904227
\.


--
-- Name: blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dairy
--

SELECT pg_catalog.setval('public.blocks_id_seq', 157, true);


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dairy
--

SELECT pg_catalog.setval('public.chapters_id_seq', 27, true);


--
-- Name: errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dairy
--

SELECT pg_catalog.setval('public.errors_id_seq', 7, true);


--
-- Name: subsections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dairy
--

SELECT pg_catalog.setval('public.subsections_id_seq', 53, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dairy
--

SELECT pg_catalog.setval('public.tasks_id_seq', 17, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blocks blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: errors errors_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.errors
    ADD CONSTRAINT errors_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subsections subsections_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.subsections
    ADD CONSTRAINT subsections_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: index_blocks_on_chapter_id; Type: INDEX; Schema: public; Owner: dairy
--

CREATE INDEX index_blocks_on_chapter_id ON public.blocks USING btree (chapter_id);


--
-- Name: index_blocks_on_subsection_id; Type: INDEX; Schema: public; Owner: dairy
--

CREATE INDEX index_blocks_on_subsection_id ON public.blocks USING btree (subsection_id);


--
-- Name: index_subsections_on_chapter_id; Type: INDEX; Schema: public; Owner: dairy
--

CREATE INDEX index_subsections_on_chapter_id ON public.subsections USING btree (chapter_id);


--
-- Name: subsections fk_rails_585b868414; Type: FK CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.subsections
    ADD CONSTRAINT fk_rails_585b868414 FOREIGN KEY (chapter_id) REFERENCES public.chapters(id);


--
-- Name: blocks fk_rails_bd4a40a5af; Type: FK CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT fk_rails_bd4a40a5af FOREIGN KEY (subsection_id) REFERENCES public.subsections(id);


--
-- Name: blocks fk_rails_e1fc8cff3d; Type: FK CONSTRAINT; Schema: public; Owner: dairy
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT fk_rails_e1fc8cff3d FOREIGN KEY (chapter_id) REFERENCES public.chapters(id);


--
-- PostgreSQL database dump complete
--

