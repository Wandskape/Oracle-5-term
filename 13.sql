-- 1.	Создайте таблицу T_RANGE c диапазонным секционированием. Используйте ключ секционирования типа NUMBER. 
CREATE TABLE T_RANGE (
    ID NUMBER,
    NAME VARCHAR2(50),
    CREATED_DATE DATE
)
PARTITION BY RANGE (ID) (
    PARTITION part_low VALUES LESS THAN (100),
    PARTITION part_medium VALUES LESS THAN (200),
    PARTITION part_high VALUES LESS THAN (MAXVALUE)
);

-- 2.	Создайте таблицу T_INTERVAL c интервальным секционированием. Используйте ключ секционирования типа DATE.
CREATE TABLE T_INTERVAL (
    ID NUMBER,
    EVENT_DATE DATE,
    EVENT_DESCRIPTION VARCHAR2(100)
)
PARTITION BY RANGE (EVENT_DATE) 
INTERVAL (NUMTOYMINTERVAL(1, 'MONTH')) (
    PARTITION p_initial VALUES LESS THAN (TO_DATE('01-01-2024', 'DD-MM-YYYY'))
);

-- 3.	Создайте таблицу T_HASH c хэш-секционированием. Используйте ключ секционирования типа VARCHAR2.
CREATE TABLE T_HASH (
    ID NUMBER,
    HASH_KEY VARCHAR2(30),
    VALUE NUMBER
)
PARTITION BY HASH (HASH_KEY)
PARTITIONS 3;

-- 4.	Создайте таблицу T_LIST со списочным секционированием. Используйте ключ секционирования типа CHAR.
CREATE TABLE T_LIST (
    CATEGORY CHAR(1),
    PRODUCT_NAME VARCHAR2(50),
    PRICE NUMBER
)
PARTITION BY LIST (CATEGORY) (
    PARTITION part_electronics VALUES ('E'),
    PARTITION part_clothing VALUES ('C'),
    PARTITION part_other VALUES (DEFAULT)
);

-- 5.	Введите с помощью операторов INSERT данные в таблицы T_RANGE, T_INTERVAL, T_HASH, T_LIST. 
     -- Данные должны быть такими, чтобы они разместились по всем секциям. 
     -- Продемонстрируйте это с помощью SELECT запроса. 

-- T_RANGE
INSERT INTO T_RANGE VALUES(50, 'Low Range Item', SYSDATE);
INSERT INTO T_RANGE VALUES(51, 'Second Low Range Item', SYSDATE);
INSERT INTO T_RANGE VALUES(150, 'Medium Range Item', SYSDATE);
INSERT INTO T_RANGE VALUES(250, 'High Range Item', SYSDATE);

SELECT * FROM T_RANGE;
SELECT * FROM USER_TAB_PARTITIONS;

SELECT ID, NAME, CREATED_DATE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_RANGE;


-- T_INTERVAL
INSERT INTO T_INTERVAL VALUES(1, TO_DATE('01-12-2023', 'DD-MM-YYYY'), 'Event in Initial Partition');
INSERT INTO T_INTERVAL VALUES(2, TO_DATE('01-02-2024', 'DD-MM-YYYY'), 'Event in February');
INSERT INTO T_INTERVAL VALUES(4, TO_DATE('02-02-2024', 'DD-MM-YYYY'), 'Event in February 2');
INSERT INTO T_INTERVAL VALUES(3, TO_DATE('01-03-2024', 'DD-MM-YYYY'), 'Event in March');

SELECT * FROM T_INTERVAL;

SELECT ID, EVENT_DATE, EVENT_DESCRIPTION, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_INTERVAL;

-- T_HASH
INSERT INTO T_HASH VALUES(1, 'Key1', 100);
INSERT INTO T_HASH VALUES(2, 'Key2', 200);
INSERT INTO T_HASH VALUES(3, 'Key3', 300);
INSERT INTO T_HASH VALUES(4, 'Key4', -100);
INSERT INTO T_HASH VALUES(5, 'Key5', 112);
INSERT INTO T_HASH VALUES(6, 'Key6', 10001);
INSERT INTO T_HASH VALUES(7, 'Key7', 76553);
INSERT INTO T_HASH VALUES(8, 'Key8', 76554);
INSERT INTO T_HASH VALUES(9, 'Key9', 76555);


SELECT * FROM T_HASH;

SELECT ID, HASH_KEY, VALUE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_HASH;

-- T_LIST
INSERT INTO T_LIST VALUES('E', 'PS5 PRO', 500);
INSERT INTO T_LIST VALUES('C', 'Jacket', 100);
INSERT INTO T_LIST VALUES('X', 'Chair', 50);

SELECT * FROM T_LIST;

SELECT CATEGORY, PRODUCT_NAME, PRICE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_LIST;

-- 6.	Продемонстрируйте для всех таблиц процесс перемещения строк между секциями, при изменении (оператор UPDATE) ключа секционирования.
ALTER TABLE T_RANGE ENABLE ROW MOVEMENT;
ALTER TABLE T_LIST ENABLE ROW MOVEMENT;
ALTER TABLE T_INTERVAL ENABLE ROW MOVEMENT;
ALTER TABLE T_HASH ENABLE ROW MOVEMENT;
-- T_RANGE
INSERT INTO T_RANGE VALUES(60, 'Shuffle item', SYSDATE);

UPDATE T_RANGE SET ID = 150 WHERE ID = 60;

SELECT ID, NAME, CREATED_DATE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_RANGE;

-- T_INTERVAL
INSERT INTO T_INTERVAL VALUES(1, TO_DATE('10-12-2023', 'DD-MM-YYYY'), 'Initial Event');

UPDATE T_INTERVAL SET EVENT_DATE = TO_DATE('22-02-2024', 'DD-MM-YYYY') WHERE ID = 1;

SELECT ID, EVENT_DATE, EVENT_DESCRIPTION, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_INTERVAL;

-- T_HASH
INSERT INTO T_HASH VALUES(10, 'Key10', 1001);

UPDATE T_HASH SET HASH_KEY = 'NewKey10' WHERE ID = 10;

SELECT ID, HASH_KEY, VALUE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_HASH;

-- T_LIST
INSERT INTO T_LIST VALUES('E', 'Asus Zen Book 2023', 1000);

UPDATE T_LIST SET CATEGORY = 'C' WHERE CATEGORY = 'E';

SELECT CATEGORY, PRODUCT_NAME, PRICE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_LIST;

-- 7.	Для одной из таблиц продемонстрируйте действие оператора ALTER TABLE MERGE.
ALTER TABLE T_RANGE MERGE PARTITIONS part_low, part_medium INTO PARTITION part_combined;

SELECT ID, NAME, CREATED_DATE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_RANGE;

-- 8.	Для одной из таблиц продемонстрируйте действие оператора ALTER TABLE SPLIT.
ALTER TABLE T_RANGE SPLIT PARTITION part_high AT (500)
INTO (
    PARTITION part_mid_high,
    PARTITION part_high
);

INSERT INTO T_RANGE VALUES(250, 'mid-high Range Item', SYSDATE);
INSERT INTO T_RANGE VALUES(500, 'mid-high Range Item', SYSDATE);
INSERT INTO T_RANGE VALUES(550, 'mid-high Range Item', SYSDATE);

SELECT ID, NAME, CREATED_DATE, DBMS_ROWID.ROWID_OBJECT(ROWID) AS PARTITION_OBJECT_ID
FROM T_RANGE;
-- 9.	Для одной из таблиц продемонстрируйте действие оператора ALTER TABLE EXCHANGE.
CREATE TABLE TEMP_PRODUCTS AS SELECT * FROM T_LIST WHERE CATEGORY = 'C';

ALTER TABLE T_LIST EXCHANGE PARTITION part_electronics 
WITH TABLE TEMP_PRODUCTS WITHOUT VALIDATION;

SELECT * FROM TEMP_PRODUCTS;
SELECT * FROM T_LIST;
-- DROPSI
DROP TABLE T_RANGE;
DROP TABLE T_INTERVAL;
DROP TABLE T_HASH;
DROP TABLE T_LIST;
DROP TABLE TEMP_PRODUCTS;




















