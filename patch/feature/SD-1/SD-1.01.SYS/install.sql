HOST TITLE Patch SD-1.01.SYS
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
PROMPT Check Min ARM patch ARM-1.11.0
execute &&APEXRM_user..arm_installer.check_patch_installed( -
 i_prereq_patch  => 'ARM-1.11.0' );
execute &&APEXRM_user..arm_installer.patch_started( -
  i_patch_name         => '&&patch_name' -
 ,i_patch_type         => 'feature' -
 ,i_db_schema          => '&&SYS_user' -
 ,i_app_code           => 'SD' - 
 ,i_branch_name        => 'feature/SD-1' -  
 ,i_tag_from           => 'SD-1.01A' -  
 ,i_tag_to             => 'SD-1.01B' -  
 ,i_suffix             => '' - 
 ,i_patch_desc         => '&&patch_desc' - 
 ,i_component_list     => apex_t_varchar2( - 
    'diary.usr' -
  ,'DIARY.sql' -
 ) - 
 ,i_patch_create_date  => '08-30-2026' -
 ,i_patch_created_by   => 'peter' - 
 ,i_note               => '' - 
 ,i_rerunnable_yn      => 'Y' - 
 ,i_force_rerun        => '&&force_rerun' -
 ,i_tracking_yn        => 'Y' -
 ,i_alt_schema_yn      => 'Y' - 
 ,i_retired_yn         => 'N' - 
 ,i_app_only_yn        => 'N' -  
 ,i_repo_code          => 'simple-diary' - 
 ,i_remove_prereqs     => 'Y' - 
 ,i_promo_levels       => '' -
 ,i_promo_level        => '&&promo_level' - 
 ,i_gp_version         => 'GP-3.1.0.0');
column patch_path new_value patch_path
select &&APEXRM_user..arm_installer.adjust_patch_path(i_patch_name => '&&patch_name',i_patch_path => '&&patch_path') patch_path from dual;
PROMPT 
PROMPT USERS
PROMPT diary.usr
@&&patch_path.diary.usr;
PROMPT Progress: &&patch_name (50%)
SPOOL OFF
SPOOL &&log_filename APPEND
PROMPT 
PROMPT MISCELLANEOUS
PROMPT DIARY.sql
@&&patch_path.DIARY.sql;
PROMPT Progress: &&patch_name (100%)
SPOOL OFF
SPOOL &&log_filename APPEND

COMMIT;
set serveroutput on;
execute &&APEXRM_user..arm_installer.patch_completed;
COMMIT;
PROMPT Progress: &&patch_name (100%)
SPOOL OFF
SPOOL &&log_filename APPEND
PROMPT 
PROMPT install.sql - COMPLETED.
spool off;

COMMIT;

--MultiModeConnect - begin
PROMPT Connecting with password authentication...
CONNECT &&APEXRM_user/&&APEXRM_password@&&database
set serveroutput on;
--MultiModeConnect - end

host &&node_wrapper &&build_log_loader &&patch_name
@load_log_&&patch_name..sql
COMMIT;

