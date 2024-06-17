-- BRANDS 테이블 생성
CREATE TABLE BRANDS(
BRAND_ID NUMBER PRIMARY KEY,            --브랜드번호
BRAND_NAME VARCHAR2(100) NOT NULL       --브랜드명
);
drop table brands;
drop table products;
-- PRODUCTS 테이블 생성
CREATE TABLE PRODUCTS(
PRODUCT_NO NUMBER PRIMARY KEY,          --상품번호
PRODUCT_NAME VARCHAR2(20) NOT NULL,     --상품명
PRODUCT_PRICE NUMBER NOT NULL,          --상품가격
BRAND_CODE NUMBER REFERENCES BRANDS,        --브랜드번호
SERIAL_NO VARCHAR2(100),                --고유번호
SOLD_OUT CHAR(1) DEFAULT 'N' CHECK(SOLD_OUT IN ('Y', 'N'))  --품절여부 
);


-- SEQ_BRAND_ID 시퀀스 생성
-- SEQ_BRAND_ID : 100부터 시작하여 100씩 증가, 최대값 1000, 반복 없음.
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 500 -- 수정 : 500 -> 1000 SEQ_BRAND_ID 의 maxvalue가 잘못 설정 되어 있음 
NOCYCLE;

ALTER SEQUENCE SEQ_BRAND_ID
INCREMENT BY 100
MAXVALUE 1000 
NOCYCLE;


-- SEQ_PRODUCT_NO 시퀀스 생성
-- SEQ_PRODUCT_NO : 1부터 시작하여 1씩 증가, 최대값 10000, 반복 없음.

CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE;

-- BRANDS 테이블 데이터 삽입

INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '삼성');

INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '애플'); --currval  은 현재 번호를 알려주는 수행어. 
                                                        --currval -> NEXTVAL 변경
update brands set brand_id='100' where brand_name = '삼성';
update brands set brand_id='200' where brand_name = '애플';                                                        
                                                        
                                                        
--확인용
select * from brands;
-- PRODUCTS 테이블 데이터 삽입

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S8', 800000, 100, 'S8','Y');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S9', 900000, 100, 'S9','N');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S10', 1000000, 100, 'S10','N');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰9S', 900000, 200, '9S','N');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰10S', 1000000, 200, '10S','N');

-- 결과 조회
rollback;
SELECT PRODUCT_NAME, PRODUCT_PRICE, BRAND_NAME, SOLD_OUT
FROM PRODUCTS JOIN BRANDS ON (BRAND_ID = BRAND_CODE);

select * from BRANDS;
