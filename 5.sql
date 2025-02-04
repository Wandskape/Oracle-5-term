--1.	Определите общий размер области SGA
SELECT SUM(value) AS "Total SGA Size (bytes)" FROM v$sga;

--2.	Определите текущие размеры основных пулов SGA.
SELECT * FROM v$sgainfo;

--3.	Определите размеры гранулы для каждого пула.
SELECT component, granule_size FROM v$sga_dynamic_components;

--4.	Определите объем доступной свободной памяти в SGA.
SELECT * FROM v$sgastat WHERE name = 'free memory';

--5.	Определите максимальный и целевой размер области SGA.
SELECT 'SGA_TARGET' AS name, value FROM v$parameter WHERE name = 'sga_target'
UNION ALL
SELECT 'SGA_MAX_SIZE' AS name, value FROM v$parameter WHERE name = 'sga_max_size';

--6.	Определите размеры пулов КЕЕP, DEFAULT и RECYCLE буферного кэша.
SELECT * FROM V$BUFFER_POOL WHERE NAME IN ('KEEP', 'DEFAULT', 'RECYCLE');

--7.	Создайте таблицу, которая будет помещаться в пул КЕЕP. Продемонстрируйте сегмент таблицы.
ALTER SYSTEM SET db_keep_cache_size = 100M;

CREATE TABLESPACE KEEP_TS
DATAFILE 'keep_ts.dbf' SIZE 50M REUSE
DEFAULT STORAGE (BUFFER_POOL KEEP);

CREATE TABLE table_keep (
    id NUMBER PRIMARY KEY,
    description VARCHAR2(100)
) STORAGE (BUFFER_POOL KEEP);

--сегмент таблицы
SELECT SEGMENT_NAME, TABLESPACE_NAME, BYTES, BUFFER_POOL
FROM DBA_SEGMENTS
WHERE SEGMENT_NAME = 'TABLE_KEEP';

--8.	Создайте таблицу, которая будет кэшироваться в пуле DEFAULT. Продемонстрируйте сегмент таблицы. 
CREATE TABLE table_default (
    id NUMBER PRIMARY KEY,
    description VARCHAR2(100)
) STORAGE (BUFFER_POOL DEFAULT);

--сегмент таблицы
SELECT SEGMENT_NAME, TABLESPACE_NAME, BYTES, BUFFER_POOL
FROM DBA_SEGMENTS
WHERE SEGMENT_NAME = 'TABLE_DEFAULT';

--9.	Найдите размер буфера журналов повтора.
SELECT VALUE AS "Redo Log Buffer Size (MB)"
FROM V$SGA
WHERE NAME = 'Redo Buffers';

--10.	Найдите размер свободной памяти в большом пуле.
SELECT SUM(BYTES) AS "Free Memory in Large Pool (MB)"
FROM V$SGASTAT
WHERE NAME = 'free memory' AND POOL = 'large pool';

--11.	Определите режимы текущих соединений с инстансом (dedicated, shared).
SELECT SERVER, COUNT(*) AS CONNECTIONS
FROM V$SESSION
GROUP BY SERVER;

--12.	Получите полный список работающих в настоящее время фоновых процессов.==
SELECT NAME, DESCRIPTION, PADDR
FROM V$BGPROCESS
WHERE PADDR IS NOT NULL;

--13.	Получите список работающих в настоящее время серверных процессов.
SELECT SID, PROCESS, PROGRAM
FROM V$SESSION
WHERE TYPE = 'USER';

--14.	Определите, сколько процессов DBWn работает в настоящий момент.
SELECT COUNT(*) AS DBWn_PROCESSES
FROM V$PROCESS
WHERE PROGRAM LIKE 'DBW%';

--15.	Определите сервисы (точки подключения экземпляра).
SELECT NAME FROM V$ACTIVE_SERVICES;

--16.	Получите известные вам параметры диспетчеров.
SHOW PARAMETER DISPATCHERS;

--17.	Укажите в списке Windows-сервисов сервис, реализующий процесс LISTENER.
--services.msc отсортировать по состоянию OracleOraDB21Home1TNSListener

--18.	Продемонстрируйте и поясните содержимое файла LISTENER.ORA. 
--C:\app\win10\product\21c\dbhomeXE\network\admin\sample

--19.	Запустите утилиту lsnrctl и поясните ее основные команды. 
--lsnrctl STATUS START STOP RELOAD SERVICES

--20.	Получите список служб инстанса, обслуживаемых процессом LISTENER. 
--lsnrctl services


