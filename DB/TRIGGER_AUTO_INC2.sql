CREATE OR REPLACE TRIGGER DISCIPLINE_on_insert
  BEFORE INSERT ON DISCIPLINE
  FOR EACH ROW
BEGIN
  SELECT DIS_sequence.nextval
  INTO :new.id
  FROM dual;
END;