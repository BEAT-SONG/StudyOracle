-- UPDATE �� 
--UPDATE SET WHERE �� �԰��̴�. / UPDATE �� DELETE�� WHERE���� �ʼ��̴�. / WHERE ���� Ȱ���ؼ� �����͸� �Ϻκи� �����ϴ� ��. / �⺻
UPDATE test
        SET title = '���������?'
              , descs = '������ ����˴ϴ�,'
  WHERE idx = 100;
  
  COMMIT;
  ROLLBACK;
  
-- DELETE ��
DELETE FROM test
   WHERE idx = 100;
  

-- ��������
-- SELECT���� ����ϴ� ����.
-- ROWNUM: ���� ������ ǥ���ϴ� �Լ�.
SELECT ROWNUM, su.ename, su.job, su.sal, su.comm FROM (
SELECT ename, job, sal, comm FROM emp
  ORDER BY sal DESC
 ) su
WHERE ROWNUM =1;



  
  

  
  