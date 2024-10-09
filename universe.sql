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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    rotation_in_hours integer,
    size_in_light_years integer NOT NULL,
    gravity_in_m_per_sec_sq numeric(2,1) NOT NULL,
    shape text,
    self_luminous boolean
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
    rotation integer,
    size integer NOT NULL,
    gravity numeric(4,1) NOT NULL,
    shape text,
    self_luminous boolean,
    planet_id integer NOT NULL
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance integer NOT NULL,
    age integer,
    mass numeric(20,2),
    description text,
    visible_to_naked_eye boolean,
    contains_star_forming_regions boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    rotation integer,
    size integer NOT NULL,
    gravity numeric(4,1) NOT NULL,
    shape text,
    self_luminous boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    rotation integer,
    size integer NOT NULL,
    gravity numeric(2,1) NOT NULL,
    shape text,
    self_luminous boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 24, 100000, 9.8, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 23, 220000, 9.5, 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 22, 60000, 9.7, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 25, 76000, 9.6, 'Spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 26, 50000, 9.4, 'Elliptical', true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 24, 40000, 9.3, 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 27, 3474, 1.6, 'Spherical', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 8, 22, 0.0, 'Irregular', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 30, 12, 0.0, 'Irregular', false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 42, 3643, 1.8, 'Spherical', false, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 85, 3122, 1.3, 'Spherical', false, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 172, 5268, 1.4, 'Spherical', false, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 400, 4820, 1.2, 'Spherical', false, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 16, 5150, 1.4, 'Spherical', false, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 108, 1528, 0.3, 'Spherical', false, 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', 79, 1469, 0.2, 'Spherical', false, 4);
INSERT INTO public.moon VALUES (11, 'Dione', 66, 1123, 0.2, 'Spherical', false, 4);
INSERT INTO public.moon VALUES (12, 'Tethys', 45, 1062, 0.2, 'Spherical', false, 4);
INSERT INTO public.moon VALUES (13, 'Miranda', 34, 471, 0.1, 'Spherical', false, 5);
INSERT INTO public.moon VALUES (14, 'Ariel', 60, 1158, 0.3, 'Spherical', false, 5);
INSERT INTO public.moon VALUES (15, 'Umbriel', 100, 1169, 0.3, 'Spherical', false, 5);
INSERT INTO public.moon VALUES (16, 'Titania', 209, 1578, 0.4, 'Spherical', false, 5);
INSERT INTO public.moon VALUES (17, 'Oberon', 323, 1523, 0.3, 'Spherical', false, 5);
INSERT INTO public.moon VALUES (18, 'Triton', 6, 2706, 0.8, 'Spherical', false, 6);
INSERT INTO public.moon VALUES (19, 'Nereid', 360, 340, 0.1, 'Irregular', false, 6);
INSERT INTO public.moon VALUES (20, 'Proteus', 27, 420, 0.1, 'Irregular', false, 6);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1344, 3, 2000.00, 'A diffuse nebula situated in the Milky Way.', true, true);
INSERT INTO public.nebula VALUES (2, 'Eagle Nebula', 7000, 6, 4600.00, 'A young open cluster of stars in the constellation Serpens.', false, true);
INSERT INTO public.nebula VALUES (3, 'Ring Nebula', 2300, 1, 0.61, 'A planetary nebula in the northern constellation of Lyra.', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 58, 4879, 3.7, 'Spherical', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 243, 12104, 8.9, 'Spherical', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, 9.8, 'Spherical', false, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, 3.7, 'Spherical', false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, 139820, 24.8, 'Spherical', false, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 0, 116460, 10.4, 'Spherical', false, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724, 8.7, 'Spherical', false, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244, 11.0, 'Spherical', false, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 6, 2376, 0.7, 'Spherical', false, 5);
INSERT INTO public.planet VALUES (10, 'Eris', 26, 2326, 0.8, 'Spherical', false, 5);
INSERT INTO public.planet VALUES (11, 'Haumea', 4, 1960, 0.4, 'Elliptical', false, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', 23, 1430, 0.5, 'Elliptical', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 25, 1000000, 9.8, 'Spherical', true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 30, 1200000, 8.5, 'Elliptical', false, 2);
INSERT INTO public.star VALUES (3, 'Vega', 15, 850000, 9.3, 'Elliptical', false, 4);
INSERT INTO public.star VALUES (4, 'Procyon', 18, 950000, 9.7, 'Spherical', true, 5);
INSERT INTO public.star VALUES (5, 'Altair', 22, 1100000, 9.0, 'Elliptical', false, 6);
INSERT INTO public.star VALUES (6, 'Sirius', 20, 900000, 9.8, 'Spherical', true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
