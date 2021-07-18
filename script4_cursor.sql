DECLARE
TYPE TCURSO_RECORD_TYPE IS RECORD
(
 COD_CURSO TCURSO.COD_CURSO%TYPE,
 NOME TCURSO.NOME%TYPE,
 VALOR TCURSO.VALOR%TYPE
);
TCURSO_RECORD TCURSO_RECORD_TYPE;
BEGIN
  TCURSO_RECORD.COD_CURSO := 1;
  TCURSO_RECORD.NOME := 'FELIPE';
  TCURSO_RECORD.VALOR := 100;
  Dbms_Output.PUT_LINE(TCURSO_RECORD.VALOR);
END;

DECLARE
TYPE TCURSO_TABLE_ASSOCIATE IS TABLE OF TALUNO%ROWTYPE INDEX BY VARCHAR2(2);
TCURSO_TABLE TCURSO_TABLE_ASSOCIATE;
BEGIN
    TCURSO_TABLE('RJ').NOME := 'FELIPE';
    TCURSO_TABLE('SP').NOME := 'FELIPE CESAR';
    TCURSO_TABLE('PB').NOME := 'FELIPE GOMES';
    Dbms_Output.PUT_LINE(TCURSO_TABLE('RJ').NOME);
    Dbms_Output.PUT_LINE(TCURSO_TABLE('SP').NOME);
    Dbms_Output.PUT_LINE(TCURSO_TABLE('PB').NOME);
END;

DECLARE
  TYPE TCURSO_TABLE_NESTED_TABLE IS TABLE OF TALUNO%ROWTYPE;
  TCURSO_TABLE TCURSO_TABLE_NESTED_TABLE := TCURSO_TABLE_NESTED_TABLE();
BEGIN
  TCURSO_TABLE.EXTEND;
  TCURSO_TABLE(1).NOME := 'FELIPE';
  Dbms_Output.PUT_LINE(TCURSO_TABLE(1).NOME);
END;

DECLARE
  TYPE VETOR_TYPE IS VARRAY(4) OF INTEGER;
  VETOR VETOR_TYPE := VETOR_TYPE();
BEGIN
  VETOR.EXTEND;
  VETOR(1) := 4;
  VETOR.EXTEND;
  VETOR.EXTEND;
  VETOR(2) := 3;
  VETOR(3) := 6;
  Dbms_Output.PUT_LINE(VETOR(1));
  Dbms_Output.PUT_LINE(VETOR(2));
  Dbms_Output.PUT_LINE(VETOR(3));
END;


DECLARE
CURSOR C1 IS
  SELECT * FROM TCURSO;
  REC TCURSO%ROWTYPE;
CURSOR C3 IS
  SELECT * FROM TALUNO;
TYPE T_CARGO_RECORD_TYPE IS RECORD (
  COD_ALUNO TALUNO.COD_ALUNO%TYPE,
  NOME TALUNO.NOME%TYPE,
  CIDADE TALUNO.CIDADE%TYPE,
  CEP TALUNO.CEP%TYPE
);
T_CARGO_RECORD T_CARGO_RECORD_TYPE;
BEGIN
  OPEN C1;
  LOOP
    FETCH C1 INTO REC;
    EXIT WHEN C1%ROWCOUNT > 1 OR C1%NOTFOUND;
      Dbms_Output.PUT_LINE(REC.NOME);
  END LOOP;
  CLOSE C1;
  FOR T_CARGO_RECORD IN C3
  LOOP
  EXIT WHEN C3%ROWCOUNT > 1 OR C3%NOTFOUND;
    Dbms_Output.PUT_LINE(T_CARGO_RECORD.NOME);
  END LOOP;
END;


INSERT INTO TCURSO VALUES (2,'L�GICA DE PROGRAMA��O',700,20);
INSERT INTO TCURSO VALUES (3,'DBA',800,20);
INSERT INTO TCURSO VALUES (4,'JAVA',900,20);