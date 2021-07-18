DECLARE
  x INTEGER;
  y INTEGER;
  c INTEGER;
BEGIN
  x := 10;
  y := 20;
  c := x + y;
  Dbms_Output.Put_Line('Resultado: '||c);
  Dbms_Output.Put_Line('');
END;


   --desconto = 0.50
   --cidade = novo hamburgo
   --cod_aluno = 5
   --total = 1345.89

DECLARE
  vDESCONTO NUMBER(38,2) := 0.50;
  vCIDADE taluno.cidade%TYPE := 'NOVO HAMBURGO';
  vCOD_ALUNO TALUNO.COD_ALUNO%TYPE := 5;
  vTOTAL NUMBER(38,2) := 1345.89;
  BEGIN
    VTOTAL := Round(VTOTAL * VDESCONTO, 2);
    Dbms_Output.Put_Line('Total: '||vTotal);
    VDESCONTO := 1.20;
    VCIDADE := InitCap(VCidade);
    Dbms_Output.Put_Line('Cidade: '||vCidade);
    Dbms_Output.Put_Line('Desconto: '||vDesconto);
    Dbms_Output.Put_Line('Aluno: '||vcod_aluno);
 END;

    --preco1 = 10
    --preco2 = 20
    --vFlag
    --compara pra ver se preco 1 é maior q preco 2
    --se verdadeiro imprime verdadeiro ou senão falso
    --compara pra ver qual o preco é maior , 1 ou 2

    VARIABLE VPRECO1 NUMBER

    DECLARE
      VPRECO2 NUMBER(8,2) := 20;
      VFLAG BOOLEAN;
    BEGIN
      :VPRECO1 := 10;
      VFLAG := :VPRECO1>VPRECO2;

      IF(VFLAG=TRUE) THEN
        Dbms_Output.Put_Line('VERDADEIRO');
      ELSE
        Dbms_Output.Put_Line('FALSO');
      END IF;

      IF(:VPRECO1>VPRECO2) THEN
        Dbms_Output.Put_Line('PRECO1 É MAIOR QUE PRECO2');
      ELSE
        Dbms_Output.Put_Line('PRECO2 É MAIOR QUE PRECO1');
      END IF;
    END;


DECLARE
    vValor NUMBER(8,2);
    vNome VARCHAR2(30);
BEGIN
    SELECT VALOR, NOME
    INTO vValor, vNome
    FROM TCURSO
    WHERE COD_CURSO = &COD_CURSO;
    Dbms_Output.Put_Line('Valor: '|| To_Char(vValor, 'fm9999.99'));
    Dbms_Output.Put_Line('Curso: '|| InitCap(vNome));
END;

SELECT * FROM TCONTRATO;

CREATE SEQUENCE SEQ_CONTRATO START WITH 8;

DECLARE
  vCod TCONTRATO.COD_CONTRATO%TYPE;
BEGIN
  SELECT SEQ_CONTRATO.NEXTVAL
  INTO VCod FROM DUAL;
  INSERT INTO TCONTRATO (COD_CONTRATO, DATA, COD_ALUNO, DESCONTO) VALUES (VCOD,SYSDATE,1,NULL);
  Dbms_Output.Put_Line(vCod);
END;

DECLARE
  vValor TCONTRATO.COD_CONTRATO%TYPE := &VALOR;
BEGIN
  UPDATE TCONTRATO SET
  TOTAL = TOTAL + vVALOR;
  Dbms_Output.Put_Line(vValor);
END;

DECLARE
 vCod TCONTRATO.COD_CONTRATO%TYPE := &codigo;
BEGIN
  DELETE FROM TCONTRATO WHERE COD_CONTRATO = vCod;
  Dbms_Output.Put_Line('Código: ' || vCod || ' deletado com sucesso!');
END;


DECLARE
 vCod TCONTRATO.COD_CONTRATO%TYPE := &Codigo;
 vQtd NUMBER;
 vDesconto NUMBER;
BEGIN
 UPDATE TCONTRATO SET DESCONTO = Nvl(DESCONTO,0) + 5 WHERE COD_CONTRATO <= vCod;
 vQtd := SQL%ROWCOUNT;
 Dbms_Output.Put_Line(vQtd);
END;

SELECT * FROM TCONTRATO;


UPDATE TCONTRATO SET DESCONTO = NULL WHERE desconto IS null;


DECLARE
  vContador INTEGER := 0;
BEGIN
  LOOP
    vContador := vContador + 1;
    Dbms_Output.Put_Line(vContador);
    EXIT WHEN vContador = 10;
  END LOOP;
  Dbms_Output.Put_Line('Fim do LOOP');
END;


DECLARE
 vContador INTEGER;
BEGIN
 FOR vContador IN 1..10
 LOOP
 Dbms_Output.Put_Line(vContador);
 END LOOP;
END;

DECLARE
  vContador INTEGER := 0;
  vTexto VARCHAR(10);
BEGIN
  WHILE vContador < 10
  LOOP
    vContador := vContador + 1;
    IF (vContador Mod 2)=0 THEN
      vTexto := 'Par';
    ELSE
      vTexto := 'Impar';
    END IF;
    Dbms_Output.Put_Line(vContador|| ' -> ' ||vTexto);
  END LOOP;
END;

------------------------

DECLARE
 vCount INTEGER := 0;
BEGIN
 WHILE (vCount < 10)
 LOOP
  vCount := vCount + 1;
  IF(vCount Mod 2)=0 THEN
    Dbms_Output.Put_Line(vCount || ' Par');
  ELSE
     Dbms_Output.Put_Line(vCount || ' Impar');
  END IF;
  END LOOP;
END;


--type type_name is record (...)
--identifier type_name;

DECLARE
  TYPE CLIENTE_RECORD_TYPE IS RECORD
      ( ID NUMBER(4) NOT NULL := 0,
        NOME TCLIENTES.NOME%TYPE,
        CIDADE TCLIENTES.CIDADE%TYPE );

  CLIENTE_RECORD CLIENTE_RECORD_TYPE;


CLIENTE_RECORD TCLIENTES%ROWTYPE;

