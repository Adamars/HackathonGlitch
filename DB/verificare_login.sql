CREATE OR REPLACE FUNCTION VERIFICARE( userna varchar , pass varchar)
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