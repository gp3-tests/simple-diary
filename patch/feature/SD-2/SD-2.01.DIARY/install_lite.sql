HOST TITLE Patch SD-2.01.DIARY - NOT using ARM
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

define patch_name = 'SD-2.01.DIARY'
define patch_desc = 'Create tables client, diary_entry_client'
define patch_path = 'feature/SD-2/SD-2.01.DIARY/'
define log_filename = 'SD-2.01.DIARY.log'

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
PROMPT TABLES
PROMPT client.tab
@&&patch_path.client.tab;
PROMPT diary_entry_client.tab
@&&patch_path.diary_entry_client.tab;

COMMIT;
PROMPT Completed &&patch_name
COMMIT;
PROMPT 
PROMPT install_lite.sql - COMPLETED.
spool off;

COMMIT;

