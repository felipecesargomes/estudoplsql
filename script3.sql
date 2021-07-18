--DEFININDO TIPO RECORDS (LINHA UNICA) COM COLUNAS PR�-DEFENIDAS
DECLARE
vId INTEGER;
vNome VARCHAR2(255);
vCep VARCHAR2(40);
TYPE RECORD_ALUNO_TYPE IS RECORD
(
  ID TALUNO.COD_ALUNO%TYPE,
  NOME TALUNO.NOME%TYPE,
  CEP VARCHAR2(40)
);
ALUNO_RECORD RECORD_ALUNO_TYPE;
BEGIN
  SELECT COD_ALUNO, NOME, CEP INTO vId, vNome, vCep FROM TALUNO WHERE COD_ALUNO = 44;
  ALUNO_RECORD.ID := vId;
  ALUNO_RECORD.NOME := vNome;
  ALUNO_RECORD.CEP := vCep;
  Dbms_Output.put_line(ALUNO_RECORD.id);
  Dbms_Output.put_line(ALUNO_RECORD.nome);
  Dbms_Output.put_line(ALUNO_RECORD.cep);
END;

--DEFININDO TIPO COM O ATRIBUTO ROWTYPE
DECLARE
  rAluno TALUNO%ROWTYPE;
BEGIN
  rAluno.nome := 'Felipe';
  Dbms_Output.put_line(rAluno.nome);
END;

--DEFININDO TIPO VARRAY
DECLARE
  TYPE arrayAluno IS VARRAY(6) OF VARCHAR2(40);
  arrayobj arrayAluno := arrayAluno();
BEGIN
  arrayobj.EXTEND;
  arrayobj(1) := 'Felipe';
  arrayobj.EXTEND;
  arrayobj(2) := 'Fabio';
  Dbms_Output.PUT_LINE(arrayobj(2));
END;

--DEFININDO TIPO ASSOCIATIVE ARRAY
DECLARE
  TYPE linhacompleta IS TABLE OF VARCHAR2(50) INDEX BY BINARY_INTEGER;
  TYPE linha2 IS TABLE OF TALUNO%ROWTYPE INDEX BY VARCHAR2(2);
  LINHA linhacompleta;
  LINHAT LINHA2;
BEGIN
  LINHA(1) := 'FELIPE';
  LINHA(4) := 'FABIO';
  Dbms_Output.PUT_LINE(LINHA(4));
  LINHAT(1).NOME := 'FELIPE';
  Dbms_Output.PUT_LINE(LINHAT(1).NOME);
END;

--DEFININDO TIPO NESTED TABLES

DECLARE
  TYPE tipoNestedTable IS TABLE OF VARCHAR2(50);
  TYPE tipoNestedTable2 IS TABLE OF TALUNO%ROWTYPE;
  linha tipoNestedTable := tipoNestedTable();
  linha2 tipoNestedTable2 := tipoNestedTable2();
BEGIN
  linha2.EXTEND;
  linha2(1).nome := 'Felipe';
  Dbms_Output.PUT_LINE(LINHA2(1).nome);
END;

DECLARE
  CURSOR C1 IS
    SELECT COD_ALUNO, NOME FROM TALUNO;
  TYPE ALUNO_RECORD_TYPE IS RECORD (
    COD_ALUNO TALUNO.COD_ALUNO%TYPE,
    NOME TALUNO.NOME%TYPE
  );
  R1 ALUNO_RECORD_TYPE;
BEGIN
  OPEN C1;
  LOOP
  FETCH C1 INTO R1;
  EXIT WHEN C1%notfound;
  Dbms_Output.Put_Line(r1.nome);
  end loop;
  CLOSE C1;
END;

DECLARE
  CURSOR C1 IS
    SELECT COD_ALUNO, NOME FROM TALUNO;
  TYPE ALUNO_RECORD_TYPE IS RECORD (
    COD_ALUNO TALUNO.COD_ALUNO%TYPE,
    NOME TALUNO.NOME%TYPE
  );
  R1 ALUNO_RECORD_TYPE;
BEGIN
 FOR R1 IN C1
 LOOP
  Dbms_Output.Put_Line(r1.nome);
 END LOOP;
END;