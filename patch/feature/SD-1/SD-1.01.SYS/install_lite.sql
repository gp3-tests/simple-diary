HOST TITLE Patch SD-1.01.SYS - NOT using ARM
SET AUTOCOMMIT OFF
SET AUTOPRINT ON
SET FEEDBACK ON
SET PAUSE OFF
SET SERVEROUTPUT ON SIZE 1000000
SET TRIMOUT ON
SET TRIMS ON PAGESIZE 3000
SET AUTO OFF
SET VERIFY OFF ECHO OFF DEFINE ON
WHENEVER OSERROR EXIT FAILURE ROLLBACK
WHENEVER SQLERROR EXIT FAILURE ROLLBACK

define patch_name = 'SD-1.01.SYS'
define patch_desc = 'Create User and Workspace'
define patch_path = 'feature/SD-1/SD-1.01.SYS/'
define log_filename = 'SD-1.01.SYS.log'

--MultiModeConnect - begin
PROMPT Connecting with password authentication...
CONNECT &&SYS_user/&&SYS_password@&&database AS SYSDBA
set serveroutput on;
--MultiModeConnect - end

PROMPT LOG TO &&log_filename
SPOOL &&log_filename
select '&&org_code &&sys_code &&db_code' "Target" from dual;
select user||'@'||global_name "Connection" from global_name;
PROMPT 
PROMPT USERS
PROMPT diary.usr
@&&patch_path.diary.usr;
PROMPT 
PROMPT MISCELLANEOUS
PROMPT DIARY.sql
@&&patch_path.DIARY.sql;

COMMIT;
COMMIT;
PROMPT 
PROMPT install_lite.sql - COMPLETED.
spool off;

COMMIT;

