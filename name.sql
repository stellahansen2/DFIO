--------------------------------------------------------
--  File created - Wednesday-July-27-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure TEST_CI_CD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "GPC"."TEST_CI_CD" AS

cursor csr_test is
  select name,TABLECHANGED from CX_TEST_CICD_SCRIPT;

BEGIN

FOR csr_test_v IN csr_test LOOP

          begin
            update CX_TEST_CICD_SCRIPT
              set  name = CONCAT(name, '_changed')

            where TABLECHANGED = 'changed';

          EXCEPTION when OTHERS then
            raise_application_error(-20010,'Error');
          end;

    end LOOP;

    commit;


END TEST_CI_CD;
/*comment */
/

