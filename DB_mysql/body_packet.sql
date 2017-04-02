CREATE OR REPLACE PACKAGE BODY PACK IS

    FUNCTION REGISTER_STUD(i_username varchar , i_password varchar ,nr_matricol varchar , i_nume varchar ,i_prenume varchar , i_an int , i_grupa varchar) 
RETURN int
AS
v int;
verificare int;
BEGIN

SELECT count(*) into verificare FROM USERS where username like i_username;
IF verificare >0 THEN
  return 0;
END IF;
INSERT INTO USERS ( username, password, id)
  VALUES ( i_username, i_password, 's'||nr_matricol );
INSERT INTO  STUDENTI ( nr_matricol , nume , prenume , an, grupa )
  VALUES (nr_matricol, i_nume, i_prenume, i_an, i_grupa);
  return 1;

END;

FUNCTION VERIFICARE( userna varchar , pass varchar)
return int as
exista int;
v_id varchar(30);

CURSOR get_linie is
    SELECT * FROM USERS WHERE username like userna;
v_std_linie get_linie%ROWTYPE;
BEGIN
exista:=0;
 FOR v_std_linie IN get_linie LOOP
  if lower(substr(v_std_linie.id,1,1)) like 's' then
    return 1;
  END IF;
  
   if lower(substr(v_std_linie.id,1,1)) like 'p' then
    return 2;
  END IF; 
  
  if lower(substr(v_std_linie.id,1,1)) like 'a' then
    return 3;
  END IF; 
  END LOOP;

return 0;

END;

function adaugare_colaborator(i_id_prof varchar, i_id_curs int)
return int
as
v int;
v_count int;
begin

select count(*) into v_count from didactic where id_prof like i_id_prof and id_curs=i_id_curs; 
if v_count>0 then
return 0;
end if;

insert into didactic (id_prof,id_curs)
values (i_id_prof,i_id_curs);

return 1;

end;

FUNCTION REGISTER_PROF(i_username varchar, i_password varchar, i_nume varchar, i_prenume varchar, i_grad varchar, i_link varchar) 
RETURN int
AS
v int;
v_id int;
verificare int;
BEGIN

SELECT count(*) into verificare FROM USERS where username like i_username;
IF verificare >0 THEN
  return 0;
END IF;
INSERT INTO PROFESORI ( nume, prenume, grad_didactic, link)
  VALUES ( i_nume, i_prenume, i_grad, i_link);
select MAX(id) into v_id from PROFESORI where nume like i_nume and prenume like i_prenume;

INSERT INTO USERS ( username, password, id)
  VALUES ( i_username, i_password, 'p'||TO_CHAR(v_id));
  return 1;

END;

FUNCTION ADD_DISCIPLINA(i_username_prof varchar, i_denumire varchar, i_an int, i_semestru int, i_credite int, i_link varchar) return int
AS
v_prof_id varchar(30);
v_dis_id int;
begin
insert into discipline (  titlu_curs, an, semestru, credite, link)
  VALUES ( i_denumire, i_an, i_semestru, i_credite, i_link);

select id into v_prof_id from users where username like i_username_prof;

select max(id) into v_dis_id from discipline where titlu_curs like i_denumire;

insert into didactic (id_prof, id_curs)
    VALUES (v_prof_id, v_dis_id);


return 1;

END;
    
END PACK;    