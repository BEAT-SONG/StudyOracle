SELECT e.* FROM emp e;

-- 기본(표준) 이너조인(INNER JOIN) / 일치하는 것을 확인할 수 있다.
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e
    INNER JOIN dept d
    ON e.deptno = d.deptno  -- 테이블을 연결(조인)할 때의 조건을 ON으로 설정해준다. / 등가조건(=)을 활용해서 테이블을 합친다. 
WHERE e.job = 'SALESMAN'; -- WHERE로 조건절을 형성하여 원하는 정보를 추려서 볼 수 있다.

SELECT d.deptno
            , d.dname 
            , e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     FROM dept d
    INNER JOIN emp e
    ON d.deptno = e.deptno;
    
-- PL/SQL 이너 조인 (INNER JOIN) / 상대적으로 간편한 커리
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e,  dept d
    ON e.deptno = d.deptno   -- JOIN이라는 절이 없으면 ON을 사용할 수 없다. / JOIN 과 ON은 한 쌍이라고 생각하고 써야한다. / 빨간 밑줄은 오류를 표시해줌.
WHERE e.job = 'SALESMAN'; 
    
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e,  dept d -- 2개의 테이블을 사용한다는 것을 INNER JOIN 대신에 한번에 표현하는 법
-- WHERE 1 = 1 / TIP인데 이런식으로 사용하면 다른 곳에 적용하기가 편리함. / 현업에서 사용하는 경우가 종종 있음.
     WHERE e.deptno = d.deptno   
          AND e.job = 'SALESMAN'; 

-- LEFT OUTER JOIN
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e
    LEFT OUTER JOIN dept d -- 왼쪽을 기준(emp)으로 오른쪽에서 조건이 안 맞는 것을 확인해서 나타내준다. /  확인 후 일치하지 않은 것을 NULL로 채워서 나타내준다.
    ON e.deptno = d.deptno;
    
 SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM dept d
    LEFT OUTER JOIN emp e -- 왼쪽을 기준(dept)으로 오른쪽에서 조건이 안 맞는 것을 확인해서 나타내준다. /  확인 후 일치하지 않은 것을 NULL로 채워서 나타내준다.
    ON e.deptno = d.deptno;   
   
--  RIGHT OUTER JOIN  
-- 기본 키가 NULL로 나오면 OUTER JOIN을 사용했다는 것을 의미하는 것이다. 
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e
    RIGHT OUTER JOIN dept d -- 오른쪽을 기준(dept)으로 왼쪽에서 조건이 안 맞는 것을 확인해서 나타내준다.
    ON e.deptno = d.deptno;  -- 오른쪽(dept) 테이블에서는 40이 있는데 왼쪽(emp) 테이블에서는 40이 없으므로 NULL값이 나타남. / NULL은 값이 아닌 값 / 모르는 값
 
--PL/SQL의 OUTER JOIN 방법      
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e,  dept d 
     WHERE e.deptno (+)= d.deptno; -- RIGHT OUTER JOIN
-- WHERE e.deptno = d.deptno (+); -- LIFT OUTER JOIN     


-- 3개 테이블 조인
-- 이너 조인은 같은 것만 확인함으로 아래의 커리에서는 하나만 나온다.
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
            , b.comm
     FROM emp e,  dept d, bonus b
     WHERE e.deptno = d.deptno
         AND e.ename = b.ename;

-- 아웃트 조인
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
            , b.comm
     FROM emp e,  dept d, bonus b
     WHERE e.deptno(+) = d.deptno -- RIGHT OUTER JOIN
         AND e.ename = b.ename(+); -- LIFT OUTER JOIN 







    