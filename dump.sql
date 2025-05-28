--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-05-26 01:05:30

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
-- TOC entry 220 (class 1259 OID 28649)
-- Name: center; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.center (
    id integer NOT NULL,
    adress character varying(255),
    week_schedule character varying(255),
    weekend_schedule character varying(255)
);


ALTER TABLE public.center OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28648)
-- Name: center_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.center_id_seq OWNER TO postgres;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 219
-- Name: center_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.center_id_seq OWNED BY public.center.id;


--
-- TOC entry 221 (class 1259 OID 28657)
-- Name: class_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_type (
    approved boolean NOT NULL,
    difficulty_level smallint,
    id integer NOT NULL,
    description character varying(255),
    name character varying(255),
    image_url character varying(255),
    CONSTRAINT class_type_difficulty_level_check CHECK (((difficulty_level >= 0) AND (difficulty_level <= 2)))
);


ALTER TABLE public.class_type OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 28644)
-- Name: class_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_type_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_type_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28665)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    account_balance real NOT NULL,
    id integer NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    token character varying(255)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 28672)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    years_of_experience integer,
    biography character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    token character varying(255),
    image_url character varying(255)
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28679)
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owner (
    id integer NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    token character varying(255)
);


ALTER TABLE public.owner OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 28686)
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    customer_id integer NOT NULL,
    date date,
    id integer NOT NULL,
    session_id integer NOT NULL,
    "time" time(6) without time zone
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28645)
-- Name: registration_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.registration_seq OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28691)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    class_type_id integer NOT NULL,
    date date,
    end_time time(6) without time zone,
    id integer NOT NULL,
    instructor_id integer,
    price real NOT NULL,
    remaining_capacity integer,
    room_number integer,
    start_time time(6) without time zone
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28646)
-- Name: session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.session_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.session_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28647)
-- Name: user_table_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_table_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_table_seq OWNER TO postgres;

--
-- TOC entry 4662 (class 2604 OID 28652)
-- Name: center id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.center ALTER COLUMN id SET DEFAULT nextval('public.center_id_seq'::regclass);


--
-- TOC entry 4830 (class 0 OID 28649)
-- Dependencies: 220
-- Data for Name: center; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.center (id, adress, week_schedule, weekend_schedule) FROM stdin;
1	845 Sherbrooke St W, Montreal, Quebec H3A 0G4	9:00 am to 9:00 pm	9:00 am to 5:00 pm
\.


--
-- TOC entry 4831 (class 0 OID 28657)
-- Dependencies: 221
-- Data for Name: class_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_type (approved, difficulty_level, id, description, name, image_url) FROM stdin;
t	0	52	Fun Tennis Class 	Tennis	https://superblog.supercdn.cloud/site_cuid_clbflviuv1211271lryc26gl78p/images/image-cp-1734108141593-compressed.jpeg
\.


--
-- TOC entry 4832 (class 0 OID 28665)
-- Dependencies: 222
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (account_balance, id, email, first_name, last_name, password, token) FROM stdin;
\.


--
-- TOC entry 4833 (class 0 OID 28672)
-- Dependencies: 223
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (id, years_of_experience, biography, email, first_name, last_name, password, token, image_url) FROM stdin;
254	0		ronald@gmail.com	Ronald	McDonald	Ronald123!		https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-5YS-b9foS2UxMIUxU7S8g49T28TkO2b3WA&s
\.


--
-- TOC entry 4834 (class 0 OID 28679)
-- Dependencies: 224
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owner (id, email, first_name, last_name, password, token) FROM stdin;
253	owner@gmail.com	owner	owner	owner!23koko	eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvd25lckBnbWFpbC5jb20iLCJpYXQiOjE3NDgyMzQ3ODEsImV4cCI6MTc0ODMyMTE4MX0.Ts2mDLEQtUkm7YMCPENRlaPQATFZ2bOmISbMtp0OorQ
\.


--
-- TOC entry 4835 (class 0 OID 28686)
-- Dependencies: 225
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration (customer_id, date, id, session_id, "time") FROM stdin;
\.


--
-- TOC entry 4836 (class 0 OID 28691)
-- Dependencies: 226
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (class_type_id, date, end_time, id, instructor_id, price, remaining_capacity, room_number, start_time) FROM stdin;
52	2025-05-29	12:00:00	102	254	50	16	280	10:00:00
\.


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 219
-- Name: center_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.center_id_seq', 1, true);


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 215
-- Name: class_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_type_seq', 101, true);


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 216
-- Name: registration_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registration_seq', 301, true);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 217
-- Name: session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.session_seq', 151, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_table_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_table_seq', 301, true);


--
-- TOC entry 4665 (class 2606 OID 28656)
-- Name: center center_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.center
    ADD CONSTRAINT center_pkey PRIMARY KEY (id);


--
-- TOC entry 4667 (class 2606 OID 28664)
-- Name: class_type class_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_type
    ADD CONSTRAINT class_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4669 (class 2606 OID 28671)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 4671 (class 2606 OID 28678)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- TOC entry 4673 (class 2606 OID 28685)
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 28690)
-- Name: registration registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 28695)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 28701)
-- Name: registration fk8alpdtshbyu3x0fkod9b2rfpy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT fk8alpdtshbyu3x0fkod9b2rfpy FOREIGN KEY (session_id) REFERENCES public.session(id);


--
-- TOC entry 4680 (class 2606 OID 28711)
-- Name: session fk8l1v75brk9afixg1li5ymt7nj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT fk8l1v75brk9afixg1li5ymt7nj FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- TOC entry 4679 (class 2606 OID 28696)
-- Name: registration fkijm9x3g0n5d8w6qg91a7nwypp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT fkijm9x3g0n5d8w6qg91a7nwypp FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 4681 (class 2606 OID 28706)
-- Name: session fkstsr2fpdy6erqx5ao1tvpl0px; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT fkstsr2fpdy6erqx5ao1tvpl0px FOREIGN KEY (class_type_id) REFERENCES public.class_type(id);


-- Completed on 2025-05-26 01:05:30

--
-- PostgreSQL database dump complete
--

