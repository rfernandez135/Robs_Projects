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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: celestial_body_relationships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body_relationships (
    celestial_body_relationships_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.celestial_body_relationships OWNER TO freecodecamp;

--
-- Name: celestial_body_relationships_celestial_body_relationships_i_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_relationships_celestial_body_relationships_i_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_relationships_celestial_body_relationships_i_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_relationships_celestial_body_relationships_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_relationships_celestial_body_relationships_i_seq OWNED BY public.celestial_body_relationships.celestial_body_relationships_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type text NOT NULL,
    date_discovered date NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    has_water boolean NOT NULL,
    planet_id integer NOT NULL,
    distance_to_planet_km numeric(12,3) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    number_of_moons integer NOT NULL,
    day_in_hours numeric(10,3),
    star_id integer NOT NULL,
    rob_is_current_living_here boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type text,
    mass_solar_masses numeric(10,2) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_body_relationships celestial_body_relationships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body_relationships ALTER COLUMN celestial_body_relationships_id SET DEFAULT nextval('public.celestial_body_relationships_celestial_body_relationships_i_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_body_relationships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body_relationships VALUES (1, NULL, 4, 1, 3, 1);
INSERT INTO public.celestial_body_relationships VALUES (2, NULL, 4, 1, 5, 2);
INSERT INTO public.celestial_body_relationships VALUES (3, NULL, 4, 1, 5, 3);
INSERT INTO public.celestial_body_relationships VALUES (4, NULL, 4, 1, 5, 4);
INSERT INTO public.celestial_body_relationships VALUES (5, NULL, 4, 1, 5, 5);
INSERT INTO public.celestial_body_relationships VALUES (6, NULL, 4, 1, 5, 6);
INSERT INTO public.celestial_body_relationships VALUES (7, NULL, 4, 1, 5, 7);
INSERT INTO public.celestial_body_relationships VALUES (8, NULL, 4, 1, 5, 8);
INSERT INTO public.celestial_body_relationships VALUES (9, NULL, 4, 1, 5, 9);
INSERT INTO public.celestial_body_relationships VALUES (10, NULL, 4, 1, 5, 10);
INSERT INTO public.celestial_body_relationships VALUES (11, NULL, 4, 1, 5, 11);
INSERT INTO public.celestial_body_relationships VALUES (12, NULL, 4, 1, 5, 12);
INSERT INTO public.celestial_body_relationships VALUES (13, NULL, 4, 1, 5, 13);
INSERT INTO public.celestial_body_relationships VALUES (14, NULL, 4, 1, 5, 14);
INSERT INTO public.celestial_body_relationships VALUES (15, NULL, 4, 1, 5, 15);
INSERT INTO public.celestial_body_relationships VALUES (16, NULL, 4, 1, 5, 16);
INSERT INTO public.celestial_body_relationships VALUES (17, NULL, 4, 1, 5, 17);
INSERT INTO public.celestial_body_relationships VALUES (18, NULL, 4, 1, 5, 18);
INSERT INTO public.celestial_body_relationships VALUES (19, NULL, 4, 1, 5, 19);
INSERT INTO public.celestial_body_relationships VALUES (20, NULL, 4, 1, 5, 20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10000, 'Barred Spiral Galaxy', '1924-11-23');
INSERT INTO public.galaxy VALUES (2, 'Backward Galaxy', 100, 'Spiral Galaxy', '2001-05-25');
INSERT INTO public.galaxy VALUES (3, 'Eye of Sauron', 1000, 'Intermediate Spiral Galaxy', '1787-03-17');
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 13610, 'Barred Spiral Galaxy', '1610-10-10');
INSERT INTO public.galaxy VALUES (5, 'Peekaboo Galaxy', 1000, 'Dwarf Irregular Galaxy', '2001-10-10');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 13250, 'Spiral Galaxy', '1781-05-11');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', true, 3, 384400.000);
INSERT INTO public.moon VALUES (2, 'Metis', false, 5, 128000.000);
INSERT INTO public.moon VALUES (3, 'Adrastea', false, 5, 129000.000);
INSERT INTO public.moon VALUES (4, 'Amalthea', false, 5, 181400.000);
INSERT INTO public.moon VALUES (5, 'Thebe', false, 5, 221900.000);
INSERT INTO public.moon VALUES (6, 'Io', false, 5, 421800.000);
INSERT INTO public.moon VALUES (7, 'Europa', false, 5, 671100.000);
INSERT INTO public.moon VALUES (8, 'Ganymede', false, 5, 1070400.000);
INSERT INTO public.moon VALUES (9, 'Callisto', false, 5, 1882700.000);
INSERT INTO public.moon VALUES (10, 'Themisto', false, 5, 7507000.000);
INSERT INTO public.moon VALUES (11, 'Leda', false, 5, 11165000.000);
INSERT INTO public.moon VALUES (12, 'S/2018 J2', false, 5, 11419700.000);
INSERT INTO public.moon VALUES (13, 'Himalia', false, 5, 11461000.000);
INSERT INTO public.moon VALUES (14, 'Ersa', false, 5, 11483000.000);
INSERT INTO public.moon VALUES (15, 'Pandia', false, 5, 11525000.000);
INSERT INTO public.moon VALUES (16, 'S/2011 J3', false, 5, 11716800.000);
INSERT INTO public.moon VALUES (17, 'Lysithea', false, 5, 11717000.000);
INSERT INTO public.moon VALUES (18, 'Elara', false, 5, 11741000.000);
INSERT INTO public.moon VALUES (19, 'Dia', false, 5, 12118000.000);
INSERT INTO public.moon VALUES (20, 'S/2018 J4', false, 5, 16328500.000);
INSERT INTO public.moon VALUES (21, 'Carpo', false, 5, 16989000.000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 1408.000, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0, 5832.000, 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 24.000, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 24.000, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 95, 10.000, 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 146, 11.000, 1, false);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 14, 16.000, 1, false);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 28, 17.000, 1, false);
INSERT INTO public.planet VALUES (9, 'Mu Cephei b', false, 0, 24.000, 4, false);
INSERT INTO public.planet VALUES (10, 'Aldebaran b', false, 0, 24.000, 5, false);
INSERT INTO public.planet VALUES (11, 'Pluto', false, 0, 24.000, 1, false);
INSERT INTO public.planet VALUES (12, 'Planet X', false, 0, 24.000, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'Yellow Dwarf', 1.00, 4);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 15.00, 4);
INSERT INTO public.star VALUES (3, 'Antares', 'Red Supergiant', 15.50, 4);
INSERT INTO public.star VALUES (4, 'Mu Cephei', 'Red Supergiant', 20.00, 4);
INSERT INTO public.star VALUES (5, 'Aldebaran', 'Red Giant', 1.70, 4);
INSERT INTO public.star VALUES (6, 'Arcturus', 'Red Giant', 1.08, 4);


--
-- Name: celestial_body_relationships_celestial_body_relationships_i_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_relationships_celestial_body_relationships_i_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_body_relationships celestial_body_relationships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body_relationships
    ADD CONSTRAINT celestial_body_relationships_name_key UNIQUE (name);


--
-- Name: celestial_body_relationships celestial_body_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body_relationships
    ADD CONSTRAINT celestial_body_relationships_pkey PRIMARY KEY (celestial_body_relationships_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

