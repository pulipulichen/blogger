--
-- PostgreSQL database dump
--

--
-- Name: doc; Type: TABLE; Schema: public
--

CREATE TABLE doc (
    doc_id integer NOT NULL,
    fulltext text
);


--
-- Name: doc_doc_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE doc_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: doc_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public
--

ALTER SEQUENCE doc_doc_id_seq OWNED BY doc.doc_id;


--
-- Name: new_word; Type: TABLE; Schema: public
--

CREATE TABLE new_word (
    new_word_id integer NOT NULL,
    term text
);

--
-- Name: new_word_new_word_id_seq; Type: SEQUENCE; Schema: public
--

CREATE SEQUENCE new_word_new_word_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: new_word_new_word_id_seq; Type: SEQUENCE OWNED BY; Schema: public
--

ALTER SEQUENCE new_word_new_word_id_seq OWNED BY new_word.new_word_id;


--
-- Name: stop_word; Type: TABLE; Schema: public
--

CREATE TABLE stop_word (
    stop_word_id integer NOT NULL,
    term text
);


--
-- Name: stop_word_stop_word_id_seq; Type: SEQUENCE; Schema: public
--

CREATE SEQUENCE stop_word_stop_word_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: stop_word_stop_word_id_seq; Type: SEQUENCE OWNED BY; Schema: public
--

ALTER SEQUENCE stop_word_stop_word_id_seq OWNED BY stop_word.stop_word_id;


--
-- Name: term_freq; Type: TABLE; Schema: public
--

CREATE TABLE term_freq (
    term_freq_id integer NOT NULL,
    doc_id text,
    term text,
    speech text,
    freq integer
);

--
-- Name: term_freq_term_freq_id_seq; Type: SEQUENCE; Schema: public
--

CREATE SEQUENCE term_freq_term_freq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: term_freq_term_freq_id_seq; Type: SEQUENCE OWNED BY; Schema: public
--

ALTER SEQUENCE term_freq_term_freq_id_seq OWNED BY term_freq.term_freq_id;


--
-- Name: view_term_freq_sum; Type: VIEW; Schema: public
--

CREATE VIEW view_term_freq_sum AS
 SELECT term_freq.term AS word,
    sum(term_freq.freq) AS freq
   FROM term_freq
  GROUP BY term_freq.term
  ORDER BY (sum(term_freq.freq)) DESC;

--
-- Name: doc_id; Type: DEFAULT; Schema: public
--

ALTER TABLE ONLY doc ALTER COLUMN doc_id SET DEFAULT nextval('doc_doc_id_seq'::regclass);

--
-- Name: new_word_id; Type: DEFAULT; Schema: public
--

ALTER TABLE ONLY new_word ALTER COLUMN new_word_id SET DEFAULT nextval('new_word_new_word_id_seq'::regclass);


--
-- Name: stop_word_id; Type: DEFAULT; Schema: public
--

ALTER TABLE ONLY stop_word ALTER COLUMN stop_word_id SET DEFAULT nextval('stop_word_stop_word_id_seq'::regclass);


--
-- Name: term_freq_id; Type: DEFAULT; Schema: public
--

ALTER TABLE ONLY term_freq ALTER COLUMN term_freq_id SET DEFAULT nextval('term_freq_term_freq_id_seq'::regclass);


--
-- Name: doc_pkey; Type: CONSTRAINT; Schema: public
--

ALTER TABLE ONLY doc
    ADD CONSTRAINT doc_pkey PRIMARY KEY (doc_id);


--
-- Name: new_word_pkey; Type: CONSTRAINT; Schema: public
--

ALTER TABLE ONLY new_word
    ADD CONSTRAINT new_word_pkey PRIMARY KEY (new_word_id);


--
-- Name: stop_word_pkey; Type: CONSTRAINT; Schema: public
--

ALTER TABLE ONLY stop_word
    ADD CONSTRAINT stop_word_pkey PRIMARY KEY (stop_word_id);


--
-- Name: term_freq_pkey; Type: CONSTRAINT; Schema: public
--

ALTER TABLE ONLY term_freq
    ADD CONSTRAINT term_freq_pkey PRIMARY KEY (term_freq_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

