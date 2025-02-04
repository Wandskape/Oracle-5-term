CREATE TABLE source_table (
    id NUMBER PRIMARY KEY,
    data VARCHAR2(100),
    created_date DATE
);

CREATE TABLE destination_table (
    id NUMBER PRIMARY KEY,
    data VARCHAR2(100),
    copied_date DATE
);

CREATE TABLE job_log (
    job_id NUMBER PRIMARY KEY,
    status VARCHAR2(50),
    execution_time DATE
);

DROP TABLE source_table;
DROP TABLE destination_table;

SELECT * FROM job_log;
SELECT * FROM source_table;
SELECT * FROM destination_table;

INSERT INTO source_table VALUES (1, 'Test data 1', SYSDATE);
INSERT INTO source_table VALUES (2, 'Test data 2', SYSDATE - 1);
INSERT INTO source_table VALUES (3, 'Test data 3', SYSDATE - 2);
INSERT INTO source_table VALUES (4, 'Test data 4', SYSDATE - 3);
INSERT INTO source_table VALUES (5, 'Test data 5', SYSDATE - 7);
INSERT INTO source_table VALUES (6, 'Test data 6', SYSDATE - 7);
INSERT INTO source_table VALUES (7, 'Test data 7', SYSDATE - 8);
INSERT INTO source_table VALUES (8, 'Test data 8', SYSDATE - 8);
INSERT INTO source_table VALUES (9, 'Test data 9', SYSDATE - 8);
INSERT INTO source_table VALUES (10, 'Test data 10', SYSDATE - 8);

INSERT INTO source_table VALUES (11, 'Test data 10', SYSDATE - 8);
INSERT INTO source_table VALUES (12, 'Test data 10', SYSDATE - 8);
INSERT INTO source_table VALUES (13, 'Test data 10', SYSDATE - 8);
INSERT INTO source_table VALUES (14, 'Test data 10', SYSDATE - 8);


CREATE OR REPLACE PROCEDURE copy_and_delete_data AS
    v_status VARCHAR2(200);
    v_job_id NUMBER;
BEGIN
    BEGIN
        SELECT NVL(MAX(job_id), 0) + 1 INTO v_job_id FROM job_log;

        INSERT INTO destination_table (id, data, copied_date)
        SELECT id, data, SYSDATE
        FROM source_table
        WHERE created_date < SYSDATE - 7;

        DELETE FROM source_table
        WHERE created_date < SYSDATE - 7;

        v_status := 'SUCCESS';
        INSERT INTO job_log (job_id, status, execution_time)
        VALUES (v_job_id, v_status, SYSDATE);
    EXCEPTION
        WHEN OTHERS THEN
            v_status := 'FAILED: ' || SQLERRM;
            SELECT NVL(MAX(job_id), 0) + 1 INTO v_job_id FROM job_log;
            INSERT INTO job_log (job_id, status, execution_time)
            VALUES (v_job_id, v_status, SYSDATE);
    END;
END;
/

DECLARE
    job_id NUMBER;
BEGIN
    DBMS_JOB.SUBMIT(
        job => job_id,
        what => 'copy_and_delete_data;',
        next_date => SYSDATE,
        interval => 'TRUNC(SYSDATE+7)'
    );
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || job_id);
    COMMIT;
END;
/

BEGIN
    DBMS_JOB.CHANGE(
        job       => 6,
        what      => 'BEGIN copy_and_delete_data; END;',
        next_date => SYSDATE + 1,
        interval  => 'SYSDATE + 7'
    );
    COMMIT;
END;
/


SELECT job FROM user_jobs;


SELECT * FROM job_log;
SELECT * FROM source_table;
SELECT * FROM destination_table;

SELECT JOB, WHAT, LAST_DATE, LAST_SEC, NEXT_DATE, NEXT_SEC, NEXT_DATE, BROKEN FROM USER_JOBS;

SELECT sid
FROM v$lock
WHERE id1 IN (SELECT job FROM user_jobs);

BEGIN
    DBMS_JOB.BROKEN(job => 1, broken => TRUE);
END;
/

BEGIN
    DBMS_JOB.RUN(7);
END;
/

BEGIN
    DBMS_JOB.REMOVE(job => 7);
END;
/

SELECT * FROM source_table;
SELECT * FROM destination_table;
SELECT * FROM job_log;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name => 'copy_delete_job',
        job_type => 'PLSQL_BLOCK',
        job_action => 'BEGIN copy_and_delete_data; END;',
        start_date => SYSTIMESTAMP,
        repeat_interval => 'FREQ=WEEKLY; BYDAY=MON',
        enabled => TRUE
    );
END;
/

SELECT * FROM job_log;

SELECT job_name, state, last_start_date, last_run_duration
FROM user_scheduler_jobs;

BEGIN
    DBMS_SCHEDULER.DISABLE('copy_delete_job');
END;
/

BEGIN
    DBMS_SCHEDULER.ENABLE('copy_delete_job');
END;
/

BEGIN
    DBMS_SCHEDULER.RUN_JOB('copy_delete_job');
END;
/

BEGIN
    DBMS_SCHEDULER.DROP_JOB('copy_delete_job');
END;
/



SELECT job_name, status, error#, additional_info 
FROM user_scheduler_job_run_details
WHERE job_name = 'COPY_DELETE_JOB';

BEGIN
    copy_and_delete_data;
END;
/

SELECT * FROM user_scheduler_job_log
WHERE job_name = 'COPY_DELETE_JOB';




