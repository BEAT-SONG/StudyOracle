-- 데이터 입력 INSERT
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
     
     
COMMIT;     -- 완전 저장. 
ROLLBACK;  --  취소

-- 트랜젝션: 어떠한 작업을 처리하기 위해서 여러 테이블에서 작업하고 commit, rollback 하는 일련의 과정을 트랜젝션이라고 하는 것 같다.

-- TEST 테이블에 입력커리. / 규격을 입력한 뒤에 동일한 것을 복사해서 적는 것이 좋다.
INSERT INTO test
                (idx, title, descs)
VALUES
                (1, NULL, '내용증명'); -- 오류
                
 INSERT INTO test
                (idx, title, descs)
VALUES
                (1, '내용증명', NULL);               

 INSERT INTO test
                (idx, title, descs)
VALUES
                (1, '내용증명2', NULL); -- 기본키 'idx'가 중복되서 입력이 안된다. / 오류 / 한번 결정된 것이 다시 사용하거나 돌아갈 수 없다. = 무결성 제약 조건          

 INSERT INTO test
                (idx, title, descs)
VALUES
                (2, '내용증명2', '내용내용내용');
                
 INSERT INTO test
                (idx, title, descs, regdate)
VALUES
                (3, '내용증명3', '내용내용내용3', SYSDATE); -- 현재 날짜를 입력

 INSERT INTO test
                (idx, title, descs, regdate)
VALUES
                (4, '내용증명4', '내용내용내용4', TO_DATE('2021-12-31', 'yyyy-mm-dd')); -- 특정 날짜를 원하는 규격에 맞춰서 입력
                
-- 시퀀스
-- 오라클의 나쁜 점. / 값이 자동으로 증가되는 경우 필요. 
SELECT SEQ_TEST.CURRVAL  FROM dual; -- 현재 값 
SELECT SEQ_TEST.NEXTVAL  FROM dual; -- 다음 값. / 'SEQ_TEST.NEXTVAL' 시퀸스 편집에서 조절하여 원하는 값으로 증분할 수 있도록 도와주는 함수이다.

 INSERT INTO test
                (idx, title, descs, regdate)
VALUES
                (SEQ_TEST.NEXTVAL, '내용증명6', '내용내용내용6', SYSDATE);




