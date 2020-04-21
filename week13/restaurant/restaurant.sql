--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: restaurant; Type: TABLE; Schema: public; Owner: KelLes
--

CREATE TABLE public.restaurant (
    id integer NOT NULL,
    name character varying(255),
    distance double precision,
    stars integer,
    category character varying(255),
    favorite_dish character varying(255),
    takeout boolean,
    last_time character varying(10)
);


ALTER TABLE public.restaurant OWNER TO "KelLes";

--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: KelLes
--

COPY public.restaurant (id, name, distance, stars, category, favorite_dish, takeout, last_time) FROM stdin;
1	American_Deli	3	5	American_Cuisine	LemonPepperWings	t	4152020
8	IHOP	4.3	3	American_Cuisine	Pancakes	f	4112020
2	Ribshack	4.5	5	BBQ	Baby Back Ribs	f	4012020
3	Popeys	3.2	5	Fast Food	Chicken Sandwich	t	3082020
4	Stone_Mountain_Deli	4.5	4	American_Cuisine	Cheeseburger Meal	f	3032020
5	Chinese_Dragon	0.5	5	Chinese	House Fried Rice	f	4132020
6	American_Deli	3	5	American_Cuisine	Lemon Pepper Wings	t	4162020
7	Stacks	23.2	5	Bar and Grill	T Bone Steak	f	3262020
9	American_Deli	3	5	American_Cuisine	Hot Wings	t	4152020
10	American_Deli	3	5	American_Cuisine	Chili Wings	t	3152020
11	Applebees	1.8	4	American_Cuisine	Fajita Plate	f	4172020
\.


--
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: KelLes
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

