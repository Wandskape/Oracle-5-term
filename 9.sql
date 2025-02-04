-- Заполнение таблицы AUDITORIUM_TYPE
INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
VALUES ('LK', 'Лекционный зал');

INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
VALUES ('LAB', 'Лаборатория');

INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
VALUES ('CRM', 'Компьютерный класс');

INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
VALUES ('DRM', 'Обычный класс');

-- Заполнение таблицы AUDITORIUM
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('100', 'Лекционный зал 100', 250, 'LK');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('200', 'Лекционный зал 200', 300, 'LK');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('313', 'Лекционный зал 313', 100, 'LK');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('408', 'Лекционный зал 408', 400, 'LK');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('154', 'Лаборатория 154', 15, 'LAB');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('149', 'Лаборатория 149', 15, 'LAB');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('511', 'Лаборатория 511', 15, 'LAB');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('504', 'Лаборатория 504', 15, 'LAB');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('324', 'Компьютерный класс 324', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('320', 'Компьютерный класс 320', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('301', 'Компьютерный класс 301', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('306', 'Компьютерный класс 306', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('308', 'Компьютерный класс 308', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('201', 'Компьютерный класс 201', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('204', 'Компьютерный класс 204', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('206', 'Компьютерный класс 206', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('208', 'Компьютерный класс 208', 15, 'CRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('115', 'Обычный класс 115', 30, 'DRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('116', 'Обычный класс 116', 30, 'DRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('117', 'Обычный класс 117', 30, 'DRM');

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
VALUES ('118', 'Обычный класс 118', 30, 'DRM');

-- Заполнение таблицы FACULTY
ALTER TABLE FACULTY
MODIFY (FACULTY_NAME VARCHAR2(100));


INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
VALUES ('FIT', 'Факультет информационных технологий');

INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
VALUES ('FLX', 'Факультет лесного хозяйства');

INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
VALUES ('FLI', 'Факультет лесной инженерии');

INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
VALUES ('FXT', 'Факультет химический технологий');

-- Заполнение таблицы PULPIT
ALTER TABLE PULPIT
MODIFY (PULPIT_NAME VARCHAR2(120));

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('IT1', 'Кафедра информационных систем и технологий', 'FIT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('IT2', 'Кафедра информатики и веб-дизайна', 'FIT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('IT3', 'Кафедра программной инженерии', 'FIT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('IT4', 'Кафедра физики', 'FIT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LX1', 'Кафедра лесоводства', 'FLX');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LX2', 'Кафедра лесоустройства', 'FLX');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LX3', 'Кафедра лесозащиты', 'FLX');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LX4', 'Кафедра лесных культур', 'FLX');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LI1', 'Кафедра лесных машин', 'FLI');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LI2', 'Кафедра энергосбережения', 'FLI');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LI3', 'Кафедра материаловедения', 'FLI');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('LI4', 'Кафедра гидравлики', 'FLI');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('XT1', 'Кафедра химии', 'FXT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('XT2', 'Кафедра машин и аппаратов', 'FXT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('XT3', 'Кафедра процессов', 'FXT');

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
VALUES ('XT4', 'Кафедра механики', 'FXT');

-- Заполнение таблицы TEACHER
ALTER TABLE TEACHER
MODIFY (TEACHER_NAME VARCHAR2(120));

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T01', 'Макаров Артём Робертович', 'IT1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T02', 'Казакова София Кирилловна', 'IT1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T03', 'Фирсова Лидия Андреевна', 'IT2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T04', 'Зайцев Степан Кириллович', 'IT2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T05', 'Николаев Александр Иванович', 'IT3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T06', 'Лаврентьева Алиса Александровна', 'IT3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T07', 'Бурова Эмилия Ивановна', 'IT4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T08', 'Демидова Вера Антоновна', 'IT4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T09', 'Гаврилов Никита Данилович', 'LX1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T10', 'Соколов Артём Григорьевич', 'LX1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T11', 'Абрамова Анна Фёдоровна', 'LX2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T12', 'Семенова Анна Фёдоровна', 'LX2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T13', 'Кудрявцева Александра Марсельевна', 'LX3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T14', 'Максимов Александр Арсентьевич', 'LX3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T15', 'Наумов Роман Романович', 'LX4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T16', 'Пахомов Матвей Даниилович', 'LX4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T17', 'Попова Мария Вячеславовна', 'LI1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T18', 'Макаров Никита Николаевич', 'LI1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T19', 'Тихомирова Вероника Егоровна', 'LI2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T20', 'Белов Ярослав Денисович', 'LI2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T21', 'Дмитриев Макар Ильич', 'LI3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T22', 'Фомина Алиса Вячеславовна', 'LI3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T23', 'Игнатова Анна Егоровна', 'LI4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T24', 'Федорова Анна Львовна', 'LI4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T25', 'Прохоров Адам Александрович', 'XT1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T26', 'Соловьев Вадим Викторович', 'XT1');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T27', 'Безруков Тихон Никитич', 'XT2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T28', 'Пирогова Елена Александровна', 'XT2');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T29', 'Андреев Макар Иванович', 'XT3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T30', 'Соколова Варвара Фёдоровна', 'XT3');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T31', 'Алексеев Платон Александрович', 'XT4');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, PULPIT)
VALUES ('T32', 'Дроздова Александра Фёдоровна', 'XT4');

-- Заполнение таблицы SUBJECT
ALTER TABLE SUBJECT
MODIFY (SUBJECT_NAME VARCHAR2(100));

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S01', 'Основы программирования', 'IT1');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S02', 'Алгоритмы и структуры данных', 'IT2');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S03', 'Разработка мобильных приложений', 'IT3');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S04', 'Базы данных и SQL', 'IT4');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S05', 'Лесная экология', 'LX1');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S06', 'Технологии лесоводства', 'LX2');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S07', 'Охрана лесных экосистем', 'LX3');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S08', 'Лесоустройство и планирование', 'LX4');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S09', 'Инженерная экология леса', 'LI1');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S10', 'Лесные дороги и мосты', 'LI2');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S11', 'Проектирование лесных объектов', 'LI3');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S12', 'Механизация лесных работ', 'LI4');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S13', 'Оборудование химических производств', 'XT1');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S14', 'Химия и процессные технологии', 'XT2');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S15', 'Технология органических веществ', 'XT3');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
VALUES ('S16', 'Экологическая химия и безопасность', 'XT4');

--1. Разработайте АБ, демонстрирующий работу оператора SELECT с точной выборкой. 

DECLARE
    v_faculty_name VARCHAR2(100);
BEGIN
    -- Выполняем точный запрос для выборки имени факультета
    SELECT FACULTY_NAME INTO v_faculty_name 
    FROM FACULTY 
    WHERE FACULTY = 'FIT';

    DBMS_OUTPUT.PUT_LINE('Факультет: ' || v_faculty_name);
END;
/


--2. Разработайте АБ, демонстрирующий работу оператора SELECT с неточной точной выборкой. Используйте конструкцию WHEN OTHERS секции исключений и встроенную функции SQLERRM, SQLCODE для диагностирования неточной выборки. 

DECLARE
    v_pulpit_name VARCHAR2(100);
BEGIN
    BEGIN
        SELECT PULPIT INTO v_pulpit_name
        FROM PULPIT
        WHERE PULPIT LIKE '%XT1%';

        DBMS_OUTPUT.PUT_LINE('Найдена кафедра: ' || v_pulpit_name);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Записи не найдены для указанного условия.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Произошла ошибка. Код: ' || SQLCODE || ' - ' || SQLERRM);
    END;
END;
/

--3. Разработайте АБ, демонстрирующий работу конструкции WHEN TO_MANY_ROWS секции исключений для диагностирования неточной выборки. 

select * from AUDITORIUM;

DECLARE
    v_auditorium_name VARCHAR2(100);
BEGIN
    BEGIN
        SELECT AUDITORIUM_NAME INTO v_auditorium_name
        FROM AUDITORIUM
        WHERE AUDITORIUM_TYPE = 'LK';  

        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_auditorium_name);

    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Ошибка: Запрос вернул слишком много строк.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Произошла ошибка. Код: ' || SQLCODE || ' - ' || SQLERRM);
    END;
END;
/

--4. Разработайте АБ, демонстрирующий возникновение и обработку исключения NO_DATA_FOUND. Разработайте АБ, демонстрирующий применение атрибутов неявного курсора.

select * from FACULTY;
DECLARE
    v_faculty_name VARCHAR2(100);
BEGIN
    BEGIN
        SELECT FACULTY_NAME INTO v_faculty_name
        FROM FACULTY
        WHERE FACULTY = 'FIT';  

        DBMS_OUTPUT.PUT_LINE('Факультет: ' || v_faculty_name);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Ошибка: Факультет не найден.');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Ошибка: Запрос вернул слишком много строк.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Произошла ошибка. Код: ' || SQLCODE || ' - ' || SQLERRM);
    END;
END;
/


DECLARE
    v_faculty_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_faculty_count
    FROM FACULTY
    WHERE FACULTY LIKE 'FI%';

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Количество факультетов на букву I: ' || v_faculty_count);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Записи не найдены.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Количество обработанных строк: ' || SQL%ROWCOUNT);
END;
/

--5. Разработайте АБ, демонстрирующий применение оператора UPDATE совместно с операторами COMMIT/ROLLBACK. 

select * from AUDITORIUM;

DECLARE
    v_old_capacity NUMBER;
BEGIN
    SELECT AUDITORIUM_CAPACITY INTO v_old_capacity
    FROM AUDITORIUM
    WHERE AUDITORIUM = '100';

    UPDATE AUDITORIUM
    SET AUDITORIUM_CAPACITY = AUDITORIUM_CAPACITY + 10
    WHERE AUDITORIUM = '100';

    DBMS_OUTPUT.PUT_LINE('Вместимость аудитории обновлена.');

    IF v_old_capacity < 110 THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Изменения зафиксированы.');
    ELSE
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Изменения отменены.');
    END IF;
END;
/

--6. Продемонстрируйте оператор UPDATE, вызывающий нарушение целостности в базе данных. Обработайте возникшее исключение.

SELECT * FROM FACULTY; 

DECLARE
    v_faculty_old VARCHAR2(10);
BEGIN
    SELECT FACULTY INTO v_faculty_old
    FROM PULPIT
    WHERE PULPIT_NAME = 'Кафедра информационных систем и технологий';

    BEGIN
        UPDATE PULPIT
        SET FACULTY = 'XXX'  -- Значение, которого нет в FACULTY
        WHERE PULPIT_NAME = 'Кафедра информационных систем и технологий';

        DBMS_OUTPUT.PUT_LINE('Обновление выполнено.');

    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2291 THEN
                DBMS_OUTPUT.PUT_LINE('Ошибка: Нарушение целостности внешнего ключа. Недопустимое значение FACULTY.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLCODE || ' - ' || SQLERRM);
            END IF;

            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Операция откатилась.');
    END;
END;
/

--7. Разработайте АБ, демонстрирующий применение оператора INSERT совместно с операторами COMMIT/ROLLBACK.

select * from FACULTY;

DECLARE
    v_faculty_name VARCHAR2(100) := 'Факультет ФИЗКУЛЬТУРЫ';
BEGIN
    INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
    VALUES ('FZN', v_faculty_name);

    DBMS_OUTPUT.PUT_LINE('Запись вставлена.');

    IF v_faculty_name = 'NORMIS' THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Изменения зафиксированы.');
    ELSE
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Изменения отменены.');
    END IF;
END;
/

--8. Продемонстрируйте оператор INSERT, вызывающий нарушение целостности в базе данных. Обработайте возникшее исключение.

select * from PULPIT;

DECLARE
    v_pulpit_name VARCHAR2(100) := 'Кафедра лесоводства';
    v_faculty VARCHAR2(10) := 'FIE';
BEGIN
    BEGIN
        INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY)
        VALUES ('EXP99', v_pulpit_name, v_faculty);

        DBMS_OUTPUT.PUT_LINE('Запись вставлена.');

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2291 THEN
                DBMS_OUTPUT.PUT_LINE('Ошибка: Нарушение целостности внешнего ключа. Недопустимое значение FACULTY.');
            ELSIF SQLCODE = -1 THEN
                DBMS_OUTPUT.PUT_LINE('Ошибка: Нарушение уникального ограничения. Запись с таким PULPIT_NAME уже существует.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLCODE || ' - ' || SQLERRM);
            END IF;

            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Операция откатилась.');
    END;
END;
/

--9. Разработайте АБ, демонстрирующий применение оператора DELETE совместно с операторами COMMIT/ROLLBACK.

select * from SUBJECT;
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
        VALUES ('S17', 'Компьютерные системы и сети', 'IT1');
COMMIT;
        
DECLARE
    v_subject_name VARCHAR2(100) := 'Компьютерные системы и сети';
BEGIN
    DELETE FROM SUBJECT
    WHERE SUBJECT_NAME = v_subject_name;

    DBMS_OUTPUT.PUT_LINE('Запись удалена.');

    -- Условие для выполнения COMMIT или ROLLBACK
    IF v_subject_name = 'Компьютерные системы и сети' THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Изменения зафиксированы.');
    ELSE
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Изменения отменены.');
    END IF;
END;
/

--10. Продемонстрируйте оператор DELETE, вызывающий нарушение целостности в базе данных. Обработайте возникшее исключение.

SELECT * FROM FACULTY;
INSERT INTO FACULTY VALUES ('XX1', 'TEST');
COMMIT;

DECLARE
    v_faculty VARCHAR2(10) := 'FXT';
BEGIN
    BEGIN
        DELETE FROM FACULTY
        WHERE FACULTY = v_faculty;

        DBMS_OUTPUT.PUT_LINE('Запись удалена.');

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2292 THEN
                DBMS_OUTPUT.PUT_LINE('Ошибка: Нарушение целостности. Есть зависимые записи в связанных таблицах.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLCODE || ' - ' || SQLERRM);
            END IF;

            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Операция откатилась.');
    END;
END;
/
--11. Создайте анонимный блок, распечатывающий таблицу TEACHER с применением явного курсора LOOP-цикла. Считанные данные должны быть записаны в переменные, объявленные с применением опции %TYPE.

DECLARE
    v_teacher_name TEACHER.TEACHER_NAME%TYPE;
    v_pulpit TEACHER.PULPIT%TYPE;

    CURSOR teacher_cursor IS
        SELECT TEACHER_NAME, PULPIT
        FROM TEACHER;
BEGIN
    -- Открытие курсора и обход каждой строки с использованием цикла LOOP
    OPEN teacher_cursor;
    LOOP
        FETCH teacher_cursor INTO v_teacher_name, v_pulpit;  -- Извлечение данных из курсора
        EXIT WHEN teacher_cursor%NOTFOUND;  -- Прерывание цикла, если больше нет данных

        -- Вывод данных о преподавателях
        DBMS_OUTPUT.PUT_LINE('Преподаватель: ' || v_teacher_name || ', Кафедра: ' || v_pulpit);
    END LOOP;

    -- Закрытие курсора
    CLOSE teacher_cursor;
END;
/
--12. Создайте АБ, распечатывающий таблицу SUBJECT с применением явного курсора иWHILE-цикла. Считанные данные должны быть записаны в запись (RECORD), объявленную с применением опции %ROWTYPE.
DECLARE
    v_subject SUBJECT%ROWTYPE;

    CURSOR subject_cursor IS
        SELECT * FROM SUBJECT;

BEGIN
    OPEN subject_cursor;

    WHILE TRUE LOOP
        FETCH subject_cursor INTO v_subject;

        IF subject_cursor%NOTFOUND THEN
            EXIT;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Предмет: ' || v_subject.SUBJECT_NAME || ', Кафедра: ' || v_subject.PULPIT);
    END LOOP;
    CLOSE subject_cursor;
END;
/

--13. Создайте АБ, распечатывающий все кафедры (таблица PULPIT) и фамилии всех преподавателей (TEACHER) использовав, соединение (JOIN) PULPIT и TEACHER и с применением явного курсора и FOR-цикла.

DECLARE
    CURSOR teacher_cursor IS
        SELECT P.PULPIT, T.TEACHER_NAME
        FROM PULPIT P
        JOIN TEACHER T ON P.PULPIT = T.PULPIT
        ORDER BY P.PULPIT;
BEGIN
    FOR v_record IN teacher_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Кафедра: ' || v_record.PULPIT || ', Преподаватель: ' || v_record.TEACHER_NAME);
    END LOOP;
END;
/

--14. Создайте АБ, распечатывающий следующие списки аудиторий: все аудитории (таблица AUDITORIUM) с вместимостью меньше 20, от 21-30, от 31-60, от 61 до 80, от 81 и выше. Примените курсор с параметрами и три способа организации цикла по строкам курсора.
DECLARE
    -- Объявление курсора с параметром вместимости
    CURSOR auditorium_cursor(p_capacity_from NUMBER, p_capacity_to NUMBER) IS
        SELECT AUDITORIUM_NAME, AUDITORIUM_CAPACITY
        FROM AUDITORIUM
        WHERE AUDITORIUM_CAPACITY BETWEEN p_capacity_from AND p_capacity_to
        ORDER BY AUDITORIUM_CAPACITY;

    v_auditorium_name AUDITORIUM.AUDITORIUM_NAME%TYPE;
    v_capacity AUDITORIUM.AUDITORIUM_CAPACITY%TYPE;

BEGIN
    -- 1. Список всех аудиторий с вместимостью < 20
    DBMS_OUTPUT.PUT_LINE('Аудитории с вместимостью < 20:');
    FOR v_record IN auditorium_cursor(1, 19) LOOP
        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_record.AUDITORIUM_NAME || ', Вместимость: ' || v_record.AUDITORIUM_CAPACITY);
    END LOOP;

    -- 2. Список всех аудиторий с вместимостью от 21 до 30
    DBMS_OUTPUT.PUT_LINE('Аудитории с вместимостью от 21 до 30:');
    OPEN auditorium_cursor(21, 30);
    LOOP
        FETCH auditorium_cursor INTO v_auditorium_name, v_capacity;
        EXIT WHEN auditorium_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_auditorium_name || ', Вместимость: ' || v_capacity);
    END LOOP;
    CLOSE auditorium_cursor;

    -- 3. Список всех аудиторий с вместимостью от 31 до 60
    DBMS_OUTPUT.PUT_LINE('Аудитории с вместимостью от 31 до 60:');
    OPEN auditorium_cursor(31, 60);
    DECLARE
        v_found BOOLEAN := TRUE;
    BEGIN
        WHILE v_found LOOP
            FETCH auditorium_cursor INTO v_auditorium_name, v_capacity;
            IF auditorium_cursor%NOTFOUND THEN
                v_found := FALSE;
            ELSE
                DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_auditorium_name || ', Вместимость: ' || v_capacity);
            END IF;
        END LOOP;
    END;
    CLOSE auditorium_cursor;

    -- 4. Список всех аудиторий с вместимостью от 61 до 80
    DBMS_OUTPUT.PUT_LINE('Аудитории с вместимостью от 61 до 80:');
    FOR v_record IN auditorium_cursor(61, 80) LOOP
        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_record.AUDITORIUM_NAME || ', Вместимость: ' || v_record.AUDITORIUM_CAPACITY);
    END LOOP;

    -- 5. Список всех аудиторий с вместимостью 81 и выше
    DBMS_OUTPUT.PUT_LINE('Аудитории с вместимостью > 80:');
    OPEN auditorium_cursor(81, 500);
    LOOP
        FETCH auditorium_cursor INTO v_auditorium_name, v_capacity;
        EXIT WHEN auditorium_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_auditorium_name || ', Вместимость: ' || v_capacity);
    END LOOP;
    CLOSE auditorium_cursor;
END;
/

--15. Создайте AБ. Объявите курсорную переменную с помощью системного типа refcursor. Продемонстрируйте ее применение для курсора c параметрами. 
DECLARE
    v_cursor SYS_REFCURSOR;  -- Курсорная переменная

    -- Переменные для хранения данных, извлекаемых из курсора
    v_auditorium_name AUDITORIUM.AUDITORIUM_NAME%TYPE;
    v_capacity AUDITORIUM.AUDITORIUM_CAPACITY%TYPE;

    -- Параметры для курсора
    v_min_capacity NUMBER := 15;
    v_max_capacity NUMBER := 100;

BEGIN
    OPEN v_cursor FOR
        SELECT AUDITORIUM_NAME, AUDITORIUM_CAPACITY
        FROM AUDITORIUM
        WHERE AUDITORIUM_CAPACITY BETWEEN v_min_capacity AND v_max_capacity
        ORDER BY AUDITORIUM_CAPACITY;

    LOOP
        FETCH v_cursor INTO v_auditorium_name, v_capacity;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_auditorium_name || ', Вместимость: ' || v_capacity);
    END LOOP;

    CLOSE v_cursor;
END;
/


--16. Создайте AБ. Продемонстрируйте понятие курсорный подзапрос?
DECLARE
    -- Объявление курсора с параметром
    CURSOR faculty_pulpit_cursor(p_faculty_name FACULTY.FACULTY_NAME%TYPE) IS
        SELECT PULPIT
        FROM PULPIT
        WHERE FACULTY = (SELECT FACULTY 
                         FROM FACULTY 
                         WHERE FACULTY_NAME = p_faculty_name);

    -- Переменные для хранения данных
    v_pulpit_name PULPIT.PULPIT%TYPE;
BEGIN
    -- Проход по всем факультетам через SQL-запрос
    FOR faculty_rec IN (SELECT FACULTY_NAME FROM FACULTY) LOOP
        DBMS_OUTPUT.PUT_LINE('Факультет: ' || faculty_rec.FACULTY_NAME);

        -- Открытие подкурсорной выборки для кафедр текущего факультета
        FOR pulp_rec IN faculty_pulpit_cursor(faculty_rec.FACULTY_NAME) LOOP
            DBMS_OUTPUT.PUT_LINE('   Кафедра: ' || pulp_rec.PULPIT);
        END LOOP;
    END LOOP;
END;
/

--17. Создайте AБ. Уменьшите вместимость всех аудиторий (таблица AUDITORIUM) вместимостью от 40 до 80 на 10%. Используйте явный курсор с параметрами, цикл FOR, конструкцию UPDATE CURRENT OF. 
DECLARE
    -- Объявление явного курсора с параметрами для выборки аудиторий по вместимости
    CURSOR auditorium_cursor(p_capacity_from NUMBER, p_capacity_to NUMBER) IS
        SELECT AUDITORIUM_NAME, AUDITORIUM_CAPACITY
        FROM AUDITORIUM
        WHERE AUDITORIUM_CAPACITY BETWEEN p_capacity_from AND p_capacity_to
        FOR UPDATE OF AUDITORIUM_CAPACITY;
BEGIN
    -- Проход по всем аудиториям, подходящим по вместимости
    FOR v_record IN auditorium_cursor(15, 30) LOOP
        -- Уменьшаем вместимость на 10%
        UPDATE AUDITORIUM
        SET AUDITORIUM_CAPACITY = v_record.AUDITORIUM_CAPACITY * 0.9
        WHERE CURRENT OF auditorium_cursor;

        -- Выводим информацию об измененной аудитории
        DBMS_OUTPUT.PUT_LINE('Аудитория: ' || v_record.AUDITORIUM_NAME || 
                             ', Новая вместимость: ' || v_record.AUDITORIUM_CAPACITY * 0.9);
    END LOOP;

    --COMMIT;
END;
/

--18. Создайте AБ. Удалите все аудитории (таблица AUDITORIUM) вместимостью от 0 до 20. Используйте явный курсор с параметрами, цикл WHILE, конструкцию UPDATE CURRENT OF. 
DECLARE
    -- Объявление явного курсора с параметром для выборки аудиторий по вместимости
    CURSOR auditorium_cursor(p_capacity_from NUMBER, p_capacity_to NUMBER) IS
        SELECT AUDITORIUM_NAME
        FROM AUDITORIUM
        WHERE AUDITORIUM_CAPACITY BETWEEN p_capacity_from AND p_capacity_to
        FOR UPDATE;

    -- Переменная для хранения имени аудитории
    v_auditorium_name AUDITORIUM.AUDITORIUM_NAME%TYPE;

BEGIN
    OPEN auditorium_cursor(0, 20);

    -- Цикл для удаления аудиторий
    LOOP
        FETCH auditorium_cursor INTO v_auditorium_name;
        EXIT WHEN auditorium_cursor%NOTFOUND;
        DELETE FROM AUDITORIUM
        WHERE CURRENT OF auditorium_cursor;
        DBMS_OUTPUT.PUT_LINE('Удалена аудитория: ' || v_auditorium_name);
    END LOOP;
    --COMMIT;
    CLOSE auditorium_cursor;
END;
/

--19. Создайте AБ. Продемонстрируйте применение псевдостолбца ROWID в операторах UPDATE и DELETE. 
DECLARE
    -- Переменные для хранения данных
    v_rowid ROWID;
    v_auditorium_name AUDITORIUM.AUDITORIUM_NAME%TYPE;
BEGIN
    -- Цикл для обновления данных с использованием ROWID
    FOR v_record IN (SELECT ROWID, AUDITORIUM_NAME FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < 50) LOOP
        -- Запись ROWID в переменную
        v_rowid := v_record.ROWID;
        v_auditorium_name := v_record.AUDITORIUM_NAME;

        -- Обновление записи с использованием ROWID
        UPDATE AUDITORIUM
        SET AUDITORIUM_CAPACITY = AUDITORIUM_CAPACITY + 10
        WHERE ROWID = v_rowid;

        DBMS_OUTPUT.PUT_LINE('Обновлена аудитория: ' || v_auditorium_name);
    END LOOP;

    --COMMIT;

    -- Цикл для удаления данных с использованием ROWID
    FOR v_record IN (SELECT ROWID, AUDITORIUM_NAME FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY >= 100) LOOP
        -- Запись ROWID в переменную
        v_rowid := v_record.ROWID;
        v_auditorium_name := v_record.AUDITORIUM_NAME;

        -- Удаление записи с использованием ROWID
        DELETE FROM AUDITORIUM WHERE ROWID = v_rowid;

        DBMS_OUTPUT.PUT_LINE('Удалена аудитория: ' || v_auditorium_name);
    END LOOP;

    --COMMIT;
END;
/

--20. Распечатайте в одном цикле всех преподавателей (TEACHER), разделив группами по три (отделите группы линией -------------). 
DECLARE
    v_teacher_name TEACHER.TEACHER_NAME%TYPE;
    v_counter NUMBER := 0;
BEGIN
    FOR v_record IN (SELECT TEACHER_NAME FROM TEACHER ORDER BY TEACHER_NAME) LOOP
        DBMS_OUTPUT.PUT_LINE(v_record.TEACHER_NAME);
        v_counter := v_counter + 1;
        IF MOD(v_counter, 3) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('-------------------');
        END IF;
    END LOOP;
END;
/