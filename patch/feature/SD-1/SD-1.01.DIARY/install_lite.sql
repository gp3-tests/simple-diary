HOST TITLE Patch SD-1.01.DIARY - NOT using ARM
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

define patch_name = 'SD-1.01.DIARY'
define patch_desc = 'Install tables and views'
define patch_path = 'feature/SD-1/SD-1.01.DIARY/'
define log_filename = 'SD-1.01.DIARY.log'

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
WHENEVER SQLERROR CONTINUE
PROMPT diary_entry.tab
@&&patch_path.diary_entry.tab;
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
WHENEVER SQLERROR CONTINUE
PROMPT tag.tab
@&&patch_path.tag.tab;
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
WHENEVER SQLERROR CONTINUE
PROMPT diary_entry_tag.tab
@&&patch_path.diary_entry_tag.tab;
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
PROMPT 
PROMPT VIEWS
PROMPT diary_entry_tags_v.vw
@&&patch_path.diary_entry_tags_v.vw;
show error;

COMMIT;
COMMIT;
PROMPT 
PROMPT install_lite.sql - COMPLETED.
spool off;

COMMIT;

