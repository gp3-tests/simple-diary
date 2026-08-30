set feed off;
CONNECT &&DIARY_user/&&DIARY_password@&&database
PROMPT RUNNING AS &&DIARY_user
define spool="&&spool_prog &&DIARY_dir &&DIARY_user"

--script &&spool DATA %
script &&spool TABLE %
script &&spool VIEW %

-- script &&spool MATERIALIZED_VIEW %
-- script &&spool PACKAGE %
-- script &&spool PACKAGE_BODY %
-- script &&spool PROCEDURE %
-- script &&spool FUNCTION %
-- script &&spool TYPE %
-- script &&spool TYPE_BODY %   
-- script &&spool SEQUENCE %
-- script &&spool SYNONYM %  

--script &&spool RULE % 
--script &&spool RULE_SET % 
--script &&spool PROGRAM % 
--script &&spool JOB % 
--script &&spool CREDENTIAL %  
--script &&spool SCHEDULE % 
--script &&spool CHAIN % 
--script &&spool EVALUATION_CONTEXT % 
--script &&spool DATABASE_LINK %   
--script &&spool ROLE GN%
--script &&spool JAVA_SOURCE %    
 


 


