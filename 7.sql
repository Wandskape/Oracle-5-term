SELECT username FROM all_users;
DROP SEQUENCE S1;
DROP SEQUENCE S2;
DROP SEQUENCE S3;
DROP SEQUENCE S4;
DROP TABLE T1;
DROP CLUSTER ABC;
DROP TABLE A;
DROP TABLE B;
DROP TABLE C;
DROP VIEW V1;
DROP SYNONYM synonym_c;
DROP PUBLIC SYNONYM synonym_b;
DROP MATERIALIZED VIEW MV;

-- sqlplus / as sysdba
-- ALTER PLUGGABLE DATABASE KAA_PDB OPEN;

-- 1.	Прочитайте задание полностью и выдайте своему пользователю необходимые права.
GRANT CREATE SEQUENCE TO C##KAA1;
GRANT CREATE ANY SEQUENCE TO C##KAA1;
GRANT CREATE SESSION TO C##KAA1;

/* 2.	Создайте последовательность S1 (SEQUENCE), со следующими характеристиками: начальное значение 1000; приращение 10; нет минимального значения; 
нет максимального значения; не циклическая; значения не кэшируются в памяти; хронология значений не гарантируется. 
Получите несколько значений последовательности. Получите текущее значение последовательности. */
CREATE SEQUENCE S1
  START WITH 1000
  INCREMENT BY 10
  NOCYCLE
  NOCACHE
  NOORDER;

SELECT S1.NEXTVAL FROM DUAL;
SELECT S1.CURRVAL FROM DUAL;

/* 3.	Создайте последовательность S2 (SEQUENCE), со следующими характеристиками: начальное значение 10; приращение 10; максимальное значение 100; 
не циклическую. Получите все значения последовательности. Попытайтесь получить значение, выходящее за максимальное значение.*/
CREATE SEQUENCE S2
  START WITH 10
  INCREMENT BY 10
  MAXVALUE 100
  NOCYCLE;

SELECT S2.NEXTVAL FROM DUAL;

/* 4.	Создайте последовательность S3 (SEQUENCE), со следующими характеристиками: начальное значение 10; приращение -10; минимальное значение -100; 
не циклическую; гарантирующую хронологию значений. Получите все значения последовательности. Попытайтесь получить значение, меньше минимального значения.*/
CREATE SEQUENCE S3
  START WITH 10
  INCREMENT BY -10
  MINVALUE -100
  MAXVALUE 10
  NOCYCLE
  ORDER;

SELECT S3.NEXTVAL FROM DUAL;

/* 5.	Создайте последовательность S4 (SEQUENCE), со следующими характеристиками: начальное значение 1; приращение 1; минимальное значение 10; 
циклическая; кэшируется в памяти 5 значений; хронология значений не гарантируется. Продемонстрируйте цикличность генерации значений 
последовательностью S4. */
CREATE SEQUENCE S4
  START WITH 10
  INCREMENT BY 1
  MINVALUE 10
  MAXVALUE 16
  CYCLE
  CACHE 5
  NOORDER;

SELECT S4.NEXTVAL FROM DUAL;

-- 6.	Получите список всех последовательностей в словаре базы данных, владельцем которых является пользователь XXX.
SELECT SEQUENCE_NAME FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = 'C##KAA1';

/* 7.	Создайте таблицу T1, имеющую столбцы N1, N2, N3, N4, типа NUMBER (20), кэшируемую и расположенную в буферном пуле KEEP. С помощью оператора 
INSERT добавьте 7 строк, вводимое значение для столбцов должно формироваться с помощью последовательностей S1, S2, S3, S4. */
CREATE TABLE T1 (
    N1 NUMBER(20),
    N2 NUMBER(20),
    N3 NUMBER(20),
    N4 NUMBER(20)
) STORAGE (BUFFER_POOL KEEP);

INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
INSERT INTO T1 (N1, N2, N3, N4) VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);

SELECT * FROM T1;

-- 8.	Создайте кластер ABC, имеющий hash-тип (размер 200) и содержащий 2 поля: X (NUMBER (10)), V (VARCHAR2(12)).
CREATE CLUSTER ABC (
    X NUMBER(10),
    V VARCHAR2(12)
)
HASHKEYS 200;

-- 9.	Создайте таблицу A, имеющую столбцы XA (NUMBER (10)) и VA (VARCHAR2(12)), принадлежащие кластеру ABC, а также еще один произвольный столбец.
CREATE TABLE A (
    XA NUMBER(10),
    VA VARCHAR2(12),
    OTHER_A VARCHAR2(50)
) CLUSTER ABC (XA, VA);


-- 10.	Создайте таблицу B, имеющую столбцы XB (NUMBER (10)) и VB (VARCHAR2(12)), принадлежащие кластеру ABC, а также еще один произвольный столбец.
CREATE TABLE B (
    XB NUMBER(10),
    VB VARCHAR2(12),
    OTHER_B VARCHAR2(50)
) CLUSTER ABC (XB, VB);


-- 11.	Создайте таблицу С, имеющую столбцы XС (NUMBER (10)) и VС (VARCHAR2(12)), принадлежащие кластеру ABC, а также еще один произвольный столбец.
CREATE TABLE C (
    XC NUMBER(10),
    VC VARCHAR2(12),
    OTHER_C VARCHAR2(50)
) CLUSTER ABC (XC, VC);

-- 12.	Найдите созданные таблицы и кластер в представлениях словаря Oracle.
SELECT TABLE_NAME, CLUSTER_NAME 
FROM USER_TABLES 
WHERE CLUSTER_NAME = 'ABC';

SELECT * FROM USER_CLUSTERS WHERE CLUSTER_NAME = 'ABC';

-- 13.	Создайте частный синоним для таблицы XXX.С и продемонстрируйте его применение.
CREATE SYNONYM synonym_c FOR C##KAA1.C;

SELECT * FROM synonym_c;

-- 14.	Создайте публичный синоним для таблицы XXX.B и продемонстрируйте его применение.
CREATE PUBLIC SYNONYM synonym_b FOR C##KAA1.B;

SELECT * FROM synonym_b;

/* 15.	Создайте две произвольные таблицы A и B (с первичным и внешним ключами), заполните их данными, создайте представление V1, основанное на 
SELECT... FOR A inner join B. Продемонстрируйте его работоспособность. */
DROP TABLE A;
DROP TABLE B;
DROP TABLE C;

CREATE TABLE A (
    id NUMBER PRIMARY KEY,
    data_a VARCHAR2(50)
);

CREATE TABLE B (
    id NUMBER PRIMARY KEY,
    a_id NUMBER,
    data_b VARCHAR2(50),
    CONSTRAINT fk_a_id FOREIGN KEY (a_id) REFERENCES A(id)
);

INSERT INTO A (id, data_a) VALUES (1, 'Data A1');
INSERT INTO A (id, data_a) VALUES (2, 'Data A2');

INSERT INTO B (id, a_id, data_b) VALUES (1, 1, 'Data B1');
INSERT INTO B (id, a_id, data_b) VALUES (2, 2, 'Data B2');

COMMIT;

CREATE VIEW V1 AS
SELECT A.id AS a_id, A.data_a, B.data_b
FROM A
INNER JOIN B ON A.id = B.a_id;

SELECT * FROM V1;

/* 16.	На основе таблиц A и B создайте материализованное представление MV, которое имеет периодичность обновления 2 минуты. Продемонстрируйте его 
работоспособность. */

CREATE MATERIALIZED VIEW MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
NEXT SYSDATE + (2 / 1440)
AS
SELECT A.id AS a_id, A.data_a, B.data_b
FROM A
INNER JOIN B ON A.id = B.a_id;

