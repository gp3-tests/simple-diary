CREATE OR REPLACE FORCE VIEW diary_entry_tags_v (
  entry_id
 ,entry_date
 ,title
 ,body
 ,visibility
 ,status
 ,mood
 ,location
 ,created_on
 ,created_by
 ,updated_on
 ,updated_by
 ,tags_csv
) AS
  SELECT e.ENTRY_ID
        ,e.ENTRY_DATE
        ,e.TITLE
        ,e.BODY
        ,e.VISIBILITY
        ,e.STATUS
        ,e.MOOD
        ,e.LOCATION
        ,e.CREATED_ON
        ,e.CREATED_BY
        ,e.UPDATED_ON
        ,e.UPDATED_BY
        ,(
    SELECT
      LISTAGG(t.NAME,', ') WITHIN GROUP(
       ORDER BY t.NAME)
      FROM DIARY_ENTRY_TAG et
      JOIN TAG t
    ON t.TAG_ID = et.TAG_ID
     WHERE et.ENTRY_ID = e.ENTRY_ID
  ) AS TAGS_CSV
    FROM DIARY_ENTRY e;

--COMMENTS

--TRIGGERS

--GRANTS
WHENEVER SQLERROR CONTINUE
WHENEVER SQLERROR EXIT FAILURE ROLLBACK

--SYNONYMS
WHENEVER SQLERROR CONTINUE
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
