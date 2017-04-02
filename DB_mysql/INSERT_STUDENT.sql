DROP FUNCTION IF EXISTS REGISTER_STUD;

DELIMITER //

CREATE FUNCTION REGISTER_STUD(i_username varchar(4000) , i_password varchar(4000) ,nr_matricol varchar(4000) , i_nume varchar(4000) ,i_prenume varchar(4000) , i_an int , i_grupa varchar(4000)) 
RETURNS int
BEGIN
DECLARE v int;
DECLARE verificare int;
 

SELECT count(*) into verificare FROM USERS where username like i_username;
IF verificare >0 THEN
  return 0;
END IF;
INSERT INTO USERS ( username, password, id)
  VALUES ( i_username, i_password, Concat('s',ifnull(nr_matricol, '')) );
INSERT INTO  STUDENTI ( nr_matricol , nume , prenume , an, grupa )
  VALUES (nr_matricol, i_nume, i_prenume, i_an, i_grupa);
  return 1;

END;
//

DELIMITER ;