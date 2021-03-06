--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

--
-- Name: AdvertAgencySchema; Type: SCHEMA; Schema: -; Owner: vladiknaska
--

CREATE SCHEMA "AdvertAgencySchema";


ALTER SCHEMA "AdvertAgencySchema" OWNER TO vladiknaska;

--
-- Name: status; Type: TYPE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TYPE "AdvertAgencySchema".status AS ENUM (
    'approved',
    'denied',
    'paid',
    'closed'
);


ALTER TYPE "AdvertAgencySchema".status OWNER TO vladiknaska;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Customer; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."Customer" (
    id integer NOT NULL,
    full_name character(256) NOT NULL,
    phone_number character(30),
    email character(256)
);


ALTER TABLE "AdvertAgencySchema"."Customer" OWNER TO vladiknaska;

--
-- Name: Material; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."Material" (
    id integer NOT NULL,
    name character(256) NOT NULL,
    measure character(128),
    price_per_item money
);


ALTER TABLE "AdvertAgencySchema"."Material" OWNER TO vladiknaska;

--
-- Name: MaterialPerOrder; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."MaterialPerOrder" (
    id integer NOT NULL,
    material_id integer NOT NULL,
    amount double precision DEFAULT 1
);


ALTER TABLE "AdvertAgencySchema"."MaterialPerOrder" OWNER TO vladiknaska;

--
-- Name: Order; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."Order" (
    id integer NOT NULL,
    order_content_id integer NOT NULL,
    customer_id integer NOT NULL,
    paid_at date,
    status character(128)
);


ALTER TABLE "AdvertAgencySchema"."Order" OWNER TO vladiknaska;

--
-- Name: OrderContent; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."OrderContent" (
    id integer NOT NULL,
    service_id integer NOT NULL,
    amount double precision DEFAULT 1,
    materials_id integer NOT NULL,
    performer_id integer NOT NULL,
    comments character(1024)
);


ALTER TABLE "AdvertAgencySchema"."OrderContent" OWNER TO vladiknaska;

--
-- Name: Performer; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."Performer" (
    id integer NOT NULL,
    full_name character(256) NOT NULL,
    phone_number character(30)
);


ALTER TABLE "AdvertAgencySchema"."Performer" OWNER TO vladiknaska;

--
-- Name: PriceList; Type: TABLE; Schema: AdvertAgencySchema; Owner: vladiknaska
--

CREATE TABLE "AdvertAgencySchema"."PriceList" (
    id integer NOT NULL,
    service_name character(256) NOT NULL,
    price_per_item money
);


ALTER TABLE "AdvertAgencySchema"."PriceList" OWNER TO vladiknaska;

--
-- Data for Name: Customer; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."Customer" (id, full_name, phone_number, email) FROM stdin;
0	Ivanov Petr                                                                                                                                                                                                                                                     	424242                        	ivanov@ya.ru                                                                                                                                                                                                                                                    
1	Petrov Ivan                                                                                                                                                                                                                                                     	88005553535                   	petrov@ya.ru                                                                                                                                                                                                                                                    
2	Mamonova Anastasiya                                                                                                                                                                                                                                             	900                           	mam@gmail.com                                                                                                                                                                                                                                                   
3	Popova Katya                                                                                                                                                                                                                                                    	1234                          	popova@mail.ru                                                                                                                                                                                                                                                  
4	Filimonova Katya                                                                                                                                                                                                                                                	5555                          	fili@ya.ru                                                                                                                                                                                                                                                      
\.


--
-- Data for Name: Material; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."Material" (id, name, measure, price_per_item) FROM stdin;
0	paper                                                                                                                                                                                                                                                           	pcs                                                                                                                             	$5.00
1	thick paper                                                                                                                                                                                                                                                     	pcs                                                                                                                             	$10.00
2	hd camera                                                                                                                                                                                                                                                       	frames per sec                                                                                                                  	$15,000.00
3	magazine paper                                                                                                                                                                                                                                                  	kg                                                                                                                              	$100.00
4	color prints                                                                                                                                                                                                                                                    	pcs                                                                                                                             	$500.00
\.


--
-- Data for Name: MaterialPerOrder; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."MaterialPerOrder" (id, material_id, amount) FROM stdin;
0	1	2
1	1	10
2	2	100
3	3	1
4	4	1000
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."Order" (id, order_content_id, customer_id, paid_at, status) FROM stdin;
0	0	1	2018-01-01	approved                                                                                                                        
1	1	4	2020-05-01	closed                                                                                                                          
2	2	3	2019-02-01	denied                                                                                                                          
3	3	2	2017-07-01	approved                                                                                                                        
4	4	0	2016-10-01	approved                                                                                                                        
\.


--
-- Data for Name: OrderContent; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."OrderContent" (id, service_id, amount, materials_id, performer_id, comments) FROM stdin;
0	0	2	0	1	Performer has contacted with customer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
1	2	1	2	1	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
2	3	2	0	0	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
3	1	3	1	3	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
4	4	4	4	4	For sale                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
\.


--
-- Data for Name: Performer; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."Performer" (id, full_name, phone_number) FROM stdin;
0	Tretyak Alina                                                                                                                                                                                                                                                   	67645                         
1	Vasin Oleg                                                                                                                                                                                                                                                      	30002                         
2	Loh Dmitriy                                                                                                                                                                                                                                                     	8907323                       
3	Tiktok Petr                                                                                                                                                                                                                                                     	892176231                     
4	Holod Liza                                                                                                                                                                                                                                                      	203942                        
\.


--
-- Data for Name: PriceList; Type: TABLE DATA; Schema: AdvertAgencySchema; Owner: vladiknaska
--

COPY "AdvertAgencySchema"."PriceList" (id, service_name, price_per_item) FROM stdin;
0	Banner                                                                                                                                                                                                                                                          	$1,000.00
1	Promotion                                                                                                                                                                                                                                                       	$4,200.00
2	Ad movie                                                                                                                                                                                                                                                        	$9,000.00
3	SMM                                                                                                                                                                                                                                                             	$1,000.00
4	Ad post                                                                                                                                                                                                                                                         	$500.00
\.


--
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- Name: MaterialPerOrder MaterialPerOrder_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."MaterialPerOrder"
    ADD CONSTRAINT "MaterialPerOrder_pkey" PRIMARY KEY (id);


--
-- Name: Material Material_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."Material"
    ADD CONSTRAINT "Material_pkey" PRIMARY KEY (id);


--
-- Name: OrderContent OrderContent_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."OrderContent"
    ADD CONSTRAINT "OrderContent_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Performer Performer_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."Performer"
    ADD CONSTRAINT "Performer_pkey" PRIMARY KEY (id);


--
-- Name: PriceList PriceList_pkey; Type: CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."PriceList"
    ADD CONSTRAINT "PriceList_pkey" PRIMARY KEY (id);


--
-- Name: MaterialPerOrder fk_materialperorder_material; Type: FK CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."MaterialPerOrder"
    ADD CONSTRAINT fk_materialperorder_material FOREIGN KEY (material_id) REFERENCES "AdvertAgencySchema"."Material"(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- Name: OrderContent fk_ordercontent_materialperorder; Type: FK CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."OrderContent"
    ADD CONSTRAINT fk_ordercontent_materialperorder FOREIGN KEY (materials_id) REFERENCES "AdvertAgencySchema"."MaterialPerOrder"(id) NOT VALID;


--
-- Name: OrderContent fk_ordercontent_performer; Type: FK CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."OrderContent"
    ADD CONSTRAINT fk_ordercontent_performer FOREIGN KEY (performer_id) REFERENCES "AdvertAgencySchema"."Performer"(id) NOT VALID;


--
-- Name: OrderContent fk_ordercontent_pricelist; Type: FK CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."OrderContent"
    ADD CONSTRAINT fk_ordercontent_pricelist FOREIGN KEY (service_id) REFERENCES "AdvertAgencySchema"."PriceList"(id) NOT VALID;


--
-- Name: Order fk_orders_customer; Type: FK CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."Order"
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES "AdvertAgencySchema"."Customer"(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- Name: Order fk_orders_ordercontent; Type: FK CONSTRAINT; Schema: AdvertAgencySchema; Owner: vladiknaska
--

ALTER TABLE ONLY "AdvertAgencySchema"."Order"
    ADD CONSTRAINT fk_orders_ordercontent FOREIGN KEY (order_content_id) REFERENCES "AdvertAgencySchema"."OrderContent"(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

