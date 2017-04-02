DROP TABLE STUDENTI;
CREATE  TABLE STUDENTI ( nr_matricol varchar(30) auto_increment , nume varchar(30), prenume varchar(30), an int, grupa varchar(2), primary key(nr_matricol));
DROP TABLE DISCIPLINE cascade constraints;
CREATE TABLE DISCIPLINE ( id int , titlu_curs varchar(30), an int, semestru int, credite int, link varchar(60));
ALTER TABLE DISCIPLINE
  ADD 
    CONSTRAINT DIS_pk PRIMARY KEY (id)
;
  CALL DropSequence('DIS_sequence');
  CALL CreateSequence('DIS_sequence', 1, 1);

DROP TABLE PROFESORI cascade constraints;
CREATE TABLE PROFESORI ( id varchar(30) , nume varchar(30), prenume varchar(30), grad_didactic varchar(30), link varchar(60));
ALTER TABLE PROFESORI
  ADD 
    CONSTRAINT PROF_pk PRIMARY KEY (id)
;
  CALL DropSequence('PROF_sequence');
  CALL CreateSequence('PROF_sequence', 1, 1);
DROP TABLE DIDACTIC cascade constraints;
CREATE TABLE DIDACTIC ( id_prof varchar(30)  , id_curs int, FOREIGN KEY (id_prof ) REFERENCES PROFESORI(id), FOREIGN KEY (id_curs) REFERENCES DISCIPLINE(id) ) ;
DROP TABLE USERS;
CREATE TABLE USERS( username varchar(30), password varchar(30), id varchar(30) );
