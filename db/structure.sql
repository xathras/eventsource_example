--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: priced_item_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE priced_item_events (
    id integer NOT NULL,
    item_id uuid NOT NULL,
    event_name character varying NOT NULL,
    data json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: priced_item_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE priced_item_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: priced_item_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE priced_item_events_id_seq OWNED BY priced_item_events.id;


--
-- Name: priced_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE priced_items (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    title text,
    description text,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    taxed boolean DEFAULT false NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: scheduled_priced_item_changes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE scheduled_priced_item_changes (
    id integer NOT NULL,
    item_id uuid,
    effective_date timestamp without time zone,
    title text,
    description text,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    taxed boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: scheduled_priced_item_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE scheduled_priced_item_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scheduled_priced_item_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE scheduled_priced_item_changes_id_seq OWNED BY scheduled_priced_item_changes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY priced_item_events ALTER COLUMN id SET DEFAULT nextval('priced_item_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY scheduled_priced_item_changes ALTER COLUMN id SET DEFAULT nextval('scheduled_priced_item_changes_id_seq'::regclass);


--
-- Name: priced_item_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY priced_item_events
    ADD CONSTRAINT priced_item_events_pkey PRIMARY KEY (id);


--
-- Name: priced_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY priced_items
    ADD CONSTRAINT priced_items_pkey PRIMARY KEY (id);


--
-- Name: scheduled_priced_item_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY scheduled_priced_item_changes
    ADD CONSTRAINT scheduled_priced_item_changes_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150706155106');

INSERT INTO schema_migrations (version) VALUES ('20150706161146');

INSERT INTO schema_migrations (version) VALUES ('20150706161610');

INSERT INTO schema_migrations (version) VALUES ('20150708144020');

