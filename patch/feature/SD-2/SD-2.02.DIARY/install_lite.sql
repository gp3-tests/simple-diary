HOST TITLE Patch SD-2.02.DIARY - NOT using ARM
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

define patch_name = 'SD-2.02.DIARY'
define patch_desc = 'New View'
define patch_path = 'feature/SD-2/SD-2.02.DIARY/'
define log_filename = 'SD-2.02.DIARY.log'

--MultiModeConnect - begin
PROMPT Connecting with password authentication...
CONNECT &&DIARY_user/&&DIARY_password@&&database
set serveroutput on;
--MultiModeConnect - end

PROMPT LOG TO &&log_filename
SPOOL &&log_filename
select '&&org_code &&sys_code &&db_code' "Target" from dual;
select user||'@'||global_name "Connection" from global_name;
PROMPT 
PROMPT VIEWS
PROMPT client_v.vw
@&&patch_path.client_v.vw;
show error;

COMMIT;
PROMPT Completed &&patch_name
COMMIT;
PROMPT 
PROMPT install_lite.sql - COMPLETED.
spool off;

COMMIT;

