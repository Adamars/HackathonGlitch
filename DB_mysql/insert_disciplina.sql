DELIMITER //
CREATE FUNCTION ADD_DISCIPLINA(i_username_prof varchar, i_denumire varchar, i_an int, i_semestru int, i_credite int, i_link varchar) return int

begin
DECLARE v_prof_id varchar(30), v_dis_id int;
insert into discipline (  titlu_curs, an, semestru, credite, link)
  VALUES ( i_denumire, i_an, i_semestru, i_credite, i_link);

select id into v_prof_id from users where username like i_username_prof;

select max(id) into v_dis_id from discipline where titlu_curs like i_denumire;

insert into didactic (id_prof, id_curs)
    VALUES (v_prof_id, v_dis_id);


return 1;

END//
DELIMITER;