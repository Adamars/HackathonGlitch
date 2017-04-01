CREATE OR REPLACE FUNCTION REGISTER_PROF(i_username varchar, i_password varchar, i_nume varchar, i_prenume varchar, i_grad varchar, i_link varchar) 
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