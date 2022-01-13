SELECT e.* FROM emp e;

-- �⺻(ǥ��) �̳�����(INNER JOIN) / ��ġ�ϴ� ���� Ȯ���� �� �ִ�.
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e
    INNER JOIN dept d
    ON e.deptno = d.deptno  -- ���̺��� ����(����)�� ���� ������ ON���� �������ش�. / �����(=)�� Ȱ���ؼ� ���̺��� ��ģ��. 
WHERE e.job = 'SALESMAN'; -- WHERE�� �������� �����Ͽ� ���ϴ� ������ �߷��� �� �� �ִ�.

SELECT d.deptno
            , d.dname 
            , e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     FROM dept d
    INNER JOIN emp e
    ON d.deptno = e.deptno;
    
-- PL/SQL �̳� ���� (INNER JOIN) / ��������� ������ Ŀ��
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e,  dept d
    ON e.deptno = d.deptno   -- JOIN�̶�� ���� ������ ON�� ����� �� ����. / JOIN �� ON�� �� ���̶�� �����ϰ� ����Ѵ�. / ���� ������ ������ ǥ������.
WHERE e.job = 'SALESMAN'; 
    
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e,  dept d -- 2���� ���̺��� ����Ѵٴ� ���� INNER JOIN ��ſ� �ѹ��� ǥ���ϴ� ��
-- WHERE 1 = 1 / TIP�ε� �̷������� ����ϸ� �ٸ� ���� �����ϱⰡ ����. / �������� ����ϴ� ��찡 ���� ����.
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
    LEFT OUTER JOIN dept d -- ������ ����(emp)���� �����ʿ��� ������ �� �´� ���� Ȯ���ؼ� ��Ÿ���ش�. /  Ȯ�� �� ��ġ���� ���� ���� NULL�� ä���� ��Ÿ���ش�.
    ON e.deptno = d.deptno;
    
 SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM dept d
    LEFT OUTER JOIN emp e -- ������ ����(dept)���� �����ʿ��� ������ �� �´� ���� Ȯ���ؼ� ��Ÿ���ش�. /  Ȯ�� �� ��ġ���� ���� ���� NULL�� ä���� ��Ÿ���ش�.
    ON e.deptno = d.deptno;   
   
--  RIGHT OUTER JOIN  
-- �⺻ Ű�� NULL�� ������ OUTER JOIN�� ����ߴٴ� ���� �ǹ��ϴ� ���̴�. 
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e
    RIGHT OUTER JOIN dept d -- �������� ����(dept)���� ���ʿ��� ������ �� �´� ���� Ȯ���ؼ� ��Ÿ���ش�.
    ON e.deptno = d.deptno;  -- ������(dept) ���̺����� 40�� �ִµ� ����(emp) ���̺����� 40�� �����Ƿ� NULL���� ��Ÿ��. / NULL�� ���� �ƴ� �� / �𸣴� ��
 
--PL/SQL�� OUTER JOIN ���      
SELECT e.empno
            , e.ename
            , e.job
            , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
            , e.deptno
            , d.dname 
     FROM emp e,  dept d 
     WHERE e.deptno (+)= d.deptno; -- RIGHT OUTER JOIN
-- WHERE e.deptno = d.deptno (+); -- LIFT OUTER JOIN     


-- 3�� ���̺� ����
-- �̳� ������ ���� �͸� Ȯ�������� �Ʒ��� Ŀ�������� �ϳ��� ���´�.
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

-- �ƿ�Ʈ ����
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







    