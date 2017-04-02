CREATE OR REPLACE PACKAGE PACK IS
     function adaugare_colaborator(i_id_prof varchar, i_id_curs int) RETURN INT;
     FUNCTION REGISTER_PROF(i_username varchar, i_password varchar, i_nume varchar, i_prenume varchar, i_grad varchar, i_link varchar) 
RETURN int;
FUNCTION ADD_DISCIPLINA(i_username_prof varchar, i_denumire varchar, i_an int, i_semestru int, i_credite int, i_link varchar) return int;
 FUNCTION REGISTER_STUD(i_username varchar , i_password varchar ,nr_matricol varchar , i_nume varchar ,i_prenume varchar , i_an int , i_grupa varchar) 
RETURN int;
FUNCTION VERIFICARE( userna varchar , pass varchar)
return int;
END PACK;