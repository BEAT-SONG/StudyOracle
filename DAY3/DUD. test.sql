-- ������ �Է� INSERT
INSERT INTO bonus
                       ( emane
                       , job
                       , sal
                       , comm
                       )
VALUES (emane
               , job
               , sal
               , comm
               );
               
 INSERT INTO bonus
     (ename, job, sal, comm)
VALUES 
     ('JACK', 'SALEMAN', 4000, NULL);
     
     
COMMIT;     -- ���� ����. 
ROLLBACK;  --  ���

-- Ʈ������: ��� �۾��� ó���ϱ� ���ؼ� ���� ���̺��� �۾��ϰ� commit, rollback �ϴ� �Ϸ��� ������ Ʈ�������̶�� �ϴ� �� ����.

-- TEST ���̺� �Է�Ŀ��. / �԰��� �Է��� �ڿ� ������ ���� �����ؼ� ���� ���� ����.
INSERT INTO test
                (idx, title, descs)
VALUES
                (1, NULL, '��������'); -- ����
                
 INSERT INTO test
                (idx, title, descs)
VALUES
                (1, '��������', NULL);               

 INSERT INTO test
                (idx, title, descs)
VALUES
                (1, '��������2', NULL); -- �⺻Ű 'idx'�� �ߺ��Ǽ� �Է��� �ȵȴ�. / ���� / �ѹ� ������ ���� �ٽ� ����ϰų� ���ư� �� ����. = ���Ἲ ���� ����          

 INSERT INTO test
                (idx, title, descs)
VALUES
                (2, '��������2', '���볻�볻��');
                
 INSERT INTO test
                (idx, title, descs, regdate)
VALUES
                (3, '��������3', '���볻�볻��3', SYSDATE); -- ���� ��¥�� �Է�

 INSERT INTO test
                (idx, title, descs, regdate)
VALUES
                (4, '��������4', '���볻�볻��4', TO_DATE('2021-12-31', 'yyyy-mm-dd')); -- Ư�� ��¥�� ���ϴ� �԰ݿ� ���缭 �Է�
                
-- ������
-- ����Ŭ�� ���� ��. / ���� �ڵ����� �����Ǵ� ��� �ʿ�. 
SELECT SEQ_TEST.CURRVAL  FROM dual; -- ���� �� 
SELECT SEQ_TEST.NEXTVAL  FROM dual; -- ���� ��. / 'SEQ_TEST.NEXTVAL' ������ �������� �����Ͽ� ���ϴ� ������ ������ �� �ֵ��� �����ִ� �Լ��̴�.

 INSERT INTO test
                (idx, title, descs, regdate)
VALUES
                (SEQ_TEST.NEXTVAL, '��������6', '���볻�볻��6', SYSDATE);




