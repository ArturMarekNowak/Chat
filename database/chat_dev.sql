--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2023-04-01 12:50:35

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
-- TOC entry 211 (class 1259 OID 17447)
-- Name: auth_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_users (
    id bigint NOT NULL,
    nickname character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255)
);


ALTER TABLE public.auth_users OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17446)
-- Name: auth_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_users_id_seq OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_users_id_seq OWNED BY public.auth_users.id;


--
-- TOC entry 215 (class 1259 OID 17461)
-- Name: chat_conversation_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_conversation_members (
    id bigint NOT NULL,
    owner boolean DEFAULT false NOT NULL,
    conversation_id bigint NOT NULL,
    user_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.chat_conversation_members OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17460)
-- Name: chat_conversation_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_conversation_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_conversation_members_id_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 214
-- Name: chat_conversation_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_conversation_members_id_seq OWNED BY public.chat_conversation_members.id;


--
-- TOC entry 213 (class 1259 OID 17454)
-- Name: chat_conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_conversations (
    id bigint NOT NULL,
    title character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.chat_conversations OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17453)
-- Name: chat_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_conversations_id_seq OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 212
-- Name: chat_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_conversations_id_seq OWNED BY public.chat_conversations.id;


--
-- TOC entry 219 (class 1259 OID 17504)
-- Name: chat_emojis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_emojis (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    unicode character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.chat_emojis OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17503)
-- Name: chat_emojis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_emojis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_emojis_id_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 218
-- Name: chat_emojis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_emojis_id_seq OWNED BY public.chat_emojis.id;


--
-- TOC entry 221 (class 1259 OID 17513)
-- Name: chat_message_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_message_reactions (
    id bigint NOT NULL,
    message_id bigint NOT NULL,
    user_id bigint NOT NULL,
    emoji_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.chat_message_reactions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17512)
-- Name: chat_message_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_message_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_message_reactions_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 220
-- Name: chat_message_reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_message_reactions_id_seq OWNED BY public.chat_message_reactions.id;


--
-- TOC entry 217 (class 1259 OID 17483)
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id bigint NOT NULL,
    content text,
    conversation_id bigint NOT NULL,
    user_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17482)
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_messages_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 216
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- TOC entry 223 (class 1259 OID 17539)
-- Name: chat_seen_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_seen_messages (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    message_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.chat_seen_messages OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17538)
-- Name: chat_seen_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_seen_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_seen_messages_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 222
-- Name: chat_seen_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_seen_messages_id_seq OWNED BY public.chat_seen_messages.id;


--
-- TOC entry 209 (class 1259 OID 17441)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 3198 (class 2604 OID 17450)
-- Name: auth_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users ALTER COLUMN id SET DEFAULT nextval('public.auth_users_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 17464)
-- Name: chat_conversation_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_conversation_members ALTER COLUMN id SET DEFAULT nextval('public.chat_conversation_members_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 17457)
-- Name: chat_conversations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_conversations ALTER COLUMN id SET DEFAULT nextval('public.chat_conversations_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 17507)
-- Name: chat_emojis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_emojis ALTER COLUMN id SET DEFAULT nextval('public.chat_emojis_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 17516)
-- Name: chat_message_reactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message_reactions ALTER COLUMN id SET DEFAULT nextval('public.chat_message_reactions_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17486)
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 17542)
-- Name: chat_seen_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_seen_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_seen_messages_id_seq'::regclass);


--
-- TOC entry 3386 (class 0 OID 17447)
-- Dependencies: 211
-- Data for Name: auth_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_users (id, nickname, inserted_at, updated_at, email, password_hash) FROM stdin;
\.


--
-- TOC entry 3390 (class 0 OID 17461)
-- Dependencies: 215
-- Data for Name: chat_conversation_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_conversation_members (id, owner, conversation_id, user_id, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3388 (class 0 OID 17454)
-- Dependencies: 213
-- Data for Name: chat_conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_conversations (id, title, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 17504)
-- Dependencies: 219
-- Data for Name: chat_emojis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_emojis (id, key, unicode, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3396 (class 0 OID 17513)
-- Dependencies: 221
-- Data for Name: chat_message_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_message_reactions (id, message_id, user_id, emoji_id, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 17483)
-- Dependencies: 217
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, content, conversation_id, user_id, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 17539)
-- Dependencies: 223
-- Data for Name: chat_seen_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_seen_messages (id, user_id, message_id, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 17441)
-- Dependencies: 209
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20230304180322	2023-03-26 15:11:08
20230304180529	2023-03-26 15:11:08
20230304180713	2023-03-26 15:11:08
20230304180817	2023-03-26 15:11:08
20230304182248	2023-03-26 15:11:08
20230304183626	2023-03-26 15:11:08
20230304183719	2023-03-26 15:11:08
20230318180717	2023-03-26 15:11:08
\.


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_users_id_seq', 12, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 214
-- Name: chat_conversation_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_conversation_members_id_seq', 4, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 212
-- Name: chat_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_conversations_id_seq', 2, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 218
-- Name: chat_emojis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_emojis_id_seq', 1, false);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 220
-- Name: chat_message_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_message_reactions_id_seq', 1, false);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 216
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 5, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 222
-- Name: chat_seen_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_seen_messages_id_seq', 1, false);


--
-- TOC entry 3210 (class 2606 OID 17452)
-- Name: auth_users auth_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users
    ADD CONSTRAINT auth_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 17467)
-- Name: chat_conversation_members chat_conversation_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_conversation_members
    ADD CONSTRAINT chat_conversation_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 17459)
-- Name: chat_conversations chat_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_conversations
    ADD CONSTRAINT chat_conversations_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 17511)
-- Name: chat_emojis chat_emojis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_emojis
    ADD CONSTRAINT chat_emojis_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 17518)
-- Name: chat_message_reactions chat_message_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message_reactions
    ADD CONSTRAINT chat_message_reactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 17490)
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 17544)
-- Name: chat_seen_messages chat_seen_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_seen_messages
    ADD CONSTRAINT chat_seen_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 17445)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3208 (class 1259 OID 17560)
-- Name: auth_users_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_users_email_index ON public.auth_users USING btree (email);


--
-- TOC entry 3213 (class 1259 OID 17478)
-- Name: chat_conversation_members_conversation_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_conversation_members_conversation_id_index ON public.chat_conversation_members USING btree (conversation_id);


--
-- TOC entry 3214 (class 1259 OID 17480)
-- Name: chat_conversation_members_conversation_id_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX chat_conversation_members_conversation_id_user_id_index ON public.chat_conversation_members USING btree (conversation_id, user_id);


--
-- TOC entry 3215 (class 1259 OID 17481)
-- Name: chat_conversation_members_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX chat_conversation_members_owner ON public.chat_conversation_members USING btree (conversation_id) WHERE (owner = true);


--
-- TOC entry 3218 (class 1259 OID 17479)
-- Name: chat_conversation_members_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_conversation_members_user_id_index ON public.chat_conversation_members USING btree (user_id);


--
-- TOC entry 3225 (class 1259 OID 17536)
-- Name: chat_message_reactions_emoji_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_message_reactions_emoji_id_index ON public.chat_message_reactions USING btree (emoji_id);


--
-- TOC entry 3226 (class 1259 OID 17534)
-- Name: chat_message_reactions_message_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_message_reactions_message_id_index ON public.chat_message_reactions USING btree (message_id);


--
-- TOC entry 3229 (class 1259 OID 17535)
-- Name: chat_message_reactions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_message_reactions_user_id_index ON public.chat_message_reactions USING btree (user_id);


--
-- TOC entry 3230 (class 1259 OID 17537)
-- Name: chat_message_reactions_user_id_message_id_emoji_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX chat_message_reactions_user_id_message_id_emoji_id_index ON public.chat_message_reactions USING btree (user_id, message_id, emoji_id);


--
-- TOC entry 3219 (class 1259 OID 17501)
-- Name: chat_messages_conversation_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_messages_conversation_id_index ON public.chat_messages USING btree (conversation_id);


--
-- TOC entry 3222 (class 1259 OID 17502)
-- Name: chat_messages_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_messages_user_id_index ON public.chat_messages USING btree (user_id);


--
-- TOC entry 3231 (class 1259 OID 17556)
-- Name: chat_seen_messages_message_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_seen_messages_message_id_index ON public.chat_seen_messages USING btree (message_id);


--
-- TOC entry 3234 (class 1259 OID 17555)
-- Name: chat_seen_messages_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_seen_messages_user_id_index ON public.chat_seen_messages USING btree (user_id);


--
-- TOC entry 3235 (class 1259 OID 17557)
-- Name: chat_seen_messages_user_id_message_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chat_seen_messages_user_id_message_id_index ON public.chat_seen_messages USING btree (user_id, message_id);


--
-- TOC entry 3236 (class 2606 OID 17468)
-- Name: chat_conversation_members chat_conversation_members_conversation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_conversation_members
    ADD CONSTRAINT chat_conversation_members_conversation_id_fkey FOREIGN KEY (conversation_id) REFERENCES public.chat_conversations(id);


--
-- TOC entry 3237 (class 2606 OID 17473)
-- Name: chat_conversation_members chat_conversation_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_conversation_members
    ADD CONSTRAINT chat_conversation_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_users(id);


--
-- TOC entry 3242 (class 2606 OID 17529)
-- Name: chat_message_reactions chat_message_reactions_emoji_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message_reactions
    ADD CONSTRAINT chat_message_reactions_emoji_id_fkey FOREIGN KEY (emoji_id) REFERENCES public.chat_emojis(id);


--
-- TOC entry 3240 (class 2606 OID 17519)
-- Name: chat_message_reactions chat_message_reactions_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message_reactions
    ADD CONSTRAINT chat_message_reactions_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.chat_messages(id);


--
-- TOC entry 3241 (class 2606 OID 17524)
-- Name: chat_message_reactions chat_message_reactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message_reactions
    ADD CONSTRAINT chat_message_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_users(id);


--
-- TOC entry 3238 (class 2606 OID 17491)
-- Name: chat_messages chat_messages_conversation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_conversation_id_fkey FOREIGN KEY (conversation_id) REFERENCES public.chat_conversations(id);


--
-- TOC entry 3239 (class 2606 OID 17496)
-- Name: chat_messages chat_messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_users(id);


--
-- TOC entry 3244 (class 2606 OID 17550)
-- Name: chat_seen_messages chat_seen_messages_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_seen_messages
    ADD CONSTRAINT chat_seen_messages_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.chat_messages(id);


--
-- TOC entry 3243 (class 2606 OID 17545)
-- Name: chat_seen_messages chat_seen_messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_seen_messages
    ADD CONSTRAINT chat_seen_messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_users(id);


-- Completed on 2023-04-01 12:50:35

--
-- PostgreSQL database dump complete
--

