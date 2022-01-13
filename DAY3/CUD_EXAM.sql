-- UPDATE 문 
--UPDATE SET WHERE 은 규격이다. / UPDATE 와 DELETE는 WHERE절이 필수이다. / WHERE 절을 활용해서 데이터를 일부분만 수정하는 것. / 기본
UPDATE test
        SET title = '내용증명요?'
              , descs = '내용이 변경됩니다,'
  WHERE idx = 100;
  
  COMMIT;
  ROLLBACK;
  
-- DELETE 문
DELETE FROM test
   WHERE idx = 100;
  

-- 서브쿼리
-- SELECT에서 사용하는 쿼리.
-- ROWNUM: 행의 순서를 표현하는 함수.
SELECT ROWNUM, su.ename, su.job, su.sal, su.comm FROM (
SELECT ename, job, sal, comm FROM emp
  ORDER BY sal DESC
 ) su
WHERE ROWNUM =1;



  
  

  
  