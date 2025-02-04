--1. Добавьте в таблицу TEACHERS два столбца BIRTHDAY и SALARY, заполните их значениями.
ALTER TABLE TEACHER
ADD (
    BIRTHDAY DATE,
    SALARY NUMBER
);

BEGIN
  FOR rec IN (SELECT TEACHER FROM TEACHER) LOOP
    UPDATE TEACHER
    SET 
      BIRTHDAY = TO_DATE('1960-01-01', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 11323)),
      SALARY = ROUND(DBMS_RANDOM.VALUE(1000, 3500), 2)
    WHERE TEACHER = rec.TEACHER;
  END LOOP;
END;
/

SELECT * FROM TEACHER;

--2. Получите список преподавателей в виде Фамилия И.О.
SELECT * FROM TEACHER;

--3. Получите список преподавателей, родившихся в понедельник.
SELECT 
  REGEXP_SUBSTR(TEACHER_NAME, '^[^ ]+') || ' ' || 
  SUBSTR(REGEXP_SUBSTR(TEACHER_NAME, '[^ ]+ ', INSTR(TEACHER_NAME, ' ') + 1), 1, 1) || '.' || 
  SUBSTR(REGEXP_SUBSTR(TEACHER_NAME, '[^ ]+$'), 1, 1) || '.' AS FULL_NAME
FROM TEACHER;

--4. Создайте представление, в котором поместите список преподавателей, которые родились в следующем месяце.
CREATE OR REPLACE VIEW Teachers_Next_Month_Birthday AS
SELECT TEACHER, TEACHER_NAME, BIRTHDAY
FROM TEACHER
WHERE EXTRACT(MONTH FROM BIRTHDAY) = EXTRACT(MONTH FROM ADD_MONTHS(SYSDATE, 1));

SELECT * FROM Teachers_Next_Month_Birthday;

--5. Создайте представление, в котором поместите количество преподавателей, которые родились в каждом месяце.
CREATE OR REPLACE VIEW Teacher_Birthdays_Per_Month AS
SELECT EXTRACT(MONTH FROM BIRTHDAY) AS BIRTH_MONTH,
       COUNT(*) AS TEACHER_COUNT
FROM TEACHER
GROUP BY EXTRACT(MONTH FROM BIRTHDAY)
ORDER BY BIRTH_MONTH;

SELECT * FROM Teacher_Birthdays_Per_Month;
--6. Создать курсор и вывести список преподавателей, у которых в следующем году юбилей. ubilei
DECLARE
  CURSOR ubilei_teachers IS 
    SELECT TEACHER_NAME, BIRTHDAY
    FROM TEACHER
    WHERE MOD(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM BIRTHDAY), 5) = 0;

  v_teacher_name TEACHER.TEACHER_NAME%TYPE;
  v_birthday TEACHER.BIRTHDAY%TYPE;
BEGIN
  OPEN ubilei_teachers;
  
  LOOP
    FETCH ubilei_teachers INTO v_teacher_name, v_birthday;
    
    EXIT WHEN ubilei_teachers%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Преподаватель: ' || v_teacher_name || ', День рождения: ' || TO_CHAR(v_birthday, 'YYYY-MM-DD'));
  END LOOP;

  CLOSE ubilei_teachers;
END;
/

--7. Создать курсор и вывести среднюю заработную плату по кафедрам с округлением вниз до целых, вывести средние итоговые значения для каждого факультета и для всех факультетов в целом.
DECLARE
  CURSOR cur_pulpit_avg_salary IS
    SELECT P.PULPIT_NAME, 
           FLOOR(AVG(T.SALARY)) AS AVG_SALARY
    FROM TEACHER T
    JOIN PULPIT P ON T.PULPIT = P.PULPIT
    GROUP BY P.PULPIT_NAME;

  CURSOR cur_faculty_avg_salary IS
    SELECT F.FACULTY_NAME,
           FLOOR(AVG(T.SALARY)) AS AVG_SALARY
    FROM TEACHER T
    JOIN PULPIT P ON T.PULPIT = P.PULPIT
    JOIN FACULTY F ON P.FACULTY = F.FACULTY
    GROUP BY F.FACULTY_NAME;

  v_pulpit_name PULPIT.PULPIT_NAME%TYPE;
  v_avg_salary NUMBER;
  
  v_faculty_name FACULTY.FACULTY_NAME%TYPE;
  v_faculty_avg_salary NUMBER;
  
  v_overall_avg_salary NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Средняя зарплата по кафедрам:');
  OPEN cur_pulpit_avg_salary;
  LOOP
    FETCH cur_pulpit_avg_salary INTO v_pulpit_name, v_avg_salary;
    EXIT WHEN cur_pulpit_avg_salary%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Кафедра: ' || v_pulpit_name || ', Средняя зарплата: ' || v_avg_salary);
  END LOOP;
  CLOSE cur_pulpit_avg_salary;

  DBMS_OUTPUT.PUT_LINE('Средняя зарплата по факультетам:');
  OPEN cur_faculty_avg_salary;
  LOOP
    FETCH cur_faculty_avg_salary INTO v_faculty_name, v_faculty_avg_salary;
    EXIT WHEN cur_faculty_avg_salary%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Факультет: ' || v_faculty_name || ', Средняя зарплата: ' || v_faculty_avg_salary);
  END LOOP;
  CLOSE cur_faculty_avg_salary;

  SELECT FLOOR(AVG(SALARY))
  INTO v_overall_avg_salary
  FROM TEACHER;

  DBMS_OUTPUT.PUT_LINE('Средняя зарплата для всех факультетов: ' || v_overall_avg_salary);
END;
/

--8. Создайте собственный тип PL/SQL-записи (record) и продемонстрируйте работу с ним. Продемонстрируйте работу с вложенными записями. Продемонстрируйте и объясните операцию присвоения.
DECLARE
  TYPE teacher_record IS RECORD (
    teacher_id    VARCHAR2(10),
    teacher_name  VARCHAR2(120),
    salary        NUMBER
  );

  TYPE pulpit_record IS RECORD (
    pulpit_id   VARCHAR2(10),
    pulpit_name VARCHAR2(120),
    teacher_info teacher_record
  );

  v_teacher teacher_record;
  v_pulpit pulpit_record;
BEGIN
  v_teacher.teacher_id := 'T01';
  v_teacher.teacher_name := 'Макаров Артём Робертович';
  v_teacher.salary := 2500;

  v_pulpit.pulpit_id := 'IT1';
  v_pulpit.pulpit_name := 'Информационные технологии';
  v_pulpit.teacher_info := v_teacher;

  DBMS_OUTPUT.PUT_LINE('ID преподавателя: ' || v_pulpit.teacher_info.teacher_id);
  DBMS_OUTPUT.PUT_LINE('Имя преподавателя: ' || v_pulpit.teacher_info.teacher_name);
  DBMS_OUTPUT.PUT_LINE('Зарплата преподавателя: ' || v_pulpit.teacher_info.salary);
  DBMS_OUTPUT.PUT_LINE('Кафедра: ' || v_pulpit.pulpit_name);
  
  v_teacher.teacher_id := 'T02';
  v_teacher.teacher_name := 'Казакова София Кирилловна';
  v_teacher.salary := 2800;

  v_pulpit.teacher_info := v_teacher;

  DBMS_OUTPUT.PUT_LINE('Новый преподаватель:');
  DBMS_OUTPUT.PUT_LINE('ID преподавателя: ' || v_pulpit.teacher_info.teacher_id);
  DBMS_OUTPUT.PUT_LINE('Имя преподавателя: ' || v_pulpit.teacher_info.teacher_name);
  DBMS_OUTPUT.PUT_LINE('Зарплата преподавателя: ' || v_pulpit.teacher_info.salary);
END;
/