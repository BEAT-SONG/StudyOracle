--SELECT COUNT(*) FROM divtbl; -- 결과 7
--SELECT COUNT(*) FROM bookstbl; -- 결과 59
--SELECT COUNT(*) FROM membertbl; -- 결과 26
--SELECT COUNT(*) FROM rentaltbl; -- 결과 16
 
 -- 1. 회원 테이블에서 이메일, 모바일, 이름, 주소, 레벨 열의 순서로 출력하고, 이름을 내림차순으로, 이메일은 소문자로 출력하세요.
 SELECT LOWER(email)EMAIL, mobile, names, addr, levels 
 FROM membertbl
 ORDER BY names DESC;
 
 -- 2. 책 테이블에서 책제목, 저자, 출판일, 금액 순으로 출력하고 가격이 비싼 순으로 나오게 하십시오. 컬럼이름도 확인하세요!!
 SELECT *  FROM bookstbl;
 SELECT names 책제목, author 저자명, to_char(releasedate, 'yyyy-mm-dd') 출판일, price 가격 
 FROM bookstbl
 ORDER BY idx ASC; 
 
 -- 3. 책 테이블과 구분 테이블을 조인하여 아래와 같은 정보가 나오도록 구현하세요. 똑같이 나와야 합니다!! 
 SELECT d. names 장르 
              , b. names 책제목
              , b. author 저자
              , TO_CHAR(b.releasedate, 'yyyy-mm-dd') 출판일
              , b.isbn 책코드번호
              , b. price 가격 
 FROM divtbl d, bookstbl b
WHERE d.division = b.division
ORDER BY idx DESC;

-- 4. 회원 테이블에 마지막 홍길동 회원을 입력하는 쿼리를 작성하세요. 시퀀스를 만들어서 사용해야 합니다. 
--SELECT * FROM membertbl;
--SELECT SEQ_MEMBERTBL.CURRVAL  FROM dual;
-- 한번 팅겨서 이미 27이 들어갔다가 다시 눌러서 28로 된거 같습니다.
INSERT INTO membertbl
         (idx, names, levels, addr, mobile, email, userid, password, lastlogindt, loginipaddr)
VALUES
         (SEQ_MEMBERTBL.nextval, '홍길동', 'A', '부산시 동구 초량동', '010-7989-0909', 'HGDO9@NAVER.COM', 'HGA7989', 12345, NULL, NULL);      
 
 
-- 5. 아래와 같이 책의 구분별로 합계와 모든 책의 합계가 같이 나오도록 구현하세요. 롤...어... 

--SELECT d.names 장르, b.price 장르별합계금액
--FROM divtbl d, bookstbl b;

--SELECT d.names 장르, b.price 장르별합계금액
--FROM divtbl d, bookstbl b
--WHERE d.division = b.division;

--SELECT d.names 장르, SUM(b.price) 장르별합계금액
--FROM divtbl d, bookstbl b
--WHERE d.division = b.division
--GROUP BY d.names;

--SELECT NVL(d.names, '--합계--') 장르, SUM(b.price) 장르별합계금액
--FROM divtbl d, bookstbl b
--WHERE d.division = b.division
--GROUP BY ROLLUP (d.names);

SELECT NVL(d.names, '--합계--') 장르, SUM(b.price) 장르별합계금액
FROM divtbl d, bookstbl b
WHERE d.division = b.division
GROUP BY ROLLUP (d.names)
ORDER BY d.names ASC;




 