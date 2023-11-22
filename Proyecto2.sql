--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2023-11-22 15:36:44

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
-- TOC entry 224 (class 1259 OID 16466)
-- Name: Aplicación; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aplicación" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char",
    costo "char",
    "tamaño_mb" bigint,
    "versión" "char",
    nombre "char",
    "descripción" "char",
    "temática" "char",
    "versión_ios" "char",
    "Id" bigint
);


ALTER TABLE public."Aplicación" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16465)
-- Name: Aplicación_Id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Aplicación_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Aplicación_Id_producto_seq" OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 223
-- Name: Aplicación_Id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Aplicación_Id_producto_seq" OWNED BY public."Aplicación"."Id_producto";


--
-- TOC entry 217 (class 1259 OID 16412)
-- Name: Artista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Artista" (
    "Id_artista" bigint NOT NULL,
    "nom_artístico" "char" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    "nombreD" "char" NOT NULL
);


ALTER TABLE public."Artista" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: Artista_Id_artista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Artista_Id_artista_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Artista_Id_artista_seq" OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 216
-- Name: Artista_Id_artista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Artista_Id_artista_seq" OWNED BY public."Artista"."Id_artista";


--
-- TOC entry 231 (class 1259 OID 16503)
-- Name: Canción; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Canción" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char" NOT NULL,
    costo "char" NOT NULL,
    genero "char",
    nom_disco "char",
    "duración" bigint,
    fecha_lanz date NOT NULL,
    "nom_canción" "char" NOT NULL,
    und_vendidas bigint NOT NULL,
    "Id_artista" bigint NOT NULL
);


ALTER TABLE public."Canción" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16502)
-- Name: Canción_Id_artista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Canción_Id_artista_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Canción_Id_artista_seq" OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 230
-- Name: Canción_Id_artista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Canción_Id_artista_seq" OWNED BY public."Canción"."Id_artista";


--
-- TOC entry 229 (class 1259 OID 16501)
-- Name: Canción_Id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Canción_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Canción_Id_producto_seq" OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 229
-- Name: Canción_Id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Canción_Id_producto_seq" OWNED BY public."Canción"."Id_producto";


--
-- TOC entry 215 (class 1259 OID 16406)
-- Name: Casa_Disquera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Casa_Disquera" (
    nombre "char" NOT NULL,
    "dirección" "char"
);


ALTER TABLE public."Casa_Disquera" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16522)
-- Name: Compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Compra" (
    "Id_producto" bigint NOT NULL,
    "Id_promoción" bigint NOT NULL,
    "Id_Usuario" bigint NOT NULL,
    fecha_compra date NOT NULL,
    rating "char",
    monto bigint
);


ALTER TABLE public."Compra" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16520)
-- Name: Compra_Id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Compra_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Compra_Id_producto_seq" OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 232
-- Name: Compra_Id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Compra_Id_producto_seq" OWNED BY public."Compra"."Id_producto";


--
-- TOC entry 233 (class 1259 OID 16521)
-- Name: Compra_Id_promoción_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Compra_Id_promoción_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Compra_Id_promoción_seq" OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 233
-- Name: Compra_Id_promoción_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Compra_Id_promoción_seq" OWNED BY public."Compra"."Id_promoción";


--
-- TOC entry 228 (class 1259 OID 16495)
-- Name: Dispositivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dispositivo" (
    "Id_producto" bigint NOT NULL,
    "puntuación" "char" NOT NULL,
    costo "char" NOT NULL,
    modelo "char" NOT NULL,
    "generación" bigint NOT NULL,
    version_ios "char" NOT NULL,
    capacidad "char" NOT NULL
);


ALTER TABLE public."Dispositivo" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16494)
-- Name: Dispositivo_Id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Dispositivo_Id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Dispositivo_Id_producto_seq" OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 227
-- Name: Dispositivo_Id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Dispositivo_Id_producto_seq" OWNED BY public."Dispositivo"."Id_producto";


--
-- TOC entry 226 (class 1259 OID 16483)
-- Name: Dispositivo_comp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dispositivo_comp" (
    "Id_aplicación" bigint NOT NULL,
    dispositivo "char" NOT NULL
);


ALTER TABLE public."Dispositivo_comp" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16482)
-- Name: Dispositivo_comp_Id_aplicación_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Dispositivo_comp_Id_aplicación_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Dispositivo_comp_Id_aplicación_seq" OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 225
-- Name: Dispositivo_comp_Id_aplicación_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Dispositivo_comp_Id_aplicación_seq" OWNED BY public."Dispositivo_comp"."Id_aplicación";


--
-- TOC entry 220 (class 1259 OID 16445)
-- Name: País; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."País" (
    "País" "char" NOT NULL,
    "Id_promo" bigint NOT NULL
);


ALTER TABLE public."País" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16460)
-- Name: Producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Producto" (
    "Id_producto" bigint NOT NULL
);


ALTER TABLE public."Producto" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16440)
-- Name: Promoción; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Promoción" (
    "Id_promo" bigint NOT NULL,
    descuento "char" NOT NULL,
    "duración" "char" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);


ALTER TABLE public."Promoción" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16455)
-- Name: Proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Proveedor" (
    "Id" bigint NOT NULL,
    correo "char",
    nombre "char" NOT NULL,
    "dirección" "char",
    "fecha_afiliación" date NOT NULL,
    "esDesarrollador" boolean NOT NULL,
    "esEmpresa" boolean NOT NULL
);


ALTER TABLE public."Proveedor" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16423)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Id" bigint NOT NULL,
    correo "char",
    "dirección" "char",
    cod_vvt bigint[] NOT NULL,
    fecha_venc date NOT NULL,
    num_tjt bigint[] NOT NULL,
    apellido "char" NOT NULL,
    name "char" NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 4686 (class 2604 OID 16469)
-- Name: Aplicación Id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aplicación" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Aplicación_Id_producto_seq"'::regclass);


--
-- TOC entry 4685 (class 2604 OID 16415)
-- Name: Artista Id_artista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artista" ALTER COLUMN "Id_artista" SET DEFAULT nextval('public."Artista_Id_artista_seq"'::regclass);


--
-- TOC entry 4689 (class 2604 OID 16506)
-- Name: Canción Id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Canción" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Canción_Id_producto_seq"'::regclass);


--
-- TOC entry 4690 (class 2604 OID 16507)
-- Name: Canción Id_artista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Canción" ALTER COLUMN "Id_artista" SET DEFAULT nextval('public."Canción_Id_artista_seq"'::regclass);


--
-- TOC entry 4691 (class 2604 OID 16525)
-- Name: Compra Id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compra" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Compra_Id_producto_seq"'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16526)
-- Name: Compra Id_promoción; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compra" ALTER COLUMN "Id_promoción" SET DEFAULT nextval('public."Compra_Id_promoción_seq"'::regclass);


--
-- TOC entry 4688 (class 2604 OID 16498)
-- Name: Dispositivo Id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispositivo" ALTER COLUMN "Id_producto" SET DEFAULT nextval('public."Dispositivo_Id_producto_seq"'::regclass);


--
-- TOC entry 4687 (class 2604 OID 16486)
-- Name: Dispositivo_comp Id_aplicación; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispositivo_comp" ALTER COLUMN "Id_aplicación" SET DEFAULT nextval('public."Dispositivo_comp_Id_aplicación_seq"'::regclass);


--
-- TOC entry 4879 (class 0 OID 16466)
-- Dependencies: 224
-- Data for Name: Aplicación; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Aplicación" ("Id_producto", "puntuación", costo, "tamaño_mb", "versión", nombre, "descripción", "temática", "versión_ios", "Id") FROM stdin;
\.


--
-- TOC entry 4872 (class 0 OID 16412)
-- Dependencies: 217
-- Data for Name: Artista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Artista" ("Id_artista", "nom_artístico", fecha_inicio, fecha_fin, "nombreD") FROM stdin;
\.


--
-- TOC entry 4886 (class 0 OID 16503)
-- Dependencies: 231
-- Data for Name: Canción; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Canción" ("Id_producto", "puntuación", costo, genero, nom_disco, "duración", fecha_lanz, "nom_canción", und_vendidas, "Id_artista") FROM stdin;
\.


--
-- TOC entry 4870 (class 0 OID 16406)
-- Dependencies: 215
-- Data for Name: Casa_Disquera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Casa_Disquera" (nombre, "dirección") FROM stdin;
\.


--
-- TOC entry 4889 (class 0 OID 16522)
-- Dependencies: 234
-- Data for Name: Compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Compra" ("Id_producto", "Id_promoción", "Id_Usuario", fecha_compra, rating, monto) FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 16495)
-- Dependencies: 228
-- Data for Name: Dispositivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dispositivo" ("Id_producto", "puntuación", costo, modelo, "generación", version_ios, capacidad) FROM stdin;
\.


--
-- TOC entry 4881 (class 0 OID 16483)
-- Dependencies: 226
-- Data for Name: Dispositivo_comp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dispositivo_comp" ("Id_aplicación", dispositivo) FROM stdin;
\.


--
-- TOC entry 4875 (class 0 OID 16445)
-- Dependencies: 220
-- Data for Name: País; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."País" ("País", "Id_promo") FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 16460)
-- Dependencies: 222
-- Data for Name: Producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Producto" ("Id_producto") FROM stdin;
\.


--
-- TOC entry 4874 (class 0 OID 16440)
-- Dependencies: 219
-- Data for Name: Promoción; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Promoción" ("Id_promo", descuento, "duración", fecha_inicio, fecha_fin) FROM stdin;
\.


--
-- TOC entry 4876 (class 0 OID 16455)
-- Dependencies: 221
-- Data for Name: Proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Proveedor" ("Id", correo, nombre, "dirección", "fecha_afiliación", "esDesarrollador", "esEmpresa") FROM stdin;
\.


--
-- TOC entry 4873 (class 0 OID 16423)
-- Dependencies: 218
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("Id", correo, "dirección", cod_vvt, fecha_venc, num_tjt, apellido, name) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 223
-- Name: Aplicación_Id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Aplicación_Id_producto_seq"', 1, false);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 216
-- Name: Artista_Id_artista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Artista_Id_artista_seq"', 1, false);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 230
-- Name: Canción_Id_artista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Canción_Id_artista_seq"', 1, false);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 229
-- Name: Canción_Id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Canción_Id_producto_seq"', 1, false);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 232
-- Name: Compra_Id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Compra_Id_producto_seq"', 1, false);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 233
-- Name: Compra_Id_promoción_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Compra_Id_promoción_seq"', 1, false);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 227
-- Name: Dispositivo_Id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dispositivo_Id_producto_seq"', 1, false);


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 225
-- Name: Dispositivo_comp_Id_aplicación_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dispositivo_comp_Id_aplicación_seq"', 1, false);


--
-- TOC entry 4708 (class 2606 OID 16471)
-- Name: Aplicación Aplicación_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aplicación"
    ADD CONSTRAINT "Aplicación_pkey" PRIMARY KEY ("Id_producto");


--
-- TOC entry 4696 (class 2606 OID 16417)
-- Name: Artista Artista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artista"
    ADD CONSTRAINT "Artista_pkey" PRIMARY KEY ("Id_artista");


--
-- TOC entry 4714 (class 2606 OID 16509)
-- Name: Canción Canción_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Canción"
    ADD CONSTRAINT "Canción_pkey" PRIMARY KEY ("Id_producto");


--
-- TOC entry 4694 (class 2606 OID 16410)
-- Name: Casa_Disquera Casa_Disquera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Casa_Disquera"
    ADD CONSTRAINT "Casa_Disquera_pkey" PRIMARY KEY (nombre);


--
-- TOC entry 4716 (class 2606 OID 16528)
-- Name: Compra Compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Compra_pkey" PRIMARY KEY (fecha_compra, "Id_Usuario", "Id_promoción", "Id_producto");


--
-- TOC entry 4710 (class 2606 OID 16488)
-- Name: Dispositivo_comp Dispositivo_comp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispositivo_comp"
    ADD CONSTRAINT "Dispositivo_comp_pkey" PRIMARY KEY ("Id_aplicación", dispositivo);


--
-- TOC entry 4712 (class 2606 OID 16500)
-- Name: Dispositivo Dispositivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispositivo"
    ADD CONSTRAINT "Dispositivo_pkey" PRIMARY KEY ("Id_producto");


--
-- TOC entry 4702 (class 2606 OID 16449)
-- Name: País País_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."País"
    ADD CONSTRAINT "País_pkey" PRIMARY KEY ("País", "Id_promo");


--
-- TOC entry 4706 (class 2606 OID 16464)
-- Name: Producto Producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT "Producto_pkey" PRIMARY KEY ("Id_producto");


--
-- TOC entry 4700 (class 2606 OID 16444)
-- Name: Promoción Promoción_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Promoción"
    ADD CONSTRAINT "Promoción_pkey" PRIMARY KEY ("Id_promo");


--
-- TOC entry 4704 (class 2606 OID 16459)
-- Name: Proveedor Proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Proveedor"
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4698 (class 2606 OID 16429)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4719 (class 2606 OID 16472)
-- Name: Aplicación Id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aplicación"
    ADD CONSTRAINT "Id" FOREIGN KEY ("Id") REFERENCES public."Proveedor"("Id");


--
-- TOC entry 4724 (class 2606 OID 16539)
-- Name: Compra Id_Usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_Usuario" FOREIGN KEY ("Id_Usuario") REFERENCES public."Usuario"("Id");


--
-- TOC entry 4721 (class 2606 OID 16489)
-- Name: Dispositivo_comp Id_aplicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispositivo_comp"
    ADD CONSTRAINT "Id_aplicacion" FOREIGN KEY ("Id_aplicación") REFERENCES public."Aplicación"("Id_producto");


--
-- TOC entry 4722 (class 2606 OID 16515)
-- Name: Canción Id_artista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Canción"
    ADD CONSTRAINT "Id_artista" FOREIGN KEY ("Id_artista") REFERENCES public."Artista"("Id_artista");


--
-- TOC entry 4720 (class 2606 OID 16477)
-- Name: Aplicación Id_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aplicación"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");


--
-- TOC entry 4723 (class 2606 OID 16510)
-- Name: Canción Id_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Canción"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");


--
-- TOC entry 4725 (class 2606 OID 16529)
-- Name: Compra Id_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_producto" FOREIGN KEY ("Id_producto") REFERENCES public."Producto"("Id_producto");


--
-- TOC entry 4718 (class 2606 OID 16450)
-- Name: País Id_promo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."País"
    ADD CONSTRAINT "Id_promo" FOREIGN KEY ("Id_promo") REFERENCES public."Promoción"("Id_promo");


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 4718
-- Name: CONSTRAINT "Id_promo" ON "País"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "Id_promo" ON public."País" IS 'Donde Id_promo es una Fk referencia de Id_promo en Promoción';


--
-- TOC entry 4726 (class 2606 OID 16534)
-- Name: Compra Id_promoción; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Id_promoción" FOREIGN KEY ("Id_promoción") REFERENCES public."Promoción"("Id_promo");


--
-- TOC entry 4717 (class 2606 OID 16418)
-- Name: Artista nombreD; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Artista"
    ADD CONSTRAINT "nombreD" FOREIGN KEY ("nombreD") REFERENCES public."Casa_Disquera"(nombre);


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 4717
-- Name: CONSTRAINT "nombreD" ON "Artista"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "nombreD" ON public."Artista" IS 'Donde nombreD es una Fk referencia de nombre en Casa_Disquera';


-- Completed on 2023-11-22 15:36:44

--
-- PostgreSQL database dump complete
--
