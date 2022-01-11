-- 주석, 아래의 select 구분을 실행
SELECT*FROM emp;
DESC emp;

--컬럼을 구분해서 선택
SELECT ename, job, hiredate
FROM emp;

--부서명만 출력 & 중복된 내용은 제거하고 출력
SELECT DISTINCT deptno
FROM emp;

-- 이거는 모두가 다른 것이 있으므로 중복 제거가 되지 않는다.
SELECT DISTINCT empno, deptno
FROM emp;

-- 조건절 where
SELECT*FROM emp
WHERE empno = 7499;

-- '(따음표)를 이용해서 글자임을 표시
SELECT*FROM emp
WHERE ename = '호길동';

SELECT*FROM emp
WHERE job = 'CLERK';

-- 급여(sal)가 1500 이상인 사람 조회
SELECT*FROM emp
WHERE sal >=1500;


