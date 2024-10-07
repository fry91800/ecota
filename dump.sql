--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

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
-- Name: answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer (
    id integer NOT NULL,
    year integer,
    vendorcode character varying(255),
    purchasingorganisationcode character varying(255),
    questioncode character varying(255),
    answer character varying(255),
    comment text,
    commenter integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.answer OWNER TO postgres;

--
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answer_id_seq OWNER TO postgres;

--
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_id_seq OWNED BY public.answer.id;


--
-- Name: cached_selection_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cached_selection_data (
    id integer NOT NULL,
    teamdataid integer,
    vendorcode character varying(255),
    vendorname character varying(255),
    purchasingorganisationcode character varying(255),
    spend integer,
    city character varying(255),
    country character varying(255),
    mdmcode character varying(255),
    perfscope boolean,
    riskscope boolean,
    lastsurveillance character varying(255),
    spendscope boolean,
    reason1 boolean,
    reason2 boolean,
    reason3 boolean,
    reason4 boolean,
    comment text,
    commenter integer,
    status character varying(255),
    hasnewname boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cached_selection_data OWNER TO postgres;

--
-- Name: cached_selection_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cached_selection_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cached_selection_data_id_seq OWNER TO postgres;

--
-- Name: cached_selection_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cached_selection_data_id_seq OWNED BY public.cached_selection_data.id;


--
-- Name: campaign; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaign (
    id integer NOT NULL,
    year integer NOT NULL,
    revenue integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.campaign OWNER TO postgres;

--
-- Name: campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campaign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campaign_id_seq OWNER TO postgres;

--
-- Name: campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campaign_id_seq OWNED BY public.campaign.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    text character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: intensity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intensity (
    id integer NOT NULL,
    text character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.intensity OWNER TO postgres;

--
-- Name: intensity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intensity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intensity_id_seq OWNER TO postgres;

--
-- Name: intensity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intensity_id_seq OWNED BY public.intensity.id;


--
-- Name: orga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orga (
    id integer NOT NULL,
    number character varying(255) NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    mail character varying(255) NOT NULL,
    phone character varying(255),
    team integer,
    "position" integer,
    plant integer,
    manager integer,
    arrivaldate timestamp with time zone,
    leavingdate timestamp with time zone,
    pass character varying(255),
    resettoken uuid,
    resetdeadline timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.orga OWNER TO postgres;

--
-- Name: orga_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orga_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orga_id_seq OWNER TO postgres;

--
-- Name: orga_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orga_id_seq OWNED BY public.orga.id;


--
-- Name: plant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant (
    id integer NOT NULL,
    code character varying(255),
    shorttext character varying(255),
    longtext character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.plant OWNER TO postgres;

--
-- Name: plant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plant_id_seq OWNER TO postgres;

--
-- Name: plant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_id_seq OWNED BY public.plant.id;


--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    text character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    cotarole character varying(255)
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_id_seq OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- Name: rd_vendor_master_data_sap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rd_vendor_master_data_sap (
    vendorcode character varying(10) NOT NULL,
    vendorname character varying(255),
    address character varying(255),
    city character varying(255),
    country character varying(255),
    mdmcode character varying(255),
    vendortype character varying(255)
);


ALTER TABLE public.rd_vendor_master_data_sap OWNER TO postgres;

--
-- Name: rd_vendor_master_data_stl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rd_vendor_master_data_stl (
    vendorcode character varying(10),
    vendorname character varying(255),
    address character varying(255),
    city character varying(255),
    country character varying(50),
    mdmcode character varying(255),
    vendortype character varying(255)
);


ALTER TABLE public.rd_vendor_master_data_stl OWNER TO postgres;

--
-- Name: rd_vendor_master_data_syt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rd_vendor_master_data_syt (
    vendorcode character varying(10),
    vendorname character varying(255),
    address character varying(255),
    city character varying(255),
    country character varying(50),
    mdmcode character varying(255),
    vendortype character varying(255)
);


ALTER TABLE public.rd_vendor_master_data_syt OWNER TO postgres;

--
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    id integer NOT NULL,
    year integer,
    vendorcode character varying(255),
    purchasingorganisationcode character varying(255),
    intensity integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.result OWNER TO postgres;

--
-- Name: result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.result_id_seq OWNER TO postgres;

--
-- Name: result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.result_id_seq OWNED BY public.result.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    id uuid NOT NULL,
    orgaid integer,
    starttime timestamp with time zone,
    endtime timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: td_perfo_synthesis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.td_perfo_synthesis (
    "VendorCode" character varying(255),
    purchasingorganisationcode character varying(255),
    "Value(EUR)" integer,
    id integer NOT NULL
);


ALTER TABLE public.td_perfo_synthesis OWNER TO postgres;

--
-- Name: td_perfo_synthesis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.td_perfo_synthesis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.td_perfo_synthesis_id_seq OWNER TO postgres;

--
-- Name: td_perfo_synthesis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.td_perfo_synthesis_id_seq OWNED BY public.td_perfo_synthesis.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id integer NOT NULL,
    code character varying(255),
    shorttext character varying(255),
    longtext character varying(255),
    parent integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_id_seq OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: yearly_supplier_snapshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yearly_supplier_snapshot (
    id integer NOT NULL,
    year integer,
    vendorcode character varying(255),
    vendorname character varying(255),
    mdmcode character varying(255),
    country character varying(255),
    city character varying(255),
    address character varying(255),
    source character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.yearly_supplier_snapshot OWNER TO postgres;

--
-- Name: yearly_supplier_snapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yearly_supplier_snapshot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.yearly_supplier_snapshot_id_seq OWNER TO postgres;

--
-- Name: yearly_supplier_snapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yearly_supplier_snapshot_id_seq OWNED BY public.yearly_supplier_snapshot.id;


--
-- Name: yearly_team_cota_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yearly_team_cota_data (
    id integer NOT NULL,
    year integer,
    vendorcode character varying(255),
    purchasingorganisationcode character varying(255),
    "Value(EUR)" integer DEFAULT 0,
    reason1 boolean DEFAULT false,
    reason2 boolean DEFAULT false,
    reason3 boolean DEFAULT false,
    reason4 boolean DEFAULT false,
    forceperfcota boolean,
    forceriskcota boolean,
    comment text,
    commenter integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    intensity integer,
    perfscope boolean DEFAULT false,
    riskscope boolean DEFAULT false,
    lastsurveillance integer,
    spendscope boolean DEFAULT false,
    status character varying(255),
    hasnewname boolean DEFAULT false
);


ALTER TABLE public.yearly_team_cota_data OWNER TO postgres;

--
-- Name: yearly_team_cota_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yearly_team_cota_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.yearly_team_cota_data_id_seq OWNER TO postgres;

--
-- Name: yearly_team_cota_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yearly_team_cota_data_id_seq OWNED BY public.yearly_team_cota_data.id;


--
-- Name: answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer ALTER COLUMN id SET DEFAULT nextval('public.answer_id_seq'::regclass);


--
-- Name: cached_selection_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cached_selection_data ALTER COLUMN id SET DEFAULT nextval('public.cached_selection_data_id_seq'::regclass);


--
-- Name: campaign id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign ALTER COLUMN id SET DEFAULT nextval('public.campaign_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: intensity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intensity ALTER COLUMN id SET DEFAULT nextval('public.intensity_id_seq'::regclass);


--
-- Name: orga id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga ALTER COLUMN id SET DEFAULT nextval('public.orga_id_seq'::regclass);


--
-- Name: plant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant ALTER COLUMN id SET DEFAULT nextval('public.plant_id_seq'::regclass);


--
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- Name: result id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result ALTER COLUMN id SET DEFAULT nextval('public.result_id_seq'::regclass);


--
-- Name: td_perfo_synthesis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.td_perfo_synthesis ALTER COLUMN id SET DEFAULT nextval('public.td_perfo_synthesis_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: yearly_supplier_snapshot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yearly_supplier_snapshot ALTER COLUMN id SET DEFAULT nextval('public.yearly_supplier_snapshot_id_seq'::regclass);


--
-- Name: yearly_team_cota_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yearly_team_cota_data ALTER COLUMN id SET DEFAULT nextval('public.yearly_team_cota_data_id_seq'::regclass);


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer (id, year, vendorcode, purchasingorganisationcode, questioncode, answer, comment, commenter, "createdAt", "updatedAt") FROM stdin;
2	2024	MDM537415	MB02	c1	yes	\N	\N	2024-10-06 05:12:07.108+02	2024-10-06 05:12:07.108+02
1	2024	MDM537422	MB02	c1	no	test comment	\N	2024-10-06 04:31:46.982+02	2024-10-07 01:31:35.396+02
\.


--
-- Data for Name: cached_selection_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cached_selection_data (id, teamdataid, vendorcode, vendorname, purchasingorganisationcode, spend, city, country, mdmcode, perfscope, riskscope, lastsurveillance, spendscope, reason1, reason2, reason3, reason4, comment, commenter, status, hasnewname, "createdAt", "updatedAt") FROM stdin;
61	1	MDM537415	EATON	MB02	300000	HAVANT	GB	MDM537415	t	t	3	t	t	f	f	f	test	1	\N	t	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
62	4	MDM537422	CISOLIFT DISTRIBUTION	MB02	0	ST GERMAIN DE GRANTHAM	CA	MDM537422	f	f	\N	f	f	f	f	f	\N	\N	\N	f	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
63	2	MDM537415	EATON	MB03	0	HAVANT	GB	MDM537415	t	f	\N	t	f	f	f	f	\N	\N	\N	t	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
64	5	MDM537422	CISOLIFT DISTRIBUTION	MB03	0	ST GERMAIN DE GRANTHAM	CA	MDM537422	t	f	\N	t	f	f	f	f	\N	\N	\N	f	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
65	3	MDM537415	EATON	GOPE	0	HAVANT	GB	MDM537415	t	f	\N	t	f	f	f	f	\N	\N	\N	t	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
66	6	MDM537422	CISOLIFT DISTRIBUTION	GOPE	0	ST GERMAIN DE GRANTHAM	CA	MDM537422	t	f	\N	t	f	f	f	f	\N	\N	\N	f	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
\.


--
-- Data for Name: campaign; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campaign (id, year, revenue, "createdAt", "updatedAt") FROM stdin;
1	2024	90	2024-09-14 09:26:07.859+02	2024-09-30 16:17:34.265+02
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, code, text, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: intensity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intensity (id, text, "createdAt", "updatedAt") FROM stdin;
2	Nominal	2024-09-12 10:58:57.837449+02	2024-09-12 10:58:57.837449+02
3	Tightened	2024-09-12 10:58:57.839855+02	2024-09-12 10:58:57.839855+02
4	Intensive	2024-09-12 10:58:57.843612+02	2024-09-12 10:58:57.843612+02
1	Reduce	2024-09-12 10:57:43.831488+02	2024-09-12 10:57:43.831488+02
\.


--
-- Data for Name: orga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orga (id, number, firstname, lastname, mail, phone, team, "position", plant, manager, arrivaldate, leavingdate, pass, resettoken, resetdeadline, "createdAt", "updatedAt") FROM stdin;
1	n	François	Nguinbu	a	\N	1	1	\N	\N	2024-09-11 11:26:23.71019+02	\N	$2b$10$XYa0hBPttJ8i4rhUQKKWH.PrWiQUu/lB.wGTHnWwTxZmfUySqA/lu	3363ad19-506e-4b93-a9b8-f6a252fa32b8	2024-09-25 17:35:31.888+02	2024-09-11 11:26:23.71019+02	2024-09-25 17:21:55.896+02
\.


--
-- Data for Name: plant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant (id, code, shorttext, longtext, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, text, "createdAt", "updatedAt", cotarole) FROM stdin;
1	admincota	2024-09-11 11:20:29.166287+02	2024-09-11 11:20:29.166287+02	admin
\.


--
-- Data for Name: rd_vendor_master_data_sap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rd_vendor_master_data_sap (vendorcode, vendorname, address, city, country, mdmcode, vendortype) FROM stdin;
MDM544480	INTEGRATED PROTECTION SERVICES	5303 LESTER RD	CINCINNATI	US	MDM544480	N0
MDM506017	SERENIA	72 AV EDOUARD VAILLANT	BOULOGNE BILLANCOURT	FR	MDM506017	
MDM544478	UNISON	FAROE HOUSE	SCARBOROUGH	GB	MDM544478	N0
MDM500875	FEDEX EXPRESS FR	58 AV LECLERC	LYON	FR	MDM500875	N0
MDM542497	CONFERENCE SST	92 DES MARGUERITES	ST JOSEPH DU LAC	CA	MDM542497	N0
MDM542496	CTRM TESTING LABORATORY	COMPOSITES TECHNOLOGY CITY	MELAKA	MY	MDM542496	N0
MDM542495	MHE DEMAG MALASIA	15 PERISIARAN ASTANA KYU 2	KLANG	MY	MDM542495	N0
MDM537405	GALLIONS	142 RUE GAMBETTA	SURESNES	FR	MDM537405	N0
MDM537422	CISOLIFT DISTRIBUTION	192 RUE SYLVESTRE	ST GERMAIN DE GRANTHAM	CA	MDM537422	M1
MDM537415	EATON	LARCHWOOD AV	HAVANT	GB	MDM537415	M1
\.


--
-- Data for Name: rd_vendor_master_data_stl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rd_vendor_master_data_stl (vendorcode, vendorname, address, city, country, mdmcode, vendortype) FROM stdin;
\.


--
-- Data for Name: rd_vendor_master_data_syt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rd_vendor_master_data_syt (vendorcode, vendorname, address, city, country, mdmcode, vendortype) FROM stdin;
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result (id, year, vendorcode, purchasingorganisationcode, intensity, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (id, orgaid, starttime, endtime, "createdAt", "updatedAt") FROM stdin;
243d8269-43ae-4e8f-b17b-698b20ea82da	1	2024-09-11 11:28:13.544+02	2024-09-12 07:45:30+02	2024-09-11 11:28:13.545+02	2024-09-12 07:45:30.127+02
c4e912b8-3e41-4fd3-8567-e81842716ad3	1	2024-09-18 19:18:28.139+02	2024-09-18 19:22:20+02	2024-09-18 19:18:28.14+02	2024-09-18 19:22:20.698+02
aab26c6a-2779-4c63-ad41-38c18c497218	1	2024-09-18 19:50:28.926+02	\N	2024-09-18 19:50:28.928+02	2024-09-18 19:50:28.928+02
6d1827b0-8326-4e33-8937-6662812e0f1c	1	2024-09-23 00:33:30.338+02	2024-09-23 00:35:41+02	2024-09-23 00:33:30.339+02	2024-09-23 00:35:41.97+02
f846d153-9bb9-4ac2-ac80-af1e67bc76ad	1	2024-09-23 00:35:46.082+02	2024-09-23 00:36:02+02	2024-09-23 00:35:46.083+02	2024-09-23 00:36:02.367+02
d8db76b9-4cb0-404f-9a1f-65f2efbda317	1	2024-09-23 00:36:05.607+02	2024-09-23 00:36:19+02	2024-09-23 00:36:05.608+02	2024-09-23 00:36:19.508+02
22e5ec5d-62d6-4c5d-8f63-44737fbbf946	1	2024-09-23 00:36:23.136+02	2024-09-23 00:37:57+02	2024-09-23 00:36:23.137+02	2024-09-23 00:37:57.193+02
903b9996-f2ef-46fe-9868-392a549b2d12	1	2024-09-23 00:38:00.921+02	2024-09-23 00:40:09+02	2024-09-23 00:38:00.922+02	2024-09-23 00:40:09.948+02
9e8db09a-848b-4cd4-b064-796afee766d7	1	2024-09-23 00:40:14.686+02	2024-09-23 00:40:17+02	2024-09-23 00:40:14.686+02	2024-09-23 00:40:17.311+02
26ba703f-8b19-4d02-a940-8e104043492f	1	2024-09-23 15:16:38.174+02	2024-09-23 15:19:57+02	2024-09-23 15:16:38.175+02	2024-09-23 15:19:57.794+02
92b726f8-53b8-4807-a2e9-ef84f68897bb	1	2024-09-23 16:13:03.569+02	2024-09-23 16:15:14+02	2024-09-23 16:13:03.57+02	2024-09-23 16:15:14.112+02
e672bfa1-3b1d-402e-92af-bc4ab3869935	1	2024-09-23 16:16:44.902+02	2024-09-23 16:20:19+02	2024-09-23 16:16:44.902+02	2024-09-23 16:20:19.334+02
2cca879b-9690-4748-b901-fe476b1c7853	1	2024-09-23 21:51:59.916+02	2024-09-23 23:09:04+02	2024-09-23 21:51:59.917+02	2024-09-23 23:09:04.11+02
3e40954d-af08-4284-8a51-4045a9826c5e	1	2024-09-23 23:45:35.955+02	2024-09-23 23:45:51+02	2024-09-23 23:45:35.955+02	2024-09-23 23:45:51.251+02
acad59ab-8c59-4766-8c0b-7dcb9733dd62	1	2024-09-23 23:55:09.681+02	2024-09-23 23:55:12+02	2024-09-23 23:55:09.681+02	2024-09-23 23:55:12.045+02
4c8ad939-9529-40d1-b1ef-611aafc4dc93	1	2024-09-23 23:59:40.467+02	2024-09-23 23:59:53+02	2024-09-23 23:59:40.467+02	2024-09-23 23:59:53.333+02
b2e36852-0259-4d69-94a3-a6ad725b1e0c	1	2024-09-18 19:22:25.779+02	2024-09-24 14:29:03+02	2024-09-18 19:22:25.781+02	2024-09-24 14:29:03.701+02
61d33667-a103-43dc-812b-3368ddce2cb6	1	2024-09-24 15:24:29.174+02	2024-09-24 15:24:31+02	2024-09-24 15:24:29.177+02	2024-09-24 15:24:31.377+02
0f0a0a5e-a2bb-4dbe-9340-537a75bd02b5	1	2024-09-24 15:29:53.063+02	2024-09-24 15:29:55+02	2024-09-24 15:29:53.064+02	2024-09-24 15:29:55.528+02
e2459f1e-ce54-41b6-a2df-26e789e51b34	1	2024-09-24 15:29:57.924+02	2024-09-24 15:30:55+02	2024-09-24 15:29:57.924+02	2024-09-24 15:30:55.736+02
1a76789e-8e1b-450a-a6d5-d82182d28a14	1	2024-09-24 15:32:39.997+02	2024-09-24 15:32:47+02	2024-09-24 15:32:39.997+02	2024-09-24 15:32:47.887+02
abccd4d7-baa2-4342-a677-0ac0e435f58f	1	2024-09-24 15:43:03.16+02	2024-09-24 15:43:20+02	2024-09-24 15:43:03.161+02	2024-09-24 15:43:20.373+02
a3935efa-4ccf-4314-8413-b8a27796c04f	1	2024-09-24 15:47:18.216+02	2024-09-24 15:47:47+02	2024-09-24 15:47:18.217+02	2024-09-24 15:47:47.619+02
170cbdcd-9c23-499a-9338-59dea948d8d9	1	2024-09-24 16:00:06.808+02	2024-09-24 16:00:08+02	2024-09-24 16:00:06.809+02	2024-09-24 16:00:08.404+02
ac614d6f-634a-465a-93ca-a1f7a3f17666	1	2024-09-24 16:09:26.096+02	2024-09-24 16:09:29+02	2024-09-24 16:09:26.097+02	2024-09-24 16:09:29.659+02
03a6baa0-079e-4c2c-b374-c23cf1e3b71c	1	2024-09-24 16:12:38.281+02	2024-09-24 16:14:49+02	2024-09-24 16:12:38.281+02	2024-09-24 16:14:49.529+02
92ffab50-0913-47f8-9505-5734560f0261	1	2024-09-24 16:17:18.922+02	2024-09-25 00:08:21+02	2024-09-24 16:17:18.923+02	2024-09-25 00:08:21.45+02
a24b315b-ba85-4e2e-9ad6-d7e716175976	1	2024-09-25 00:10:54.967+02	2024-09-25 00:11:58+02	2024-09-25 00:10:54.968+02	2024-09-25 00:11:58.929+02
d9303be9-5a1c-4eda-beeb-943e6699339e	1	2024-09-25 00:12:29.282+02	2024-09-25 00:17:03+02	2024-09-25 00:12:29.282+02	2024-09-25 00:17:03.113+02
40027fa5-fb50-44ea-800e-b5fbfd0a69c2	1	2024-09-25 00:17:17.128+02	2024-09-25 00:33:24+02	2024-09-25 00:17:17.128+02	2024-09-25 00:33:24.776+02
12d05a63-dc45-479b-ba3d-d0f6de06d86f	1	2024-09-25 00:33:29.595+02	2024-09-25 00:39:20+02	2024-09-25 00:33:29.596+02	2024-09-25 00:39:20.823+02
81ef20d7-8e6a-44a8-a956-84d269bf0500	1	2024-09-25 00:39:28.357+02	2024-09-25 00:53:17+02	2024-09-25 00:39:28.357+02	2024-09-25 00:53:17.252+02
81465cc0-ab57-46fd-8384-61995467803f	1	2024-09-25 14:02:12.733+02	2024-09-25 14:06:24+02	2024-09-25 14:02:12.735+02	2024-09-25 14:06:24.899+02
f2292f24-12e4-4ca8-942f-c129093a5f07	1	2024-09-25 14:06:28.956+02	2024-09-25 14:08:15+02	2024-09-25 14:06:28.956+02	2024-09-25 14:08:15.047+02
bd74981f-74c1-48f0-9c28-e56469152490	1	2024-09-25 14:08:29.199+02	2024-09-25 14:30:28+02	2024-09-25 14:08:29.2+02	2024-09-25 14:30:28.695+02
27fe505c-b6af-4eaa-af71-1c6bcb4c74c6	1	2024-09-25 14:30:39.181+02	2024-09-25 14:30:52+02	2024-09-25 14:30:39.183+02	2024-09-25 14:30:52.947+02
9d03c4c3-2437-4a97-ad6b-b2696687859a	1	2024-09-25 14:37:16.88+02	2024-09-25 15:10:52+02	2024-09-25 14:37:16.88+02	2024-09-25 15:10:52.294+02
9eb1f4ae-99ba-4190-90de-e65fa8502772	1	2024-09-25 15:17:25.834+02	2024-09-25 15:17:34+02	2024-09-25 15:17:25.835+02	2024-09-25 15:17:34.64+02
77cf7d10-52e0-41c5-b9e6-56581bfade52	1	2024-09-25 15:17:37.857+02	2024-09-25 16:20:40+02	2024-09-25 15:17:37.857+02	2024-09-25 16:20:40.242+02
02bdf7bb-409f-4d7c-a41a-fa08129ad079	1	2024-09-25 16:23:58.829+02	2024-09-25 17:16:41+02	2024-09-25 16:23:58.829+02	2024-09-25 17:16:41.409+02
980bd59b-2ada-4ca5-b331-f081f8962999	1	2024-09-25 17:16:44.883+02	2024-09-25 17:19:31+02	2024-09-25 17:16:44.884+02	2024-09-25 17:19:31.662+02
7d0cfcb5-7826-4246-a936-b90498f47c33	1	2024-09-25 17:22:04.42+02	2024-10-01 14:19:54+02	2024-09-25 17:22:04.42+02	2024-10-01 14:19:54.665+02
5791b68a-baf5-4cd7-a452-ad9b6bf1e3e8	1	2024-10-01 14:28:01.991+02	2024-10-01 17:53:36+02	2024-10-01 14:28:01.992+02	2024-10-01 17:53:36.227+02
30cb3f4d-10ea-48eb-afe2-3131fecf84fa	1	2024-10-01 17:59:12.54+02	2024-10-03 19:52:13+02	2024-10-01 17:59:12.541+02	2024-10-03 19:52:13.585+02
379aad65-3eb2-404a-849e-367e96957ea2	1	2024-10-03 19:54:08.511+02	2024-10-05 13:55:06+02	2024-10-03 19:54:08.512+02	2024-10-05 13:55:06.365+02
1673bc3d-8217-4fd4-85f2-b889e3b6d000	1	2024-10-05 13:55:11.594+02	\N	2024-10-05 13:55:11.596+02	2024-10-05 13:55:11.596+02
\.


--
-- Data for Name: td_perfo_synthesis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.td_perfo_synthesis ("VendorCode", purchasingorganisationcode, "Value(EUR)", id) FROM stdin;
MDM537415	MB02	100000	1
MDM537415	MB02	100000	2
MDM537415	MB02	100000	3
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, code, shorttext, longtext, parent, "createdAt", "updatedAt") FROM stdin;
1	MB02	WB	\N	\N	2024-09-18 11:55:45.608402+02	2024-09-18 11:55:45.608402+02
2	MB03	SE	\N	\N	2024-09-29 16:14:57.329374+02	2024-09-29 16:14:57.329374+02
3	GOPE	LGI	\N	\N	2024-09-29 16:14:57.34065+02	2024-09-29 16:14:57.34065+02
\.


--
-- Data for Name: yearly_supplier_snapshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yearly_supplier_snapshot (id, year, vendorcode, vendorname, mdmcode, country, city, address, source, "createdAt", "updatedAt") FROM stdin;
1	2024	MDM537415	EATON	MDM537415	GB	HAVANT	LARCHWOOD AV	SAP	2024-09-18 12:21:17.071+02	2024-10-07 01:28:15.456+02
255	2023	MDM537415	OLD EATON	MDM537415	GB	HAVANT	LARCHWOOD AV	SAP	2024-09-18 12:21:17.071+02	2024-09-18 12:21:17.071+02
2	2024	MDM537422	CISOLIFT DISTRIBUTION	MDM537422	CA	ST GERMAIN DE GRANTHAM	192 RUE SYLVESTRE	SAP	2024-09-18 12:21:17.071+02	2024-10-07 01:28:15.44+02
\.


--
-- Data for Name: yearly_team_cota_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yearly_team_cota_data (id, year, vendorcode, purchasingorganisationcode, "Value(EUR)", reason1, reason2, reason3, reason4, forceperfcota, forceriskcota, comment, commenter, "createdAt", "updatedAt", intensity, perfscope, riskscope, lastsurveillance, spendscope, status, hasnewname) FROM stdin;
162	2023	MDM537415	MB02	100000	f	f	f	f	\N	\N	\N	\N	2024-09-18 12:21:17.088+02	2024-09-18 12:21:17.088+02	3	f	f	\N	f	\N	f
1	2024	MDM537415	MB02	300000	f	f	f	f	\N	\N	 	1	2024-09-18 12:21:17.088+02	2024-10-07 01:31:50.391+02	\N	t	t	3	t	new	t
4	2024	MDM537422	MB02	0	f	f	f	f	t	t	 	1	2024-09-18 12:21:17.088+02	2024-10-07 01:31:50.397+02	\N	t	t	\N	f	new	f
2	2024	MDM537415	MB03	0	f	f	f	f	\N	\N	\N	\N	2024-09-18 12:21:17.088+02	2024-10-07 01:31:50.399+02	\N	t	f	\N	t	new	t
5	2024	MDM537422	MB03	0	f	f	f	f	\N	\N	\N	\N	2024-09-18 12:21:17.088+02	2024-10-07 01:31:50.409+02	\N	t	f	\N	t	new	f
3	2024	MDM537415	GOPE	0	f	f	f	f	\N	\N	\N	\N	2024-09-18 12:21:17.088+02	2024-10-07 01:31:50.415+02	\N	t	f	\N	t	new	t
6	2024	MDM537422	GOPE	0	f	f	f	f	f	\N	 	1	2024-09-18 12:21:17.088+02	2024-10-07 01:31:50.423+02	\N	f	f	\N	t	\N	f
\.


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_id_seq', 2, true);


--
-- Name: cached_selection_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cached_selection_data_id_seq', 66, true);


--
-- Name: campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campaign_id_seq', 1, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, false);


--
-- Name: intensity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intensity_id_seq', 4, true);


--
-- Name: orga_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orga_id_seq', 1, true);


--
-- Name: plant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_id_seq', 1, false);


--
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 1, true);


--
-- Name: result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.result_id_seq', 1, false);


--
-- Name: td_perfo_synthesis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.td_perfo_synthesis_id_seq', 3, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 3, true);


--
-- Name: yearly_supplier_snapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yearly_supplier_snapshot_id_seq', 271, true);


--
-- Name: yearly_team_cota_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yearly_team_cota_data_id_seq', 836, true);


--
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- Name: cached_selection_data cached_selection_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cached_selection_data
    ADD CONSTRAINT cached_selection_data_pkey PRIMARY KEY (id);


--
-- Name: campaign campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_pkey PRIMARY KEY (id);


--
-- Name: campaign campaign_year_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key UNIQUE (year);


--
-- Name: campaign campaign_year_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key1 UNIQUE (year);


--
-- Name: campaign campaign_year_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key10 UNIQUE (year);


--
-- Name: campaign campaign_year_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key100 UNIQUE (year);


--
-- Name: campaign campaign_year_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key101 UNIQUE (year);


--
-- Name: campaign campaign_year_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key102 UNIQUE (year);


--
-- Name: campaign campaign_year_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key103 UNIQUE (year);


--
-- Name: campaign campaign_year_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key104 UNIQUE (year);


--
-- Name: campaign campaign_year_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key105 UNIQUE (year);


--
-- Name: campaign campaign_year_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key106 UNIQUE (year);


--
-- Name: campaign campaign_year_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key107 UNIQUE (year);


--
-- Name: campaign campaign_year_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key108 UNIQUE (year);


--
-- Name: campaign campaign_year_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key109 UNIQUE (year);


--
-- Name: campaign campaign_year_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key11 UNIQUE (year);


--
-- Name: campaign campaign_year_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key110 UNIQUE (year);


--
-- Name: campaign campaign_year_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key111 UNIQUE (year);


--
-- Name: campaign campaign_year_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key112 UNIQUE (year);


--
-- Name: campaign campaign_year_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key113 UNIQUE (year);


--
-- Name: campaign campaign_year_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key114 UNIQUE (year);


--
-- Name: campaign campaign_year_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key115 UNIQUE (year);


--
-- Name: campaign campaign_year_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key116 UNIQUE (year);


--
-- Name: campaign campaign_year_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key117 UNIQUE (year);


--
-- Name: campaign campaign_year_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key118 UNIQUE (year);


--
-- Name: campaign campaign_year_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key119 UNIQUE (year);


--
-- Name: campaign campaign_year_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key12 UNIQUE (year);


--
-- Name: campaign campaign_year_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key120 UNIQUE (year);


--
-- Name: campaign campaign_year_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key121 UNIQUE (year);


--
-- Name: campaign campaign_year_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key122 UNIQUE (year);


--
-- Name: campaign campaign_year_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key123 UNIQUE (year);


--
-- Name: campaign campaign_year_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key124 UNIQUE (year);


--
-- Name: campaign campaign_year_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key125 UNIQUE (year);


--
-- Name: campaign campaign_year_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key126 UNIQUE (year);


--
-- Name: campaign campaign_year_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key127 UNIQUE (year);


--
-- Name: campaign campaign_year_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key128 UNIQUE (year);


--
-- Name: campaign campaign_year_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key129 UNIQUE (year);


--
-- Name: campaign campaign_year_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key13 UNIQUE (year);


--
-- Name: campaign campaign_year_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key130 UNIQUE (year);


--
-- Name: campaign campaign_year_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key131 UNIQUE (year);


--
-- Name: campaign campaign_year_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key132 UNIQUE (year);


--
-- Name: campaign campaign_year_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key133 UNIQUE (year);


--
-- Name: campaign campaign_year_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key134 UNIQUE (year);


--
-- Name: campaign campaign_year_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key135 UNIQUE (year);


--
-- Name: campaign campaign_year_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key136 UNIQUE (year);


--
-- Name: campaign campaign_year_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key137 UNIQUE (year);


--
-- Name: campaign campaign_year_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key138 UNIQUE (year);


--
-- Name: campaign campaign_year_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key139 UNIQUE (year);


--
-- Name: campaign campaign_year_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key14 UNIQUE (year);


--
-- Name: campaign campaign_year_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key140 UNIQUE (year);


--
-- Name: campaign campaign_year_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key141 UNIQUE (year);


--
-- Name: campaign campaign_year_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key142 UNIQUE (year);


--
-- Name: campaign campaign_year_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key143 UNIQUE (year);


--
-- Name: campaign campaign_year_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key144 UNIQUE (year);


--
-- Name: campaign campaign_year_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key145 UNIQUE (year);


--
-- Name: campaign campaign_year_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key146 UNIQUE (year);


--
-- Name: campaign campaign_year_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key147 UNIQUE (year);


--
-- Name: campaign campaign_year_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key148 UNIQUE (year);


--
-- Name: campaign campaign_year_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key149 UNIQUE (year);


--
-- Name: campaign campaign_year_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key15 UNIQUE (year);


--
-- Name: campaign campaign_year_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key150 UNIQUE (year);


--
-- Name: campaign campaign_year_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key151 UNIQUE (year);


--
-- Name: campaign campaign_year_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key152 UNIQUE (year);


--
-- Name: campaign campaign_year_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key153 UNIQUE (year);


--
-- Name: campaign campaign_year_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key154 UNIQUE (year);


--
-- Name: campaign campaign_year_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key155 UNIQUE (year);


--
-- Name: campaign campaign_year_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key156 UNIQUE (year);


--
-- Name: campaign campaign_year_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key157 UNIQUE (year);


--
-- Name: campaign campaign_year_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key158 UNIQUE (year);


--
-- Name: campaign campaign_year_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key159 UNIQUE (year);


--
-- Name: campaign campaign_year_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key16 UNIQUE (year);


--
-- Name: campaign campaign_year_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key160 UNIQUE (year);


--
-- Name: campaign campaign_year_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key161 UNIQUE (year);


--
-- Name: campaign campaign_year_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key162 UNIQUE (year);


--
-- Name: campaign campaign_year_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key163 UNIQUE (year);


--
-- Name: campaign campaign_year_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key164 UNIQUE (year);


--
-- Name: campaign campaign_year_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key165 UNIQUE (year);


--
-- Name: campaign campaign_year_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key166 UNIQUE (year);


--
-- Name: campaign campaign_year_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key167 UNIQUE (year);


--
-- Name: campaign campaign_year_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key168 UNIQUE (year);


--
-- Name: campaign campaign_year_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key169 UNIQUE (year);


--
-- Name: campaign campaign_year_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key17 UNIQUE (year);


--
-- Name: campaign campaign_year_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key170 UNIQUE (year);


--
-- Name: campaign campaign_year_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key171 UNIQUE (year);


--
-- Name: campaign campaign_year_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key172 UNIQUE (year);


--
-- Name: campaign campaign_year_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key173 UNIQUE (year);


--
-- Name: campaign campaign_year_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key174 UNIQUE (year);


--
-- Name: campaign campaign_year_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key175 UNIQUE (year);


--
-- Name: campaign campaign_year_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key176 UNIQUE (year);


--
-- Name: campaign campaign_year_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key177 UNIQUE (year);


--
-- Name: campaign campaign_year_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key178 UNIQUE (year);


--
-- Name: campaign campaign_year_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key179 UNIQUE (year);


--
-- Name: campaign campaign_year_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key18 UNIQUE (year);


--
-- Name: campaign campaign_year_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key180 UNIQUE (year);


--
-- Name: campaign campaign_year_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key181 UNIQUE (year);


--
-- Name: campaign campaign_year_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key182 UNIQUE (year);


--
-- Name: campaign campaign_year_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key183 UNIQUE (year);


--
-- Name: campaign campaign_year_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key184 UNIQUE (year);


--
-- Name: campaign campaign_year_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key185 UNIQUE (year);


--
-- Name: campaign campaign_year_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key186 UNIQUE (year);


--
-- Name: campaign campaign_year_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key187 UNIQUE (year);


--
-- Name: campaign campaign_year_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key188 UNIQUE (year);


--
-- Name: campaign campaign_year_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key189 UNIQUE (year);


--
-- Name: campaign campaign_year_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key19 UNIQUE (year);


--
-- Name: campaign campaign_year_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key190 UNIQUE (year);


--
-- Name: campaign campaign_year_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key191 UNIQUE (year);


--
-- Name: campaign campaign_year_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key192 UNIQUE (year);


--
-- Name: campaign campaign_year_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key193 UNIQUE (year);


--
-- Name: campaign campaign_year_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key194 UNIQUE (year);


--
-- Name: campaign campaign_year_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key195 UNIQUE (year);


--
-- Name: campaign campaign_year_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key196 UNIQUE (year);


--
-- Name: campaign campaign_year_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key197 UNIQUE (year);


--
-- Name: campaign campaign_year_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key198 UNIQUE (year);


--
-- Name: campaign campaign_year_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key199 UNIQUE (year);


--
-- Name: campaign campaign_year_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key2 UNIQUE (year);


--
-- Name: campaign campaign_year_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key20 UNIQUE (year);


--
-- Name: campaign campaign_year_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key200 UNIQUE (year);


--
-- Name: campaign campaign_year_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key201 UNIQUE (year);


--
-- Name: campaign campaign_year_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key202 UNIQUE (year);


--
-- Name: campaign campaign_year_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key203 UNIQUE (year);


--
-- Name: campaign campaign_year_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key204 UNIQUE (year);


--
-- Name: campaign campaign_year_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key205 UNIQUE (year);


--
-- Name: campaign campaign_year_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key206 UNIQUE (year);


--
-- Name: campaign campaign_year_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key207 UNIQUE (year);


--
-- Name: campaign campaign_year_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key208 UNIQUE (year);


--
-- Name: campaign campaign_year_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key209 UNIQUE (year);


--
-- Name: campaign campaign_year_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key21 UNIQUE (year);


--
-- Name: campaign campaign_year_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key210 UNIQUE (year);


--
-- Name: campaign campaign_year_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key211 UNIQUE (year);


--
-- Name: campaign campaign_year_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key212 UNIQUE (year);


--
-- Name: campaign campaign_year_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key213 UNIQUE (year);


--
-- Name: campaign campaign_year_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key214 UNIQUE (year);


--
-- Name: campaign campaign_year_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key215 UNIQUE (year);


--
-- Name: campaign campaign_year_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key216 UNIQUE (year);


--
-- Name: campaign campaign_year_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key217 UNIQUE (year);


--
-- Name: campaign campaign_year_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key218 UNIQUE (year);


--
-- Name: campaign campaign_year_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key219 UNIQUE (year);


--
-- Name: campaign campaign_year_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key22 UNIQUE (year);


--
-- Name: campaign campaign_year_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key220 UNIQUE (year);


--
-- Name: campaign campaign_year_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key221 UNIQUE (year);


--
-- Name: campaign campaign_year_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key222 UNIQUE (year);


--
-- Name: campaign campaign_year_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key223 UNIQUE (year);


--
-- Name: campaign campaign_year_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key224 UNIQUE (year);


--
-- Name: campaign campaign_year_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key225 UNIQUE (year);


--
-- Name: campaign campaign_year_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key226 UNIQUE (year);


--
-- Name: campaign campaign_year_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key227 UNIQUE (year);


--
-- Name: campaign campaign_year_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key228 UNIQUE (year);


--
-- Name: campaign campaign_year_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key229 UNIQUE (year);


--
-- Name: campaign campaign_year_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key23 UNIQUE (year);


--
-- Name: campaign campaign_year_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key230 UNIQUE (year);


--
-- Name: campaign campaign_year_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key231 UNIQUE (year);


--
-- Name: campaign campaign_year_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key232 UNIQUE (year);


--
-- Name: campaign campaign_year_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key233 UNIQUE (year);


--
-- Name: campaign campaign_year_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key234 UNIQUE (year);


--
-- Name: campaign campaign_year_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key235 UNIQUE (year);


--
-- Name: campaign campaign_year_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key236 UNIQUE (year);


--
-- Name: campaign campaign_year_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key237 UNIQUE (year);


--
-- Name: campaign campaign_year_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key238 UNIQUE (year);


--
-- Name: campaign campaign_year_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key239 UNIQUE (year);


--
-- Name: campaign campaign_year_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key24 UNIQUE (year);


--
-- Name: campaign campaign_year_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key240 UNIQUE (year);


--
-- Name: campaign campaign_year_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key241 UNIQUE (year);


--
-- Name: campaign campaign_year_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key242 UNIQUE (year);


--
-- Name: campaign campaign_year_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key243 UNIQUE (year);


--
-- Name: campaign campaign_year_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key244 UNIQUE (year);


--
-- Name: campaign campaign_year_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key245 UNIQUE (year);


--
-- Name: campaign campaign_year_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key246 UNIQUE (year);


--
-- Name: campaign campaign_year_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key247 UNIQUE (year);


--
-- Name: campaign campaign_year_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key248 UNIQUE (year);


--
-- Name: campaign campaign_year_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key249 UNIQUE (year);


--
-- Name: campaign campaign_year_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key25 UNIQUE (year);


--
-- Name: campaign campaign_year_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key250 UNIQUE (year);


--
-- Name: campaign campaign_year_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key251 UNIQUE (year);


--
-- Name: campaign campaign_year_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key252 UNIQUE (year);


--
-- Name: campaign campaign_year_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key253 UNIQUE (year);


--
-- Name: campaign campaign_year_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key254 UNIQUE (year);


--
-- Name: campaign campaign_year_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key255 UNIQUE (year);


--
-- Name: campaign campaign_year_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key256 UNIQUE (year);


--
-- Name: campaign campaign_year_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key257 UNIQUE (year);


--
-- Name: campaign campaign_year_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key258 UNIQUE (year);


--
-- Name: campaign campaign_year_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key259 UNIQUE (year);


--
-- Name: campaign campaign_year_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key26 UNIQUE (year);


--
-- Name: campaign campaign_year_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key260 UNIQUE (year);


--
-- Name: campaign campaign_year_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key261 UNIQUE (year);


--
-- Name: campaign campaign_year_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key262 UNIQUE (year);


--
-- Name: campaign campaign_year_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key263 UNIQUE (year);


--
-- Name: campaign campaign_year_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key264 UNIQUE (year);


--
-- Name: campaign campaign_year_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key265 UNIQUE (year);


--
-- Name: campaign campaign_year_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key266 UNIQUE (year);


--
-- Name: campaign campaign_year_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key267 UNIQUE (year);


--
-- Name: campaign campaign_year_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key268 UNIQUE (year);


--
-- Name: campaign campaign_year_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key269 UNIQUE (year);


--
-- Name: campaign campaign_year_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key27 UNIQUE (year);


--
-- Name: campaign campaign_year_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key270 UNIQUE (year);


--
-- Name: campaign campaign_year_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key271 UNIQUE (year);


--
-- Name: campaign campaign_year_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key272 UNIQUE (year);


--
-- Name: campaign campaign_year_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key273 UNIQUE (year);


--
-- Name: campaign campaign_year_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key274 UNIQUE (year);


--
-- Name: campaign campaign_year_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key275 UNIQUE (year);


--
-- Name: campaign campaign_year_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key276 UNIQUE (year);


--
-- Name: campaign campaign_year_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key277 UNIQUE (year);


--
-- Name: campaign campaign_year_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key278 UNIQUE (year);


--
-- Name: campaign campaign_year_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key279 UNIQUE (year);


--
-- Name: campaign campaign_year_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key28 UNIQUE (year);


--
-- Name: campaign campaign_year_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key280 UNIQUE (year);


--
-- Name: campaign campaign_year_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key281 UNIQUE (year);


--
-- Name: campaign campaign_year_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key282 UNIQUE (year);


--
-- Name: campaign campaign_year_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key283 UNIQUE (year);


--
-- Name: campaign campaign_year_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key284 UNIQUE (year);


--
-- Name: campaign campaign_year_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key285 UNIQUE (year);


--
-- Name: campaign campaign_year_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key286 UNIQUE (year);


--
-- Name: campaign campaign_year_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key287 UNIQUE (year);


--
-- Name: campaign campaign_year_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key288 UNIQUE (year);


--
-- Name: campaign campaign_year_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key289 UNIQUE (year);


--
-- Name: campaign campaign_year_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key29 UNIQUE (year);


--
-- Name: campaign campaign_year_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key290 UNIQUE (year);


--
-- Name: campaign campaign_year_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key291 UNIQUE (year);


--
-- Name: campaign campaign_year_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key292 UNIQUE (year);


--
-- Name: campaign campaign_year_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key293 UNIQUE (year);


--
-- Name: campaign campaign_year_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key294 UNIQUE (year);


--
-- Name: campaign campaign_year_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key295 UNIQUE (year);


--
-- Name: campaign campaign_year_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key296 UNIQUE (year);


--
-- Name: campaign campaign_year_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key297 UNIQUE (year);


--
-- Name: campaign campaign_year_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key298 UNIQUE (year);


--
-- Name: campaign campaign_year_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key299 UNIQUE (year);


--
-- Name: campaign campaign_year_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key3 UNIQUE (year);


--
-- Name: campaign campaign_year_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key30 UNIQUE (year);


--
-- Name: campaign campaign_year_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key300 UNIQUE (year);


--
-- Name: campaign campaign_year_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key301 UNIQUE (year);


--
-- Name: campaign campaign_year_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key302 UNIQUE (year);


--
-- Name: campaign campaign_year_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key303 UNIQUE (year);


--
-- Name: campaign campaign_year_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key304 UNIQUE (year);


--
-- Name: campaign campaign_year_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key305 UNIQUE (year);


--
-- Name: campaign campaign_year_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key306 UNIQUE (year);


--
-- Name: campaign campaign_year_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key307 UNIQUE (year);


--
-- Name: campaign campaign_year_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key308 UNIQUE (year);


--
-- Name: campaign campaign_year_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key309 UNIQUE (year);


--
-- Name: campaign campaign_year_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key31 UNIQUE (year);


--
-- Name: campaign campaign_year_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key310 UNIQUE (year);


--
-- Name: campaign campaign_year_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key311 UNIQUE (year);


--
-- Name: campaign campaign_year_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key312 UNIQUE (year);


--
-- Name: campaign campaign_year_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key313 UNIQUE (year);


--
-- Name: campaign campaign_year_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key314 UNIQUE (year);


--
-- Name: campaign campaign_year_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key315 UNIQUE (year);


--
-- Name: campaign campaign_year_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key316 UNIQUE (year);


--
-- Name: campaign campaign_year_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key317 UNIQUE (year);


--
-- Name: campaign campaign_year_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key318 UNIQUE (year);


--
-- Name: campaign campaign_year_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key319 UNIQUE (year);


--
-- Name: campaign campaign_year_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key32 UNIQUE (year);


--
-- Name: campaign campaign_year_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key320 UNIQUE (year);


--
-- Name: campaign campaign_year_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key321 UNIQUE (year);


--
-- Name: campaign campaign_year_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key322 UNIQUE (year);


--
-- Name: campaign campaign_year_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key323 UNIQUE (year);


--
-- Name: campaign campaign_year_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key324 UNIQUE (year);


--
-- Name: campaign campaign_year_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key325 UNIQUE (year);


--
-- Name: campaign campaign_year_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key326 UNIQUE (year);


--
-- Name: campaign campaign_year_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key327 UNIQUE (year);


--
-- Name: campaign campaign_year_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key328 UNIQUE (year);


--
-- Name: campaign campaign_year_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key329 UNIQUE (year);


--
-- Name: campaign campaign_year_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key33 UNIQUE (year);


--
-- Name: campaign campaign_year_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key330 UNIQUE (year);


--
-- Name: campaign campaign_year_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key331 UNIQUE (year);


--
-- Name: campaign campaign_year_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key332 UNIQUE (year);


--
-- Name: campaign campaign_year_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key333 UNIQUE (year);


--
-- Name: campaign campaign_year_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key334 UNIQUE (year);


--
-- Name: campaign campaign_year_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key335 UNIQUE (year);


--
-- Name: campaign campaign_year_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key336 UNIQUE (year);


--
-- Name: campaign campaign_year_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key337 UNIQUE (year);


--
-- Name: campaign campaign_year_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key338 UNIQUE (year);


--
-- Name: campaign campaign_year_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key339 UNIQUE (year);


--
-- Name: campaign campaign_year_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key34 UNIQUE (year);


--
-- Name: campaign campaign_year_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key340 UNIQUE (year);


--
-- Name: campaign campaign_year_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key341 UNIQUE (year);


--
-- Name: campaign campaign_year_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key342 UNIQUE (year);


--
-- Name: campaign campaign_year_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key343 UNIQUE (year);


--
-- Name: campaign campaign_year_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key344 UNIQUE (year);


--
-- Name: campaign campaign_year_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key345 UNIQUE (year);


--
-- Name: campaign campaign_year_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key346 UNIQUE (year);


--
-- Name: campaign campaign_year_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key347 UNIQUE (year);


--
-- Name: campaign campaign_year_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key348 UNIQUE (year);


--
-- Name: campaign campaign_year_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key349 UNIQUE (year);


--
-- Name: campaign campaign_year_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key35 UNIQUE (year);


--
-- Name: campaign campaign_year_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key350 UNIQUE (year);


--
-- Name: campaign campaign_year_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key351 UNIQUE (year);


--
-- Name: campaign campaign_year_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key352 UNIQUE (year);


--
-- Name: campaign campaign_year_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key353 UNIQUE (year);


--
-- Name: campaign campaign_year_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key354 UNIQUE (year);


--
-- Name: campaign campaign_year_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key355 UNIQUE (year);


--
-- Name: campaign campaign_year_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key356 UNIQUE (year);


--
-- Name: campaign campaign_year_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key357 UNIQUE (year);


--
-- Name: campaign campaign_year_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key358 UNIQUE (year);


--
-- Name: campaign campaign_year_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key359 UNIQUE (year);


--
-- Name: campaign campaign_year_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key36 UNIQUE (year);


--
-- Name: campaign campaign_year_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key360 UNIQUE (year);


--
-- Name: campaign campaign_year_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key361 UNIQUE (year);


--
-- Name: campaign campaign_year_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key362 UNIQUE (year);


--
-- Name: campaign campaign_year_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key363 UNIQUE (year);


--
-- Name: campaign campaign_year_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key364 UNIQUE (year);


--
-- Name: campaign campaign_year_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key365 UNIQUE (year);


--
-- Name: campaign campaign_year_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key366 UNIQUE (year);


--
-- Name: campaign campaign_year_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key367 UNIQUE (year);


--
-- Name: campaign campaign_year_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key368 UNIQUE (year);


--
-- Name: campaign campaign_year_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key369 UNIQUE (year);


--
-- Name: campaign campaign_year_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key37 UNIQUE (year);


--
-- Name: campaign campaign_year_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key370 UNIQUE (year);


--
-- Name: campaign campaign_year_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key371 UNIQUE (year);


--
-- Name: campaign campaign_year_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key372 UNIQUE (year);


--
-- Name: campaign campaign_year_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key373 UNIQUE (year);


--
-- Name: campaign campaign_year_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key374 UNIQUE (year);


--
-- Name: campaign campaign_year_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key375 UNIQUE (year);


--
-- Name: campaign campaign_year_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key376 UNIQUE (year);


--
-- Name: campaign campaign_year_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key377 UNIQUE (year);


--
-- Name: campaign campaign_year_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key378 UNIQUE (year);


--
-- Name: campaign campaign_year_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key379 UNIQUE (year);


--
-- Name: campaign campaign_year_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key38 UNIQUE (year);


--
-- Name: campaign campaign_year_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key380 UNIQUE (year);


--
-- Name: campaign campaign_year_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key381 UNIQUE (year);


--
-- Name: campaign campaign_year_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key382 UNIQUE (year);


--
-- Name: campaign campaign_year_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key383 UNIQUE (year);


--
-- Name: campaign campaign_year_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key384 UNIQUE (year);


--
-- Name: campaign campaign_year_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key385 UNIQUE (year);


--
-- Name: campaign campaign_year_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key386 UNIQUE (year);


--
-- Name: campaign campaign_year_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key387 UNIQUE (year);


--
-- Name: campaign campaign_year_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key388 UNIQUE (year);


--
-- Name: campaign campaign_year_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key389 UNIQUE (year);


--
-- Name: campaign campaign_year_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key39 UNIQUE (year);


--
-- Name: campaign campaign_year_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key390 UNIQUE (year);


--
-- Name: campaign campaign_year_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key391 UNIQUE (year);


--
-- Name: campaign campaign_year_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key392 UNIQUE (year);


--
-- Name: campaign campaign_year_key393; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key393 UNIQUE (year);


--
-- Name: campaign campaign_year_key394; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key394 UNIQUE (year);


--
-- Name: campaign campaign_year_key395; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key395 UNIQUE (year);


--
-- Name: campaign campaign_year_key396; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key396 UNIQUE (year);


--
-- Name: campaign campaign_year_key397; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key397 UNIQUE (year);


--
-- Name: campaign campaign_year_key398; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key398 UNIQUE (year);


--
-- Name: campaign campaign_year_key399; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key399 UNIQUE (year);


--
-- Name: campaign campaign_year_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key4 UNIQUE (year);


--
-- Name: campaign campaign_year_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key40 UNIQUE (year);


--
-- Name: campaign campaign_year_key400; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key400 UNIQUE (year);


--
-- Name: campaign campaign_year_key401; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key401 UNIQUE (year);


--
-- Name: campaign campaign_year_key402; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key402 UNIQUE (year);


--
-- Name: campaign campaign_year_key403; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key403 UNIQUE (year);


--
-- Name: campaign campaign_year_key404; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key404 UNIQUE (year);


--
-- Name: campaign campaign_year_key405; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key405 UNIQUE (year);


--
-- Name: campaign campaign_year_key406; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key406 UNIQUE (year);


--
-- Name: campaign campaign_year_key407; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key407 UNIQUE (year);


--
-- Name: campaign campaign_year_key408; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key408 UNIQUE (year);


--
-- Name: campaign campaign_year_key409; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key409 UNIQUE (year);


--
-- Name: campaign campaign_year_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key41 UNIQUE (year);


--
-- Name: campaign campaign_year_key410; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key410 UNIQUE (year);


--
-- Name: campaign campaign_year_key411; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key411 UNIQUE (year);


--
-- Name: campaign campaign_year_key412; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key412 UNIQUE (year);


--
-- Name: campaign campaign_year_key413; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key413 UNIQUE (year);


--
-- Name: campaign campaign_year_key414; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key414 UNIQUE (year);


--
-- Name: campaign campaign_year_key415; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key415 UNIQUE (year);


--
-- Name: campaign campaign_year_key416; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key416 UNIQUE (year);


--
-- Name: campaign campaign_year_key417; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key417 UNIQUE (year);


--
-- Name: campaign campaign_year_key418; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key418 UNIQUE (year);


--
-- Name: campaign campaign_year_key419; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key419 UNIQUE (year);


--
-- Name: campaign campaign_year_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key42 UNIQUE (year);


--
-- Name: campaign campaign_year_key420; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key420 UNIQUE (year);


--
-- Name: campaign campaign_year_key421; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key421 UNIQUE (year);


--
-- Name: campaign campaign_year_key422; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key422 UNIQUE (year);


--
-- Name: campaign campaign_year_key423; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key423 UNIQUE (year);


--
-- Name: campaign campaign_year_key424; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key424 UNIQUE (year);


--
-- Name: campaign campaign_year_key425; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key425 UNIQUE (year);


--
-- Name: campaign campaign_year_key426; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key426 UNIQUE (year);


--
-- Name: campaign campaign_year_key427; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key427 UNIQUE (year);


--
-- Name: campaign campaign_year_key428; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key428 UNIQUE (year);


--
-- Name: campaign campaign_year_key429; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key429 UNIQUE (year);


--
-- Name: campaign campaign_year_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key43 UNIQUE (year);


--
-- Name: campaign campaign_year_key430; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key430 UNIQUE (year);


--
-- Name: campaign campaign_year_key431; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key431 UNIQUE (year);


--
-- Name: campaign campaign_year_key432; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key432 UNIQUE (year);


--
-- Name: campaign campaign_year_key433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key433 UNIQUE (year);


--
-- Name: campaign campaign_year_key434; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key434 UNIQUE (year);


--
-- Name: campaign campaign_year_key435; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key435 UNIQUE (year);


--
-- Name: campaign campaign_year_key436; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key436 UNIQUE (year);


--
-- Name: campaign campaign_year_key437; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key437 UNIQUE (year);


--
-- Name: campaign campaign_year_key438; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key438 UNIQUE (year);


--
-- Name: campaign campaign_year_key439; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key439 UNIQUE (year);


--
-- Name: campaign campaign_year_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key44 UNIQUE (year);


--
-- Name: campaign campaign_year_key440; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key440 UNIQUE (year);


--
-- Name: campaign campaign_year_key441; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key441 UNIQUE (year);


--
-- Name: campaign campaign_year_key442; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key442 UNIQUE (year);


--
-- Name: campaign campaign_year_key443; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key443 UNIQUE (year);


--
-- Name: campaign campaign_year_key444; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key444 UNIQUE (year);


--
-- Name: campaign campaign_year_key445; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key445 UNIQUE (year);


--
-- Name: campaign campaign_year_key446; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key446 UNIQUE (year);


--
-- Name: campaign campaign_year_key447; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key447 UNIQUE (year);


--
-- Name: campaign campaign_year_key448; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key448 UNIQUE (year);


--
-- Name: campaign campaign_year_key449; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key449 UNIQUE (year);


--
-- Name: campaign campaign_year_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key45 UNIQUE (year);


--
-- Name: campaign campaign_year_key450; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key450 UNIQUE (year);


--
-- Name: campaign campaign_year_key451; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key451 UNIQUE (year);


--
-- Name: campaign campaign_year_key452; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key452 UNIQUE (year);


--
-- Name: campaign campaign_year_key453; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key453 UNIQUE (year);


--
-- Name: campaign campaign_year_key454; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key454 UNIQUE (year);


--
-- Name: campaign campaign_year_key455; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key455 UNIQUE (year);


--
-- Name: campaign campaign_year_key456; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key456 UNIQUE (year);


--
-- Name: campaign campaign_year_key457; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key457 UNIQUE (year);


--
-- Name: campaign campaign_year_key458; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key458 UNIQUE (year);


--
-- Name: campaign campaign_year_key459; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key459 UNIQUE (year);


--
-- Name: campaign campaign_year_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key46 UNIQUE (year);


--
-- Name: campaign campaign_year_key460; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key460 UNIQUE (year);


--
-- Name: campaign campaign_year_key461; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key461 UNIQUE (year);


--
-- Name: campaign campaign_year_key462; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key462 UNIQUE (year);


--
-- Name: campaign campaign_year_key463; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key463 UNIQUE (year);


--
-- Name: campaign campaign_year_key464; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key464 UNIQUE (year);


--
-- Name: campaign campaign_year_key465; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key465 UNIQUE (year);


--
-- Name: campaign campaign_year_key466; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key466 UNIQUE (year);


--
-- Name: campaign campaign_year_key467; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key467 UNIQUE (year);


--
-- Name: campaign campaign_year_key468; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key468 UNIQUE (year);


--
-- Name: campaign campaign_year_key469; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key469 UNIQUE (year);


--
-- Name: campaign campaign_year_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key47 UNIQUE (year);


--
-- Name: campaign campaign_year_key470; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key470 UNIQUE (year);


--
-- Name: campaign campaign_year_key471; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key471 UNIQUE (year);


--
-- Name: campaign campaign_year_key472; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key472 UNIQUE (year);


--
-- Name: campaign campaign_year_key473; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key473 UNIQUE (year);


--
-- Name: campaign campaign_year_key474; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key474 UNIQUE (year);


--
-- Name: campaign campaign_year_key475; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key475 UNIQUE (year);


--
-- Name: campaign campaign_year_key476; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key476 UNIQUE (year);


--
-- Name: campaign campaign_year_key477; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key477 UNIQUE (year);


--
-- Name: campaign campaign_year_key478; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key478 UNIQUE (year);


--
-- Name: campaign campaign_year_key479; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key479 UNIQUE (year);


--
-- Name: campaign campaign_year_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key48 UNIQUE (year);


--
-- Name: campaign campaign_year_key480; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key480 UNIQUE (year);


--
-- Name: campaign campaign_year_key481; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key481 UNIQUE (year);


--
-- Name: campaign campaign_year_key482; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key482 UNIQUE (year);


--
-- Name: campaign campaign_year_key483; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key483 UNIQUE (year);


--
-- Name: campaign campaign_year_key484; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key484 UNIQUE (year);


--
-- Name: campaign campaign_year_key485; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key485 UNIQUE (year);


--
-- Name: campaign campaign_year_key486; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key486 UNIQUE (year);


--
-- Name: campaign campaign_year_key487; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key487 UNIQUE (year);


--
-- Name: campaign campaign_year_key488; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key488 UNIQUE (year);


--
-- Name: campaign campaign_year_key489; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key489 UNIQUE (year);


--
-- Name: campaign campaign_year_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key49 UNIQUE (year);


--
-- Name: campaign campaign_year_key490; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key490 UNIQUE (year);


--
-- Name: campaign campaign_year_key491; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key491 UNIQUE (year);


--
-- Name: campaign campaign_year_key492; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key492 UNIQUE (year);


--
-- Name: campaign campaign_year_key493; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key493 UNIQUE (year);


--
-- Name: campaign campaign_year_key494; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key494 UNIQUE (year);


--
-- Name: campaign campaign_year_key495; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key495 UNIQUE (year);


--
-- Name: campaign campaign_year_key496; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key496 UNIQUE (year);


--
-- Name: campaign campaign_year_key497; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key497 UNIQUE (year);


--
-- Name: campaign campaign_year_key498; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key498 UNIQUE (year);


--
-- Name: campaign campaign_year_key499; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key499 UNIQUE (year);


--
-- Name: campaign campaign_year_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key5 UNIQUE (year);


--
-- Name: campaign campaign_year_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key50 UNIQUE (year);


--
-- Name: campaign campaign_year_key500; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key500 UNIQUE (year);


--
-- Name: campaign campaign_year_key501; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key501 UNIQUE (year);


--
-- Name: campaign campaign_year_key502; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key502 UNIQUE (year);


--
-- Name: campaign campaign_year_key503; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key503 UNIQUE (year);


--
-- Name: campaign campaign_year_key504; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key504 UNIQUE (year);


--
-- Name: campaign campaign_year_key505; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key505 UNIQUE (year);


--
-- Name: campaign campaign_year_key506; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key506 UNIQUE (year);


--
-- Name: campaign campaign_year_key507; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key507 UNIQUE (year);


--
-- Name: campaign campaign_year_key508; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key508 UNIQUE (year);


--
-- Name: campaign campaign_year_key509; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key509 UNIQUE (year);


--
-- Name: campaign campaign_year_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key51 UNIQUE (year);


--
-- Name: campaign campaign_year_key510; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key510 UNIQUE (year);


--
-- Name: campaign campaign_year_key511; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key511 UNIQUE (year);


--
-- Name: campaign campaign_year_key512; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key512 UNIQUE (year);


--
-- Name: campaign campaign_year_key513; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key513 UNIQUE (year);


--
-- Name: campaign campaign_year_key514; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key514 UNIQUE (year);


--
-- Name: campaign campaign_year_key515; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key515 UNIQUE (year);


--
-- Name: campaign campaign_year_key516; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key516 UNIQUE (year);


--
-- Name: campaign campaign_year_key517; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key517 UNIQUE (year);


--
-- Name: campaign campaign_year_key518; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key518 UNIQUE (year);


--
-- Name: campaign campaign_year_key519; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key519 UNIQUE (year);


--
-- Name: campaign campaign_year_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key52 UNIQUE (year);


--
-- Name: campaign campaign_year_key520; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key520 UNIQUE (year);


--
-- Name: campaign campaign_year_key521; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key521 UNIQUE (year);


--
-- Name: campaign campaign_year_key522; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key522 UNIQUE (year);


--
-- Name: campaign campaign_year_key523; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key523 UNIQUE (year);


--
-- Name: campaign campaign_year_key524; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key524 UNIQUE (year);


--
-- Name: campaign campaign_year_key525; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key525 UNIQUE (year);


--
-- Name: campaign campaign_year_key526; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key526 UNIQUE (year);


--
-- Name: campaign campaign_year_key527; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key527 UNIQUE (year);


--
-- Name: campaign campaign_year_key528; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key528 UNIQUE (year);


--
-- Name: campaign campaign_year_key529; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key529 UNIQUE (year);


--
-- Name: campaign campaign_year_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key53 UNIQUE (year);


--
-- Name: campaign campaign_year_key530; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key530 UNIQUE (year);


--
-- Name: campaign campaign_year_key531; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key531 UNIQUE (year);


--
-- Name: campaign campaign_year_key532; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key532 UNIQUE (year);


--
-- Name: campaign campaign_year_key533; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key533 UNIQUE (year);


--
-- Name: campaign campaign_year_key534; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key534 UNIQUE (year);


--
-- Name: campaign campaign_year_key535; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key535 UNIQUE (year);


--
-- Name: campaign campaign_year_key536; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key536 UNIQUE (year);


--
-- Name: campaign campaign_year_key537; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key537 UNIQUE (year);


--
-- Name: campaign campaign_year_key538; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key538 UNIQUE (year);


--
-- Name: campaign campaign_year_key539; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key539 UNIQUE (year);


--
-- Name: campaign campaign_year_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key54 UNIQUE (year);


--
-- Name: campaign campaign_year_key540; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key540 UNIQUE (year);


--
-- Name: campaign campaign_year_key541; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key541 UNIQUE (year);


--
-- Name: campaign campaign_year_key542; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key542 UNIQUE (year);


--
-- Name: campaign campaign_year_key543; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key543 UNIQUE (year);


--
-- Name: campaign campaign_year_key544; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key544 UNIQUE (year);


--
-- Name: campaign campaign_year_key545; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key545 UNIQUE (year);


--
-- Name: campaign campaign_year_key546; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key546 UNIQUE (year);


--
-- Name: campaign campaign_year_key547; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key547 UNIQUE (year);


--
-- Name: campaign campaign_year_key548; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key548 UNIQUE (year);


--
-- Name: campaign campaign_year_key549; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key549 UNIQUE (year);


--
-- Name: campaign campaign_year_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key55 UNIQUE (year);


--
-- Name: campaign campaign_year_key550; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key550 UNIQUE (year);


--
-- Name: campaign campaign_year_key551; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key551 UNIQUE (year);


--
-- Name: campaign campaign_year_key552; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key552 UNIQUE (year);


--
-- Name: campaign campaign_year_key553; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key553 UNIQUE (year);


--
-- Name: campaign campaign_year_key554; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key554 UNIQUE (year);


--
-- Name: campaign campaign_year_key555; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key555 UNIQUE (year);


--
-- Name: campaign campaign_year_key556; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key556 UNIQUE (year);


--
-- Name: campaign campaign_year_key557; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key557 UNIQUE (year);


--
-- Name: campaign campaign_year_key558; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key558 UNIQUE (year);


--
-- Name: campaign campaign_year_key559; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key559 UNIQUE (year);


--
-- Name: campaign campaign_year_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key56 UNIQUE (year);


--
-- Name: campaign campaign_year_key560; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key560 UNIQUE (year);


--
-- Name: campaign campaign_year_key561; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key561 UNIQUE (year);


--
-- Name: campaign campaign_year_key562; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key562 UNIQUE (year);


--
-- Name: campaign campaign_year_key563; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key563 UNIQUE (year);


--
-- Name: campaign campaign_year_key564; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key564 UNIQUE (year);


--
-- Name: campaign campaign_year_key565; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key565 UNIQUE (year);


--
-- Name: campaign campaign_year_key566; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key566 UNIQUE (year);


--
-- Name: campaign campaign_year_key567; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key567 UNIQUE (year);


--
-- Name: campaign campaign_year_key568; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key568 UNIQUE (year);


--
-- Name: campaign campaign_year_key569; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key569 UNIQUE (year);


--
-- Name: campaign campaign_year_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key57 UNIQUE (year);


--
-- Name: campaign campaign_year_key570; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key570 UNIQUE (year);


--
-- Name: campaign campaign_year_key571; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key571 UNIQUE (year);


--
-- Name: campaign campaign_year_key572; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key572 UNIQUE (year);


--
-- Name: campaign campaign_year_key573; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key573 UNIQUE (year);


--
-- Name: campaign campaign_year_key574; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key574 UNIQUE (year);


--
-- Name: campaign campaign_year_key575; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key575 UNIQUE (year);


--
-- Name: campaign campaign_year_key576; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key576 UNIQUE (year);


--
-- Name: campaign campaign_year_key577; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key577 UNIQUE (year);


--
-- Name: campaign campaign_year_key578; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key578 UNIQUE (year);


--
-- Name: campaign campaign_year_key579; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key579 UNIQUE (year);


--
-- Name: campaign campaign_year_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key58 UNIQUE (year);


--
-- Name: campaign campaign_year_key580; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key580 UNIQUE (year);


--
-- Name: campaign campaign_year_key581; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key581 UNIQUE (year);


--
-- Name: campaign campaign_year_key582; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key582 UNIQUE (year);


--
-- Name: campaign campaign_year_key583; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key583 UNIQUE (year);


--
-- Name: campaign campaign_year_key584; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key584 UNIQUE (year);


--
-- Name: campaign campaign_year_key585; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key585 UNIQUE (year);


--
-- Name: campaign campaign_year_key586; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key586 UNIQUE (year);


--
-- Name: campaign campaign_year_key587; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key587 UNIQUE (year);


--
-- Name: campaign campaign_year_key588; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key588 UNIQUE (year);


--
-- Name: campaign campaign_year_key589; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key589 UNIQUE (year);


--
-- Name: campaign campaign_year_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key59 UNIQUE (year);


--
-- Name: campaign campaign_year_key590; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key590 UNIQUE (year);


--
-- Name: campaign campaign_year_key591; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key591 UNIQUE (year);


--
-- Name: campaign campaign_year_key592; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key592 UNIQUE (year);


--
-- Name: campaign campaign_year_key593; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key593 UNIQUE (year);


--
-- Name: campaign campaign_year_key594; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key594 UNIQUE (year);


--
-- Name: campaign campaign_year_key595; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key595 UNIQUE (year);


--
-- Name: campaign campaign_year_key596; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key596 UNIQUE (year);


--
-- Name: campaign campaign_year_key597; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key597 UNIQUE (year);


--
-- Name: campaign campaign_year_key598; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key598 UNIQUE (year);


--
-- Name: campaign campaign_year_key599; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key599 UNIQUE (year);


--
-- Name: campaign campaign_year_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key6 UNIQUE (year);


--
-- Name: campaign campaign_year_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key60 UNIQUE (year);


--
-- Name: campaign campaign_year_key600; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key600 UNIQUE (year);


--
-- Name: campaign campaign_year_key601; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key601 UNIQUE (year);


--
-- Name: campaign campaign_year_key602; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key602 UNIQUE (year);


--
-- Name: campaign campaign_year_key603; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key603 UNIQUE (year);


--
-- Name: campaign campaign_year_key604; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key604 UNIQUE (year);


--
-- Name: campaign campaign_year_key605; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key605 UNIQUE (year);


--
-- Name: campaign campaign_year_key606; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key606 UNIQUE (year);


--
-- Name: campaign campaign_year_key607; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key607 UNIQUE (year);


--
-- Name: campaign campaign_year_key608; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key608 UNIQUE (year);


--
-- Name: campaign campaign_year_key609; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key609 UNIQUE (year);


--
-- Name: campaign campaign_year_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key61 UNIQUE (year);


--
-- Name: campaign campaign_year_key610; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key610 UNIQUE (year);


--
-- Name: campaign campaign_year_key611; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key611 UNIQUE (year);


--
-- Name: campaign campaign_year_key612; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key612 UNIQUE (year);


--
-- Name: campaign campaign_year_key613; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key613 UNIQUE (year);


--
-- Name: campaign campaign_year_key614; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key614 UNIQUE (year);


--
-- Name: campaign campaign_year_key615; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key615 UNIQUE (year);


--
-- Name: campaign campaign_year_key616; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key616 UNIQUE (year);


--
-- Name: campaign campaign_year_key617; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key617 UNIQUE (year);


--
-- Name: campaign campaign_year_key618; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key618 UNIQUE (year);


--
-- Name: campaign campaign_year_key619; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key619 UNIQUE (year);


--
-- Name: campaign campaign_year_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key62 UNIQUE (year);


--
-- Name: campaign campaign_year_key620; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key620 UNIQUE (year);


--
-- Name: campaign campaign_year_key621; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key621 UNIQUE (year);


--
-- Name: campaign campaign_year_key622; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key622 UNIQUE (year);


--
-- Name: campaign campaign_year_key623; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key623 UNIQUE (year);


--
-- Name: campaign campaign_year_key624; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key624 UNIQUE (year);


--
-- Name: campaign campaign_year_key625; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key625 UNIQUE (year);


--
-- Name: campaign campaign_year_key626; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key626 UNIQUE (year);


--
-- Name: campaign campaign_year_key627; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key627 UNIQUE (year);


--
-- Name: campaign campaign_year_key628; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key628 UNIQUE (year);


--
-- Name: campaign campaign_year_key629; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key629 UNIQUE (year);


--
-- Name: campaign campaign_year_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key63 UNIQUE (year);


--
-- Name: campaign campaign_year_key630; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key630 UNIQUE (year);


--
-- Name: campaign campaign_year_key631; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key631 UNIQUE (year);


--
-- Name: campaign campaign_year_key632; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key632 UNIQUE (year);


--
-- Name: campaign campaign_year_key633; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key633 UNIQUE (year);


--
-- Name: campaign campaign_year_key634; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key634 UNIQUE (year);


--
-- Name: campaign campaign_year_key635; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key635 UNIQUE (year);


--
-- Name: campaign campaign_year_key636; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key636 UNIQUE (year);


--
-- Name: campaign campaign_year_key637; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key637 UNIQUE (year);


--
-- Name: campaign campaign_year_key638; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key638 UNIQUE (year);


--
-- Name: campaign campaign_year_key639; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key639 UNIQUE (year);


--
-- Name: campaign campaign_year_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key64 UNIQUE (year);


--
-- Name: campaign campaign_year_key640; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key640 UNIQUE (year);


--
-- Name: campaign campaign_year_key641; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key641 UNIQUE (year);


--
-- Name: campaign campaign_year_key642; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key642 UNIQUE (year);


--
-- Name: campaign campaign_year_key643; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key643 UNIQUE (year);


--
-- Name: campaign campaign_year_key644; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key644 UNIQUE (year);


--
-- Name: campaign campaign_year_key645; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key645 UNIQUE (year);


--
-- Name: campaign campaign_year_key646; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key646 UNIQUE (year);


--
-- Name: campaign campaign_year_key647; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key647 UNIQUE (year);


--
-- Name: campaign campaign_year_key648; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key648 UNIQUE (year);


--
-- Name: campaign campaign_year_key649; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key649 UNIQUE (year);


--
-- Name: campaign campaign_year_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key65 UNIQUE (year);


--
-- Name: campaign campaign_year_key650; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key650 UNIQUE (year);


--
-- Name: campaign campaign_year_key651; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key651 UNIQUE (year);


--
-- Name: campaign campaign_year_key652; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key652 UNIQUE (year);


--
-- Name: campaign campaign_year_key653; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key653 UNIQUE (year);


--
-- Name: campaign campaign_year_key654; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key654 UNIQUE (year);


--
-- Name: campaign campaign_year_key655; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key655 UNIQUE (year);


--
-- Name: campaign campaign_year_key656; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key656 UNIQUE (year);


--
-- Name: campaign campaign_year_key657; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key657 UNIQUE (year);


--
-- Name: campaign campaign_year_key658; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key658 UNIQUE (year);


--
-- Name: campaign campaign_year_key659; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key659 UNIQUE (year);


--
-- Name: campaign campaign_year_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key66 UNIQUE (year);


--
-- Name: campaign campaign_year_key660; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key660 UNIQUE (year);


--
-- Name: campaign campaign_year_key661; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key661 UNIQUE (year);


--
-- Name: campaign campaign_year_key662; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key662 UNIQUE (year);


--
-- Name: campaign campaign_year_key663; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key663 UNIQUE (year);


--
-- Name: campaign campaign_year_key664; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key664 UNIQUE (year);


--
-- Name: campaign campaign_year_key665; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key665 UNIQUE (year);


--
-- Name: campaign campaign_year_key666; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key666 UNIQUE (year);


--
-- Name: campaign campaign_year_key667; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key667 UNIQUE (year);


--
-- Name: campaign campaign_year_key668; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key668 UNIQUE (year);


--
-- Name: campaign campaign_year_key669; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key669 UNIQUE (year);


--
-- Name: campaign campaign_year_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key67 UNIQUE (year);


--
-- Name: campaign campaign_year_key670; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key670 UNIQUE (year);


--
-- Name: campaign campaign_year_key671; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key671 UNIQUE (year);


--
-- Name: campaign campaign_year_key672; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key672 UNIQUE (year);


--
-- Name: campaign campaign_year_key673; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key673 UNIQUE (year);


--
-- Name: campaign campaign_year_key674; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key674 UNIQUE (year);


--
-- Name: campaign campaign_year_key675; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key675 UNIQUE (year);


--
-- Name: campaign campaign_year_key676; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key676 UNIQUE (year);


--
-- Name: campaign campaign_year_key677; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key677 UNIQUE (year);


--
-- Name: campaign campaign_year_key678; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key678 UNIQUE (year);


--
-- Name: campaign campaign_year_key679; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key679 UNIQUE (year);


--
-- Name: campaign campaign_year_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key68 UNIQUE (year);


--
-- Name: campaign campaign_year_key680; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key680 UNIQUE (year);


--
-- Name: campaign campaign_year_key681; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key681 UNIQUE (year);


--
-- Name: campaign campaign_year_key682; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key682 UNIQUE (year);


--
-- Name: campaign campaign_year_key683; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key683 UNIQUE (year);


--
-- Name: campaign campaign_year_key684; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key684 UNIQUE (year);


--
-- Name: campaign campaign_year_key685; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key685 UNIQUE (year);


--
-- Name: campaign campaign_year_key686; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key686 UNIQUE (year);


--
-- Name: campaign campaign_year_key687; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key687 UNIQUE (year);


--
-- Name: campaign campaign_year_key688; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key688 UNIQUE (year);


--
-- Name: campaign campaign_year_key689; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key689 UNIQUE (year);


--
-- Name: campaign campaign_year_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key69 UNIQUE (year);


--
-- Name: campaign campaign_year_key690; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key690 UNIQUE (year);


--
-- Name: campaign campaign_year_key691; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key691 UNIQUE (year);


--
-- Name: campaign campaign_year_key692; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key692 UNIQUE (year);


--
-- Name: campaign campaign_year_key693; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key693 UNIQUE (year);


--
-- Name: campaign campaign_year_key694; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key694 UNIQUE (year);


--
-- Name: campaign campaign_year_key695; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key695 UNIQUE (year);


--
-- Name: campaign campaign_year_key696; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key696 UNIQUE (year);


--
-- Name: campaign campaign_year_key697; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key697 UNIQUE (year);


--
-- Name: campaign campaign_year_key698; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key698 UNIQUE (year);


--
-- Name: campaign campaign_year_key699; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key699 UNIQUE (year);


--
-- Name: campaign campaign_year_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key7 UNIQUE (year);


--
-- Name: campaign campaign_year_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key70 UNIQUE (year);


--
-- Name: campaign campaign_year_key700; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key700 UNIQUE (year);


--
-- Name: campaign campaign_year_key701; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key701 UNIQUE (year);


--
-- Name: campaign campaign_year_key702; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key702 UNIQUE (year);


--
-- Name: campaign campaign_year_key703; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key703 UNIQUE (year);


--
-- Name: campaign campaign_year_key704; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key704 UNIQUE (year);


--
-- Name: campaign campaign_year_key705; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key705 UNIQUE (year);


--
-- Name: campaign campaign_year_key706; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key706 UNIQUE (year);


--
-- Name: campaign campaign_year_key707; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key707 UNIQUE (year);


--
-- Name: campaign campaign_year_key708; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key708 UNIQUE (year);


--
-- Name: campaign campaign_year_key709; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key709 UNIQUE (year);


--
-- Name: campaign campaign_year_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key71 UNIQUE (year);


--
-- Name: campaign campaign_year_key710; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key710 UNIQUE (year);


--
-- Name: campaign campaign_year_key711; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key711 UNIQUE (year);


--
-- Name: campaign campaign_year_key712; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key712 UNIQUE (year);


--
-- Name: campaign campaign_year_key713; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key713 UNIQUE (year);


--
-- Name: campaign campaign_year_key714; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key714 UNIQUE (year);


--
-- Name: campaign campaign_year_key715; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key715 UNIQUE (year);


--
-- Name: campaign campaign_year_key716; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key716 UNIQUE (year);


--
-- Name: campaign campaign_year_key717; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key717 UNIQUE (year);


--
-- Name: campaign campaign_year_key718; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key718 UNIQUE (year);


--
-- Name: campaign campaign_year_key719; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key719 UNIQUE (year);


--
-- Name: campaign campaign_year_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key72 UNIQUE (year);


--
-- Name: campaign campaign_year_key720; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key720 UNIQUE (year);


--
-- Name: campaign campaign_year_key721; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key721 UNIQUE (year);


--
-- Name: campaign campaign_year_key722; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key722 UNIQUE (year);


--
-- Name: campaign campaign_year_key723; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key723 UNIQUE (year);


--
-- Name: campaign campaign_year_key724; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key724 UNIQUE (year);


--
-- Name: campaign campaign_year_key725; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key725 UNIQUE (year);


--
-- Name: campaign campaign_year_key726; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key726 UNIQUE (year);


--
-- Name: campaign campaign_year_key727; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key727 UNIQUE (year);


--
-- Name: campaign campaign_year_key728; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key728 UNIQUE (year);


--
-- Name: campaign campaign_year_key729; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key729 UNIQUE (year);


--
-- Name: campaign campaign_year_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key73 UNIQUE (year);


--
-- Name: campaign campaign_year_key730; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key730 UNIQUE (year);


--
-- Name: campaign campaign_year_key731; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key731 UNIQUE (year);


--
-- Name: campaign campaign_year_key732; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key732 UNIQUE (year);


--
-- Name: campaign campaign_year_key733; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key733 UNIQUE (year);


--
-- Name: campaign campaign_year_key734; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key734 UNIQUE (year);


--
-- Name: campaign campaign_year_key735; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key735 UNIQUE (year);


--
-- Name: campaign campaign_year_key736; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key736 UNIQUE (year);


--
-- Name: campaign campaign_year_key737; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key737 UNIQUE (year);


--
-- Name: campaign campaign_year_key738; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key738 UNIQUE (year);


--
-- Name: campaign campaign_year_key739; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key739 UNIQUE (year);


--
-- Name: campaign campaign_year_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key74 UNIQUE (year);


--
-- Name: campaign campaign_year_key740; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key740 UNIQUE (year);


--
-- Name: campaign campaign_year_key741; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key741 UNIQUE (year);


--
-- Name: campaign campaign_year_key742; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key742 UNIQUE (year);


--
-- Name: campaign campaign_year_key743; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key743 UNIQUE (year);


--
-- Name: campaign campaign_year_key744; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key744 UNIQUE (year);


--
-- Name: campaign campaign_year_key745; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key745 UNIQUE (year);


--
-- Name: campaign campaign_year_key746; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key746 UNIQUE (year);


--
-- Name: campaign campaign_year_key747; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key747 UNIQUE (year);


--
-- Name: campaign campaign_year_key748; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key748 UNIQUE (year);


--
-- Name: campaign campaign_year_key749; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key749 UNIQUE (year);


--
-- Name: campaign campaign_year_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key75 UNIQUE (year);


--
-- Name: campaign campaign_year_key750; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key750 UNIQUE (year);


--
-- Name: campaign campaign_year_key751; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key751 UNIQUE (year);


--
-- Name: campaign campaign_year_key752; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key752 UNIQUE (year);


--
-- Name: campaign campaign_year_key753; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key753 UNIQUE (year);


--
-- Name: campaign campaign_year_key754; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key754 UNIQUE (year);


--
-- Name: campaign campaign_year_key755; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key755 UNIQUE (year);


--
-- Name: campaign campaign_year_key756; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key756 UNIQUE (year);


--
-- Name: campaign campaign_year_key757; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key757 UNIQUE (year);


--
-- Name: campaign campaign_year_key758; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key758 UNIQUE (year);


--
-- Name: campaign campaign_year_key759; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key759 UNIQUE (year);


--
-- Name: campaign campaign_year_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key76 UNIQUE (year);


--
-- Name: campaign campaign_year_key760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key760 UNIQUE (year);


--
-- Name: campaign campaign_year_key761; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key761 UNIQUE (year);


--
-- Name: campaign campaign_year_key762; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key762 UNIQUE (year);


--
-- Name: campaign campaign_year_key763; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key763 UNIQUE (year);


--
-- Name: campaign campaign_year_key764; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key764 UNIQUE (year);


--
-- Name: campaign campaign_year_key765; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key765 UNIQUE (year);


--
-- Name: campaign campaign_year_key766; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key766 UNIQUE (year);


--
-- Name: campaign campaign_year_key767; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key767 UNIQUE (year);


--
-- Name: campaign campaign_year_key768; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key768 UNIQUE (year);


--
-- Name: campaign campaign_year_key769; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key769 UNIQUE (year);


--
-- Name: campaign campaign_year_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key77 UNIQUE (year);


--
-- Name: campaign campaign_year_key770; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key770 UNIQUE (year);


--
-- Name: campaign campaign_year_key771; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key771 UNIQUE (year);


--
-- Name: campaign campaign_year_key772; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key772 UNIQUE (year);


--
-- Name: campaign campaign_year_key773; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key773 UNIQUE (year);


--
-- Name: campaign campaign_year_key774; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key774 UNIQUE (year);


--
-- Name: campaign campaign_year_key775; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key775 UNIQUE (year);


--
-- Name: campaign campaign_year_key776; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key776 UNIQUE (year);


--
-- Name: campaign campaign_year_key777; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key777 UNIQUE (year);


--
-- Name: campaign campaign_year_key778; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key778 UNIQUE (year);


--
-- Name: campaign campaign_year_key779; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key779 UNIQUE (year);


--
-- Name: campaign campaign_year_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key78 UNIQUE (year);


--
-- Name: campaign campaign_year_key780; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key780 UNIQUE (year);


--
-- Name: campaign campaign_year_key781; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key781 UNIQUE (year);


--
-- Name: campaign campaign_year_key782; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key782 UNIQUE (year);


--
-- Name: campaign campaign_year_key783; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key783 UNIQUE (year);


--
-- Name: campaign campaign_year_key784; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key784 UNIQUE (year);


--
-- Name: campaign campaign_year_key785; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key785 UNIQUE (year);


--
-- Name: campaign campaign_year_key786; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key786 UNIQUE (year);


--
-- Name: campaign campaign_year_key787; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key787 UNIQUE (year);


--
-- Name: campaign campaign_year_key788; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key788 UNIQUE (year);


--
-- Name: campaign campaign_year_key789; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key789 UNIQUE (year);


--
-- Name: campaign campaign_year_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key79 UNIQUE (year);


--
-- Name: campaign campaign_year_key790; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key790 UNIQUE (year);


--
-- Name: campaign campaign_year_key791; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key791 UNIQUE (year);


--
-- Name: campaign campaign_year_key792; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key792 UNIQUE (year);


--
-- Name: campaign campaign_year_key793; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key793 UNIQUE (year);


--
-- Name: campaign campaign_year_key794; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key794 UNIQUE (year);


--
-- Name: campaign campaign_year_key795; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key795 UNIQUE (year);


--
-- Name: campaign campaign_year_key796; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key796 UNIQUE (year);


--
-- Name: campaign campaign_year_key797; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key797 UNIQUE (year);


--
-- Name: campaign campaign_year_key798; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key798 UNIQUE (year);


--
-- Name: campaign campaign_year_key799; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key799 UNIQUE (year);


--
-- Name: campaign campaign_year_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key8 UNIQUE (year);


--
-- Name: campaign campaign_year_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key80 UNIQUE (year);


--
-- Name: campaign campaign_year_key800; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key800 UNIQUE (year);


--
-- Name: campaign campaign_year_key801; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key801 UNIQUE (year);


--
-- Name: campaign campaign_year_key802; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key802 UNIQUE (year);


--
-- Name: campaign campaign_year_key803; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key803 UNIQUE (year);


--
-- Name: campaign campaign_year_key804; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key804 UNIQUE (year);


--
-- Name: campaign campaign_year_key805; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key805 UNIQUE (year);


--
-- Name: campaign campaign_year_key806; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key806 UNIQUE (year);


--
-- Name: campaign campaign_year_key807; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key807 UNIQUE (year);


--
-- Name: campaign campaign_year_key808; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key808 UNIQUE (year);


--
-- Name: campaign campaign_year_key809; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key809 UNIQUE (year);


--
-- Name: campaign campaign_year_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key81 UNIQUE (year);


--
-- Name: campaign campaign_year_key810; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key810 UNIQUE (year);


--
-- Name: campaign campaign_year_key811; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key811 UNIQUE (year);


--
-- Name: campaign campaign_year_key812; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key812 UNIQUE (year);


--
-- Name: campaign campaign_year_key813; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key813 UNIQUE (year);


--
-- Name: campaign campaign_year_key814; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key814 UNIQUE (year);


--
-- Name: campaign campaign_year_key815; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key815 UNIQUE (year);


--
-- Name: campaign campaign_year_key816; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key816 UNIQUE (year);


--
-- Name: campaign campaign_year_key817; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key817 UNIQUE (year);


--
-- Name: campaign campaign_year_key818; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key818 UNIQUE (year);


--
-- Name: campaign campaign_year_key819; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key819 UNIQUE (year);


--
-- Name: campaign campaign_year_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key82 UNIQUE (year);


--
-- Name: campaign campaign_year_key820; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key820 UNIQUE (year);


--
-- Name: campaign campaign_year_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key83 UNIQUE (year);


--
-- Name: campaign campaign_year_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key84 UNIQUE (year);


--
-- Name: campaign campaign_year_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key85 UNIQUE (year);


--
-- Name: campaign campaign_year_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key86 UNIQUE (year);


--
-- Name: campaign campaign_year_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key87 UNIQUE (year);


--
-- Name: campaign campaign_year_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key88 UNIQUE (year);


--
-- Name: campaign campaign_year_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key89 UNIQUE (year);


--
-- Name: campaign campaign_year_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key9 UNIQUE (year);


--
-- Name: campaign campaign_year_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key90 UNIQUE (year);


--
-- Name: campaign campaign_year_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key91 UNIQUE (year);


--
-- Name: campaign campaign_year_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key92 UNIQUE (year);


--
-- Name: campaign campaign_year_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key93 UNIQUE (year);


--
-- Name: campaign campaign_year_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key94 UNIQUE (year);


--
-- Name: campaign campaign_year_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key95 UNIQUE (year);


--
-- Name: campaign campaign_year_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key96 UNIQUE (year);


--
-- Name: campaign campaign_year_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key97 UNIQUE (year);


--
-- Name: campaign campaign_year_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key98 UNIQUE (year);


--
-- Name: campaign campaign_year_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_year_key99 UNIQUE (year);


--
-- Name: country country_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key UNIQUE (code);


--
-- Name: country country_code_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key1 UNIQUE (code);


--
-- Name: country country_code_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key10 UNIQUE (code);


--
-- Name: country country_code_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key100 UNIQUE (code);


--
-- Name: country country_code_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key101 UNIQUE (code);


--
-- Name: country country_code_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key102 UNIQUE (code);


--
-- Name: country country_code_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key103 UNIQUE (code);


--
-- Name: country country_code_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key104 UNIQUE (code);


--
-- Name: country country_code_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key105 UNIQUE (code);


--
-- Name: country country_code_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key106 UNIQUE (code);


--
-- Name: country country_code_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key107 UNIQUE (code);


--
-- Name: country country_code_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key108 UNIQUE (code);


--
-- Name: country country_code_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key109 UNIQUE (code);


--
-- Name: country country_code_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key11 UNIQUE (code);


--
-- Name: country country_code_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key110 UNIQUE (code);


--
-- Name: country country_code_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key111 UNIQUE (code);


--
-- Name: country country_code_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key112 UNIQUE (code);


--
-- Name: country country_code_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key113 UNIQUE (code);


--
-- Name: country country_code_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key114 UNIQUE (code);


--
-- Name: country country_code_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key115 UNIQUE (code);


--
-- Name: country country_code_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key116 UNIQUE (code);


--
-- Name: country country_code_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key117 UNIQUE (code);


--
-- Name: country country_code_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key118 UNIQUE (code);


--
-- Name: country country_code_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key119 UNIQUE (code);


--
-- Name: country country_code_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key12 UNIQUE (code);


--
-- Name: country country_code_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key120 UNIQUE (code);


--
-- Name: country country_code_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key121 UNIQUE (code);


--
-- Name: country country_code_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key122 UNIQUE (code);


--
-- Name: country country_code_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key123 UNIQUE (code);


--
-- Name: country country_code_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key124 UNIQUE (code);


--
-- Name: country country_code_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key125 UNIQUE (code);


--
-- Name: country country_code_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key126 UNIQUE (code);


--
-- Name: country country_code_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key127 UNIQUE (code);


--
-- Name: country country_code_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key128 UNIQUE (code);


--
-- Name: country country_code_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key129 UNIQUE (code);


--
-- Name: country country_code_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key13 UNIQUE (code);


--
-- Name: country country_code_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key130 UNIQUE (code);


--
-- Name: country country_code_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key131 UNIQUE (code);


--
-- Name: country country_code_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key132 UNIQUE (code);


--
-- Name: country country_code_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key133 UNIQUE (code);


--
-- Name: country country_code_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key134 UNIQUE (code);


--
-- Name: country country_code_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key135 UNIQUE (code);


--
-- Name: country country_code_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key136 UNIQUE (code);


--
-- Name: country country_code_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key137 UNIQUE (code);


--
-- Name: country country_code_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key138 UNIQUE (code);


--
-- Name: country country_code_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key139 UNIQUE (code);


--
-- Name: country country_code_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key14 UNIQUE (code);


--
-- Name: country country_code_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key140 UNIQUE (code);


--
-- Name: country country_code_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key141 UNIQUE (code);


--
-- Name: country country_code_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key142 UNIQUE (code);


--
-- Name: country country_code_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key143 UNIQUE (code);


--
-- Name: country country_code_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key144 UNIQUE (code);


--
-- Name: country country_code_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key145 UNIQUE (code);


--
-- Name: country country_code_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key146 UNIQUE (code);


--
-- Name: country country_code_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key147 UNIQUE (code);


--
-- Name: country country_code_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key148 UNIQUE (code);


--
-- Name: country country_code_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key149 UNIQUE (code);


--
-- Name: country country_code_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key15 UNIQUE (code);


--
-- Name: country country_code_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key150 UNIQUE (code);


--
-- Name: country country_code_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key151 UNIQUE (code);


--
-- Name: country country_code_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key152 UNIQUE (code);


--
-- Name: country country_code_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key153 UNIQUE (code);


--
-- Name: country country_code_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key154 UNIQUE (code);


--
-- Name: country country_code_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key155 UNIQUE (code);


--
-- Name: country country_code_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key156 UNIQUE (code);


--
-- Name: country country_code_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key157 UNIQUE (code);


--
-- Name: country country_code_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key158 UNIQUE (code);


--
-- Name: country country_code_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key159 UNIQUE (code);


--
-- Name: country country_code_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key16 UNIQUE (code);


--
-- Name: country country_code_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key160 UNIQUE (code);


--
-- Name: country country_code_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key161 UNIQUE (code);


--
-- Name: country country_code_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key162 UNIQUE (code);


--
-- Name: country country_code_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key163 UNIQUE (code);


--
-- Name: country country_code_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key164 UNIQUE (code);


--
-- Name: country country_code_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key165 UNIQUE (code);


--
-- Name: country country_code_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key166 UNIQUE (code);


--
-- Name: country country_code_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key167 UNIQUE (code);


--
-- Name: country country_code_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key168 UNIQUE (code);


--
-- Name: country country_code_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key169 UNIQUE (code);


--
-- Name: country country_code_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key17 UNIQUE (code);


--
-- Name: country country_code_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key170 UNIQUE (code);


--
-- Name: country country_code_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key171 UNIQUE (code);


--
-- Name: country country_code_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key172 UNIQUE (code);


--
-- Name: country country_code_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key173 UNIQUE (code);


--
-- Name: country country_code_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key174 UNIQUE (code);


--
-- Name: country country_code_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key175 UNIQUE (code);


--
-- Name: country country_code_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key176 UNIQUE (code);


--
-- Name: country country_code_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key177 UNIQUE (code);


--
-- Name: country country_code_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key178 UNIQUE (code);


--
-- Name: country country_code_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key179 UNIQUE (code);


--
-- Name: country country_code_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key18 UNIQUE (code);


--
-- Name: country country_code_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key180 UNIQUE (code);


--
-- Name: country country_code_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key181 UNIQUE (code);


--
-- Name: country country_code_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key182 UNIQUE (code);


--
-- Name: country country_code_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key183 UNIQUE (code);


--
-- Name: country country_code_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key184 UNIQUE (code);


--
-- Name: country country_code_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key185 UNIQUE (code);


--
-- Name: country country_code_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key186 UNIQUE (code);


--
-- Name: country country_code_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key187 UNIQUE (code);


--
-- Name: country country_code_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key188 UNIQUE (code);


--
-- Name: country country_code_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key189 UNIQUE (code);


--
-- Name: country country_code_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key19 UNIQUE (code);


--
-- Name: country country_code_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key190 UNIQUE (code);


--
-- Name: country country_code_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key191 UNIQUE (code);


--
-- Name: country country_code_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key192 UNIQUE (code);


--
-- Name: country country_code_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key193 UNIQUE (code);


--
-- Name: country country_code_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key194 UNIQUE (code);


--
-- Name: country country_code_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key195 UNIQUE (code);


--
-- Name: country country_code_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key196 UNIQUE (code);


--
-- Name: country country_code_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key197 UNIQUE (code);


--
-- Name: country country_code_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key198 UNIQUE (code);


--
-- Name: country country_code_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key199 UNIQUE (code);


--
-- Name: country country_code_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key2 UNIQUE (code);


--
-- Name: country country_code_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key20 UNIQUE (code);


--
-- Name: country country_code_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key200 UNIQUE (code);


--
-- Name: country country_code_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key201 UNIQUE (code);


--
-- Name: country country_code_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key202 UNIQUE (code);


--
-- Name: country country_code_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key203 UNIQUE (code);


--
-- Name: country country_code_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key204 UNIQUE (code);


--
-- Name: country country_code_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key205 UNIQUE (code);


--
-- Name: country country_code_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key206 UNIQUE (code);


--
-- Name: country country_code_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key207 UNIQUE (code);


--
-- Name: country country_code_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key208 UNIQUE (code);


--
-- Name: country country_code_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key209 UNIQUE (code);


--
-- Name: country country_code_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key21 UNIQUE (code);


--
-- Name: country country_code_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key210 UNIQUE (code);


--
-- Name: country country_code_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key211 UNIQUE (code);


--
-- Name: country country_code_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key212 UNIQUE (code);


--
-- Name: country country_code_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key213 UNIQUE (code);


--
-- Name: country country_code_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key214 UNIQUE (code);


--
-- Name: country country_code_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key215 UNIQUE (code);


--
-- Name: country country_code_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key216 UNIQUE (code);


--
-- Name: country country_code_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key217 UNIQUE (code);


--
-- Name: country country_code_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key218 UNIQUE (code);


--
-- Name: country country_code_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key219 UNIQUE (code);


--
-- Name: country country_code_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key22 UNIQUE (code);


--
-- Name: country country_code_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key220 UNIQUE (code);


--
-- Name: country country_code_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key221 UNIQUE (code);


--
-- Name: country country_code_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key222 UNIQUE (code);


--
-- Name: country country_code_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key223 UNIQUE (code);


--
-- Name: country country_code_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key224 UNIQUE (code);


--
-- Name: country country_code_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key225 UNIQUE (code);


--
-- Name: country country_code_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key226 UNIQUE (code);


--
-- Name: country country_code_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key227 UNIQUE (code);


--
-- Name: country country_code_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key228 UNIQUE (code);


--
-- Name: country country_code_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key229 UNIQUE (code);


--
-- Name: country country_code_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key23 UNIQUE (code);


--
-- Name: country country_code_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key230 UNIQUE (code);


--
-- Name: country country_code_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key231 UNIQUE (code);


--
-- Name: country country_code_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key232 UNIQUE (code);


--
-- Name: country country_code_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key233 UNIQUE (code);


--
-- Name: country country_code_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key234 UNIQUE (code);


--
-- Name: country country_code_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key235 UNIQUE (code);


--
-- Name: country country_code_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key236 UNIQUE (code);


--
-- Name: country country_code_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key237 UNIQUE (code);


--
-- Name: country country_code_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key238 UNIQUE (code);


--
-- Name: country country_code_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key239 UNIQUE (code);


--
-- Name: country country_code_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key24 UNIQUE (code);


--
-- Name: country country_code_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key240 UNIQUE (code);


--
-- Name: country country_code_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key241 UNIQUE (code);


--
-- Name: country country_code_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key242 UNIQUE (code);


--
-- Name: country country_code_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key243 UNIQUE (code);


--
-- Name: country country_code_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key244 UNIQUE (code);


--
-- Name: country country_code_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key245 UNIQUE (code);


--
-- Name: country country_code_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key246 UNIQUE (code);


--
-- Name: country country_code_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key247 UNIQUE (code);


--
-- Name: country country_code_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key248 UNIQUE (code);


--
-- Name: country country_code_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key249 UNIQUE (code);


--
-- Name: country country_code_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key25 UNIQUE (code);


--
-- Name: country country_code_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key250 UNIQUE (code);


--
-- Name: country country_code_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key251 UNIQUE (code);


--
-- Name: country country_code_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key252 UNIQUE (code);


--
-- Name: country country_code_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key253 UNIQUE (code);


--
-- Name: country country_code_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key254 UNIQUE (code);


--
-- Name: country country_code_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key255 UNIQUE (code);


--
-- Name: country country_code_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key256 UNIQUE (code);


--
-- Name: country country_code_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key257 UNIQUE (code);


--
-- Name: country country_code_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key258 UNIQUE (code);


--
-- Name: country country_code_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key259 UNIQUE (code);


--
-- Name: country country_code_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key26 UNIQUE (code);


--
-- Name: country country_code_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key260 UNIQUE (code);


--
-- Name: country country_code_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key261 UNIQUE (code);


--
-- Name: country country_code_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key262 UNIQUE (code);


--
-- Name: country country_code_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key263 UNIQUE (code);


--
-- Name: country country_code_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key264 UNIQUE (code);


--
-- Name: country country_code_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key265 UNIQUE (code);


--
-- Name: country country_code_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key266 UNIQUE (code);


--
-- Name: country country_code_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key267 UNIQUE (code);


--
-- Name: country country_code_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key268 UNIQUE (code);


--
-- Name: country country_code_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key269 UNIQUE (code);


--
-- Name: country country_code_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key27 UNIQUE (code);


--
-- Name: country country_code_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key270 UNIQUE (code);


--
-- Name: country country_code_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key271 UNIQUE (code);


--
-- Name: country country_code_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key272 UNIQUE (code);


--
-- Name: country country_code_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key273 UNIQUE (code);


--
-- Name: country country_code_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key274 UNIQUE (code);


--
-- Name: country country_code_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key275 UNIQUE (code);


--
-- Name: country country_code_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key276 UNIQUE (code);


--
-- Name: country country_code_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key277 UNIQUE (code);


--
-- Name: country country_code_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key278 UNIQUE (code);


--
-- Name: country country_code_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key279 UNIQUE (code);


--
-- Name: country country_code_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key28 UNIQUE (code);


--
-- Name: country country_code_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key280 UNIQUE (code);


--
-- Name: country country_code_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key281 UNIQUE (code);


--
-- Name: country country_code_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key282 UNIQUE (code);


--
-- Name: country country_code_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key283 UNIQUE (code);


--
-- Name: country country_code_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key284 UNIQUE (code);


--
-- Name: country country_code_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key285 UNIQUE (code);


--
-- Name: country country_code_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key286 UNIQUE (code);


--
-- Name: country country_code_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key287 UNIQUE (code);


--
-- Name: country country_code_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key288 UNIQUE (code);


--
-- Name: country country_code_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key289 UNIQUE (code);


--
-- Name: country country_code_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key29 UNIQUE (code);


--
-- Name: country country_code_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key290 UNIQUE (code);


--
-- Name: country country_code_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key291 UNIQUE (code);


--
-- Name: country country_code_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key292 UNIQUE (code);


--
-- Name: country country_code_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key293 UNIQUE (code);


--
-- Name: country country_code_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key294 UNIQUE (code);


--
-- Name: country country_code_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key295 UNIQUE (code);


--
-- Name: country country_code_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key296 UNIQUE (code);


--
-- Name: country country_code_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key297 UNIQUE (code);


--
-- Name: country country_code_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key298 UNIQUE (code);


--
-- Name: country country_code_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key299 UNIQUE (code);


--
-- Name: country country_code_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key3 UNIQUE (code);


--
-- Name: country country_code_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key30 UNIQUE (code);


--
-- Name: country country_code_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key300 UNIQUE (code);


--
-- Name: country country_code_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key301 UNIQUE (code);


--
-- Name: country country_code_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key302 UNIQUE (code);


--
-- Name: country country_code_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key303 UNIQUE (code);


--
-- Name: country country_code_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key304 UNIQUE (code);


--
-- Name: country country_code_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key305 UNIQUE (code);


--
-- Name: country country_code_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key306 UNIQUE (code);


--
-- Name: country country_code_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key307 UNIQUE (code);


--
-- Name: country country_code_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key308 UNIQUE (code);


--
-- Name: country country_code_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key309 UNIQUE (code);


--
-- Name: country country_code_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key31 UNIQUE (code);


--
-- Name: country country_code_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key310 UNIQUE (code);


--
-- Name: country country_code_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key311 UNIQUE (code);


--
-- Name: country country_code_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key312 UNIQUE (code);


--
-- Name: country country_code_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key313 UNIQUE (code);


--
-- Name: country country_code_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key314 UNIQUE (code);


--
-- Name: country country_code_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key315 UNIQUE (code);


--
-- Name: country country_code_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key316 UNIQUE (code);


--
-- Name: country country_code_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key317 UNIQUE (code);


--
-- Name: country country_code_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key318 UNIQUE (code);


--
-- Name: country country_code_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key319 UNIQUE (code);


--
-- Name: country country_code_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key32 UNIQUE (code);


--
-- Name: country country_code_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key320 UNIQUE (code);


--
-- Name: country country_code_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key321 UNIQUE (code);


--
-- Name: country country_code_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key322 UNIQUE (code);


--
-- Name: country country_code_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key323 UNIQUE (code);


--
-- Name: country country_code_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key324 UNIQUE (code);


--
-- Name: country country_code_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key325 UNIQUE (code);


--
-- Name: country country_code_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key326 UNIQUE (code);


--
-- Name: country country_code_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key327 UNIQUE (code);


--
-- Name: country country_code_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key328 UNIQUE (code);


--
-- Name: country country_code_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key329 UNIQUE (code);


--
-- Name: country country_code_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key33 UNIQUE (code);


--
-- Name: country country_code_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key330 UNIQUE (code);


--
-- Name: country country_code_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key331 UNIQUE (code);


--
-- Name: country country_code_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key332 UNIQUE (code);


--
-- Name: country country_code_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key333 UNIQUE (code);


--
-- Name: country country_code_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key334 UNIQUE (code);


--
-- Name: country country_code_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key335 UNIQUE (code);


--
-- Name: country country_code_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key336 UNIQUE (code);


--
-- Name: country country_code_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key337 UNIQUE (code);


--
-- Name: country country_code_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key338 UNIQUE (code);


--
-- Name: country country_code_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key339 UNIQUE (code);


--
-- Name: country country_code_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key34 UNIQUE (code);


--
-- Name: country country_code_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key340 UNIQUE (code);


--
-- Name: country country_code_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key341 UNIQUE (code);


--
-- Name: country country_code_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key342 UNIQUE (code);


--
-- Name: country country_code_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key343 UNIQUE (code);


--
-- Name: country country_code_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key344 UNIQUE (code);


--
-- Name: country country_code_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key345 UNIQUE (code);


--
-- Name: country country_code_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key346 UNIQUE (code);


--
-- Name: country country_code_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key347 UNIQUE (code);


--
-- Name: country country_code_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key348 UNIQUE (code);


--
-- Name: country country_code_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key349 UNIQUE (code);


--
-- Name: country country_code_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key35 UNIQUE (code);


--
-- Name: country country_code_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key350 UNIQUE (code);


--
-- Name: country country_code_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key351 UNIQUE (code);


--
-- Name: country country_code_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key352 UNIQUE (code);


--
-- Name: country country_code_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key353 UNIQUE (code);


--
-- Name: country country_code_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key354 UNIQUE (code);


--
-- Name: country country_code_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key355 UNIQUE (code);


--
-- Name: country country_code_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key356 UNIQUE (code);


--
-- Name: country country_code_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key357 UNIQUE (code);


--
-- Name: country country_code_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key358 UNIQUE (code);


--
-- Name: country country_code_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key359 UNIQUE (code);


--
-- Name: country country_code_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key36 UNIQUE (code);


--
-- Name: country country_code_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key360 UNIQUE (code);


--
-- Name: country country_code_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key361 UNIQUE (code);


--
-- Name: country country_code_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key362 UNIQUE (code);


--
-- Name: country country_code_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key363 UNIQUE (code);


--
-- Name: country country_code_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key364 UNIQUE (code);


--
-- Name: country country_code_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key365 UNIQUE (code);


--
-- Name: country country_code_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key366 UNIQUE (code);


--
-- Name: country country_code_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key367 UNIQUE (code);


--
-- Name: country country_code_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key368 UNIQUE (code);


--
-- Name: country country_code_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key369 UNIQUE (code);


--
-- Name: country country_code_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key37 UNIQUE (code);


--
-- Name: country country_code_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key370 UNIQUE (code);


--
-- Name: country country_code_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key371 UNIQUE (code);


--
-- Name: country country_code_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key372 UNIQUE (code);


--
-- Name: country country_code_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key373 UNIQUE (code);


--
-- Name: country country_code_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key374 UNIQUE (code);


--
-- Name: country country_code_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key375 UNIQUE (code);


--
-- Name: country country_code_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key376 UNIQUE (code);


--
-- Name: country country_code_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key377 UNIQUE (code);


--
-- Name: country country_code_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key378 UNIQUE (code);


--
-- Name: country country_code_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key379 UNIQUE (code);


--
-- Name: country country_code_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key38 UNIQUE (code);


--
-- Name: country country_code_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key380 UNIQUE (code);


--
-- Name: country country_code_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key381 UNIQUE (code);


--
-- Name: country country_code_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key382 UNIQUE (code);


--
-- Name: country country_code_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key383 UNIQUE (code);


--
-- Name: country country_code_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key384 UNIQUE (code);


--
-- Name: country country_code_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key385 UNIQUE (code);


--
-- Name: country country_code_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key386 UNIQUE (code);


--
-- Name: country country_code_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key387 UNIQUE (code);


--
-- Name: country country_code_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key388 UNIQUE (code);


--
-- Name: country country_code_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key389 UNIQUE (code);


--
-- Name: country country_code_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key39 UNIQUE (code);


--
-- Name: country country_code_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key390 UNIQUE (code);


--
-- Name: country country_code_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key391 UNIQUE (code);


--
-- Name: country country_code_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key392 UNIQUE (code);


--
-- Name: country country_code_key393; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key393 UNIQUE (code);


--
-- Name: country country_code_key394; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key394 UNIQUE (code);


--
-- Name: country country_code_key395; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key395 UNIQUE (code);


--
-- Name: country country_code_key396; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key396 UNIQUE (code);


--
-- Name: country country_code_key397; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key397 UNIQUE (code);


--
-- Name: country country_code_key398; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key398 UNIQUE (code);


--
-- Name: country country_code_key399; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key399 UNIQUE (code);


--
-- Name: country country_code_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key4 UNIQUE (code);


--
-- Name: country country_code_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key40 UNIQUE (code);


--
-- Name: country country_code_key400; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key400 UNIQUE (code);


--
-- Name: country country_code_key401; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key401 UNIQUE (code);


--
-- Name: country country_code_key402; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key402 UNIQUE (code);


--
-- Name: country country_code_key403; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key403 UNIQUE (code);


--
-- Name: country country_code_key404; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key404 UNIQUE (code);


--
-- Name: country country_code_key405; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key405 UNIQUE (code);


--
-- Name: country country_code_key406; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key406 UNIQUE (code);


--
-- Name: country country_code_key407; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key407 UNIQUE (code);


--
-- Name: country country_code_key408; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key408 UNIQUE (code);


--
-- Name: country country_code_key409; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key409 UNIQUE (code);


--
-- Name: country country_code_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key41 UNIQUE (code);


--
-- Name: country country_code_key410; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key410 UNIQUE (code);


--
-- Name: country country_code_key411; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key411 UNIQUE (code);


--
-- Name: country country_code_key412; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key412 UNIQUE (code);


--
-- Name: country country_code_key413; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key413 UNIQUE (code);


--
-- Name: country country_code_key414; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key414 UNIQUE (code);


--
-- Name: country country_code_key415; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key415 UNIQUE (code);


--
-- Name: country country_code_key416; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key416 UNIQUE (code);


--
-- Name: country country_code_key417; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key417 UNIQUE (code);


--
-- Name: country country_code_key418; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key418 UNIQUE (code);


--
-- Name: country country_code_key419; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key419 UNIQUE (code);


--
-- Name: country country_code_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key42 UNIQUE (code);


--
-- Name: country country_code_key420; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key420 UNIQUE (code);


--
-- Name: country country_code_key421; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key421 UNIQUE (code);


--
-- Name: country country_code_key422; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key422 UNIQUE (code);


--
-- Name: country country_code_key423; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key423 UNIQUE (code);


--
-- Name: country country_code_key424; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key424 UNIQUE (code);


--
-- Name: country country_code_key425; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key425 UNIQUE (code);


--
-- Name: country country_code_key426; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key426 UNIQUE (code);


--
-- Name: country country_code_key427; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key427 UNIQUE (code);


--
-- Name: country country_code_key428; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key428 UNIQUE (code);


--
-- Name: country country_code_key429; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key429 UNIQUE (code);


--
-- Name: country country_code_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key43 UNIQUE (code);


--
-- Name: country country_code_key430; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key430 UNIQUE (code);


--
-- Name: country country_code_key431; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key431 UNIQUE (code);


--
-- Name: country country_code_key432; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key432 UNIQUE (code);


--
-- Name: country country_code_key433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key433 UNIQUE (code);


--
-- Name: country country_code_key434; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key434 UNIQUE (code);


--
-- Name: country country_code_key435; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key435 UNIQUE (code);


--
-- Name: country country_code_key436; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key436 UNIQUE (code);


--
-- Name: country country_code_key437; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key437 UNIQUE (code);


--
-- Name: country country_code_key438; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key438 UNIQUE (code);


--
-- Name: country country_code_key439; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key439 UNIQUE (code);


--
-- Name: country country_code_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key44 UNIQUE (code);


--
-- Name: country country_code_key440; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key440 UNIQUE (code);


--
-- Name: country country_code_key441; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key441 UNIQUE (code);


--
-- Name: country country_code_key442; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key442 UNIQUE (code);


--
-- Name: country country_code_key443; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key443 UNIQUE (code);


--
-- Name: country country_code_key444; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key444 UNIQUE (code);


--
-- Name: country country_code_key445; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key445 UNIQUE (code);


--
-- Name: country country_code_key446; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key446 UNIQUE (code);


--
-- Name: country country_code_key447; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key447 UNIQUE (code);


--
-- Name: country country_code_key448; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key448 UNIQUE (code);


--
-- Name: country country_code_key449; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key449 UNIQUE (code);


--
-- Name: country country_code_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key45 UNIQUE (code);


--
-- Name: country country_code_key450; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key450 UNIQUE (code);


--
-- Name: country country_code_key451; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key451 UNIQUE (code);


--
-- Name: country country_code_key452; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key452 UNIQUE (code);


--
-- Name: country country_code_key453; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key453 UNIQUE (code);


--
-- Name: country country_code_key454; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key454 UNIQUE (code);


--
-- Name: country country_code_key455; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key455 UNIQUE (code);


--
-- Name: country country_code_key456; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key456 UNIQUE (code);


--
-- Name: country country_code_key457; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key457 UNIQUE (code);


--
-- Name: country country_code_key458; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key458 UNIQUE (code);


--
-- Name: country country_code_key459; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key459 UNIQUE (code);


--
-- Name: country country_code_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key46 UNIQUE (code);


--
-- Name: country country_code_key460; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key460 UNIQUE (code);


--
-- Name: country country_code_key461; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key461 UNIQUE (code);


--
-- Name: country country_code_key462; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key462 UNIQUE (code);


--
-- Name: country country_code_key463; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key463 UNIQUE (code);


--
-- Name: country country_code_key464; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key464 UNIQUE (code);


--
-- Name: country country_code_key465; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key465 UNIQUE (code);


--
-- Name: country country_code_key466; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key466 UNIQUE (code);


--
-- Name: country country_code_key467; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key467 UNIQUE (code);


--
-- Name: country country_code_key468; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key468 UNIQUE (code);


--
-- Name: country country_code_key469; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key469 UNIQUE (code);


--
-- Name: country country_code_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key47 UNIQUE (code);


--
-- Name: country country_code_key470; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key470 UNIQUE (code);


--
-- Name: country country_code_key471; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key471 UNIQUE (code);


--
-- Name: country country_code_key472; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key472 UNIQUE (code);


--
-- Name: country country_code_key473; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key473 UNIQUE (code);


--
-- Name: country country_code_key474; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key474 UNIQUE (code);


--
-- Name: country country_code_key475; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key475 UNIQUE (code);


--
-- Name: country country_code_key476; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key476 UNIQUE (code);


--
-- Name: country country_code_key477; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key477 UNIQUE (code);


--
-- Name: country country_code_key478; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key478 UNIQUE (code);


--
-- Name: country country_code_key479; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key479 UNIQUE (code);


--
-- Name: country country_code_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key48 UNIQUE (code);


--
-- Name: country country_code_key480; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key480 UNIQUE (code);


--
-- Name: country country_code_key481; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key481 UNIQUE (code);


--
-- Name: country country_code_key482; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key482 UNIQUE (code);


--
-- Name: country country_code_key483; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key483 UNIQUE (code);


--
-- Name: country country_code_key484; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key484 UNIQUE (code);


--
-- Name: country country_code_key485; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key485 UNIQUE (code);


--
-- Name: country country_code_key486; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key486 UNIQUE (code);


--
-- Name: country country_code_key487; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key487 UNIQUE (code);


--
-- Name: country country_code_key488; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key488 UNIQUE (code);


--
-- Name: country country_code_key489; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key489 UNIQUE (code);


--
-- Name: country country_code_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key49 UNIQUE (code);


--
-- Name: country country_code_key490; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key490 UNIQUE (code);


--
-- Name: country country_code_key491; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key491 UNIQUE (code);


--
-- Name: country country_code_key492; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key492 UNIQUE (code);


--
-- Name: country country_code_key493; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key493 UNIQUE (code);


--
-- Name: country country_code_key494; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key494 UNIQUE (code);


--
-- Name: country country_code_key495; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key495 UNIQUE (code);


--
-- Name: country country_code_key496; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key496 UNIQUE (code);


--
-- Name: country country_code_key497; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key497 UNIQUE (code);


--
-- Name: country country_code_key498; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key498 UNIQUE (code);


--
-- Name: country country_code_key499; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key499 UNIQUE (code);


--
-- Name: country country_code_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key5 UNIQUE (code);


--
-- Name: country country_code_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key50 UNIQUE (code);


--
-- Name: country country_code_key500; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key500 UNIQUE (code);


--
-- Name: country country_code_key501; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key501 UNIQUE (code);


--
-- Name: country country_code_key502; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key502 UNIQUE (code);


--
-- Name: country country_code_key503; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key503 UNIQUE (code);


--
-- Name: country country_code_key504; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key504 UNIQUE (code);


--
-- Name: country country_code_key505; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key505 UNIQUE (code);


--
-- Name: country country_code_key506; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key506 UNIQUE (code);


--
-- Name: country country_code_key507; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key507 UNIQUE (code);


--
-- Name: country country_code_key508; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key508 UNIQUE (code);


--
-- Name: country country_code_key509; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key509 UNIQUE (code);


--
-- Name: country country_code_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key51 UNIQUE (code);


--
-- Name: country country_code_key510; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key510 UNIQUE (code);


--
-- Name: country country_code_key511; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key511 UNIQUE (code);


--
-- Name: country country_code_key512; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key512 UNIQUE (code);


--
-- Name: country country_code_key513; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key513 UNIQUE (code);


--
-- Name: country country_code_key514; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key514 UNIQUE (code);


--
-- Name: country country_code_key515; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key515 UNIQUE (code);


--
-- Name: country country_code_key516; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key516 UNIQUE (code);


--
-- Name: country country_code_key517; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key517 UNIQUE (code);


--
-- Name: country country_code_key518; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key518 UNIQUE (code);


--
-- Name: country country_code_key519; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key519 UNIQUE (code);


--
-- Name: country country_code_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key52 UNIQUE (code);


--
-- Name: country country_code_key520; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key520 UNIQUE (code);


--
-- Name: country country_code_key521; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key521 UNIQUE (code);


--
-- Name: country country_code_key522; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key522 UNIQUE (code);


--
-- Name: country country_code_key523; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key523 UNIQUE (code);


--
-- Name: country country_code_key524; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key524 UNIQUE (code);


--
-- Name: country country_code_key525; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key525 UNIQUE (code);


--
-- Name: country country_code_key526; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key526 UNIQUE (code);


--
-- Name: country country_code_key527; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key527 UNIQUE (code);


--
-- Name: country country_code_key528; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key528 UNIQUE (code);


--
-- Name: country country_code_key529; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key529 UNIQUE (code);


--
-- Name: country country_code_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key53 UNIQUE (code);


--
-- Name: country country_code_key530; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key530 UNIQUE (code);


--
-- Name: country country_code_key531; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key531 UNIQUE (code);


--
-- Name: country country_code_key532; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key532 UNIQUE (code);


--
-- Name: country country_code_key533; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key533 UNIQUE (code);


--
-- Name: country country_code_key534; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key534 UNIQUE (code);


--
-- Name: country country_code_key535; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key535 UNIQUE (code);


--
-- Name: country country_code_key536; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key536 UNIQUE (code);


--
-- Name: country country_code_key537; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key537 UNIQUE (code);


--
-- Name: country country_code_key538; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key538 UNIQUE (code);


--
-- Name: country country_code_key539; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key539 UNIQUE (code);


--
-- Name: country country_code_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key54 UNIQUE (code);


--
-- Name: country country_code_key540; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key540 UNIQUE (code);


--
-- Name: country country_code_key541; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key541 UNIQUE (code);


--
-- Name: country country_code_key542; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key542 UNIQUE (code);


--
-- Name: country country_code_key543; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key543 UNIQUE (code);


--
-- Name: country country_code_key544; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key544 UNIQUE (code);


--
-- Name: country country_code_key545; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key545 UNIQUE (code);


--
-- Name: country country_code_key546; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key546 UNIQUE (code);


--
-- Name: country country_code_key547; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key547 UNIQUE (code);


--
-- Name: country country_code_key548; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key548 UNIQUE (code);


--
-- Name: country country_code_key549; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key549 UNIQUE (code);


--
-- Name: country country_code_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key55 UNIQUE (code);


--
-- Name: country country_code_key550; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key550 UNIQUE (code);


--
-- Name: country country_code_key551; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key551 UNIQUE (code);


--
-- Name: country country_code_key552; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key552 UNIQUE (code);


--
-- Name: country country_code_key553; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key553 UNIQUE (code);


--
-- Name: country country_code_key554; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key554 UNIQUE (code);


--
-- Name: country country_code_key555; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key555 UNIQUE (code);


--
-- Name: country country_code_key556; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key556 UNIQUE (code);


--
-- Name: country country_code_key557; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key557 UNIQUE (code);


--
-- Name: country country_code_key558; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key558 UNIQUE (code);


--
-- Name: country country_code_key559; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key559 UNIQUE (code);


--
-- Name: country country_code_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key56 UNIQUE (code);


--
-- Name: country country_code_key560; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key560 UNIQUE (code);


--
-- Name: country country_code_key561; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key561 UNIQUE (code);


--
-- Name: country country_code_key562; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key562 UNIQUE (code);


--
-- Name: country country_code_key563; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key563 UNIQUE (code);


--
-- Name: country country_code_key564; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key564 UNIQUE (code);


--
-- Name: country country_code_key565; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key565 UNIQUE (code);


--
-- Name: country country_code_key566; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key566 UNIQUE (code);


--
-- Name: country country_code_key567; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key567 UNIQUE (code);


--
-- Name: country country_code_key568; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key568 UNIQUE (code);


--
-- Name: country country_code_key569; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key569 UNIQUE (code);


--
-- Name: country country_code_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key57 UNIQUE (code);


--
-- Name: country country_code_key570; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key570 UNIQUE (code);


--
-- Name: country country_code_key571; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key571 UNIQUE (code);


--
-- Name: country country_code_key572; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key572 UNIQUE (code);


--
-- Name: country country_code_key573; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key573 UNIQUE (code);


--
-- Name: country country_code_key574; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key574 UNIQUE (code);


--
-- Name: country country_code_key575; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key575 UNIQUE (code);


--
-- Name: country country_code_key576; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key576 UNIQUE (code);


--
-- Name: country country_code_key577; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key577 UNIQUE (code);


--
-- Name: country country_code_key578; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key578 UNIQUE (code);


--
-- Name: country country_code_key579; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key579 UNIQUE (code);


--
-- Name: country country_code_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key58 UNIQUE (code);


--
-- Name: country country_code_key580; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key580 UNIQUE (code);


--
-- Name: country country_code_key581; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key581 UNIQUE (code);


--
-- Name: country country_code_key582; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key582 UNIQUE (code);


--
-- Name: country country_code_key583; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key583 UNIQUE (code);


--
-- Name: country country_code_key584; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key584 UNIQUE (code);


--
-- Name: country country_code_key585; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key585 UNIQUE (code);


--
-- Name: country country_code_key586; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key586 UNIQUE (code);


--
-- Name: country country_code_key587; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key587 UNIQUE (code);


--
-- Name: country country_code_key588; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key588 UNIQUE (code);


--
-- Name: country country_code_key589; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key589 UNIQUE (code);


--
-- Name: country country_code_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key59 UNIQUE (code);


--
-- Name: country country_code_key590; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key590 UNIQUE (code);


--
-- Name: country country_code_key591; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key591 UNIQUE (code);


--
-- Name: country country_code_key592; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key592 UNIQUE (code);


--
-- Name: country country_code_key593; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key593 UNIQUE (code);


--
-- Name: country country_code_key594; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key594 UNIQUE (code);


--
-- Name: country country_code_key595; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key595 UNIQUE (code);


--
-- Name: country country_code_key596; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key596 UNIQUE (code);


--
-- Name: country country_code_key597; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key597 UNIQUE (code);


--
-- Name: country country_code_key598; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key598 UNIQUE (code);


--
-- Name: country country_code_key599; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key599 UNIQUE (code);


--
-- Name: country country_code_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key6 UNIQUE (code);


--
-- Name: country country_code_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key60 UNIQUE (code);


--
-- Name: country country_code_key600; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key600 UNIQUE (code);


--
-- Name: country country_code_key601; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key601 UNIQUE (code);


--
-- Name: country country_code_key602; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key602 UNIQUE (code);


--
-- Name: country country_code_key603; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key603 UNIQUE (code);


--
-- Name: country country_code_key604; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key604 UNIQUE (code);


--
-- Name: country country_code_key605; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key605 UNIQUE (code);


--
-- Name: country country_code_key606; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key606 UNIQUE (code);


--
-- Name: country country_code_key607; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key607 UNIQUE (code);


--
-- Name: country country_code_key608; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key608 UNIQUE (code);


--
-- Name: country country_code_key609; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key609 UNIQUE (code);


--
-- Name: country country_code_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key61 UNIQUE (code);


--
-- Name: country country_code_key610; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key610 UNIQUE (code);


--
-- Name: country country_code_key611; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key611 UNIQUE (code);


--
-- Name: country country_code_key612; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key612 UNIQUE (code);


--
-- Name: country country_code_key613; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key613 UNIQUE (code);


--
-- Name: country country_code_key614; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key614 UNIQUE (code);


--
-- Name: country country_code_key615; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key615 UNIQUE (code);


--
-- Name: country country_code_key616; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key616 UNIQUE (code);


--
-- Name: country country_code_key617; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key617 UNIQUE (code);


--
-- Name: country country_code_key618; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key618 UNIQUE (code);


--
-- Name: country country_code_key619; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key619 UNIQUE (code);


--
-- Name: country country_code_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key62 UNIQUE (code);


--
-- Name: country country_code_key620; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key620 UNIQUE (code);


--
-- Name: country country_code_key621; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key621 UNIQUE (code);


--
-- Name: country country_code_key622; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key622 UNIQUE (code);


--
-- Name: country country_code_key623; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key623 UNIQUE (code);


--
-- Name: country country_code_key624; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key624 UNIQUE (code);


--
-- Name: country country_code_key625; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key625 UNIQUE (code);


--
-- Name: country country_code_key626; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key626 UNIQUE (code);


--
-- Name: country country_code_key627; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key627 UNIQUE (code);


--
-- Name: country country_code_key628; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key628 UNIQUE (code);


--
-- Name: country country_code_key629; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key629 UNIQUE (code);


--
-- Name: country country_code_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key63 UNIQUE (code);


--
-- Name: country country_code_key630; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key630 UNIQUE (code);


--
-- Name: country country_code_key631; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key631 UNIQUE (code);


--
-- Name: country country_code_key632; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key632 UNIQUE (code);


--
-- Name: country country_code_key633; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key633 UNIQUE (code);


--
-- Name: country country_code_key634; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key634 UNIQUE (code);


--
-- Name: country country_code_key635; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key635 UNIQUE (code);


--
-- Name: country country_code_key636; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key636 UNIQUE (code);


--
-- Name: country country_code_key637; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key637 UNIQUE (code);


--
-- Name: country country_code_key638; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key638 UNIQUE (code);


--
-- Name: country country_code_key639; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key639 UNIQUE (code);


--
-- Name: country country_code_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key64 UNIQUE (code);


--
-- Name: country country_code_key640; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key640 UNIQUE (code);


--
-- Name: country country_code_key641; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key641 UNIQUE (code);


--
-- Name: country country_code_key642; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key642 UNIQUE (code);


--
-- Name: country country_code_key643; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key643 UNIQUE (code);


--
-- Name: country country_code_key644; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key644 UNIQUE (code);


--
-- Name: country country_code_key645; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key645 UNIQUE (code);


--
-- Name: country country_code_key646; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key646 UNIQUE (code);


--
-- Name: country country_code_key647; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key647 UNIQUE (code);


--
-- Name: country country_code_key648; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key648 UNIQUE (code);


--
-- Name: country country_code_key649; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key649 UNIQUE (code);


--
-- Name: country country_code_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key65 UNIQUE (code);


--
-- Name: country country_code_key650; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key650 UNIQUE (code);


--
-- Name: country country_code_key651; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key651 UNIQUE (code);


--
-- Name: country country_code_key652; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key652 UNIQUE (code);


--
-- Name: country country_code_key653; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key653 UNIQUE (code);


--
-- Name: country country_code_key654; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key654 UNIQUE (code);


--
-- Name: country country_code_key655; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key655 UNIQUE (code);


--
-- Name: country country_code_key656; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key656 UNIQUE (code);


--
-- Name: country country_code_key657; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key657 UNIQUE (code);


--
-- Name: country country_code_key658; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key658 UNIQUE (code);


--
-- Name: country country_code_key659; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key659 UNIQUE (code);


--
-- Name: country country_code_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key66 UNIQUE (code);


--
-- Name: country country_code_key660; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key660 UNIQUE (code);


--
-- Name: country country_code_key661; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key661 UNIQUE (code);


--
-- Name: country country_code_key662; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key662 UNIQUE (code);


--
-- Name: country country_code_key663; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key663 UNIQUE (code);


--
-- Name: country country_code_key664; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key664 UNIQUE (code);


--
-- Name: country country_code_key665; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key665 UNIQUE (code);


--
-- Name: country country_code_key666; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key666 UNIQUE (code);


--
-- Name: country country_code_key667; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key667 UNIQUE (code);


--
-- Name: country country_code_key668; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key668 UNIQUE (code);


--
-- Name: country country_code_key669; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key669 UNIQUE (code);


--
-- Name: country country_code_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key67 UNIQUE (code);


--
-- Name: country country_code_key670; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key670 UNIQUE (code);


--
-- Name: country country_code_key671; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key671 UNIQUE (code);


--
-- Name: country country_code_key672; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key672 UNIQUE (code);


--
-- Name: country country_code_key673; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key673 UNIQUE (code);


--
-- Name: country country_code_key674; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key674 UNIQUE (code);


--
-- Name: country country_code_key675; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key675 UNIQUE (code);


--
-- Name: country country_code_key676; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key676 UNIQUE (code);


--
-- Name: country country_code_key677; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key677 UNIQUE (code);


--
-- Name: country country_code_key678; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key678 UNIQUE (code);


--
-- Name: country country_code_key679; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key679 UNIQUE (code);


--
-- Name: country country_code_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key68 UNIQUE (code);


--
-- Name: country country_code_key680; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key680 UNIQUE (code);


--
-- Name: country country_code_key681; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key681 UNIQUE (code);


--
-- Name: country country_code_key682; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key682 UNIQUE (code);


--
-- Name: country country_code_key683; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key683 UNIQUE (code);


--
-- Name: country country_code_key684; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key684 UNIQUE (code);


--
-- Name: country country_code_key685; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key685 UNIQUE (code);


--
-- Name: country country_code_key686; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key686 UNIQUE (code);


--
-- Name: country country_code_key687; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key687 UNIQUE (code);


--
-- Name: country country_code_key688; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key688 UNIQUE (code);


--
-- Name: country country_code_key689; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key689 UNIQUE (code);


--
-- Name: country country_code_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key69 UNIQUE (code);


--
-- Name: country country_code_key690; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key690 UNIQUE (code);


--
-- Name: country country_code_key691; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key691 UNIQUE (code);


--
-- Name: country country_code_key692; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key692 UNIQUE (code);


--
-- Name: country country_code_key693; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key693 UNIQUE (code);


--
-- Name: country country_code_key694; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key694 UNIQUE (code);


--
-- Name: country country_code_key695; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key695 UNIQUE (code);


--
-- Name: country country_code_key696; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key696 UNIQUE (code);


--
-- Name: country country_code_key697; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key697 UNIQUE (code);


--
-- Name: country country_code_key698; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key698 UNIQUE (code);


--
-- Name: country country_code_key699; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key699 UNIQUE (code);


--
-- Name: country country_code_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key7 UNIQUE (code);


--
-- Name: country country_code_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key70 UNIQUE (code);


--
-- Name: country country_code_key700; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key700 UNIQUE (code);


--
-- Name: country country_code_key701; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key701 UNIQUE (code);


--
-- Name: country country_code_key702; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key702 UNIQUE (code);


--
-- Name: country country_code_key703; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key703 UNIQUE (code);


--
-- Name: country country_code_key704; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key704 UNIQUE (code);


--
-- Name: country country_code_key705; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key705 UNIQUE (code);


--
-- Name: country country_code_key706; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key706 UNIQUE (code);


--
-- Name: country country_code_key707; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key707 UNIQUE (code);


--
-- Name: country country_code_key708; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key708 UNIQUE (code);


--
-- Name: country country_code_key709; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key709 UNIQUE (code);


--
-- Name: country country_code_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key71 UNIQUE (code);


--
-- Name: country country_code_key710; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key710 UNIQUE (code);


--
-- Name: country country_code_key711; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key711 UNIQUE (code);


--
-- Name: country country_code_key712; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key712 UNIQUE (code);


--
-- Name: country country_code_key713; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key713 UNIQUE (code);


--
-- Name: country country_code_key714; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key714 UNIQUE (code);


--
-- Name: country country_code_key715; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key715 UNIQUE (code);


--
-- Name: country country_code_key716; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key716 UNIQUE (code);


--
-- Name: country country_code_key717; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key717 UNIQUE (code);


--
-- Name: country country_code_key718; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key718 UNIQUE (code);


--
-- Name: country country_code_key719; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key719 UNIQUE (code);


--
-- Name: country country_code_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key72 UNIQUE (code);


--
-- Name: country country_code_key720; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key720 UNIQUE (code);


--
-- Name: country country_code_key721; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key721 UNIQUE (code);


--
-- Name: country country_code_key722; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key722 UNIQUE (code);


--
-- Name: country country_code_key723; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key723 UNIQUE (code);


--
-- Name: country country_code_key724; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key724 UNIQUE (code);


--
-- Name: country country_code_key725; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key725 UNIQUE (code);


--
-- Name: country country_code_key726; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key726 UNIQUE (code);


--
-- Name: country country_code_key727; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key727 UNIQUE (code);


--
-- Name: country country_code_key728; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key728 UNIQUE (code);


--
-- Name: country country_code_key729; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key729 UNIQUE (code);


--
-- Name: country country_code_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key73 UNIQUE (code);


--
-- Name: country country_code_key730; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key730 UNIQUE (code);


--
-- Name: country country_code_key731; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key731 UNIQUE (code);


--
-- Name: country country_code_key732; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key732 UNIQUE (code);


--
-- Name: country country_code_key733; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key733 UNIQUE (code);


--
-- Name: country country_code_key734; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key734 UNIQUE (code);


--
-- Name: country country_code_key735; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key735 UNIQUE (code);


--
-- Name: country country_code_key736; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key736 UNIQUE (code);


--
-- Name: country country_code_key737; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key737 UNIQUE (code);


--
-- Name: country country_code_key738; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key738 UNIQUE (code);


--
-- Name: country country_code_key739; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key739 UNIQUE (code);


--
-- Name: country country_code_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key74 UNIQUE (code);


--
-- Name: country country_code_key740; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key740 UNIQUE (code);


--
-- Name: country country_code_key741; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key741 UNIQUE (code);


--
-- Name: country country_code_key742; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key742 UNIQUE (code);


--
-- Name: country country_code_key743; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key743 UNIQUE (code);


--
-- Name: country country_code_key744; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key744 UNIQUE (code);


--
-- Name: country country_code_key745; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key745 UNIQUE (code);


--
-- Name: country country_code_key746; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key746 UNIQUE (code);


--
-- Name: country country_code_key747; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key747 UNIQUE (code);


--
-- Name: country country_code_key748; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key748 UNIQUE (code);


--
-- Name: country country_code_key749; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key749 UNIQUE (code);


--
-- Name: country country_code_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key75 UNIQUE (code);


--
-- Name: country country_code_key750; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key750 UNIQUE (code);


--
-- Name: country country_code_key751; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key751 UNIQUE (code);


--
-- Name: country country_code_key752; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key752 UNIQUE (code);


--
-- Name: country country_code_key753; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key753 UNIQUE (code);


--
-- Name: country country_code_key754; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key754 UNIQUE (code);


--
-- Name: country country_code_key755; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key755 UNIQUE (code);


--
-- Name: country country_code_key756; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key756 UNIQUE (code);


--
-- Name: country country_code_key757; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key757 UNIQUE (code);


--
-- Name: country country_code_key758; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key758 UNIQUE (code);


--
-- Name: country country_code_key759; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key759 UNIQUE (code);


--
-- Name: country country_code_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key76 UNIQUE (code);


--
-- Name: country country_code_key760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key760 UNIQUE (code);


--
-- Name: country country_code_key761; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key761 UNIQUE (code);


--
-- Name: country country_code_key762; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key762 UNIQUE (code);


--
-- Name: country country_code_key763; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key763 UNIQUE (code);


--
-- Name: country country_code_key764; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key764 UNIQUE (code);


--
-- Name: country country_code_key765; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key765 UNIQUE (code);


--
-- Name: country country_code_key766; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key766 UNIQUE (code);


--
-- Name: country country_code_key767; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key767 UNIQUE (code);


--
-- Name: country country_code_key768; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key768 UNIQUE (code);


--
-- Name: country country_code_key769; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key769 UNIQUE (code);


--
-- Name: country country_code_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key77 UNIQUE (code);


--
-- Name: country country_code_key770; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key770 UNIQUE (code);


--
-- Name: country country_code_key771; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key771 UNIQUE (code);


--
-- Name: country country_code_key772; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key772 UNIQUE (code);


--
-- Name: country country_code_key773; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key773 UNIQUE (code);


--
-- Name: country country_code_key774; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key774 UNIQUE (code);


--
-- Name: country country_code_key775; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key775 UNIQUE (code);


--
-- Name: country country_code_key776; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key776 UNIQUE (code);


--
-- Name: country country_code_key777; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key777 UNIQUE (code);


--
-- Name: country country_code_key778; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key778 UNIQUE (code);


--
-- Name: country country_code_key779; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key779 UNIQUE (code);


--
-- Name: country country_code_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key78 UNIQUE (code);


--
-- Name: country country_code_key780; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key780 UNIQUE (code);


--
-- Name: country country_code_key781; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key781 UNIQUE (code);


--
-- Name: country country_code_key782; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key782 UNIQUE (code);


--
-- Name: country country_code_key783; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key783 UNIQUE (code);


--
-- Name: country country_code_key784; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key784 UNIQUE (code);


--
-- Name: country country_code_key785; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key785 UNIQUE (code);


--
-- Name: country country_code_key786; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key786 UNIQUE (code);


--
-- Name: country country_code_key787; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key787 UNIQUE (code);


--
-- Name: country country_code_key788; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key788 UNIQUE (code);


--
-- Name: country country_code_key789; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key789 UNIQUE (code);


--
-- Name: country country_code_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key79 UNIQUE (code);


--
-- Name: country country_code_key790; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key790 UNIQUE (code);


--
-- Name: country country_code_key791; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key791 UNIQUE (code);


--
-- Name: country country_code_key792; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key792 UNIQUE (code);


--
-- Name: country country_code_key793; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key793 UNIQUE (code);


--
-- Name: country country_code_key794; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key794 UNIQUE (code);


--
-- Name: country country_code_key795; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key795 UNIQUE (code);


--
-- Name: country country_code_key796; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key796 UNIQUE (code);


--
-- Name: country country_code_key797; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key797 UNIQUE (code);


--
-- Name: country country_code_key798; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key798 UNIQUE (code);


--
-- Name: country country_code_key799; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key799 UNIQUE (code);


--
-- Name: country country_code_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key8 UNIQUE (code);


--
-- Name: country country_code_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key80 UNIQUE (code);


--
-- Name: country country_code_key800; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key800 UNIQUE (code);


--
-- Name: country country_code_key801; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key801 UNIQUE (code);


--
-- Name: country country_code_key802; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key802 UNIQUE (code);


--
-- Name: country country_code_key803; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key803 UNIQUE (code);


--
-- Name: country country_code_key804; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key804 UNIQUE (code);


--
-- Name: country country_code_key805; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key805 UNIQUE (code);


--
-- Name: country country_code_key806; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key806 UNIQUE (code);


--
-- Name: country country_code_key807; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key807 UNIQUE (code);


--
-- Name: country country_code_key808; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key808 UNIQUE (code);


--
-- Name: country country_code_key809; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key809 UNIQUE (code);


--
-- Name: country country_code_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key81 UNIQUE (code);


--
-- Name: country country_code_key810; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key810 UNIQUE (code);


--
-- Name: country country_code_key811; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key811 UNIQUE (code);


--
-- Name: country country_code_key812; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key812 UNIQUE (code);


--
-- Name: country country_code_key813; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key813 UNIQUE (code);


--
-- Name: country country_code_key814; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key814 UNIQUE (code);


--
-- Name: country country_code_key815; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key815 UNIQUE (code);


--
-- Name: country country_code_key816; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key816 UNIQUE (code);


--
-- Name: country country_code_key817; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key817 UNIQUE (code);


--
-- Name: country country_code_key818; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key818 UNIQUE (code);


--
-- Name: country country_code_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key82 UNIQUE (code);


--
-- Name: country country_code_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key83 UNIQUE (code);


--
-- Name: country country_code_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key84 UNIQUE (code);


--
-- Name: country country_code_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key85 UNIQUE (code);


--
-- Name: country country_code_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key86 UNIQUE (code);


--
-- Name: country country_code_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key87 UNIQUE (code);


--
-- Name: country country_code_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key88 UNIQUE (code);


--
-- Name: country country_code_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key89 UNIQUE (code);


--
-- Name: country country_code_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key9 UNIQUE (code);


--
-- Name: country country_code_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key90 UNIQUE (code);


--
-- Name: country country_code_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key91 UNIQUE (code);


--
-- Name: country country_code_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key92 UNIQUE (code);


--
-- Name: country country_code_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key93 UNIQUE (code);


--
-- Name: country country_code_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key94 UNIQUE (code);


--
-- Name: country country_code_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key95 UNIQUE (code);


--
-- Name: country country_code_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key96 UNIQUE (code);


--
-- Name: country country_code_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key97 UNIQUE (code);


--
-- Name: country country_code_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key98 UNIQUE (code);


--
-- Name: country country_code_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_code_key99 UNIQUE (code);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: intensity intensity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intensity
    ADD CONSTRAINT intensity_pkey PRIMARY KEY (id);


--
-- Name: orga orga_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key UNIQUE (number);


--
-- Name: orga orga_number_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key1 UNIQUE (number);


--
-- Name: orga orga_number_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key10 UNIQUE (number);


--
-- Name: orga orga_number_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key100 UNIQUE (number);


--
-- Name: orga orga_number_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key101 UNIQUE (number);


--
-- Name: orga orga_number_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key102 UNIQUE (number);


--
-- Name: orga orga_number_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key103 UNIQUE (number);


--
-- Name: orga orga_number_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key104 UNIQUE (number);


--
-- Name: orga orga_number_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key105 UNIQUE (number);


--
-- Name: orga orga_number_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key106 UNIQUE (number);


--
-- Name: orga orga_number_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key107 UNIQUE (number);


--
-- Name: orga orga_number_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key108 UNIQUE (number);


--
-- Name: orga orga_number_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key109 UNIQUE (number);


--
-- Name: orga orga_number_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key11 UNIQUE (number);


--
-- Name: orga orga_number_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key110 UNIQUE (number);


--
-- Name: orga orga_number_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key111 UNIQUE (number);


--
-- Name: orga orga_number_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key112 UNIQUE (number);


--
-- Name: orga orga_number_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key113 UNIQUE (number);


--
-- Name: orga orga_number_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key114 UNIQUE (number);


--
-- Name: orga orga_number_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key115 UNIQUE (number);


--
-- Name: orga orga_number_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key116 UNIQUE (number);


--
-- Name: orga orga_number_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key117 UNIQUE (number);


--
-- Name: orga orga_number_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key118 UNIQUE (number);


--
-- Name: orga orga_number_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key119 UNIQUE (number);


--
-- Name: orga orga_number_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key12 UNIQUE (number);


--
-- Name: orga orga_number_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key120 UNIQUE (number);


--
-- Name: orga orga_number_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key121 UNIQUE (number);


--
-- Name: orga orga_number_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key122 UNIQUE (number);


--
-- Name: orga orga_number_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key123 UNIQUE (number);


--
-- Name: orga orga_number_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key124 UNIQUE (number);


--
-- Name: orga orga_number_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key125 UNIQUE (number);


--
-- Name: orga orga_number_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key126 UNIQUE (number);


--
-- Name: orga orga_number_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key127 UNIQUE (number);


--
-- Name: orga orga_number_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key128 UNIQUE (number);


--
-- Name: orga orga_number_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key129 UNIQUE (number);


--
-- Name: orga orga_number_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key13 UNIQUE (number);


--
-- Name: orga orga_number_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key130 UNIQUE (number);


--
-- Name: orga orga_number_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key131 UNIQUE (number);


--
-- Name: orga orga_number_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key132 UNIQUE (number);


--
-- Name: orga orga_number_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key133 UNIQUE (number);


--
-- Name: orga orga_number_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key134 UNIQUE (number);


--
-- Name: orga orga_number_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key135 UNIQUE (number);


--
-- Name: orga orga_number_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key136 UNIQUE (number);


--
-- Name: orga orga_number_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key137 UNIQUE (number);


--
-- Name: orga orga_number_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key138 UNIQUE (number);


--
-- Name: orga orga_number_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key139 UNIQUE (number);


--
-- Name: orga orga_number_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key14 UNIQUE (number);


--
-- Name: orga orga_number_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key140 UNIQUE (number);


--
-- Name: orga orga_number_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key141 UNIQUE (number);


--
-- Name: orga orga_number_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key142 UNIQUE (number);


--
-- Name: orga orga_number_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key143 UNIQUE (number);


--
-- Name: orga orga_number_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key144 UNIQUE (number);


--
-- Name: orga orga_number_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key145 UNIQUE (number);


--
-- Name: orga orga_number_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key146 UNIQUE (number);


--
-- Name: orga orga_number_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key147 UNIQUE (number);


--
-- Name: orga orga_number_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key148 UNIQUE (number);


--
-- Name: orga orga_number_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key149 UNIQUE (number);


--
-- Name: orga orga_number_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key15 UNIQUE (number);


--
-- Name: orga orga_number_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key150 UNIQUE (number);


--
-- Name: orga orga_number_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key151 UNIQUE (number);


--
-- Name: orga orga_number_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key152 UNIQUE (number);


--
-- Name: orga orga_number_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key153 UNIQUE (number);


--
-- Name: orga orga_number_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key154 UNIQUE (number);


--
-- Name: orga orga_number_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key155 UNIQUE (number);


--
-- Name: orga orga_number_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key156 UNIQUE (number);


--
-- Name: orga orga_number_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key157 UNIQUE (number);


--
-- Name: orga orga_number_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key158 UNIQUE (number);


--
-- Name: orga orga_number_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key159 UNIQUE (number);


--
-- Name: orga orga_number_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key16 UNIQUE (number);


--
-- Name: orga orga_number_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key160 UNIQUE (number);


--
-- Name: orga orga_number_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key161 UNIQUE (number);


--
-- Name: orga orga_number_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key162 UNIQUE (number);


--
-- Name: orga orga_number_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key163 UNIQUE (number);


--
-- Name: orga orga_number_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key164 UNIQUE (number);


--
-- Name: orga orga_number_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key165 UNIQUE (number);


--
-- Name: orga orga_number_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key166 UNIQUE (number);


--
-- Name: orga orga_number_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key167 UNIQUE (number);


--
-- Name: orga orga_number_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key168 UNIQUE (number);


--
-- Name: orga orga_number_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key169 UNIQUE (number);


--
-- Name: orga orga_number_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key17 UNIQUE (number);


--
-- Name: orga orga_number_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key170 UNIQUE (number);


--
-- Name: orga orga_number_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key171 UNIQUE (number);


--
-- Name: orga orga_number_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key172 UNIQUE (number);


--
-- Name: orga orga_number_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key173 UNIQUE (number);


--
-- Name: orga orga_number_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key174 UNIQUE (number);


--
-- Name: orga orga_number_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key175 UNIQUE (number);


--
-- Name: orga orga_number_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key176 UNIQUE (number);


--
-- Name: orga orga_number_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key177 UNIQUE (number);


--
-- Name: orga orga_number_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key178 UNIQUE (number);


--
-- Name: orga orga_number_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key179 UNIQUE (number);


--
-- Name: orga orga_number_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key18 UNIQUE (number);


--
-- Name: orga orga_number_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key180 UNIQUE (number);


--
-- Name: orga orga_number_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key181 UNIQUE (number);


--
-- Name: orga orga_number_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key182 UNIQUE (number);


--
-- Name: orga orga_number_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key183 UNIQUE (number);


--
-- Name: orga orga_number_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key184 UNIQUE (number);


--
-- Name: orga orga_number_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key185 UNIQUE (number);


--
-- Name: orga orga_number_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key186 UNIQUE (number);


--
-- Name: orga orga_number_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key187 UNIQUE (number);


--
-- Name: orga orga_number_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key188 UNIQUE (number);


--
-- Name: orga orga_number_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key189 UNIQUE (number);


--
-- Name: orga orga_number_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key19 UNIQUE (number);


--
-- Name: orga orga_number_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key190 UNIQUE (number);


--
-- Name: orga orga_number_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key191 UNIQUE (number);


--
-- Name: orga orga_number_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key192 UNIQUE (number);


--
-- Name: orga orga_number_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key193 UNIQUE (number);


--
-- Name: orga orga_number_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key194 UNIQUE (number);


--
-- Name: orga orga_number_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key195 UNIQUE (number);


--
-- Name: orga orga_number_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key196 UNIQUE (number);


--
-- Name: orga orga_number_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key197 UNIQUE (number);


--
-- Name: orga orga_number_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key198 UNIQUE (number);


--
-- Name: orga orga_number_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key199 UNIQUE (number);


--
-- Name: orga orga_number_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key2 UNIQUE (number);


--
-- Name: orga orga_number_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key20 UNIQUE (number);


--
-- Name: orga orga_number_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key200 UNIQUE (number);


--
-- Name: orga orga_number_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key201 UNIQUE (number);


--
-- Name: orga orga_number_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key202 UNIQUE (number);


--
-- Name: orga orga_number_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key203 UNIQUE (number);


--
-- Name: orga orga_number_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key204 UNIQUE (number);


--
-- Name: orga orga_number_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key205 UNIQUE (number);


--
-- Name: orga orga_number_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key206 UNIQUE (number);


--
-- Name: orga orga_number_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key207 UNIQUE (number);


--
-- Name: orga orga_number_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key208 UNIQUE (number);


--
-- Name: orga orga_number_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key209 UNIQUE (number);


--
-- Name: orga orga_number_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key21 UNIQUE (number);


--
-- Name: orga orga_number_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key210 UNIQUE (number);


--
-- Name: orga orga_number_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key211 UNIQUE (number);


--
-- Name: orga orga_number_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key212 UNIQUE (number);


--
-- Name: orga orga_number_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key213 UNIQUE (number);


--
-- Name: orga orga_number_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key214 UNIQUE (number);


--
-- Name: orga orga_number_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key215 UNIQUE (number);


--
-- Name: orga orga_number_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key216 UNIQUE (number);


--
-- Name: orga orga_number_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key217 UNIQUE (number);


--
-- Name: orga orga_number_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key218 UNIQUE (number);


--
-- Name: orga orga_number_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key219 UNIQUE (number);


--
-- Name: orga orga_number_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key22 UNIQUE (number);


--
-- Name: orga orga_number_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key220 UNIQUE (number);


--
-- Name: orga orga_number_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key221 UNIQUE (number);


--
-- Name: orga orga_number_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key222 UNIQUE (number);


--
-- Name: orga orga_number_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key223 UNIQUE (number);


--
-- Name: orga orga_number_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key224 UNIQUE (number);


--
-- Name: orga orga_number_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key225 UNIQUE (number);


--
-- Name: orga orga_number_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key226 UNIQUE (number);


--
-- Name: orga orga_number_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key227 UNIQUE (number);


--
-- Name: orga orga_number_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key228 UNIQUE (number);


--
-- Name: orga orga_number_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key229 UNIQUE (number);


--
-- Name: orga orga_number_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key23 UNIQUE (number);


--
-- Name: orga orga_number_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key230 UNIQUE (number);


--
-- Name: orga orga_number_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key231 UNIQUE (number);


--
-- Name: orga orga_number_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key232 UNIQUE (number);


--
-- Name: orga orga_number_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key233 UNIQUE (number);


--
-- Name: orga orga_number_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key234 UNIQUE (number);


--
-- Name: orga orga_number_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key235 UNIQUE (number);


--
-- Name: orga orga_number_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key236 UNIQUE (number);


--
-- Name: orga orga_number_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key237 UNIQUE (number);


--
-- Name: orga orga_number_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key238 UNIQUE (number);


--
-- Name: orga orga_number_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key239 UNIQUE (number);


--
-- Name: orga orga_number_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key24 UNIQUE (number);


--
-- Name: orga orga_number_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key240 UNIQUE (number);


--
-- Name: orga orga_number_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key241 UNIQUE (number);


--
-- Name: orga orga_number_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key242 UNIQUE (number);


--
-- Name: orga orga_number_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key243 UNIQUE (number);


--
-- Name: orga orga_number_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key244 UNIQUE (number);


--
-- Name: orga orga_number_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key245 UNIQUE (number);


--
-- Name: orga orga_number_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key246 UNIQUE (number);


--
-- Name: orga orga_number_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key247 UNIQUE (number);


--
-- Name: orga orga_number_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key248 UNIQUE (number);


--
-- Name: orga orga_number_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key249 UNIQUE (number);


--
-- Name: orga orga_number_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key25 UNIQUE (number);


--
-- Name: orga orga_number_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key250 UNIQUE (number);


--
-- Name: orga orga_number_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key251 UNIQUE (number);


--
-- Name: orga orga_number_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key252 UNIQUE (number);


--
-- Name: orga orga_number_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key253 UNIQUE (number);


--
-- Name: orga orga_number_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key254 UNIQUE (number);


--
-- Name: orga orga_number_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key255 UNIQUE (number);


--
-- Name: orga orga_number_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key256 UNIQUE (number);


--
-- Name: orga orga_number_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key257 UNIQUE (number);


--
-- Name: orga orga_number_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key258 UNIQUE (number);


--
-- Name: orga orga_number_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key259 UNIQUE (number);


--
-- Name: orga orga_number_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key26 UNIQUE (number);


--
-- Name: orga orga_number_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key260 UNIQUE (number);


--
-- Name: orga orga_number_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key261 UNIQUE (number);


--
-- Name: orga orga_number_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key262 UNIQUE (number);


--
-- Name: orga orga_number_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key263 UNIQUE (number);


--
-- Name: orga orga_number_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key264 UNIQUE (number);


--
-- Name: orga orga_number_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key265 UNIQUE (number);


--
-- Name: orga orga_number_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key266 UNIQUE (number);


--
-- Name: orga orga_number_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key267 UNIQUE (number);


--
-- Name: orga orga_number_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key268 UNIQUE (number);


--
-- Name: orga orga_number_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key269 UNIQUE (number);


--
-- Name: orga orga_number_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key27 UNIQUE (number);


--
-- Name: orga orga_number_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key270 UNIQUE (number);


--
-- Name: orga orga_number_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key271 UNIQUE (number);


--
-- Name: orga orga_number_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key272 UNIQUE (number);


--
-- Name: orga orga_number_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key273 UNIQUE (number);


--
-- Name: orga orga_number_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key274 UNIQUE (number);


--
-- Name: orga orga_number_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key275 UNIQUE (number);


--
-- Name: orga orga_number_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key276 UNIQUE (number);


--
-- Name: orga orga_number_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key277 UNIQUE (number);


--
-- Name: orga orga_number_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key278 UNIQUE (number);


--
-- Name: orga orga_number_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key279 UNIQUE (number);


--
-- Name: orga orga_number_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key28 UNIQUE (number);


--
-- Name: orga orga_number_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key280 UNIQUE (number);


--
-- Name: orga orga_number_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key281 UNIQUE (number);


--
-- Name: orga orga_number_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key282 UNIQUE (number);


--
-- Name: orga orga_number_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key283 UNIQUE (number);


--
-- Name: orga orga_number_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key284 UNIQUE (number);


--
-- Name: orga orga_number_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key285 UNIQUE (number);


--
-- Name: orga orga_number_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key286 UNIQUE (number);


--
-- Name: orga orga_number_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key287 UNIQUE (number);


--
-- Name: orga orga_number_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key288 UNIQUE (number);


--
-- Name: orga orga_number_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key289 UNIQUE (number);


--
-- Name: orga orga_number_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key29 UNIQUE (number);


--
-- Name: orga orga_number_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key290 UNIQUE (number);


--
-- Name: orga orga_number_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key291 UNIQUE (number);


--
-- Name: orga orga_number_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key292 UNIQUE (number);


--
-- Name: orga orga_number_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key293 UNIQUE (number);


--
-- Name: orga orga_number_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key294 UNIQUE (number);


--
-- Name: orga orga_number_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key295 UNIQUE (number);


--
-- Name: orga orga_number_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key296 UNIQUE (number);


--
-- Name: orga orga_number_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key297 UNIQUE (number);


--
-- Name: orga orga_number_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key298 UNIQUE (number);


--
-- Name: orga orga_number_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key299 UNIQUE (number);


--
-- Name: orga orga_number_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key3 UNIQUE (number);


--
-- Name: orga orga_number_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key30 UNIQUE (number);


--
-- Name: orga orga_number_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key300 UNIQUE (number);


--
-- Name: orga orga_number_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key301 UNIQUE (number);


--
-- Name: orga orga_number_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key302 UNIQUE (number);


--
-- Name: orga orga_number_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key303 UNIQUE (number);


--
-- Name: orga orga_number_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key304 UNIQUE (number);


--
-- Name: orga orga_number_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key305 UNIQUE (number);


--
-- Name: orga orga_number_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key306 UNIQUE (number);


--
-- Name: orga orga_number_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key307 UNIQUE (number);


--
-- Name: orga orga_number_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key308 UNIQUE (number);


--
-- Name: orga orga_number_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key309 UNIQUE (number);


--
-- Name: orga orga_number_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key31 UNIQUE (number);


--
-- Name: orga orga_number_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key310 UNIQUE (number);


--
-- Name: orga orga_number_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key311 UNIQUE (number);


--
-- Name: orga orga_number_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key312 UNIQUE (number);


--
-- Name: orga orga_number_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key313 UNIQUE (number);


--
-- Name: orga orga_number_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key314 UNIQUE (number);


--
-- Name: orga orga_number_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key315 UNIQUE (number);


--
-- Name: orga orga_number_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key316 UNIQUE (number);


--
-- Name: orga orga_number_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key317 UNIQUE (number);


--
-- Name: orga orga_number_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key318 UNIQUE (number);


--
-- Name: orga orga_number_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key319 UNIQUE (number);


--
-- Name: orga orga_number_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key32 UNIQUE (number);


--
-- Name: orga orga_number_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key320 UNIQUE (number);


--
-- Name: orga orga_number_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key321 UNIQUE (number);


--
-- Name: orga orga_number_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key322 UNIQUE (number);


--
-- Name: orga orga_number_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key323 UNIQUE (number);


--
-- Name: orga orga_number_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key324 UNIQUE (number);


--
-- Name: orga orga_number_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key325 UNIQUE (number);


--
-- Name: orga orga_number_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key326 UNIQUE (number);


--
-- Name: orga orga_number_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key327 UNIQUE (number);


--
-- Name: orga orga_number_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key328 UNIQUE (number);


--
-- Name: orga orga_number_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key329 UNIQUE (number);


--
-- Name: orga orga_number_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key33 UNIQUE (number);


--
-- Name: orga orga_number_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key330 UNIQUE (number);


--
-- Name: orga orga_number_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key331 UNIQUE (number);


--
-- Name: orga orga_number_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key332 UNIQUE (number);


--
-- Name: orga orga_number_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key333 UNIQUE (number);


--
-- Name: orga orga_number_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key334 UNIQUE (number);


--
-- Name: orga orga_number_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key335 UNIQUE (number);


--
-- Name: orga orga_number_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key336 UNIQUE (number);


--
-- Name: orga orga_number_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key337 UNIQUE (number);


--
-- Name: orga orga_number_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key338 UNIQUE (number);


--
-- Name: orga orga_number_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key339 UNIQUE (number);


--
-- Name: orga orga_number_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key34 UNIQUE (number);


--
-- Name: orga orga_number_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key340 UNIQUE (number);


--
-- Name: orga orga_number_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key341 UNIQUE (number);


--
-- Name: orga orga_number_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key342 UNIQUE (number);


--
-- Name: orga orga_number_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key343 UNIQUE (number);


--
-- Name: orga orga_number_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key344 UNIQUE (number);


--
-- Name: orga orga_number_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key345 UNIQUE (number);


--
-- Name: orga orga_number_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key346 UNIQUE (number);


--
-- Name: orga orga_number_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key347 UNIQUE (number);


--
-- Name: orga orga_number_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key348 UNIQUE (number);


--
-- Name: orga orga_number_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key349 UNIQUE (number);


--
-- Name: orga orga_number_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key35 UNIQUE (number);


--
-- Name: orga orga_number_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key350 UNIQUE (number);


--
-- Name: orga orga_number_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key351 UNIQUE (number);


--
-- Name: orga orga_number_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key352 UNIQUE (number);


--
-- Name: orga orga_number_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key353 UNIQUE (number);


--
-- Name: orga orga_number_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key354 UNIQUE (number);


--
-- Name: orga orga_number_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key355 UNIQUE (number);


--
-- Name: orga orga_number_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key356 UNIQUE (number);


--
-- Name: orga orga_number_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key357 UNIQUE (number);


--
-- Name: orga orga_number_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key358 UNIQUE (number);


--
-- Name: orga orga_number_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key359 UNIQUE (number);


--
-- Name: orga orga_number_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key36 UNIQUE (number);


--
-- Name: orga orga_number_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key360 UNIQUE (number);


--
-- Name: orga orga_number_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key361 UNIQUE (number);


--
-- Name: orga orga_number_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key362 UNIQUE (number);


--
-- Name: orga orga_number_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key363 UNIQUE (number);


--
-- Name: orga orga_number_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key364 UNIQUE (number);


--
-- Name: orga orga_number_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key365 UNIQUE (number);


--
-- Name: orga orga_number_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key366 UNIQUE (number);


--
-- Name: orga orga_number_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key367 UNIQUE (number);


--
-- Name: orga orga_number_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key368 UNIQUE (number);


--
-- Name: orga orga_number_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key369 UNIQUE (number);


--
-- Name: orga orga_number_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key37 UNIQUE (number);


--
-- Name: orga orga_number_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key370 UNIQUE (number);


--
-- Name: orga orga_number_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key371 UNIQUE (number);


--
-- Name: orga orga_number_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key372 UNIQUE (number);


--
-- Name: orga orga_number_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key373 UNIQUE (number);


--
-- Name: orga orga_number_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key374 UNIQUE (number);


--
-- Name: orga orga_number_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key375 UNIQUE (number);


--
-- Name: orga orga_number_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key376 UNIQUE (number);


--
-- Name: orga orga_number_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key377 UNIQUE (number);


--
-- Name: orga orga_number_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key378 UNIQUE (number);


--
-- Name: orga orga_number_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key379 UNIQUE (number);


--
-- Name: orga orga_number_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key38 UNIQUE (number);


--
-- Name: orga orga_number_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key380 UNIQUE (number);


--
-- Name: orga orga_number_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key381 UNIQUE (number);


--
-- Name: orga orga_number_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key382 UNIQUE (number);


--
-- Name: orga orga_number_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key383 UNIQUE (number);


--
-- Name: orga orga_number_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key384 UNIQUE (number);


--
-- Name: orga orga_number_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key385 UNIQUE (number);


--
-- Name: orga orga_number_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key386 UNIQUE (number);


--
-- Name: orga orga_number_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key387 UNIQUE (number);


--
-- Name: orga orga_number_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key388 UNIQUE (number);


--
-- Name: orga orga_number_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key389 UNIQUE (number);


--
-- Name: orga orga_number_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key39 UNIQUE (number);


--
-- Name: orga orga_number_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key390 UNIQUE (number);


--
-- Name: orga orga_number_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key391 UNIQUE (number);


--
-- Name: orga orga_number_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key392 UNIQUE (number);


--
-- Name: orga orga_number_key393; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key393 UNIQUE (number);


--
-- Name: orga orga_number_key394; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key394 UNIQUE (number);


--
-- Name: orga orga_number_key395; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key395 UNIQUE (number);


--
-- Name: orga orga_number_key396; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key396 UNIQUE (number);


--
-- Name: orga orga_number_key397; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key397 UNIQUE (number);


--
-- Name: orga orga_number_key398; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key398 UNIQUE (number);


--
-- Name: orga orga_number_key399; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key399 UNIQUE (number);


--
-- Name: orga orga_number_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key4 UNIQUE (number);


--
-- Name: orga orga_number_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key40 UNIQUE (number);


--
-- Name: orga orga_number_key400; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key400 UNIQUE (number);


--
-- Name: orga orga_number_key401; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key401 UNIQUE (number);


--
-- Name: orga orga_number_key402; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key402 UNIQUE (number);


--
-- Name: orga orga_number_key403; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key403 UNIQUE (number);


--
-- Name: orga orga_number_key404; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key404 UNIQUE (number);


--
-- Name: orga orga_number_key405; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key405 UNIQUE (number);


--
-- Name: orga orga_number_key406; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key406 UNIQUE (number);


--
-- Name: orga orga_number_key407; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key407 UNIQUE (number);


--
-- Name: orga orga_number_key408; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key408 UNIQUE (number);


--
-- Name: orga orga_number_key409; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key409 UNIQUE (number);


--
-- Name: orga orga_number_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key41 UNIQUE (number);


--
-- Name: orga orga_number_key410; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key410 UNIQUE (number);


--
-- Name: orga orga_number_key411; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key411 UNIQUE (number);


--
-- Name: orga orga_number_key412; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key412 UNIQUE (number);


--
-- Name: orga orga_number_key413; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key413 UNIQUE (number);


--
-- Name: orga orga_number_key414; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key414 UNIQUE (number);


--
-- Name: orga orga_number_key415; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key415 UNIQUE (number);


--
-- Name: orga orga_number_key416; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key416 UNIQUE (number);


--
-- Name: orga orga_number_key417; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key417 UNIQUE (number);


--
-- Name: orga orga_number_key418; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key418 UNIQUE (number);


--
-- Name: orga orga_number_key419; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key419 UNIQUE (number);


--
-- Name: orga orga_number_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key42 UNIQUE (number);


--
-- Name: orga orga_number_key420; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key420 UNIQUE (number);


--
-- Name: orga orga_number_key421; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key421 UNIQUE (number);


--
-- Name: orga orga_number_key422; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key422 UNIQUE (number);


--
-- Name: orga orga_number_key423; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key423 UNIQUE (number);


--
-- Name: orga orga_number_key424; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key424 UNIQUE (number);


--
-- Name: orga orga_number_key425; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key425 UNIQUE (number);


--
-- Name: orga orga_number_key426; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key426 UNIQUE (number);


--
-- Name: orga orga_number_key427; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key427 UNIQUE (number);


--
-- Name: orga orga_number_key428; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key428 UNIQUE (number);


--
-- Name: orga orga_number_key429; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key429 UNIQUE (number);


--
-- Name: orga orga_number_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key43 UNIQUE (number);


--
-- Name: orga orga_number_key430; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key430 UNIQUE (number);


--
-- Name: orga orga_number_key431; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key431 UNIQUE (number);


--
-- Name: orga orga_number_key432; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key432 UNIQUE (number);


--
-- Name: orga orga_number_key433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key433 UNIQUE (number);


--
-- Name: orga orga_number_key434; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key434 UNIQUE (number);


--
-- Name: orga orga_number_key435; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key435 UNIQUE (number);


--
-- Name: orga orga_number_key436; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key436 UNIQUE (number);


--
-- Name: orga orga_number_key437; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key437 UNIQUE (number);


--
-- Name: orga orga_number_key438; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key438 UNIQUE (number);


--
-- Name: orga orga_number_key439; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key439 UNIQUE (number);


--
-- Name: orga orga_number_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key44 UNIQUE (number);


--
-- Name: orga orga_number_key440; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key440 UNIQUE (number);


--
-- Name: orga orga_number_key441; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key441 UNIQUE (number);


--
-- Name: orga orga_number_key442; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key442 UNIQUE (number);


--
-- Name: orga orga_number_key443; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key443 UNIQUE (number);


--
-- Name: orga orga_number_key444; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key444 UNIQUE (number);


--
-- Name: orga orga_number_key445; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key445 UNIQUE (number);


--
-- Name: orga orga_number_key446; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key446 UNIQUE (number);


--
-- Name: orga orga_number_key447; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key447 UNIQUE (number);


--
-- Name: orga orga_number_key448; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key448 UNIQUE (number);


--
-- Name: orga orga_number_key449; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key449 UNIQUE (number);


--
-- Name: orga orga_number_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key45 UNIQUE (number);


--
-- Name: orga orga_number_key450; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key450 UNIQUE (number);


--
-- Name: orga orga_number_key451; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key451 UNIQUE (number);


--
-- Name: orga orga_number_key452; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key452 UNIQUE (number);


--
-- Name: orga orga_number_key453; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key453 UNIQUE (number);


--
-- Name: orga orga_number_key454; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key454 UNIQUE (number);


--
-- Name: orga orga_number_key455; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key455 UNIQUE (number);


--
-- Name: orga orga_number_key456; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key456 UNIQUE (number);


--
-- Name: orga orga_number_key457; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key457 UNIQUE (number);


--
-- Name: orga orga_number_key458; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key458 UNIQUE (number);


--
-- Name: orga orga_number_key459; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key459 UNIQUE (number);


--
-- Name: orga orga_number_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key46 UNIQUE (number);


--
-- Name: orga orga_number_key460; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key460 UNIQUE (number);


--
-- Name: orga orga_number_key461; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key461 UNIQUE (number);


--
-- Name: orga orga_number_key462; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key462 UNIQUE (number);


--
-- Name: orga orga_number_key463; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key463 UNIQUE (number);


--
-- Name: orga orga_number_key464; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key464 UNIQUE (number);


--
-- Name: orga orga_number_key465; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key465 UNIQUE (number);


--
-- Name: orga orga_number_key466; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key466 UNIQUE (number);


--
-- Name: orga orga_number_key467; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key467 UNIQUE (number);


--
-- Name: orga orga_number_key468; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key468 UNIQUE (number);


--
-- Name: orga orga_number_key469; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key469 UNIQUE (number);


--
-- Name: orga orga_number_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key47 UNIQUE (number);


--
-- Name: orga orga_number_key470; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key470 UNIQUE (number);


--
-- Name: orga orga_number_key471; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key471 UNIQUE (number);


--
-- Name: orga orga_number_key472; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key472 UNIQUE (number);


--
-- Name: orga orga_number_key473; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key473 UNIQUE (number);


--
-- Name: orga orga_number_key474; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key474 UNIQUE (number);


--
-- Name: orga orga_number_key475; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key475 UNIQUE (number);


--
-- Name: orga orga_number_key476; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key476 UNIQUE (number);


--
-- Name: orga orga_number_key477; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key477 UNIQUE (number);


--
-- Name: orga orga_number_key478; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key478 UNIQUE (number);


--
-- Name: orga orga_number_key479; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key479 UNIQUE (number);


--
-- Name: orga orga_number_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key48 UNIQUE (number);


--
-- Name: orga orga_number_key480; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key480 UNIQUE (number);


--
-- Name: orga orga_number_key481; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key481 UNIQUE (number);


--
-- Name: orga orga_number_key482; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key482 UNIQUE (number);


--
-- Name: orga orga_number_key483; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key483 UNIQUE (number);


--
-- Name: orga orga_number_key484; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key484 UNIQUE (number);


--
-- Name: orga orga_number_key485; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key485 UNIQUE (number);


--
-- Name: orga orga_number_key486; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key486 UNIQUE (number);


--
-- Name: orga orga_number_key487; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key487 UNIQUE (number);


--
-- Name: orga orga_number_key488; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key488 UNIQUE (number);


--
-- Name: orga orga_number_key489; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key489 UNIQUE (number);


--
-- Name: orga orga_number_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key49 UNIQUE (number);


--
-- Name: orga orga_number_key490; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key490 UNIQUE (number);


--
-- Name: orga orga_number_key491; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key491 UNIQUE (number);


--
-- Name: orga orga_number_key492; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key492 UNIQUE (number);


--
-- Name: orga orga_number_key493; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key493 UNIQUE (number);


--
-- Name: orga orga_number_key494; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key494 UNIQUE (number);


--
-- Name: orga orga_number_key495; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key495 UNIQUE (number);


--
-- Name: orga orga_number_key496; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key496 UNIQUE (number);


--
-- Name: orga orga_number_key497; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key497 UNIQUE (number);


--
-- Name: orga orga_number_key498; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key498 UNIQUE (number);


--
-- Name: orga orga_number_key499; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key499 UNIQUE (number);


--
-- Name: orga orga_number_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key5 UNIQUE (number);


--
-- Name: orga orga_number_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key50 UNIQUE (number);


--
-- Name: orga orga_number_key500; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key500 UNIQUE (number);


--
-- Name: orga orga_number_key501; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key501 UNIQUE (number);


--
-- Name: orga orga_number_key502; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key502 UNIQUE (number);


--
-- Name: orga orga_number_key503; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key503 UNIQUE (number);


--
-- Name: orga orga_number_key504; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key504 UNIQUE (number);


--
-- Name: orga orga_number_key505; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key505 UNIQUE (number);


--
-- Name: orga orga_number_key506; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key506 UNIQUE (number);


--
-- Name: orga orga_number_key507; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key507 UNIQUE (number);


--
-- Name: orga orga_number_key508; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key508 UNIQUE (number);


--
-- Name: orga orga_number_key509; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key509 UNIQUE (number);


--
-- Name: orga orga_number_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key51 UNIQUE (number);


--
-- Name: orga orga_number_key510; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key510 UNIQUE (number);


--
-- Name: orga orga_number_key511; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key511 UNIQUE (number);


--
-- Name: orga orga_number_key512; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key512 UNIQUE (number);


--
-- Name: orga orga_number_key513; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key513 UNIQUE (number);


--
-- Name: orga orga_number_key514; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key514 UNIQUE (number);


--
-- Name: orga orga_number_key515; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key515 UNIQUE (number);


--
-- Name: orga orga_number_key516; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key516 UNIQUE (number);


--
-- Name: orga orga_number_key517; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key517 UNIQUE (number);


--
-- Name: orga orga_number_key518; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key518 UNIQUE (number);


--
-- Name: orga orga_number_key519; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key519 UNIQUE (number);


--
-- Name: orga orga_number_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key52 UNIQUE (number);


--
-- Name: orga orga_number_key520; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key520 UNIQUE (number);


--
-- Name: orga orga_number_key521; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key521 UNIQUE (number);


--
-- Name: orga orga_number_key522; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key522 UNIQUE (number);


--
-- Name: orga orga_number_key523; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key523 UNIQUE (number);


--
-- Name: orga orga_number_key524; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key524 UNIQUE (number);


--
-- Name: orga orga_number_key525; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key525 UNIQUE (number);


--
-- Name: orga orga_number_key526; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key526 UNIQUE (number);


--
-- Name: orga orga_number_key527; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key527 UNIQUE (number);


--
-- Name: orga orga_number_key528; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key528 UNIQUE (number);


--
-- Name: orga orga_number_key529; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key529 UNIQUE (number);


--
-- Name: orga orga_number_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key53 UNIQUE (number);


--
-- Name: orga orga_number_key530; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key530 UNIQUE (number);


--
-- Name: orga orga_number_key531; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key531 UNIQUE (number);


--
-- Name: orga orga_number_key532; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key532 UNIQUE (number);


--
-- Name: orga orga_number_key533; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key533 UNIQUE (number);


--
-- Name: orga orga_number_key534; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key534 UNIQUE (number);


--
-- Name: orga orga_number_key535; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key535 UNIQUE (number);


--
-- Name: orga orga_number_key536; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key536 UNIQUE (number);


--
-- Name: orga orga_number_key537; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key537 UNIQUE (number);


--
-- Name: orga orga_number_key538; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key538 UNIQUE (number);


--
-- Name: orga orga_number_key539; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key539 UNIQUE (number);


--
-- Name: orga orga_number_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key54 UNIQUE (number);


--
-- Name: orga orga_number_key540; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key540 UNIQUE (number);


--
-- Name: orga orga_number_key541; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key541 UNIQUE (number);


--
-- Name: orga orga_number_key542; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key542 UNIQUE (number);


--
-- Name: orga orga_number_key543; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key543 UNIQUE (number);


--
-- Name: orga orga_number_key544; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key544 UNIQUE (number);


--
-- Name: orga orga_number_key545; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key545 UNIQUE (number);


--
-- Name: orga orga_number_key546; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key546 UNIQUE (number);


--
-- Name: orga orga_number_key547; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key547 UNIQUE (number);


--
-- Name: orga orga_number_key548; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key548 UNIQUE (number);


--
-- Name: orga orga_number_key549; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key549 UNIQUE (number);


--
-- Name: orga orga_number_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key55 UNIQUE (number);


--
-- Name: orga orga_number_key550; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key550 UNIQUE (number);


--
-- Name: orga orga_number_key551; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key551 UNIQUE (number);


--
-- Name: orga orga_number_key552; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key552 UNIQUE (number);


--
-- Name: orga orga_number_key553; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key553 UNIQUE (number);


--
-- Name: orga orga_number_key554; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key554 UNIQUE (number);


--
-- Name: orga orga_number_key555; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key555 UNIQUE (number);


--
-- Name: orga orga_number_key556; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key556 UNIQUE (number);


--
-- Name: orga orga_number_key557; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key557 UNIQUE (number);


--
-- Name: orga orga_number_key558; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key558 UNIQUE (number);


--
-- Name: orga orga_number_key559; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key559 UNIQUE (number);


--
-- Name: orga orga_number_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key56 UNIQUE (number);


--
-- Name: orga orga_number_key560; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key560 UNIQUE (number);


--
-- Name: orga orga_number_key561; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key561 UNIQUE (number);


--
-- Name: orga orga_number_key562; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key562 UNIQUE (number);


--
-- Name: orga orga_number_key563; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key563 UNIQUE (number);


--
-- Name: orga orga_number_key564; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key564 UNIQUE (number);


--
-- Name: orga orga_number_key565; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key565 UNIQUE (number);


--
-- Name: orga orga_number_key566; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key566 UNIQUE (number);


--
-- Name: orga orga_number_key567; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key567 UNIQUE (number);


--
-- Name: orga orga_number_key568; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key568 UNIQUE (number);


--
-- Name: orga orga_number_key569; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key569 UNIQUE (number);


--
-- Name: orga orga_number_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key57 UNIQUE (number);


--
-- Name: orga orga_number_key570; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key570 UNIQUE (number);


--
-- Name: orga orga_number_key571; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key571 UNIQUE (number);


--
-- Name: orga orga_number_key572; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key572 UNIQUE (number);


--
-- Name: orga orga_number_key573; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key573 UNIQUE (number);


--
-- Name: orga orga_number_key574; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key574 UNIQUE (number);


--
-- Name: orga orga_number_key575; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key575 UNIQUE (number);


--
-- Name: orga orga_number_key576; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key576 UNIQUE (number);


--
-- Name: orga orga_number_key577; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key577 UNIQUE (number);


--
-- Name: orga orga_number_key578; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key578 UNIQUE (number);


--
-- Name: orga orga_number_key579; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key579 UNIQUE (number);


--
-- Name: orga orga_number_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key58 UNIQUE (number);


--
-- Name: orga orga_number_key580; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key580 UNIQUE (number);


--
-- Name: orga orga_number_key581; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key581 UNIQUE (number);


--
-- Name: orga orga_number_key582; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key582 UNIQUE (number);


--
-- Name: orga orga_number_key583; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key583 UNIQUE (number);


--
-- Name: orga orga_number_key584; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key584 UNIQUE (number);


--
-- Name: orga orga_number_key585; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key585 UNIQUE (number);


--
-- Name: orga orga_number_key586; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key586 UNIQUE (number);


--
-- Name: orga orga_number_key587; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key587 UNIQUE (number);


--
-- Name: orga orga_number_key588; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key588 UNIQUE (number);


--
-- Name: orga orga_number_key589; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key589 UNIQUE (number);


--
-- Name: orga orga_number_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key59 UNIQUE (number);


--
-- Name: orga orga_number_key590; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key590 UNIQUE (number);


--
-- Name: orga orga_number_key591; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key591 UNIQUE (number);


--
-- Name: orga orga_number_key592; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key592 UNIQUE (number);


--
-- Name: orga orga_number_key593; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key593 UNIQUE (number);


--
-- Name: orga orga_number_key594; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key594 UNIQUE (number);


--
-- Name: orga orga_number_key595; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key595 UNIQUE (number);


--
-- Name: orga orga_number_key596; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key596 UNIQUE (number);


--
-- Name: orga orga_number_key597; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key597 UNIQUE (number);


--
-- Name: orga orga_number_key598; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key598 UNIQUE (number);


--
-- Name: orga orga_number_key599; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key599 UNIQUE (number);


--
-- Name: orga orga_number_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key6 UNIQUE (number);


--
-- Name: orga orga_number_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key60 UNIQUE (number);


--
-- Name: orga orga_number_key600; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key600 UNIQUE (number);


--
-- Name: orga orga_number_key601; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key601 UNIQUE (number);


--
-- Name: orga orga_number_key602; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key602 UNIQUE (number);


--
-- Name: orga orga_number_key603; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key603 UNIQUE (number);


--
-- Name: orga orga_number_key604; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key604 UNIQUE (number);


--
-- Name: orga orga_number_key605; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key605 UNIQUE (number);


--
-- Name: orga orga_number_key606; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key606 UNIQUE (number);


--
-- Name: orga orga_number_key607; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key607 UNIQUE (number);


--
-- Name: orga orga_number_key608; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key608 UNIQUE (number);


--
-- Name: orga orga_number_key609; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key609 UNIQUE (number);


--
-- Name: orga orga_number_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key61 UNIQUE (number);


--
-- Name: orga orga_number_key610; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key610 UNIQUE (number);


--
-- Name: orga orga_number_key611; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key611 UNIQUE (number);


--
-- Name: orga orga_number_key612; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key612 UNIQUE (number);


--
-- Name: orga orga_number_key613; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key613 UNIQUE (number);


--
-- Name: orga orga_number_key614; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key614 UNIQUE (number);


--
-- Name: orga orga_number_key615; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key615 UNIQUE (number);


--
-- Name: orga orga_number_key616; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key616 UNIQUE (number);


--
-- Name: orga orga_number_key617; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key617 UNIQUE (number);


--
-- Name: orga orga_number_key618; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key618 UNIQUE (number);


--
-- Name: orga orga_number_key619; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key619 UNIQUE (number);


--
-- Name: orga orga_number_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key62 UNIQUE (number);


--
-- Name: orga orga_number_key620; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key620 UNIQUE (number);


--
-- Name: orga orga_number_key621; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key621 UNIQUE (number);


--
-- Name: orga orga_number_key622; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key622 UNIQUE (number);


--
-- Name: orga orga_number_key623; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key623 UNIQUE (number);


--
-- Name: orga orga_number_key624; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key624 UNIQUE (number);


--
-- Name: orga orga_number_key625; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key625 UNIQUE (number);


--
-- Name: orga orga_number_key626; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key626 UNIQUE (number);


--
-- Name: orga orga_number_key627; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key627 UNIQUE (number);


--
-- Name: orga orga_number_key628; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key628 UNIQUE (number);


--
-- Name: orga orga_number_key629; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key629 UNIQUE (number);


--
-- Name: orga orga_number_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key63 UNIQUE (number);


--
-- Name: orga orga_number_key630; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key630 UNIQUE (number);


--
-- Name: orga orga_number_key631; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key631 UNIQUE (number);


--
-- Name: orga orga_number_key632; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key632 UNIQUE (number);


--
-- Name: orga orga_number_key633; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key633 UNIQUE (number);


--
-- Name: orga orga_number_key634; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key634 UNIQUE (number);


--
-- Name: orga orga_number_key635; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key635 UNIQUE (number);


--
-- Name: orga orga_number_key636; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key636 UNIQUE (number);


--
-- Name: orga orga_number_key637; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key637 UNIQUE (number);


--
-- Name: orga orga_number_key638; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key638 UNIQUE (number);


--
-- Name: orga orga_number_key639; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key639 UNIQUE (number);


--
-- Name: orga orga_number_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key64 UNIQUE (number);


--
-- Name: orga orga_number_key640; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key640 UNIQUE (number);


--
-- Name: orga orga_number_key641; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key641 UNIQUE (number);


--
-- Name: orga orga_number_key642; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key642 UNIQUE (number);


--
-- Name: orga orga_number_key643; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key643 UNIQUE (number);


--
-- Name: orga orga_number_key644; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key644 UNIQUE (number);


--
-- Name: orga orga_number_key645; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key645 UNIQUE (number);


--
-- Name: orga orga_number_key646; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key646 UNIQUE (number);


--
-- Name: orga orga_number_key647; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key647 UNIQUE (number);


--
-- Name: orga orga_number_key648; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key648 UNIQUE (number);


--
-- Name: orga orga_number_key649; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key649 UNIQUE (number);


--
-- Name: orga orga_number_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key65 UNIQUE (number);


--
-- Name: orga orga_number_key650; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key650 UNIQUE (number);


--
-- Name: orga orga_number_key651; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key651 UNIQUE (number);


--
-- Name: orga orga_number_key652; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key652 UNIQUE (number);


--
-- Name: orga orga_number_key653; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key653 UNIQUE (number);


--
-- Name: orga orga_number_key654; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key654 UNIQUE (number);


--
-- Name: orga orga_number_key655; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key655 UNIQUE (number);


--
-- Name: orga orga_number_key656; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key656 UNIQUE (number);


--
-- Name: orga orga_number_key657; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key657 UNIQUE (number);


--
-- Name: orga orga_number_key658; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key658 UNIQUE (number);


--
-- Name: orga orga_number_key659; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key659 UNIQUE (number);


--
-- Name: orga orga_number_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key66 UNIQUE (number);


--
-- Name: orga orga_number_key660; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key660 UNIQUE (number);


--
-- Name: orga orga_number_key661; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key661 UNIQUE (number);


--
-- Name: orga orga_number_key662; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key662 UNIQUE (number);


--
-- Name: orga orga_number_key663; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key663 UNIQUE (number);


--
-- Name: orga orga_number_key664; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key664 UNIQUE (number);


--
-- Name: orga orga_number_key665; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key665 UNIQUE (number);


--
-- Name: orga orga_number_key666; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key666 UNIQUE (number);


--
-- Name: orga orga_number_key667; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key667 UNIQUE (number);


--
-- Name: orga orga_number_key668; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key668 UNIQUE (number);


--
-- Name: orga orga_number_key669; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key669 UNIQUE (number);


--
-- Name: orga orga_number_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key67 UNIQUE (number);


--
-- Name: orga orga_number_key670; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key670 UNIQUE (number);


--
-- Name: orga orga_number_key671; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key671 UNIQUE (number);


--
-- Name: orga orga_number_key672; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key672 UNIQUE (number);


--
-- Name: orga orga_number_key673; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key673 UNIQUE (number);


--
-- Name: orga orga_number_key674; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key674 UNIQUE (number);


--
-- Name: orga orga_number_key675; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key675 UNIQUE (number);


--
-- Name: orga orga_number_key676; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key676 UNIQUE (number);


--
-- Name: orga orga_number_key677; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key677 UNIQUE (number);


--
-- Name: orga orga_number_key678; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key678 UNIQUE (number);


--
-- Name: orga orga_number_key679; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key679 UNIQUE (number);


--
-- Name: orga orga_number_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key68 UNIQUE (number);


--
-- Name: orga orga_number_key680; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key680 UNIQUE (number);


--
-- Name: orga orga_number_key681; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key681 UNIQUE (number);


--
-- Name: orga orga_number_key682; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key682 UNIQUE (number);


--
-- Name: orga orga_number_key683; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key683 UNIQUE (number);


--
-- Name: orga orga_number_key684; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key684 UNIQUE (number);


--
-- Name: orga orga_number_key685; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key685 UNIQUE (number);


--
-- Name: orga orga_number_key686; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key686 UNIQUE (number);


--
-- Name: orga orga_number_key687; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key687 UNIQUE (number);


--
-- Name: orga orga_number_key688; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key688 UNIQUE (number);


--
-- Name: orga orga_number_key689; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key689 UNIQUE (number);


--
-- Name: orga orga_number_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key69 UNIQUE (number);


--
-- Name: orga orga_number_key690; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key690 UNIQUE (number);


--
-- Name: orga orga_number_key691; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key691 UNIQUE (number);


--
-- Name: orga orga_number_key692; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key692 UNIQUE (number);


--
-- Name: orga orga_number_key693; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key693 UNIQUE (number);


--
-- Name: orga orga_number_key694; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key694 UNIQUE (number);


--
-- Name: orga orga_number_key695; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key695 UNIQUE (number);


--
-- Name: orga orga_number_key696; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key696 UNIQUE (number);


--
-- Name: orga orga_number_key697; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key697 UNIQUE (number);


--
-- Name: orga orga_number_key698; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key698 UNIQUE (number);


--
-- Name: orga orga_number_key699; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key699 UNIQUE (number);


--
-- Name: orga orga_number_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key7 UNIQUE (number);


--
-- Name: orga orga_number_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key70 UNIQUE (number);


--
-- Name: orga orga_number_key700; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key700 UNIQUE (number);


--
-- Name: orga orga_number_key701; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key701 UNIQUE (number);


--
-- Name: orga orga_number_key702; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key702 UNIQUE (number);


--
-- Name: orga orga_number_key703; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key703 UNIQUE (number);


--
-- Name: orga orga_number_key704; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key704 UNIQUE (number);


--
-- Name: orga orga_number_key705; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key705 UNIQUE (number);


--
-- Name: orga orga_number_key706; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key706 UNIQUE (number);


--
-- Name: orga orga_number_key707; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key707 UNIQUE (number);


--
-- Name: orga orga_number_key708; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key708 UNIQUE (number);


--
-- Name: orga orga_number_key709; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key709 UNIQUE (number);


--
-- Name: orga orga_number_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key71 UNIQUE (number);


--
-- Name: orga orga_number_key710; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key710 UNIQUE (number);


--
-- Name: orga orga_number_key711; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key711 UNIQUE (number);


--
-- Name: orga orga_number_key712; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key712 UNIQUE (number);


--
-- Name: orga orga_number_key713; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key713 UNIQUE (number);


--
-- Name: orga orga_number_key714; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key714 UNIQUE (number);


--
-- Name: orga orga_number_key715; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key715 UNIQUE (number);


--
-- Name: orga orga_number_key716; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key716 UNIQUE (number);


--
-- Name: orga orga_number_key717; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key717 UNIQUE (number);


--
-- Name: orga orga_number_key718; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key718 UNIQUE (number);


--
-- Name: orga orga_number_key719; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key719 UNIQUE (number);


--
-- Name: orga orga_number_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key72 UNIQUE (number);


--
-- Name: orga orga_number_key720; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key720 UNIQUE (number);


--
-- Name: orga orga_number_key721; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key721 UNIQUE (number);


--
-- Name: orga orga_number_key722; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key722 UNIQUE (number);


--
-- Name: orga orga_number_key723; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key723 UNIQUE (number);


--
-- Name: orga orga_number_key724; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key724 UNIQUE (number);


--
-- Name: orga orga_number_key725; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key725 UNIQUE (number);


--
-- Name: orga orga_number_key726; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key726 UNIQUE (number);


--
-- Name: orga orga_number_key727; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key727 UNIQUE (number);


--
-- Name: orga orga_number_key728; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key728 UNIQUE (number);


--
-- Name: orga orga_number_key729; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key729 UNIQUE (number);


--
-- Name: orga orga_number_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key73 UNIQUE (number);


--
-- Name: orga orga_number_key730; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key730 UNIQUE (number);


--
-- Name: orga orga_number_key731; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key731 UNIQUE (number);


--
-- Name: orga orga_number_key732; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key732 UNIQUE (number);


--
-- Name: orga orga_number_key733; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key733 UNIQUE (number);


--
-- Name: orga orga_number_key734; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key734 UNIQUE (number);


--
-- Name: orga orga_number_key735; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key735 UNIQUE (number);


--
-- Name: orga orga_number_key736; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key736 UNIQUE (number);


--
-- Name: orga orga_number_key737; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key737 UNIQUE (number);


--
-- Name: orga orga_number_key738; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key738 UNIQUE (number);


--
-- Name: orga orga_number_key739; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key739 UNIQUE (number);


--
-- Name: orga orga_number_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key74 UNIQUE (number);


--
-- Name: orga orga_number_key740; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key740 UNIQUE (number);


--
-- Name: orga orga_number_key741; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key741 UNIQUE (number);


--
-- Name: orga orga_number_key742; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key742 UNIQUE (number);


--
-- Name: orga orga_number_key743; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key743 UNIQUE (number);


--
-- Name: orga orga_number_key744; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key744 UNIQUE (number);


--
-- Name: orga orga_number_key745; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key745 UNIQUE (number);


--
-- Name: orga orga_number_key746; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key746 UNIQUE (number);


--
-- Name: orga orga_number_key747; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key747 UNIQUE (number);


--
-- Name: orga orga_number_key748; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key748 UNIQUE (number);


--
-- Name: orga orga_number_key749; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key749 UNIQUE (number);


--
-- Name: orga orga_number_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key75 UNIQUE (number);


--
-- Name: orga orga_number_key750; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key750 UNIQUE (number);


--
-- Name: orga orga_number_key751; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key751 UNIQUE (number);


--
-- Name: orga orga_number_key752; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key752 UNIQUE (number);


--
-- Name: orga orga_number_key753; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key753 UNIQUE (number);


--
-- Name: orga orga_number_key754; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key754 UNIQUE (number);


--
-- Name: orga orga_number_key755; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key755 UNIQUE (number);


--
-- Name: orga orga_number_key756; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key756 UNIQUE (number);


--
-- Name: orga orga_number_key757; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key757 UNIQUE (number);


--
-- Name: orga orga_number_key758; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key758 UNIQUE (number);


--
-- Name: orga orga_number_key759; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key759 UNIQUE (number);


--
-- Name: orga orga_number_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key76 UNIQUE (number);


--
-- Name: orga orga_number_key760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key760 UNIQUE (number);


--
-- Name: orga orga_number_key761; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key761 UNIQUE (number);


--
-- Name: orga orga_number_key762; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key762 UNIQUE (number);


--
-- Name: orga orga_number_key763; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key763 UNIQUE (number);


--
-- Name: orga orga_number_key764; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key764 UNIQUE (number);


--
-- Name: orga orga_number_key765; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key765 UNIQUE (number);


--
-- Name: orga orga_number_key766; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key766 UNIQUE (number);


--
-- Name: orga orga_number_key767; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key767 UNIQUE (number);


--
-- Name: orga orga_number_key768; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key768 UNIQUE (number);


--
-- Name: orga orga_number_key769; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key769 UNIQUE (number);


--
-- Name: orga orga_number_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key77 UNIQUE (number);


--
-- Name: orga orga_number_key770; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key770 UNIQUE (number);


--
-- Name: orga orga_number_key771; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key771 UNIQUE (number);


--
-- Name: orga orga_number_key772; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key772 UNIQUE (number);


--
-- Name: orga orga_number_key773; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key773 UNIQUE (number);


--
-- Name: orga orga_number_key774; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key774 UNIQUE (number);


--
-- Name: orga orga_number_key775; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key775 UNIQUE (number);


--
-- Name: orga orga_number_key776; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key776 UNIQUE (number);


--
-- Name: orga orga_number_key777; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key777 UNIQUE (number);


--
-- Name: orga orga_number_key778; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key778 UNIQUE (number);


--
-- Name: orga orga_number_key779; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key779 UNIQUE (number);


--
-- Name: orga orga_number_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key78 UNIQUE (number);


--
-- Name: orga orga_number_key780; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key780 UNIQUE (number);


--
-- Name: orga orga_number_key781; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key781 UNIQUE (number);


--
-- Name: orga orga_number_key782; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key782 UNIQUE (number);


--
-- Name: orga orga_number_key783; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key783 UNIQUE (number);


--
-- Name: orga orga_number_key784; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key784 UNIQUE (number);


--
-- Name: orga orga_number_key785; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key785 UNIQUE (number);


--
-- Name: orga orga_number_key786; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key786 UNIQUE (number);


--
-- Name: orga orga_number_key787; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key787 UNIQUE (number);


--
-- Name: orga orga_number_key788; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key788 UNIQUE (number);


--
-- Name: orga orga_number_key789; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key789 UNIQUE (number);


--
-- Name: orga orga_number_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key79 UNIQUE (number);


--
-- Name: orga orga_number_key790; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key790 UNIQUE (number);


--
-- Name: orga orga_number_key791; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key791 UNIQUE (number);


--
-- Name: orga orga_number_key792; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key792 UNIQUE (number);


--
-- Name: orga orga_number_key793; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key793 UNIQUE (number);


--
-- Name: orga orga_number_key794; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key794 UNIQUE (number);


--
-- Name: orga orga_number_key795; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key795 UNIQUE (number);


--
-- Name: orga orga_number_key796; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key796 UNIQUE (number);


--
-- Name: orga orga_number_key797; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key797 UNIQUE (number);


--
-- Name: orga orga_number_key798; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key798 UNIQUE (number);


--
-- Name: orga orga_number_key799; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key799 UNIQUE (number);


--
-- Name: orga orga_number_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key8 UNIQUE (number);


--
-- Name: orga orga_number_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key80 UNIQUE (number);


--
-- Name: orga orga_number_key800; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key800 UNIQUE (number);


--
-- Name: orga orga_number_key801; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key801 UNIQUE (number);


--
-- Name: orga orga_number_key802; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key802 UNIQUE (number);


--
-- Name: orga orga_number_key803; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key803 UNIQUE (number);


--
-- Name: orga orga_number_key804; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key804 UNIQUE (number);


--
-- Name: orga orga_number_key805; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key805 UNIQUE (number);


--
-- Name: orga orga_number_key806; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key806 UNIQUE (number);


--
-- Name: orga orga_number_key807; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key807 UNIQUE (number);


--
-- Name: orga orga_number_key808; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key808 UNIQUE (number);


--
-- Name: orga orga_number_key809; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key809 UNIQUE (number);


--
-- Name: orga orga_number_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key81 UNIQUE (number);


--
-- Name: orga orga_number_key810; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key810 UNIQUE (number);


--
-- Name: orga orga_number_key811; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key811 UNIQUE (number);


--
-- Name: orga orga_number_key812; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key812 UNIQUE (number);


--
-- Name: orga orga_number_key813; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key813 UNIQUE (number);


--
-- Name: orga orga_number_key814; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key814 UNIQUE (number);


--
-- Name: orga orga_number_key815; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key815 UNIQUE (number);


--
-- Name: orga orga_number_key816; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key816 UNIQUE (number);


--
-- Name: orga orga_number_key817; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key817 UNIQUE (number);


--
-- Name: orga orga_number_key818; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key818 UNIQUE (number);


--
-- Name: orga orga_number_key819; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key819 UNIQUE (number);


--
-- Name: orga orga_number_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key82 UNIQUE (number);


--
-- Name: orga orga_number_key820; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key820 UNIQUE (number);


--
-- Name: orga orga_number_key821; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key821 UNIQUE (number);


--
-- Name: orga orga_number_key822; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key822 UNIQUE (number);


--
-- Name: orga orga_number_key823; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key823 UNIQUE (number);


--
-- Name: orga orga_number_key824; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key824 UNIQUE (number);


--
-- Name: orga orga_number_key825; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key825 UNIQUE (number);


--
-- Name: orga orga_number_key826; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key826 UNIQUE (number);


--
-- Name: orga orga_number_key827; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key827 UNIQUE (number);


--
-- Name: orga orga_number_key828; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key828 UNIQUE (number);


--
-- Name: orga orga_number_key829; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key829 UNIQUE (number);


--
-- Name: orga orga_number_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key83 UNIQUE (number);


--
-- Name: orga orga_number_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key84 UNIQUE (number);


--
-- Name: orga orga_number_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key85 UNIQUE (number);


--
-- Name: orga orga_number_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key86 UNIQUE (number);


--
-- Name: orga orga_number_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key87 UNIQUE (number);


--
-- Name: orga orga_number_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key88 UNIQUE (number);


--
-- Name: orga orga_number_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key89 UNIQUE (number);


--
-- Name: orga orga_number_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key9 UNIQUE (number);


--
-- Name: orga orga_number_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key90 UNIQUE (number);


--
-- Name: orga orga_number_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key91 UNIQUE (number);


--
-- Name: orga orga_number_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key92 UNIQUE (number);


--
-- Name: orga orga_number_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key93 UNIQUE (number);


--
-- Name: orga orga_number_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key94 UNIQUE (number);


--
-- Name: orga orga_number_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key95 UNIQUE (number);


--
-- Name: orga orga_number_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key96 UNIQUE (number);


--
-- Name: orga orga_number_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key97 UNIQUE (number);


--
-- Name: orga orga_number_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key98 UNIQUE (number);


--
-- Name: orga orga_number_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_number_key99 UNIQUE (number);


--
-- Name: orga orga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_pkey PRIMARY KEY (id);


--
-- Name: plant plant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_pkey PRIMARY KEY (id);


--
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: yearly_supplier_snapshot yearly_supplier_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yearly_supplier_snapshot
    ADD CONSTRAINT yearly_supplier_snapshot_pkey PRIMARY KEY (id);


--
-- Name: yearly_team_cota_data yearly_team_cota_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yearly_team_cota_data
    ADD CONSTRAINT yearly_team_cota_data_pkey PRIMARY KEY (id);


--
-- Name: yearly_supplier_snapshot_year_vendorcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX yearly_supplier_snapshot_year_vendorcode ON public.yearly_supplier_snapshot USING btree (year, vendorcode);


--
-- Name: yearly_team_cota_data_year_vendorcode_purchasingorganisationcod; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX yearly_team_cota_data_year_vendorcode_purchasingorganisationcod ON public.yearly_team_cota_data USING btree (year, vendorcode, purchasingorganisationcode);


--
-- Name: answer answer_commenter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_commenter_fkey FOREIGN KEY (commenter) REFERENCES public.orga(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cached_selection_data cached_selection_data_commenter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cached_selection_data
    ADD CONSTRAINT cached_selection_data_commenter_fkey FOREIGN KEY (commenter) REFERENCES public.orga(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orga orga_manager_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_manager_fkey FOREIGN KEY (manager) REFERENCES public.orga(id);


--
-- Name: orga orga_plant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_plant_fkey FOREIGN KEY (plant) REFERENCES public.plant(id);


--
-- Name: orga orga_position_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_position_fkey FOREIGN KEY ("position") REFERENCES public."position"(id);


--
-- Name: orga orga_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orga
    ADD CONSTRAINT orga_team_fkey FOREIGN KEY (team) REFERENCES public.team(id);


--
-- Name: rd_vendor_master_data_stl rd_vendor_master_data_stl_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rd_vendor_master_data_stl
    ADD CONSTRAINT rd_vendor_master_data_stl_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);


--
-- Name: rd_vendor_master_data_syt rd_vendor_master_data_syt_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rd_vendor_master_data_syt
    ADD CONSTRAINT rd_vendor_master_data_syt_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);


--
-- Name: session session_orgaid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_orgaid_fkey FOREIGN KEY (orgaid) REFERENCES public.orga(id);


--
-- Name: team team_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_parent_fkey FOREIGN KEY (parent) REFERENCES public.team(id);


--
-- Name: yearly_team_cota_data yearly_team_cota_data_commenter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yearly_team_cota_data
    ADD CONSTRAINT yearly_team_cota_data_commenter_fkey FOREIGN KEY (commenter) REFERENCES public.orga(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

