HOST TITLE Patch SD-2.01.DIARY
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
PROMPT Check Min ARM patch ARM-1.11.0
execute &&APEXRM_user..arm_installer.check_patch_installed( -
 i_prereq_patch  => 'ARM-1.11.0' );
execute &&APEXRM_user..arm_installer.patch_started( -
  i_patch_name         => '&&patch_name' -
 ,i_patch_type         => 'feature' -
 ,i_db_schema          => '&&DIARY_user' -
 ,i_app_code           => 'SD' - 
 ,i_branch_name        => 'feature/SD-2' -  
 ,i_tag_from           => 'SD-2.01A' -  
 ,i_tag_to             => 'SD-2.01B' -  
 ,i_suffix             => '' - 
 ,i_patch_desc         => '&&patch_desc' - 
 ,i_component_list     => apex_t_varchar2( - 
    'client.tab' -
  ,'diary_entry_client.tab' -
 ) - 
 ,i_patch_create_date  => '09-14-2026' -
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
PROMPT TABLES
PROMPT client.tab
@&&patch_path.client.tab;
PROMPT Progress: &&patch_name (50%)
SPOOL OFF
SPOOL &&log_filename APPEND
PROMPT diary_entry_client.tab
@&&patch_path.diary_entry_client.tab;
PROMPT Progress: &&patch_name (100%)
SPOOL OFF
SPOOL &&log_filename APPEND

COMMIT;
PROMPT Compiling objects in schema &&DIARY_user
execute &&APEXRM_user..arm_invoker.compile_post_patch;
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

