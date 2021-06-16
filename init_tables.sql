CREATE TABLE userinfo
(
    uid serial NOT NULL,
    username character varying(100) NOT NULL,
    departname character varying(500) NOT NULL,
    created date,
    CONSTRAINT userinfo_pkey PRIMARY KEY (uid)
)
WITH (OIDS=FALSE);

CREATE TABLE userdetail
(
    uid integer,
    intro character varying(100),
    profile character varying(100)
)
WITH(OIDS=FALSE);


INSERT INTO userinfo (uid, username, departname, created) VALUES (1, 'leiwang', 'pdg', '2007-07-01');
INSERT INTO userinfo (uid, username, departname, created) VALUES (2, 'tom', 'atg', '2000-09-16');

INSERT INTO userdetail(uid, intro, profile) VALUES (1, 'senior developer', 'java sql javascript go node npm');
INSERT INTO userdetail(uid, intro, profile) VALUES (2, 'priciple tester', 'java sql javascript go node npm junit');
