--SELECT COUNT(*) FROM divtbl; -- ��� 7
--SELECT COUNT(*) FROM bookstbl; -- ��� 59
--SELECT COUNT(*) FROM membertbl; -- ��� 26
--SELECT COUNT(*) FROM rentaltbl; -- ��� 16
 
 -- 1. ȸ�� ���̺��� �̸���, �����, �̸�, �ּ�, ���� ���� ������ ����ϰ�, �̸��� ������������, �̸����� �ҹ��ڷ� ����ϼ���.
 SELECT LOWER(email)EMAIL, mobile, names, addr, levels 
 FROM membertbl
 ORDER BY names DESC;
 
 -- 2. å ���̺��� å����, ����, ������, �ݾ� ������ ����ϰ� ������ ��� ������ ������ �Ͻʽÿ�. �÷��̸��� Ȯ���ϼ���!!
 SELECT *  FROM bookstbl;
 SELECT names å����, author ���ڸ�, to_char(releasedate, 'yyyy-mm-dd') ������, price ���� 
 FROM bookstbl
 ORDER BY idx ASC; 
 
 -- 3. å ���̺�� ���� ���̺��� �����Ͽ� �Ʒ��� ���� ������ �������� �����ϼ���. �Ȱ��� ���;� �մϴ�!! 
 SELECT d. names �帣 
              , b. names å����
              , b. author ����
              , TO_CHAR(b.releasedate, 'yyyy-mm-dd') ������
              , b.isbn å�ڵ��ȣ
              , b. price ���� 
 FROM divtbl d, bookstbl b
WHERE d.division = b.division
ORDER BY idx DESC;

-- 4. ȸ�� ���̺� ������ ȫ�浿 ȸ���� �Է��ϴ� ������ �ۼ��ϼ���. �������� ���� ����ؾ� �մϴ�. 
--SELECT * FROM membertbl;
--SELECT SEQ_MEMBERTBL.CURRVAL  FROM dual;
-- �ѹ� �ðܼ� �̹� 27�� ���ٰ� �ٽ� ������ 28�� �Ȱ� �����ϴ�.
INSERT INTO membertbl
         (idx, names, levels, addr, mobile, email, userid, password, lastlogindt, loginipaddr)
VALUES
         (SEQ_MEMBERTBL.nextval, 'ȫ�浿', 'A', '�λ�� ���� �ʷ���', '010-7989-0909', 'HGDO9@NAVER.COM', 'HGA7989', 12345, NULL, NULL);      
 
 
-- 5. �Ʒ��� ���� å�� ���к��� �հ�� ��� å�� �հ谡 ���� �������� �����ϼ���. ��...��... 

--SELECT d.names �帣, b.price �帣���հ�ݾ�
--FROM divtbl d, bookstbl b;

--SELECT d.names �帣, b.price �帣���հ�ݾ�
--FROM divtbl d, bookstbl b
--WHERE d.division = b.division;

--SELECT d.names �帣, SUM(b.price) �帣���հ�ݾ�
--FROM divtbl d, bookstbl b
--WHERE d.division = b.division
--GROUP BY d.names;

--SELECT NVL(d.names, '--�հ�--') �帣, SUM(b.price) �帣���հ�ݾ�
--FROM divtbl d, bookstbl b
--WHERE d.division = b.division
--GROUP BY ROLLUP (d.names);

SELECT NVL(d.names, '--�հ�--') �帣, SUM(b.price) �帣���հ�ݾ�
FROM divtbl d, bookstbl b
WHERE d.division = b.division
GROUP BY ROLLUP (d.names)
ORDER BY d.names ASC;




 