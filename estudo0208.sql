DECLARE
  TYPE TIPO_ALUNO IS TABLE OF TALUNO%ROWTYPE;
  vAluno TIPO_ALUNO := TIPO_ALUNO();
BEGIN
  vAluno.EXTEND;
  vAluno(1).nome := 'César';
  Dbms_Output.put_line(vAluno(1).nome);
END;


DECLARE
  TYPE TIPO_ASSOCIATIVE_ALUNO IS TABLE OF TALUNO%ROWTYPE INDEX BY PLS_INTEGER;
  vAluno TIPO_ASSOCIATIVE_ALUNO;
BEGIN
  vAluno(1).nome := 'Felipe';
  Dbms_Output.put_line(vAluno(1).nome);
END;                                        

DECLARE
  TYPE R1 IS RECORD (NOME VARCHAR(250));
  vR1 R1;
BEGIN
  vR1.nome := 'Felipe';
  Dbms_Output.put_line(vR1.nome);
END;

DECLARE
  vAluno TALUNO%ROWTYPE;
  CURSOR C1 IS
    SELECT * FROM TALUNO WHERE COD_ALUNO = 44;
BEGIN
  OPEN C1;
  LOOP
    FETCH C1 INTO vAluno;
      EXIT WHEN C1%NOTFOUND;
      Dbms_Output.PUT_LINE(vAluno.nome);
    END LOOP;
  CLOSE C1;
END;

DECLARE
  vAluno TALUNO%ROWTYPE;
  CURSOR C1 IS
    SELECT * FROM TALUNO WHERE COD_ALUNO = 44;
BEGIN
  FOR vAluno IN C1 LOOP
      EXIT WHEN C1%NOTFOUND;
      Dbms_Output.PUT_LINE(vAluno.nome);
    END LOOP;
END;

DECLARE
  TYPE arrayzinho_type IS VARRAY(8) OF VARCHAR(45);
  arrayzinho arrayzinho_type := arrayzinho_type();
BEGIN
  arrayzinho.extend;
  arrayzinho(1) := 'FELIPE';
  Dbms_Output.PUT_LINE(arrayzinho(1));
END;
