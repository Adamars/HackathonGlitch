DROP FUNCTION IF EXISTS REGISTER_PROF;

DELIMITER //

CREATE FUNCTION REGISTER_PROF(i_username varchar(4000), i_password varchar(4000), i_nume varchar(4000), i_prenume varchar(4000), i_grad varchar(4000), i_link varchar(4000)) 
RETURNS int
BEGIN
DECLARE v int;
DECLARE v_id int;
DECLARE verificare int;
 

SELECT count(*) into verificare FROM USERS where username like i_username;
IF verificare >0 THEN
  return 0;
END IF;
INSERT INTO PROFESORI ( nume, prenume, grad_didactic, link)
  VALUES ( i_nume, i_prenume, i_grad, i_link);
select MAX(id) into v_id from PROFESORI where nume like i_nume and prenume like i_prenume;

INSERT INTO USERS ( username, password, id)
  VALUES ( i_username, i_password, Concat('p',IFNULL(TO_CHAR(v_id), '')));
  return 1;

END;
//

DELIMITER ;
