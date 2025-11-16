-- -----------------------------------------------------------------------------------
-- File Name    : user_ddl.sql
-- Description  : Displays the portable DDL for a specific user.
-- Call Syntax  : @user_ddl (username)
-- -----------------------------------------------------------------------------------

CONNECT &&SYS_user/&&SYS_password@&&database AS SYSDBA

-- Normalize username input
COLUMN lower_user NEW_VALUE lower_user
COLUMN upper_user NEW_VALUE upper_user

SELECT LOWER('&&the_user') AS lower_user, UPPER('&&the_user') AS upper_user FROM dual;

SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY OFF TRIMSPOOL ON
COLUMN ddl FORMAT A1000

PROMPT spooling &&lower_user..usr
SPOOL &&repo_spooler_dir./&&lower_user..usr;

BEGIN
   DBMS_METADATA.set_transform_param(DBMS_METADATA.session_transform, 'SQLTERMINATOR', TRUE);
   DBMS_METADATA.set_transform_param(DBMS_METADATA.session_transform, 'PRETTY', TRUE);
END;
/

-- Portable CREATE USER section
SELECT
  'CREATE USER "' || U.USERNAME || '" IDENTIFIED BY VALUES "&&' || '&&upper_user' || '_password"' || CHR(10) ||
  '  DEFAULT TABLESPACE "&&'||'default_tablespace"' || CHR(10) ||
  '  TEMPORARY TABLESPACE "&&'||'temp_tablespace"' || CHR(10) ||
  '  QUOTA UNLIMITED ON "&&'||'default_tablespace";' AS ddl
FROM DBA_USERS U
WHERE U.USERNAME = '&&upper_user'
/

-- Grants and profiles
SELECT dbms_metadata.get_granted_ddl('ROLE_GRANT', rp.grantee) AS ddl
FROM   dba_role_privs rp
WHERE  rp.grantee = '&&upper_user'
AND    rownum = 1
UNION ALL
SELECT dbms_metadata.get_granted_ddl('SYSTEM_GRANT', sp.grantee) AS ddl
FROM   dba_sys_privs sp
WHERE  sp.grantee = '&&upper_user'
AND    rownum = 1
UNION ALL
SELECT dbms_metadata.get_granted_ddl('OBJECT_GRANT', tp.grantee) AS ddl
FROM   dba_tab_privs tp
WHERE  tp.grantee = '&&upper_user'
AND    rownum = 1
UNION ALL
SELECT dbms_metadata.get_granted_ddl('DEFAULT_ROLE', rp.grantee) AS ddl
FROM   dba_role_privs rp
WHERE  rp.grantee = '&&upper_user'
AND    rp.default_role = 'YES'
AND    rownum = 1
UNION ALL
SELECT TO_CLOB('/* Start profile creation script in case they are missing */') AS ddl
FROM   dba_users u
WHERE  u.username = '&&upper_user'
AND    u.profile <> 'DEFAULT'
AND    rownum = 1
UNION ALL
SELECT dbms_metadata.get_ddl('PROFILE', u.profile) AS ddl
FROM   dba_users u
WHERE  u.username = '&&upper_user'
AND    u.profile <> 'DEFAULT'
UNION ALL
SELECT TO_CLOB('/* End profile creation script */') AS ddl
FROM   dba_users u
WHERE  u.username = '&&upper_user'
AND    u.profile <> 'DEFAULT'
AND    rownum = 1
/

SET LINESIZE 80 PAGESIZE 14 FEEDBACK ON TRIMSPOOL ON VERIFY ON
SPOOL OFF;
