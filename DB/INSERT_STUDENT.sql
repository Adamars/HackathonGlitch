CREATE OR REPLACE FUNCTION REGISTER_STUD(i_username varchar , i_password varchar ,nr_matricol varchar , i_nume varchar ,i_prenume varchar , i_an int , i_grupa varchar) 
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