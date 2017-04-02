DROP FUNCTION IF EXISTS VERIFICARE;

DELIMITER //

CREATE FUNCTION VERIFICARE( userna varchar(4000) , pass varchar(4000))
returns int
 begin
declare exista int;
declare v_id varchar(30);

declare 

DECLARE not_found INT DEFAULT 0;

DECLARE get_linie CURSOR for
    SELECT * FROM USERS WHERE username like userna;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET not_found = 1; 
set exista=0;
 DECLARE v_std_linie CURSOR FOR get_linie OPEN v_std_linie;
 FETCH v_std_linie INTO;
 WHILE NOT_FOUND=0
 DO
  if lower(substr(v_std_linie_id,1,1)) like 's' then
    return 1;
  END IF;
  
   if lower(substr(v_std_linie_id,1,1)) like 'p' then
    return 2;
  END IF; 
  
  if lower(substr(v_std_linie_id,1,1)) like 'a' then
    return 3;
  END IF; 
  FETCH get_linie INTO;
  END WHILE;
  CLOSE get_linie;

return 0;

END;
//

DELIMITER ;

