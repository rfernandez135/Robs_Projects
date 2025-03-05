--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    prev_num_guess integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (230, 68, 158);
INSERT INTO public.games VALUES (231, 68, 94);
INSERT INTO public.games VALUES (232, 69, 377);
INSERT INTO public.games VALUES (233, 69, 136);
INSERT INTO public.games VALUES (234, 68, 183);
INSERT INTO public.games VALUES (235, 68, 84);
INSERT INTO public.games VALUES (236, 68, 912);
INSERT INTO public.games VALUES (237, 70, 11);
INSERT INTO public.games VALUES (238, 70, 10);
INSERT INTO public.games VALUES (239, 72, 440);
INSERT INTO public.games VALUES (240, 72, 187);
INSERT INTO public.games VALUES (241, 75, 427);
INSERT INTO public.games VALUES (242, 75, 68);
INSERT INTO public.games VALUES (243, 72, 189);
INSERT INTO public.games VALUES (244, 72, 205);
INSERT INTO public.games VALUES (245, 72, 20);
INSERT INTO public.games VALUES (246, 70, 3);
INSERT INTO public.games VALUES (247, 70, 2);
INSERT INTO public.games VALUES (248, 70, 5);
INSERT INTO public.games VALUES (249, 82, 909);
INSERT INTO public.games VALUES (250, 82, 340);
INSERT INTO public.games VALUES (251, 83, 289);
INSERT INTO public.games VALUES (252, 83, 922);
INSERT INTO public.games VALUES (253, 82, 251);
INSERT INTO public.games VALUES (254, 82, 727);
INSERT INTO public.games VALUES (255, 82, 100);
INSERT INTO public.games VALUES (256, 84, 405);
INSERT INTO public.games VALUES (257, 84, 760);
INSERT INTO public.games VALUES (258, 85, 965);
INSERT INTO public.games VALUES (259, 85, 266);
INSERT INTO public.games VALUES (260, 84, 307);
INSERT INTO public.games VALUES (261, 84, 591);
INSERT INTO public.games VALUES (262, 84, 125);
INSERT INTO public.games VALUES (263, 86, 87);
INSERT INTO public.games VALUES (264, 86, 41);
INSERT INTO public.games VALUES (265, 87, 485);
INSERT INTO public.games VALUES (266, 87, 88);
INSERT INTO public.games VALUES (267, 86, 74);
INSERT INTO public.games VALUES (268, 86, 3);
INSERT INTO public.games VALUES (269, 86, 542);
INSERT INTO public.games VALUES (270, 88, 233);
INSERT INTO public.games VALUES (271, 88, 343);
INSERT INTO public.games VALUES (272, 89, 585);
INSERT INTO public.games VALUES (273, 89, 99);
INSERT INTO public.games VALUES (274, 88, 164);
INSERT INTO public.games VALUES (275, 88, 149);
INSERT INTO public.games VALUES (276, 88, 240);
INSERT INTO public.games VALUES (277, 90, 786);
INSERT INTO public.games VALUES (278, 90, 248);
INSERT INTO public.games VALUES (279, 91, 65);
INSERT INTO public.games VALUES (280, 91, 12);
INSERT INTO public.games VALUES (281, 90, 932);
INSERT INTO public.games VALUES (282, 90, 726);
INSERT INTO public.games VALUES (283, 90, 160);
INSERT INTO public.games VALUES (284, 92, 113);
INSERT INTO public.games VALUES (285, 92, 492);
INSERT INTO public.games VALUES (286, 93, 76);
INSERT INTO public.games VALUES (287, 93, 350);
INSERT INTO public.games VALUES (288, 92, 689);
INSERT INTO public.games VALUES (289, 92, 16);
INSERT INTO public.games VALUES (290, 92, 945);
INSERT INTO public.games VALUES (291, 94, 258);
INSERT INTO public.games VALUES (292, 94, 92);
INSERT INTO public.games VALUES (293, 95, 952);
INSERT INTO public.games VALUES (294, 95, 189);
INSERT INTO public.games VALUES (295, 94, 23);
INSERT INTO public.games VALUES (296, 94, 79);
INSERT INTO public.games VALUES (297, 94, 804);
INSERT INTO public.games VALUES (298, 96, 150);
INSERT INTO public.games VALUES (299, 96, 839);
INSERT INTO public.games VALUES (300, 97, 869);
INSERT INTO public.games VALUES (301, 97, 106);
INSERT INTO public.games VALUES (302, 96, 167);
INSERT INTO public.games VALUES (303, 96, 607);
INSERT INTO public.games VALUES (304, 96, 424);
INSERT INTO public.games VALUES (305, 98, 274);
INSERT INTO public.games VALUES (306, 98, 78);
INSERT INTO public.games VALUES (307, 99, 986);
INSERT INTO public.games VALUES (308, 99, 233);
INSERT INTO public.games VALUES (309, 98, 363);
INSERT INTO public.games VALUES (310, 98, 700);
INSERT INTO public.games VALUES (311, 98, 549);
INSERT INTO public.games VALUES (312, 100, 855);
INSERT INTO public.games VALUES (313, 100, 304);
INSERT INTO public.games VALUES (314, 101, 307);
INSERT INTO public.games VALUES (315, 101, 635);
INSERT INTO public.games VALUES (316, 100, 855);
INSERT INTO public.games VALUES (317, 100, 836);
INSERT INTO public.games VALUES (318, 100, 166);
INSERT INTO public.games VALUES (319, 102, 695);
INSERT INTO public.games VALUES (320, 102, 681);
INSERT INTO public.games VALUES (321, 103, 698);
INSERT INTO public.games VALUES (322, 103, 5);
INSERT INTO public.games VALUES (323, 102, 85);
INSERT INTO public.games VALUES (324, 102, 112);
INSERT INTO public.games VALUES (325, 102, 641);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (68, 'user_1741133854833', NULL);
INSERT INTO public.users VALUES (69, 'user_1741133854832', NULL);
INSERT INTO public.users VALUES (71, NULL, 10);
INSERT INTO public.users VALUES (72, 'user_1741133947808', NULL);
INSERT INTO public.users VALUES (73, NULL, 440);
INSERT INTO public.users VALUES (74, NULL, 187);
INSERT INTO public.users VALUES (75, 'user_1741133947807', NULL);
INSERT INTO public.users VALUES (76, NULL, 427);
INSERT INTO public.users VALUES (77, NULL, 68);
INSERT INTO public.users VALUES (78, NULL, 189);
INSERT INTO public.users VALUES (79, NULL, 205);
INSERT INTO public.users VALUES (80, NULL, 20);
INSERT INTO public.users VALUES (81, 'ROb', NULL);
INSERT INTO public.users VALUES (70, 'Rob', 5);
INSERT INTO public.users VALUES (83, 'user_1741134503140', 922);
INSERT INTO public.users VALUES (101, 'user_1741135010348', 635);
INSERT INTO public.users VALUES (82, 'user_1741134503141', 100);
INSERT INTO public.users VALUES (100, 'user_1741135010349', 166);
INSERT INTO public.users VALUES (85, 'user_1741134560841', 266);
INSERT INTO public.users VALUES (84, 'user_1741134560842', 125);
INSERT INTO public.users VALUES (87, 'user_1741134599993', 88);
INSERT INTO public.users VALUES (103, 'user_1741135096452', 5);
INSERT INTO public.users VALUES (86, 'user_1741134599994', 542);
INSERT INTO public.users VALUES (102, 'user_1741135096453', 641);
INSERT INTO public.users VALUES (89, 'user_1741134751708', 99);
INSERT INTO public.users VALUES (88, 'user_1741134751709', 240);
INSERT INTO public.users VALUES (91, 'user_1741134778983', 12);
INSERT INTO public.users VALUES (90, 'user_1741134778984', 160);
INSERT INTO public.users VALUES (93, 'user_1741134807508', 350);
INSERT INTO public.users VALUES (92, 'user_1741134807509', 945);
INSERT INTO public.users VALUES (95, 'user_1741134865066', 189);
INSERT INTO public.users VALUES (94, 'user_1741134865067', 804);
INSERT INTO public.users VALUES (97, 'user_1741134943909', 106);
INSERT INTO public.users VALUES (96, 'user_1741134943910', 424);
INSERT INTO public.users VALUES (99, 'user_1741134959772', 233);
INSERT INTO public.users VALUES (98, 'user_1741134959773', 549);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 325, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 103, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

