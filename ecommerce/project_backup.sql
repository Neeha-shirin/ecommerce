--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: accounts_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    phone_number character varying(15),
    otp character varying(6),
    email_verified boolean NOT NULL,
    verification_code uuid NOT NULL
);


ALTER TABLE public.accounts_customuser OWNER TO postgres;

--
-- Name: accounts_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_groups OWNER TO postgres;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_customuser_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_customuser_groups_id_seq OWNED BY public.accounts_customuser_groups.id;


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_customuser_id_seq OWNER TO postgres;

--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_customuser_id_seq OWNED BY public.accounts_customuser.id;


--
-- Name: accounts_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_user_permissions OWNER TO postgres;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_customuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_customuser_user_permissions_id_seq OWNED BY public.accounts_customuser_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: core_banner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_banner (
    id bigint NOT NULL,
    title character varying(255),
    image character varying(100),
    description text
);


ALTER TABLE public.core_banner OWNER TO postgres;

--
-- Name: core_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_banner_id_seq OWNER TO postgres;

--
-- Name: core_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_banner_id_seq OWNED BY public.core_banner.id;


--
-- Name: core_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_category (
    id bigint NOT NULL,
    category_name character varying(100),
    is_available boolean NOT NULL,
    category_image character varying(100)
);


ALTER TABLE public.core_category OWNER TO postgres;

--
-- Name: core_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_category_id_seq OWNER TO postgres;

--
-- Name: core_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_category_id_seq OWNED BY public.core_category.id;


--
-- Name: core_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_order (
    id bigint NOT NULL,
    start_date timestamp with time zone NOT NULL,
    ordered_date timestamp with time zone,
    ordered boolean NOT NULL,
    order_id character varying(100),
    datetime_of_payment timestamp with time zone NOT NULL,
    order_delivered boolean NOT NULL,
    order_received boolean NOT NULL,
    user_id integer NOT NULL,
    stripe_payment_intent_id character varying(255)
);


ALTER TABLE public.core_order OWNER TO postgres;

--
-- Name: core_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_order_id_seq OWNER TO postgres;

--
-- Name: core_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_order_id_seq OWNED BY public.core_order.id;


--
-- Name: core_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    orderitem_id bigint NOT NULL
);


ALTER TABLE public.core_order_items OWNER TO postgres;

--
-- Name: core_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_order_items_id_seq OWNER TO postgres;

--
-- Name: core_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_order_items_id_seq OWNED BY public.core_order_items.id;


--
-- Name: core_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_orderitem (
    id bigint NOT NULL,
    ordered boolean NOT NULL,
    quantity integer NOT NULL,
    product_id bigint NOT NULL,
    user_id integer,
    CONSTRAINT core_orderitem_quantity_2e327e4a_check CHECK ((quantity >= 0))
);


ALTER TABLE public.core_orderitem OWNER TO postgres;

--
-- Name: core_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_orderitem_id_seq OWNER TO postgres;

--
-- Name: core_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_orderitem_id_seq OWNED BY public.core_orderitem.id;


--
-- Name: core_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_product (
    id bigint NOT NULL,
    name character varying(100),
    "desc" text NOT NULL,
    price double precision NOT NULL,
    category_id bigint NOT NULL,
    img character varying(100),
    product_available_count integer NOT NULL
);


ALTER TABLE public.core_product OWNER TO postgres;

--
-- Name: core_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_product_id_seq OWNER TO postgres;

--
-- Name: core_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_product_id_seq OWNED BY public.core_product.id;


--
-- Name: core_wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_wishlist (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.core_wishlist OWNER TO postgres;

--
-- Name: core_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_wishlist_id_seq OWNER TO postgres;

--
-- Name: core_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_wishlist_id_seq OWNED BY public.core_wishlist.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200),
    action_flag integer NOT NULL,
    change_message text,
    content_type_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: orderpayment_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderpayment_address (
    id bigint NOT NULL,
    full_name character varying(100) NOT NULL,
    phone_number character varying(15) NOT NULL,
    address_line text NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    zip_code character varying(10) NOT NULL,
    country character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.orderpayment_address OWNER TO postgres;

--
-- Name: orderpayment_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderpayment_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderpayment_address_id_seq OWNER TO postgres;

--
-- Name: orderpayment_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderpayment_address_id_seq OWNED BY public.orderpayment_address.id;


--
-- Name: orderpayment_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderpayment_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.orderpayment_customuser OWNER TO postgres;

--
-- Name: orderpayment_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderpayment_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.orderpayment_customuser_groups OWNER TO postgres;

--
-- Name: orderpayment_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderpayment_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderpayment_customuser_groups_id_seq OWNER TO postgres;

--
-- Name: orderpayment_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderpayment_customuser_groups_id_seq OWNED BY public.orderpayment_customuser_groups.id;


--
-- Name: orderpayment_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderpayment_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderpayment_customuser_id_seq OWNER TO postgres;

--
-- Name: orderpayment_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderpayment_customuser_id_seq OWNED BY public.orderpayment_customuser.id;


--
-- Name: orderpayment_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderpayment_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.orderpayment_customuser_user_permissions OWNER TO postgres;

--
-- Name: orderpayment_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderpayment_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderpayment_customuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: orderpayment_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderpayment_customuser_user_permissions_id_seq OWNED BY public.orderpayment_customuser_user_permissions.id;


--
-- Name: orderpayment_myorders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderpayment_myorders (
    id bigint NOT NULL,
    total numeric(10,2) NOT NULL,
    payment_method character varying(20) NOT NULL,
    is_paid boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    address_id bigint,
    user_id bigint NOT NULL,
    status character varying(20) NOT NULL,
    product_id bigint,
    ordered_date timestamp with time zone NOT NULL
);


ALTER TABLE public.orderpayment_myorders OWNER TO postgres;

--
-- Name: orderpayment_myorders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderpayment_myorders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderpayment_myorders_id_seq OWNER TO postgres;

--
-- Name: orderpayment_myorders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderpayment_myorders_id_seq OWNED BY public.orderpayment_myorders.id;


--
-- Name: orderpayment_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderpayment_payments (
    id bigint NOT NULL,
    payment_id character varying(100) NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_status character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.orderpayment_payments OWNER TO postgres;

--
-- Name: orderpayment_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderpayment_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderpayment_payments_id_seq OWNER TO postgres;

--
-- Name: orderpayment_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderpayment_payments_id_seq OWNED BY public.orderpayment_payments.id;


--
-- Name: accounts_customuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_id_seq'::regclass);


--
-- Name: accounts_customuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_groups_id_seq'::regclass);


--
-- Name: accounts_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_banner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_banner ALTER COLUMN id SET DEFAULT nextval('public.core_banner_id_seq'::regclass);


--
-- Name: core_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_category ALTER COLUMN id SET DEFAULT nextval('public.core_category_id_seq'::regclass);


--
-- Name: core_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order ALTER COLUMN id SET DEFAULT nextval('public.core_order_id_seq'::regclass);


--
-- Name: core_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order_items ALTER COLUMN id SET DEFAULT nextval('public.core_order_items_id_seq'::regclass);


--
-- Name: core_orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_orderitem ALTER COLUMN id SET DEFAULT nextval('public.core_orderitem_id_seq'::regclass);


--
-- Name: core_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_product ALTER COLUMN id SET DEFAULT nextval('public.core_product_id_seq'::regclass);


--
-- Name: core_wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_wishlist ALTER COLUMN id SET DEFAULT nextval('public.core_wishlist_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orderpayment_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_address ALTER COLUMN id SET DEFAULT nextval('public.orderpayment_address_id_seq'::regclass);


--
-- Name: orderpayment_customuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser ALTER COLUMN id SET DEFAULT nextval('public.orderpayment_customuser_id_seq'::regclass);


--
-- Name: orderpayment_customuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.orderpayment_customuser_groups_id_seq'::regclass);


--
-- Name: orderpayment_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.orderpayment_customuser_user_permissions_id_seq'::regclass);


--
-- Name: orderpayment_myorders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_myorders ALTER COLUMN id SET DEFAULT nextval('public.orderpayment_myorders_id_seq'::regclass);


--
-- Name: orderpayment_payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_payments ALTER COLUMN id SET DEFAULT nextval('public.orderpayment_payments_id_seq'::regclass);


--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser (id, password, last_login, is_superuser, username, is_staff, is_active, date_joined, first_name, last_name, email, phone_number, otp, email_verified, verification_code) FROM stdin;
15	pbkdf2_sha256$260000$YwguYp1VbjBdqY0orv5LXz$CiN9JINwS0RGbxDMN4UWNZ4Du1n/KRBZYV+L/CexrEs=	2024-12-10 20:40:13.151863+05:30	f	sana	f	f	2024-12-10 20:40:01.207002+05:30	fathima	sana	ppfathimathusana@gmail.com	07676767676	\N	f	f20e4c5e-4998-414b-8b7e-b49bb741278c
13	pbkdf2_sha256$260000$vnJiIpcJ7fCtIyhBhFBrGE$CK9n8HyDdFC/o1mFRTHcniM/RYVtUdq7NWmbH5qSvgc=	2025-01-12 13:50:51.581523+05:30	f	neehaa	f	t	2024-12-07 10:36:11.281056+05:30	neeha	shirin	neehasherin987@gmail.com	07676767676	\N	f	c47e4615-305d-454e-8db0-193b68a6bc13
25	pbkdf2_sha256$260000$muFi92tW6bji59wMTduw1f$iRffrTHhAdjlhQRgfKSXvxgKTPVt0k8jWjZQ9y1UlVk=	2025-01-12 23:37:43.683764+05:30	t	adminpanel	t	t	2025-01-10 11:39:14.155232+05:30				\N	\N	f	151bfb1f-726e-4b1b-a9f9-5f999ca0063e
16	pbkdf2_sha256$260000$gwkzIAyDJJK42a9SrTlkyb$m+kwoiNo/EfV466k3cPcZniX7gHrwiJ7xqrUhvxcdxs=	2025-01-06 15:38:23.376835+05:30	f	safa	f	t	2025-01-06 15:38:14.201729+05:30	fathima	safa	fathimathusafa7@gmail.com	01234567898	\N	f	3d880044-bcba-44cf-ade7-1571e84d825f
10	pbkdf2_sha256$260000$LCdEI8prDjX0uVhLSzxPf2$KeqDoMKPsn21jutvXUkzdNEHhEDP/kHZ3noNqvy1CZo=	2025-01-10 10:52:38.668061+05:30	t	shirin	t	f	2024-12-03 11:46:02.891911+05:30			temp_10@example.com	\N	\N	f	af7351c5-883b-40fe-a221-b3c37fd6bbfb
\.


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
14	pbkdf2_sha256$260000$9cAq93jDJNj2FlE8itHQHI$TJnaVqI71QJwzBuAnFtP5p9UnYaUXduG5V6q5sgm2B4=	2024-11-28 17:11:53.63035+05:30	f	sana			sana@gmail.com	f	t	2024-11-28 17:03:08.296537+05:30
1	pbkdf2_sha256$260000$ZS5BzZAMwJWTaWdtRkC6sn$hu9/6pZH8l1xhmzDz10l+ZRBrYicaf4OMZlwXwBvKiQ=	2024-11-30 15:05:04.345859+05:30	t	shirin				t	t	2024-11-18 11:37:21.768428+05:30
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_banner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_banner (id, title, image, description) FROM stdin;
2	BUY NOW!	banners/banner_2_5CU1Bv6.jpg	FLAT 20% OFF ON ALL PRODUCTS
\.


--
-- Data for Name: core_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_category (id, category_name, is_available, category_image) FROM stdin;
29	clenser	t	categories/clenser_SoKpBeF.webp
28	moisturizer	t	categories/moisturizer_ZcquwLP.webp
30	serum	t	categories/SERUMMMM.webp
\.


--
-- Data for Name: core_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_order (id, start_date, ordered_date, ordered, order_id, datetime_of_payment, order_delivered, order_received, user_id, stripe_payment_intent_id) FROM stdin;
1	2024-11-27 15:15:45.611025+05:30	2024-11-27 15:15:45.610301+05:30	f	\N	2024-11-27 15:15:45.611025+05:30	f	f	1	\N
3	2024-11-28 17:03:19.756007+05:30	2024-11-28 17:03:19.754015+05:30	f	\N	2024-11-28 17:03:19.756421+05:30	f	f	14	\N
10	2024-12-07 10:37:30.031001+05:30	2024-12-07 10:37:30.030014+05:30	f	\N	2024-12-07 10:37:30.031001+05:30	f	f	13	\N
11	2024-12-09 21:00:23.968475+05:30	2024-12-09 21:00:23.968475+05:30	f	\N	2024-12-09 21:00:23.968475+05:30	f	f	10	\N
12	2024-12-10 20:40:20.434736+05:30	2024-12-10 20:40:20.434736+05:30	f	\N	2024-12-10 20:40:20.434736+05:30	f	f	15	\N
13	2025-01-06 15:38:35.415+05:30	2025-01-06 15:38:35.415+05:30	f	\N	2025-01-06 15:38:35.415+05:30	f	f	16	\N
\.


--
-- Data for Name: core_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_order_items (id, order_id, orderitem_id) FROM stdin;
207	11	218
208	11	219
214	11	225
215	11	226
219	13	230
220	13	231
221	11	232
228	11	239
233	10	244
\.


--
-- Data for Name: core_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_orderitem (id, ordered, quantity, product_id, user_id) FROM stdin;
219	f	1	35	10
226	f	1	46	10
225	f	2	38	10
230	f	3	39	16
231	f	1	34	16
232	f	2	34	10
218	f	4	37	10
239	f	1	47	10
244	f	1	34	13
\.


--
-- Data for Name: core_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_product (id, name, "desc", price, category_id, img, product_available_count) FROM stdin;
39	haan	deeply clense you skin	800	29	products/images/haan_W31Cmjp.webp	45
38	Aqulogica	deeply clense your skin	500	29	products/images/shoot_1_bUSF20N.webp	67
34	Dot N Key	deeply clense your skin	600	29	products/images/facewash_0uZKxZO.webp	66
37	Dot N Key	get a healthy moist skin	500	28	products/images/m4_jzMWBLS.webp	55
41	Dot N Key	deeply clense your skin	499	29	products/images/clenser_dot_n_key.webp	44
44	Dot N Key	boost your glow	799	30	products/images/dot_serm_s9Wof4T.webp	77
45	9skin	boost your glow	999	30	products/images/serum_2_40oVf3Y.webp	77
46	Olay	boost your glow	699	30	products/images/serum_5_oJYOaxR.jpg	55
36	aquilogica	hydrate your skin	700	28	products/images/m6_HRCmi3y.webp	27
35	Dot N Key	hydrate your skin	600	28	products/images/m1_JoAROfu.webp	55
47	Aqulogica	keep hydrated	399	28	products/images/m6.webp	34
\.


--
-- Data for Name: core_wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_wishlist (id, product_id, user_id) FROM stdin;
8	36	10
9	37	15
10	36	15
13	37	10
14	37	13
15	36	13
18	34	13
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model, name) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
71	accounts	0001_initial	2025-01-12 02:56:40.060387+05:30
76	core	0001_initial	2025-01-12 02:56:40.071349+05:30
77	core	0002_auto_20241118_2117	2025-01-12 02:56:40.072345+05:30
78	core	0003_category_product	2025-01-12 02:56:40.074339+05:30
79	core	0004_category_cimg	2025-01-12 02:56:40.076332+05:30
80	core	0005_auto_20241120_2249	2025-01-12 02:56:40.077328+05:30
81	core	0006_auto_20241121_2308	2025-01-12 02:56:40.079321+05:30
82	core	0007_auto_20241122_1624	2025-01-12 02:56:40.081734+05:30
83	core	0008_category_is_available	2025-01-12 02:56:40.084956+05:30
84	core	0009_category_category_image	2025-01-12 02:56:40.086365+05:30
85	core	0010_remove_category_category_image	2025-01-12 02:56:40.088291+05:30
86	core	0011_auto_20241123_1354	2025-01-12 02:56:40.090286+05:30
87	core	0012_order_orderitem	2025-01-12 02:56:40.092278+05:30
88	core	0013_auto_20241128_1630	2025-01-12 02:56:40.093274+05:30
89	core	0014_auto_20241129_1123	2025-01-12 02:56:40.095339+05:30
90	core	0015_delete_customer	2025-01-12 02:56:40.097262+05:30
91	core	0016_alter_orderitem_quantity	2025-01-12 02:56:40.099258+05:30
92	core	0017_wishlist	2025-01-12 02:56:40.102312+05:30
93	core	0018_delete_checkoutaddress	2025-01-12 02:56:40.104271+05:30
94	core	0019_order_stripe_payment_intent_id	2025-01-12 02:56:40.105235+05:30
95	core	0020_auto_20241225_0102	2025-01-12 02:56:40.107228+05:30
96	core	0021_coupon	2025-01-12 02:56:40.108244+05:30
97	core	0022_delete_coupon	2025-01-12 02:56:40.110218+05:30
98	core	0023_coupon	2025-01-12 02:56:40.111313+05:30
99	core	0024_rename_is_active_coupon_active	2025-01-12 02:56:40.113208+05:30
100	core	0025_banner	2025-01-12 02:56:40.116651+05:30
101	core	0026_remove_product_product_available_count	2025-01-12 02:56:40.11919+05:30
102	core	0027_product_product_available_count	2025-01-12 02:56:40.120185+05:30
103	core	0028_auto_20250103_1016	2025-01-12 02:56:40.122179+05:30
111	sessions	0001_initial	2025-01-12 02:56:40.138126+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xmt9j3oc82adzeq5i72q439v5wrqtdeq	eyJvdHAiOjY4MjMsIm90cF9leHBpcnkiOiIyMDI0LTExLTMwVDA0OjU4OjIzLjY2OTUzNSswMDowMCJ9:1tHFPI:yE6cC9YoYFEGO110CuhXudT_gegVC__mCxWXLvN_6Qk	2024-12-14 10:18:36.850482+05:30
16hnpn5fe3duuylasc6wydnikzukgzu5	.eJxFjEEOgyAQRe8y26oZUCtl1UN0TyYVKomoAUzbGO9eaEzczX__v9lgjgtIVmNb5FPpz2L9FyRw5E3JWFnjA4VsO8lZxQRruLggSkQoYA3aq54igdz-YSKnkxrIUKqN9SGqgxmKg3UZj3TSY7kM86SVsXrsE0TG66a9duImUqcd2fF8EIc1S939lXn1nF32KYT37LOcXNj3H85kQdo:1tHJ8l:uv0z7bTpu27G3hR2FyP9tjooFXQiffrchNC1yQqfO2M	2024-12-14 14:17:47.407481+05:30
toe0op255d9i71aodh5es4vpmdnbaekb	.eJxVjEEOwiAQRe_C2hDKDNK6dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uL6kCdfsdI6SF1J3ynept1muu6TFHvij5o0-PM8rwe7t9BoVa-tQczIHjC7Mhag8RA0pMxkjoUgIjIDtBw9GQdy4A-9eitM5liPkf1_gDybzfp:1tRTAS:qYoVGhwdADS6vVxW27k5Z9uc0xr-paUP1xyu7fWpOyI	2025-01-11 15:01:32.384175+05:30
b7er7gapkvz5zntqk2aio0p89nqzrd64	.eJxdy0EOwiAQheG7zNa2GSjSyspDuCfEToWkhQZq1DS9u2BiTNzN_C_fBmFdQPV9e6zKqem5uPgCBRy5qBmrW7wwVJwpIRsmJJPdAVEhQgX3RFEPZjWgts_jzUyZeiJr8j66mFb9Fyfza8m66HyOiw2e9OhoGnI-cewkR4YiTzQbN319spTBqe_Ot5Kba5iLNik9QiyU8Rb2_Q2VWkFP:1tHKSp:1mvMmoaThHW6PKBZfyCnzbQo8xQnP_XmKzDdFewTe_c	2024-12-14 15:42:35.969842+05:30
6oaa1evsb6okuwmtw9vok5mr4tg7w6s4	.eJxVjMsOwiAQRf-FtSG8hoBL934DGWZAqoYmpV0Z_12bdKHbe865L5FwW1vaRlnSxOIstBan3zEjPUrfCd-x32ZJc1-XKctdkQcd8jpzeV4O9--g4Wjf2tnIBi2QVxm186wi5BIqZKhUdbSBcnWFWFdUnqvVDMUFsB4NGXDi_QEYGTiL:1tIMmE:xRPM90lG3_HG1XtR3pwnc4CJ66QX72b4AQoUtNmGA_c	2024-12-17 12:22:54.60366+05:30
208jblqxqt5fl4ub4owzvit42nvdyatw	.eJxFjEEOgyAQRe_CtmoGqmBZ9RDdk0mFSiJiANM2xrsXGhN389__bzbi00Ik71tWlVPpz2LDl0jCgHU10Br4g4KkQjLetIIJRi8AEoBUZI06qAETErn9w4xOZzWiwVwbG2JSBzOYRusKnvCkx3IZ_ayVsXoaMgTKrm3HRX_rc6cd2ul8kMa1SOL-Krx5eld8jPHtQ5GzS_b9B9SgQeE:1tUk1C:1r7EonByVsmps4KrJaNaEmgXws4LJXuHDDx9c4dFllk	2025-01-20 15:37:30.421362+05:30
cdpuk6wemhdcyd9svub3nzw5exrfjo36	.eJxVjEEOwiAQRe_C2hAYCkNduvcMZOgMtmpoUtqV8e7apAvd_vfef6lE2zqmrcmSJlZnBV6dfsdMw0PqTvhO9TbrYa7rMmW9K_qgTV9nluflcP8ORmrjtzYBuWdHKADOF_YBQi9GCnY5AGFnLaKNkRCMAxds4ex6m70VMjF79f4A6JQ3FA:1tX2ND:6H7k2BroT2qmQd1yAIHv0BTcxVWQrNgYvcMifXsSDGI	2025-01-26 23:37:43.685511+05:30
6jr4xyg8s82t5lmmb6n772drpm8jjy80	.eJxFjEEOwiAQRe8yW9tmwFaFlYdwTyaWWpJSCNCoaXp3wdSY2cy8P--v4JIHyTrBqrIq_fImvEECR97WjNcMb6yTTEh-aUSHXOABUSJCBUvUQfWUCOT6PWayOquRZsrxYEJMamcDpdHYgif60_3Tj27WajB66jPE8-k3OdOWzJSp93tFGpeiXR8laO7OlgKK8elCsRk_trBtH3DxQuU:1tL1rg:QS2WXHNbvOA_aZYUGrT-ti7zq_A9uzAC4g9gRJRsoa0	2024-12-24 20:39:32.292007+05:30
\.


--
-- Data for Name: orderpayment_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderpayment_address (id, full_name, phone_number, address_line, city, state, zip_code, country, user_id) FROM stdin;
1	fathima sana	08787878787	kannur carltrex\r\nkannur town	kannur	kerala	12345	India	13
9	fathima sana	07676767676	kannur carltrex\r\nkannur town	kannur	kerala	12345	India	10
10	shirin	9898989898	thalassery	kannur	kerala	12345	India	10
11	shirin	9898989898	kannur carltrex\r\nkannur town	kannur	kerala	12345	India	13
12	fathima safa	01234567898	kannur carltrex\r\nkannur town	kannur	kerala	12345	India	16
\.


--
-- Data for Name: orderpayment_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderpayment_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: orderpayment_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderpayment_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: orderpayment_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderpayment_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: orderpayment_myorders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderpayment_myorders (id, total, payment_method, is_paid, created_at, address_id, user_id, status, product_id, ordered_date) FROM stdin;
124	600.00	COD	f	2025-01-10 12:09:38.908232+05:30	1	13	Pending	\N	2025-01-10 12:09:38.908232+05:30
125	500.00	STRIPE	f	2025-01-10 12:12:46.167017+05:30	1	13	Pending	\N	2025-01-10 12:12:46.165951+05:30
126	500.00	STRIPE	f	2025-01-10 12:13:19.444095+05:30	1	13	Pending	\N	2025-01-10 12:13:19.444095+05:30
127	500.00	STRIPE	f	2025-01-10 12:13:26.054853+05:30	1	13	Pending	\N	2025-01-10 12:13:26.054853+05:30
107	600.00	COD	f	2025-01-02 11:50:45.685041+05:30	1	13	Cancelled	\N	2025-01-02 11:50:45.685041+05:30
108	3400.00	COD	f	2025-01-02 12:12:02.442683+05:30	10	10	Delivered	34	2025-01-02 12:12:02.442683+05:30
82	1100.00	COD	f	2024-12-31 10:42:24.730341+05:30	10	10	Pending	\N	2025-01-02 11:50:08.344214+05:30
94	1600.00	COD	f	2025-01-01 12:08:42.24122+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
67	1800.00	COD	f	2024-12-30 12:24:50.54209+05:30	1	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
105	1700.00	COD	f	2025-01-02 11:46:40.684852+05:30	1	13	Cancelled	36	2025-01-02 11:50:08.344214+05:30
66	1800.00	COD	f	2024-12-30 12:12:19.62763+05:30	1	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
86	1800.00	COD	f	2024-12-31 14:16:00.447643+05:30	10	10	Pending	\N	2025-01-02 11:50:08.344214+05:30
109	3500.00	COD	f	2025-01-03 11:25:27.048975+05:30	11	13	Pending	\N	2025-01-03 11:25:27.046889+05:30
88	900.00	COD	f	2024-12-31 15:14:00.960434+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
90	2000.00	STRIPE	f	2025-01-01 11:16:10.182628+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
91	3500.00	COD	f	2025-01-01 11:41:45.349285+05:30	1	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
92	600.00	COD	f	2025-01-01 11:43:53.721709+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
110	800.00	STRIPE	f	2025-01-03 12:22:50.390262+05:30	1	13	Cancelled	\N	2025-01-03 12:22:50.390262+05:30
128	500.00	COD	f	2025-01-10 12:13:32.359145+05:30	1	13	Pending	\N	2025-01-10 12:13:32.359145+05:30
95	500.00	COD	f	2025-01-01 12:22:05.105547+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
96	500.00	COD	f	2025-01-01 12:24:23.143972+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
97	2300.00	COD	f	2025-01-01 12:38:44.141754+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
84	3400.00	COD	f	2024-12-31 12:27:58.818104+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
83	1700.00	COD	f	2024-12-31 10:50:28.600464+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
85	500.00	COD	f	2024-12-31 12:34:41.970979+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
98	900.00	COD	f	2025-01-01 12:48:25.670362+05:30	1	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
89	4300.00	COD	f	2025-01-01 11:10:49.805785+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
129	500.00	STRIPE	f	2025-01-12 01:10:35.365909+05:30	1	13	Pending	\N	2025-01-12 01:10:35.362918+05:30
100	1400.00	STRIPE	f	2025-01-01 15:31:03.726866+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
101	1400.00	STRIPE	f	2025-01-01 15:36:25.775919+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
102	1400.00	STRIPE	f	2025-01-01 15:40:47.051873+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
103	3000.00	COD	f	2025-01-01 16:19:56.009808+05:30	1	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
104	500.00	COD	f	2025-01-02 11:31:09.838187+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
111	3400.00	COD	f	2025-01-04 10:07:12.617115+05:30	10	10	Pending	\N	2025-01-04 10:07:12.615363+05:30
112	2200.00	STRIPE	f	2025-01-04 10:08:00.835792+05:30	1	13	Pending	\N	2025-01-04 10:08:00.835792+05:30
113	1399.00	STRIPE	f	2025-01-04 14:19:00.035369+05:30	11	13	Cancelled	\N	2025-01-04 14:19:00.03344+05:30
106	900.00	COD	f	2025-01-02 11:50:23.80538+05:30	1	13	Cancelled	\N	2025-01-02 11:50:23.80538+05:30
87	1700.00	COD	f	2024-12-31 14:30:09.063656+05:30	10	10	Delivered	\N	2025-01-02 11:50:08.344214+05:30
61	800.00	STRIPE	f	2024-12-28 15:07:12.621013+05:30	1	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
130	500.00	STRIPE	f	2025-01-12 01:11:25.586696+05:30	1	13	Pending	\N	2025-01-12 01:11:25.585699+05:30
114	600.00	COD	f	2025-01-06 15:38:57.915376+05:30	12	16	Cancelled	\N	2025-01-06 15:38:57.91156+05:30
115	1100.00	COD	f	2025-01-06 15:54:56.779967+05:30	12	16	Pending	\N	2025-01-06 15:54:56.779967+05:30
116	7696.00	COD	f	2025-01-07 21:17:42.802764+05:30	11	13	Pending	\N	2025-01-07 21:17:42.799601+05:30
99	5400.00	COD	f	2025-01-01 15:27:51.583512+05:30	11	13	Cancelled	\N	2025-01-02 11:50:08.344214+05:30
117	2100.00	STRIPE	f	2025-01-07 22:46:39.903207+05:30	11	13	Pending	\N	2025-01-07 22:46:39.903207+05:30
62	1700.00	STRIPE	f	2024-12-28 15:09:45.421706+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
118	3100.00	COD	f	2025-01-08 15:24:08.163375+05:30	11	13	Pending	\N	2025-01-08 15:24:08.160591+05:30
64	900.00	COD	f	2024-12-29 13:03:30.581733+05:30	11	13	Pending	\N	2025-01-02 11:50:08.344214+05:30
119	500.00	COD	f	2025-01-08 15:26:14.124707+05:30	11	13	Pending	\N	2025-01-08 15:26:14.124707+05:30
120	500.00	COD	f	2025-01-08 15:26:31.658692+05:30	11	13	Pending	\N	2025-01-08 15:26:31.658692+05:30
121	500.00	COD	f	2025-01-08 15:28:40.757477+05:30	1	13	Pending	\N	2025-01-08 15:28:40.757477+05:30
122	500.00	COD	f	2025-01-08 15:31:35.62542+05:30	11	13	Pending	\N	2025-01-08 15:31:35.62542+05:30
131	500.00	COD	f	2025-01-12 01:11:59.686686+05:30	1	13	Pending	\N	2025-01-12 01:11:59.685886+05:30
123	600.00	STRIPE	f	2025-01-10 12:09:28.395038+05:30	1	13	Cancelled	\N	2025-01-10 12:09:28.392059+05:30
132	500.00	COD	f	2025-01-12 13:51:19.404916+05:30	1	13	Pending	\N	2025-01-12 13:51:19.403917+05:30
\.


--
-- Data for Name: orderpayment_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderpayment_payments (id, payment_id, amount, payment_status, created_at, order_id) FROM stdin;
24	pi_3QawSKGs9MNDXGos0oNVzvXj	800.00	Pending	2024-12-28 15:07:13.324385+05:30	61
25	pi_3QawUnGs9MNDXGos0fpGB6CT	1700.00	Pending	2024-12-28 15:09:46.230972+05:30	62
26	pi_3QcKkwGs9MNDXGos0UkZF2d1	2000.00	Pending	2025-01-01 11:16:11.058384+05:30	90
27	pi_3QcOjbGs9MNDXGos1ekWGNAA	1400.00	Pending	2025-01-01 15:31:04.485409+05:30	100
29	pi_3QcOonGs9MNDXGos1Rr2AmpA	1400.00	Pending	2025-01-01 15:36:26.274282+05:30	101
30	pi_3QcOt0Gs9MNDXGos0aQaVcTG	1400.00	Pending	2025-01-01 15:40:47.677399+05:30	102
31	pi_3Qd4kXGs9MNDXGos1NqHSc5R	800.00	Pending	2025-01-03 12:22:51.347168+05:30	110
33	pi_3QdP7dGs9MNDXGos1xTLVIWB	2200.00	Pending	2025-01-04 10:08:01.780832+05:30	112
34	pi_3QdT2WGs9MNDXGos1Ha1rkHZ	1399.00	Pending	2025-01-04 14:19:00.915955+05:30	113
35	pi_3QegOSGs9MNDXGos1SHydKuC	2100.00	Pending	2025-01-07 22:46:40.934014+05:30	117
36	pi_3QfbsSGs9MNDXGos0wQGuItQ	600.00	Pending	2025-01-10 12:09:29.106262+05:30	123
37	pi_3QfbvfGs9MNDXGos1jkjgSNh	500.00	Pending	2025-01-10 12:12:48.009554+05:30	125
39	pi_3QfbwBGs9MNDXGos1of84GoW	500.00	Pending	2025-01-10 12:13:19.989625+05:30	126
40	pi_3QfbwHGs9MNDXGos16p5RbPO	500.00	Pending	2025-01-10 12:13:26.585314+05:30	127
41	pi_3QgAXvGs9MNDXGos1Jq93ZcP	500.00	Pending	2025-01-12 01:10:36.333965+05:30	129
43	pi_3QgAYjGs9MNDXGos075rIglf	500.00	Pending	2025-01-12 01:11:26.402297+05:30	130
\.


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 1, false);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 25, true);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 14, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_banner_id_seq', 3, true);


--
-- Name: core_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_category_id_seq', 30, true);


--
-- Name: core_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_order_id_seq', 13, true);


--
-- Name: core_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_order_items_id_seq', 233, true);


--
-- Name: core_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_orderitem_id_seq', 244, true);


--
-- Name: core_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_product_id_seq', 47, true);


--
-- Name: core_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_wishlist_id_seq', 18, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 111, true);


--
-- Name: orderpayment_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderpayment_address_id_seq', 12, true);


--
-- Name: orderpayment_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderpayment_customuser_groups_id_seq', 1, false);


--
-- Name: orderpayment_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderpayment_customuser_id_seq', 1, false);


--
-- Name: orderpayment_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderpayment_customuser_user_permissions_id_seq', 1, false);


--
-- Name: orderpayment_myorders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderpayment_myorders_id_seq', 132, true);


--
-- Name: orderpayment_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderpayment_payments_id_seq', 43, true);


--
-- Name: accounts_customuser accounts_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_email_key UNIQUE (email);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq UNIQUE (customuser_id, group_id);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_customuser_id_permission_9632a709_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_customuser_id_permission_9632a709_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_banner core_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_banner
    ADD CONSTRAINT core_banner_pkey PRIMARY KEY (id);


--
-- Name: core_category core_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_category
    ADD CONSTRAINT core_category_pkey PRIMARY KEY (id);


--
-- Name: core_order_items core_order_items_order_id_orderitem_id_f9cea05f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_order_id_orderitem_id_f9cea05f_uniq UNIQUE (order_id, orderitem_id);


--
-- Name: core_order_items core_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_pkey PRIMARY KEY (id);


--
-- Name: core_order core_order_order_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_order_id_key UNIQUE (order_id);


--
-- Name: core_order core_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order
    ADD CONSTRAINT core_order_pkey PRIMARY KEY (id);


--
-- Name: core_orderitem core_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_pkey PRIMARY KEY (id);


--
-- Name: core_product core_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_product
    ADD CONSTRAINT core_product_pkey PRIMARY KEY (id);


--
-- Name: core_wishlist core_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_wishlist
    ADD CONSTRAINT core_wishlist_pkey PRIMARY KEY (id);


--
-- Name: core_wishlist core_wishlist_user_id_product_id_3d13f6a0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_wishlist
    ADD CONSTRAINT core_wishlist_user_id_product_id_3d13f6a0_uniq UNIQUE (user_id, product_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orderpayment_address orderpayment_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_address
    ADD CONSTRAINT orderpayment_address_pkey PRIMARY KEY (id);


--
-- Name: orderpayment_customuser_groups orderpayment_customuser__customuser_id_group_id_c9a2ca6b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_groups
    ADD CONSTRAINT orderpayment_customuser__customuser_id_group_id_c9a2ca6b_uniq UNIQUE (customuser_id, group_id);


--
-- Name: orderpayment_customuser_user_permissions orderpayment_customuser__customuser_id_permission_69374e41_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_user_permissions
    ADD CONSTRAINT orderpayment_customuser__customuser_id_permission_69374e41_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: orderpayment_customuser_groups orderpayment_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_groups
    ADD CONSTRAINT orderpayment_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: orderpayment_customuser orderpayment_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser
    ADD CONSTRAINT orderpayment_customuser_pkey PRIMARY KEY (id);


--
-- Name: orderpayment_customuser_user_permissions orderpayment_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_user_permissions
    ADD CONSTRAINT orderpayment_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: orderpayment_customuser orderpayment_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser
    ADD CONSTRAINT orderpayment_customuser_username_key UNIQUE (username);


--
-- Name: orderpayment_myorders orderpayment_myorders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_myorders
    ADD CONSTRAINT orderpayment_myorders_pkey PRIMARY KEY (id);


--
-- Name: orderpayment_payments orderpayment_payments_order_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_payments
    ADD CONSTRAINT orderpayment_payments_order_id_key UNIQUE (order_id);


--
-- Name: orderpayment_payments orderpayment_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_payments
    ADD CONSTRAINT orderpayment_payments_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_email_4fd8e7ce_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_email_4fd8e7ce_like ON public.accounts_customuser USING btree (email varchar_pattern_ops);


--
-- Name: accounts_customuser_groups_customuser_id_bc55088e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_groups_customuser_id_bc55088e ON public.accounts_customuser_groups USING btree (customuser_id);


--
-- Name: accounts_customuser_groups_group_id_86ba5f9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_groups_group_id_86ba5f9e ON public.accounts_customuser_groups USING btree (group_id);


--
-- Name: accounts_customuser_user_permissions_customuser_id_0deaefae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_user_permissions_customuser_id_0deaefae ON public.accounts_customuser_user_permissions USING btree (customuser_id);


--
-- Name: accounts_customuser_user_permissions_permission_id_aea3d0e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_user_permissions_permission_id_aea3d0e5 ON public.accounts_customuser_user_permissions USING btree (permission_id);


--
-- Name: accounts_customuser_username_722f3555_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_username_722f3555_like ON public.accounts_customuser USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_order_items_order_id_c5dde6c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_order_items_order_id_c5dde6c1 ON public.core_order_items USING btree (order_id);


--
-- Name: core_order_items_orderitem_id_e44f86b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_order_items_orderitem_id_e44f86b6 ON public.core_order_items USING btree (orderitem_id);


--
-- Name: core_order_order_id_0e3b3bdf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_order_order_id_0e3b3bdf_like ON public.core_order USING btree (order_id varchar_pattern_ops);


--
-- Name: core_order_user_id_b03bbffd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_order_user_id_b03bbffd ON public.core_order USING btree (user_id);


--
-- Name: core_orderitem_product_id_0c2047cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_orderitem_product_id_0c2047cd ON public.core_orderitem USING btree (product_id);


--
-- Name: core_orderitem_user_id_323fe695; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_orderitem_user_id_323fe695 ON public.core_orderitem USING btree (user_id);


--
-- Name: core_product_category_id_b9d8ff9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_product_category_id_b9d8ff9f ON public.core_product USING btree (category_id);


--
-- Name: core_wishlist_product_id_ed80ff10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_wishlist_product_id_ed80ff10 ON public.core_wishlist USING btree (product_id);


--
-- Name: core_wishlist_user_id_6ebbf187; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_wishlist_user_id_6ebbf187 ON public.core_wishlist USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orderpayment_address_user_id_155a3bfa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_address_user_id_155a3bfa ON public.orderpayment_address USING btree (user_id);


--
-- Name: orderpayment_customuser_groups_customuser_id_2c97032f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_customuser_groups_customuser_id_2c97032f ON public.orderpayment_customuser_groups USING btree (customuser_id);


--
-- Name: orderpayment_customuser_groups_group_id_e2a18f28; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_customuser_groups_group_id_e2a18f28 ON public.orderpayment_customuser_groups USING btree (group_id);


--
-- Name: orderpayment_customuser_user_permissions_customuser_id_1b17d1e0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_customuser_user_permissions_customuser_id_1b17d1e0 ON public.orderpayment_customuser_user_permissions USING btree (customuser_id);


--
-- Name: orderpayment_customuser_user_permissions_permission_id_ab955381; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_customuser_user_permissions_permission_id_ab955381 ON public.orderpayment_customuser_user_permissions USING btree (permission_id);


--
-- Name: orderpayment_customuser_username_8b687f6a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_customuser_username_8b687f6a_like ON public.orderpayment_customuser USING btree (username varchar_pattern_ops);


--
-- Name: orderpayment_myorders_address_id_16ede851; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_myorders_address_id_16ede851 ON public.orderpayment_myorders USING btree (address_id);


--
-- Name: orderpayment_myorders_product_id_abac81ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_myorders_product_id_abac81ef ON public.orderpayment_myorders USING btree (product_id);


--
-- Name: orderpayment_myorders_user_id_88a5ecd7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orderpayment_myorders_user_id_88a5ecd7 ON public.orderpayment_myorders USING btree (user_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser__customuser_id_0deaefae_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__customuser_id_0deaefae_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser__customuser_id_bc55088e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser__customuser_id_bc55088e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_items core_order_items_order_id_c5dde6c1_fk_core_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_order_id_c5dde6c1_fk_core_order_id FOREIGN KEY (order_id) REFERENCES public.core_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_order_items core_order_items_orderitem_id_e44f86b6_fk_core_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_order_items
    ADD CONSTRAINT core_order_items_orderitem_id_e44f86b6_fk_core_orderitem_id FOREIGN KEY (orderitem_id) REFERENCES public.core_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_product_id_0c2047cd_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_product_id_0c2047cd_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_orderitem core_orderitem_user_id_fk_customuser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_user_id_fk_customuser FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) ON DELETE CASCADE;


--
-- Name: core_orderitem core_orderitem_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_orderitem
    ADD CONSTRAINT core_orderitem_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id);


--
-- Name: core_product core_product_category_id_b9d8ff9f_fk_core_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_product
    ADD CONSTRAINT core_product_category_id_b9d8ff9f_fk_core_category_id FOREIGN KEY (category_id) REFERENCES public.core_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_wishlist core_wishlist_product_id_ed80ff10_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_wishlist
    ADD CONSTRAINT core_wishlist_product_id_ed80ff10_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_wishlist core_wishlist_user_id_6ebbf187_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_wishlist
    ADD CONSTRAINT core_wishlist_user_id_6ebbf187_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: django_admin_log django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: orderpayment_address orderpayment_address_user_id_155a3bfa_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_address
    ADD CONSTRAINT orderpayment_address_user_id_155a3bfa_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_customuser_user_permissions orderpayment_customu_customuser_id_1b17d1e0_fk_orderpaym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_user_permissions
    ADD CONSTRAINT orderpayment_customu_customuser_id_1b17d1e0_fk_orderpaym FOREIGN KEY (customuser_id) REFERENCES public.orderpayment_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_customuser_groups orderpayment_customu_customuser_id_2c97032f_fk_orderpaym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_groups
    ADD CONSTRAINT orderpayment_customu_customuser_id_2c97032f_fk_orderpaym FOREIGN KEY (customuser_id) REFERENCES public.orderpayment_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_customuser_groups orderpayment_customu_group_id_e2a18f28_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_customuser_groups
    ADD CONSTRAINT orderpayment_customu_group_id_e2a18f28_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_myorders orderpayment_myorder_address_id_16ede851_fk_orderpaym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_myorders
    ADD CONSTRAINT orderpayment_myorder_address_id_16ede851_fk_orderpaym FOREIGN KEY (address_id) REFERENCES public.orderpayment_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_myorders orderpayment_myorder_user_id_88a5ecd7_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_myorders
    ADD CONSTRAINT orderpayment_myorder_user_id_88a5ecd7_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_myorders orderpayment_myorders_product_id_abac81ef_fk_core_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_myorders
    ADD CONSTRAINT orderpayment_myorders_product_id_abac81ef_fk_core_product_id FOREIGN KEY (product_id) REFERENCES public.core_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orderpayment_payments orderpayment_payment_order_id_d6692797_fk_orderpaym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderpayment_payments
    ADD CONSTRAINT orderpayment_payment_order_id_d6692797_fk_orderpaym FOREIGN KEY (order_id) REFERENCES public.orderpayment_myorders(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

