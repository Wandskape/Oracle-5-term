CREATE TABLE AUDITORIUM_TYPE (
    AUDITORIUM_TYPE VARCHAR2(10) PRIMARY KEY,
    AUDITORIUM_TYPENAME VARCHAR2(50) NOT NULL
);

CREATE TABLE AUDITORIUM (
    AUDITORIUM VARCHAR2(10) PRIMARY KEY,
    AUDITORIUM_NAME VARCHAR2(50) NOT NULL,
    AUDITORIUM_CAPACITY NUMBER NOT NULL,
    AUDITORIUM_TYPE VARCHAR2(10),
    CONSTRAINT fk_auditorium_type FOREIGN KEY (AUDITORIUM_TYPE) REFERENCES AUDITORIUM_TYPE(AUDITORIUM_TYPE)
);

CREATE TABLE FACULTY (
    FACULTY VARCHAR2(10) PRIMARY KEY,
    FACULTY_NAME VARCHAR2(50) NOT NULL
);

CREATE TABLE PULPIT (
    PULPIT VARCHAR2(10) PRIMARY KEY,
    PULPIT_NAME VARCHAR2(50) NOT NULL,
    FACULTY VARCHAR2(10),
    CONSTRAINT fk_faculty FOREIGN KEY (FACULTY) REFERENCES FACULTY(FACULTY)
);

CREATE TABLE TEACHER (
    TEACHER VARCHAR2(10) PRIMARY KEY,
    TEACHER_NAME VARCHAR2(50) NOT NULL,
    PULPIT VARCHAR2(10),
    CONSTRAINT fk_pulpit_teacher FOREIGN KEY (PULPIT) REFERENCES PULPIT(PULPIT)
);

CREATE TABLE SUBJECT (
    SUBJECT VARCHAR2(10) PRIMARY KEY,
    SUBJECT_NAME VARCHAR2(50) NOT NULL,
    PULPIT VARCHAR2(10),
    CONSTRAINT fk_pulpit_subject FOREIGN KEY (PULPIT) REFERENCES PULPIT(PULPIT)
);


-- 1.	Разработайте простейший анонимный блок PL/SQL (АБ), не содержащий операторов.
BEGIN
  NULL;
END;

-- 2.	Разработайте АБ, выводящий «Hello World!». Выполните его в SQLDev и SQL+.
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello, world!');
  NULL;
END;

-- 3.	Продемонстрируйте работу исключения и встроенных функций sqlerrm, sqlcode.
DECLARE
    num NUMBER := 10;
    denom NUMBER := 0;
    result NUMBER;
BEGIN
    result := num / denom;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Ошибка деления на ноль!');
        DBMS_OUTPUT.PUT_LINE('Код ошибки: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Сообщение ошибки: ' || SQLERRM);
END;

-- 4.	Разработайте вложенный блок. Продемонстрируйте принцип обработки исключений во вложенных блоках.
DECLARE
    outer_var NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Начало внешнего блока');
    
    DECLARE
        inner_var NUMBER := 0;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Начало внутреннего блока');
        DBMS_OUTPUT.PUT_LINE('Результат: ' || (outer_var / inner_var));
        
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Внутренний блок: Ошибка деления на ноль!');
    END;
    DBMS_OUTPUT.PUT_LINE('Конец внешнего блока');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Внешний блок: другая ошибка');
END;

-- 5.	Выясните, какие типы предупреждения компилятора поддерживаются в данный момент.
ALTER SESSION SET PLSQL_WARNINGS = 'ENABLE:ALL';

--sqlplus / as sysdba
SHOW PARAMETER PLSQL_WARNINGS;
SELECT * FROM ALL_PLSQL_OBJECT_SETTINGS WHERE PLSQL_WARNINGS not like '%DISABLE:ALL%';
SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME = 'plsql_warnings';
-- 6.	Разработайте скрипт, позволяющий просмотреть все спецсимволы PL/SQL.
SELECT KEYWORD FROM V$RESERVED_WORDS WHERE LENGTH = 1 AND KEYWORD != 'A';

-- 7.	Разработайте скрипт, позволяющий просмотреть все ключевые слова  PL/SQL.
SELECT KEYWORD FROM V$RESERVED_WORDS WHERE LENGTH > 1 AND KEYWORD != 'A' ORDER BY KEYWORD;

-- 8.	Разработайте скрипт, позволяющий просмотреть все параметры Oracle Server, связанные с PL/SQL. Просмотрите эти же параметры с помощью SQL+-команды show.
SELECT name, value, description FROM V$PARAMETER WHERE name LIKE '%plsql%';
SHOW PARAMETERS PLSQL;

-- 9.	Разработайте анонимный блок, демонстрирующий (выводящий в выходной серверный поток результаты):

-- 10.	объявление и инициализацию целых number-переменных;
DECLARE
    var_1 NUMBER;
    var_2 NUMBER;
BEGIN
    var_1 := 10;
    var_2 := 20;
    DBMS_OUTPUT.PUT_LINE('Переменная var_1: ' || var_1);
    DBMS_OUTPUT.PUT_LINE('Переменная var_2: ' || var_2);
END;

-- 11.	арифметические действия над двумя целыми number-переменных, включая деление с остатком;
DECLARE
    var_1 NUMBER := 17;
    var2 NUMBER := 5;
    sum_result NUMBER;
    diff_result NUMBER;
    mul_result NUMBER;
    div_result NUMBER;
    mod_result NUMBER;
BEGIN
    sum_result := var_1 + var2;
    diff_result := var_1 - var2;
    mul_result := var_1 * var2;
    div_result := var_1 / var2;
    mod_result := MOD(var_1, var2);

    DBMS_OUTPUT.PUT_LINE('Сумма: ' || sum_result);
    DBMS_OUTPUT.PUT_LINE('Разность: ' || diff_result);
    DBMS_OUTPUT.PUT_LINE('Произведение: ' || mul_result);
    DBMS_OUTPUT.PUT_LINE('Частное: ' || div_result);
    DBMS_OUTPUT.PUT_LINE('Остаток: ' || mod_result);
END;

-- 12.	объявление и инициализацию number-переменных с фиксированной точкой;
DECLARE
    fixed_var_1 NUMBER(10, 2) := 8.76;
    fixed_var_2 NUMBER(10, 2) := 1.01;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Переменная fixed_var_1: ' || fixed_var_1);
    DBMS_OUTPUT.PUT_LINE('Переменная fixed_var_2: ' || fixed_var_2);
END;

-- 13.	объявление и инициализацию number-переменных с фиксированной точкой и отрицательным масштабом (округление);
DECLARE
    round_var_1 NUMBER(6, -1) := 18.7841;
    round_var_2 NUMBER(6, -2) := 111.513;
    round_var_3 NUMBER(6, 0) := 18.7841;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Переменная round_var_1: ' || round_var_1);
    DBMS_OUTPUT.PUT_LINE('Переменная round_var_2: ' || round_var_2);
    DBMS_OUTPUT.PUT_LINE('Переменная round_var_3: ' || round_var_3);
END;

-- 14.	объявление и инициализацию BINARY_FLOAT-переменной;
DECLARE
    binary_float_var BINARY_FLOAT := 18.351;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Переменная binary_float_var: ' || (binary_float_var));
END;

-- 15.	объявление и инициализацию BINARY_DOUBLE-переменной;
DECLARE
    binary_double_var BINARY_DOUBLE := 35.57921;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Переменная binary_double_var: ' || (binary_double_var));
END;

-- 16.	объявление number-переменных с точкой и применением символа E (степень 10) при инициализации/присвоении;
DECLARE
    numberE_var1 NUMBER := 4.58E3;
    numberE_var2 NUMBER := 5.81E-1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Переменная numerE_var1: ' || numberE_var1);
    DBMS_OUTPUT.PUT_LINE('Переменная numerE_var2: ' || numberE_var2);
END;

-- 17.	объявление и инициализацию BOOLEAN-переменных.
DECLARE
    bool_var_1 BOOLEAN := TRUE;
    bool_var_2 BOOLEAN := FALSE;
    bool_var_3 BOOLEAN := NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Переменная bool_var_1: ' || CASE WHEN bool_var_1 THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('Переменная bool_var_2: ' || CASE WHEN bool_var_2 THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('Переменная bool_var_3: ' || CASE WHEN bool_var_3 IS NULL THEN 'NULL' ELSE 'NOT NULL' END);
END;

-- 18.	Разработайте анонимный блок PL/SQL содержащий объявление констант (VARCHAR2, CHAR, NUMBER). Продемонстрируйте  возможные операции константами.
DECLARE
    c_varchar2 CONSTANT VARCHAR2(20) := 'Hello';
    c_char CONSTANT CHAR(10) := 'world';
    c_number CONSTANT NUMBER := 42;

    concatenation VARCHAR2(50);
    addition NUMBER;
    length_str NUMBER;
BEGIN
    concatenation := c_varchar2 || ', ' || c_char;
    DBMS_OUTPUT.PUT_LINE('Конкатенация: ' || concatenation);

    addition := c_number + 8;
    DBMS_OUTPUT.PUT_LINE('Сложение: ' || addition);

    length_str := length(c_varchar2);
    DBMS_OUTPUT.PUT_LINE('Длина строковой константы: ' || length_str);

    DBMS_OUTPUT.PUT_LINE('CHAR константа: "' || c_char || '"');
END;

-- 19.	Разработайте АБ, содержащий объявления с опцией %TYPE. Продемонстрируйте действие опции.
-- 20.	Разработайте АБ, содержащий объявления с опцией %ROWTYPE. Продемонстрируйте действие опции.
DECLARE
    subject C##KAA1.subject.subject%TYPE;
    pulpit C##KAA1.pulpit.pulpit%TYPE;
    faculty_rec C##KAA1.faculty%ROWTYPE;
BEGIN
    subject := 'ПИС';
    pulpit := 'ИСиТ';
    faculty_rec.faculty := 'ИДиП';
    faculty_rec.faculty_name := 'Факультет дела';

    DBMS_OUTPUT.PUT_LINE(subject);
    DBMS_OUTPUT.PUT_LINE(pulpit);
    DBMS_OUTPUT.PUT_LINE(RTRIM(faculty_rec.faculty) || ':' || faculty_rec.faculty_name);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error = ' || SQLERRM);
END;

-- 21.	Разработайте АБ, демонстрирующий все возможные конструкции оператора IF .
-- 22.	Разработайте АБ, демонстрирующий все возможные конструкции оператора IF .
BEGIN
    IF 1 = 1 THEN
        DBMS_OUTPUT.PUT_LINE('1 равно 1');
    END IF;

    IF 1 = 2 THEN
        DBMS_OUTPUT.PUT_LINE('Это условие не выполнится');
    ELSE
        DBMS_OUTPUT.PUT_LINE('1 не равно 2');
    END IF;

    IF 1 = 2 THEN
        DBMS_OUTPUT.PUT_LINE('Это условие не выполнится');
    ELSIF 1 = 1 THEN
        DBMS_OUTPUT.PUT_LINE('1 равно 1');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Это условие не выполнится');
    END IF;
END;


-- 23.	Разработайте АБ, демонстрирующий работу оператора CASE.
DECLARE
    day_of_week NUMBER := 6;
BEGIN
    CASE day_of_week
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('Понедельник');
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE('Вторник');
        WHEN 3 THEN
            DBMS_OUTPUT.PUT_LINE('Среда');
        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE('Четверг');
        WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE('Пятница');
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE('Суббота');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('Воскресенье');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Неверный день недели');
    END CASE;
END;


-- 24.	Разработайте АБ, демонстрирующий работу оператора LOOP.
DECLARE
    lopee VARCHAR2(20) := 'L';
    counter NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Итерация №' || counter);
        counter := counter + 1;
        lopee := lopee || 'O';
        EXIT WHEN counter > 5;
    END LOOP;
    lopee := lopee || 'P';
    DBMS_OUTPUT.PUT_LINE(lopee);
END;


-- 25.	Разработайте АБ, демонстрирующий работу оператора WHILE.
DECLARE
        lopee VARCHAR2(20) := 'L';
BEGIN
    WHILE length(lopee) <= 10 LOOP
        lopee := lopee || 'O';
    END LOOP;
    lopee := lopee || 'P';
    DBMS_OUTPUT.PUT_LINE(lopee);
END;

-- 26.	Разработайте АБ, демонстрирующий работу оператора FOR.
DECLARE
        lopee VARCHAR2(20) := 'L';
BEGIN
    FOR i IN 1..5 LOOP
        lopee := lopee || 'O';
    END LOOP;
    lopee := lopee || 'P';
    DBMS_OUTPUT.PUT_LINE(lopee);
END;


