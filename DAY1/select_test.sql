-- �ּ�, �Ʒ��� select ������ ����
SELECT*FROM emp;
DESC emp;

--�÷��� �����ؼ� ����
SELECT ename, job, hiredate
FROM emp;

--�μ��� ��� & �ߺ��� ������ �����ϰ� ���
SELECT DISTINCT deptno
FROM emp;

-- �̰Ŵ� ��ΰ� �ٸ� ���� �����Ƿ� �ߺ� ���Ű� ���� �ʴ´�.
SELECT DISTINCT empno, deptno
FROM emp;

-- ������ where
SELECT*FROM emp
WHERE empno = 7499;

-- '(����ǥ)�� �̿��ؼ� �������� ǥ��
SELECT*FROM emp
WHERE ename = 'ȣ�浿';

SELECT*FROM emp
WHERE job = 'CLERK';

-- �޿�(sal)�� 1500 �̻��� ��� ��ȸ
SELECT*FROM emp
WHERE sal >=1500;


