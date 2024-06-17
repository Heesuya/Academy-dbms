-- BRANDS ���̺� ����
CREATE TABLE BRANDS(
BRAND_ID NUMBER PRIMARY KEY,            --�귣���ȣ
BRAND_NAME VARCHAR2(100) NOT NULL       --�귣���
);
drop table brands;
drop table products;
-- PRODUCTS ���̺� ����
CREATE TABLE PRODUCTS(
PRODUCT_NO NUMBER PRIMARY KEY,          --��ǰ��ȣ
PRODUCT_NAME VARCHAR2(20) NOT NULL,     --��ǰ��
PRODUCT_PRICE NUMBER NOT NULL,          --��ǰ����
BRAND_CODE NUMBER REFERENCES BRANDS,        --�귣���ȣ
SERIAL_NO VARCHAR2(100),                --������ȣ
SOLD_OUT CHAR(1) DEFAULT 'N' CHECK(SOLD_OUT IN ('Y', 'N'))  --ǰ������ 
);


-- SEQ_BRAND_ID ������ ����
-- SEQ_BRAND_ID : 100���� �����Ͽ� 100�� ����, �ִ밪 1000, �ݺ� ����.
CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 500 -- ���� : 500 -> 1000 SEQ_BRAND_ID �� maxvalue�� �߸� ���� �Ǿ� ���� 
NOCYCLE;

ALTER SEQUENCE SEQ_BRAND_ID
INCREMENT BY 100
MAXVALUE 1000 
NOCYCLE;


-- SEQ_PRODUCT_NO ������ ����
-- SEQ_PRODUCT_NO : 1���� �����Ͽ� 1�� ����, �ִ밪 10000, �ݺ� ����.

CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE;

-- BRANDS ���̺� ������ ����

INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '�Ｚ');

INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '����'); --currval  �� ���� ��ȣ�� �˷��ִ� �����. 
                                                        --currval -> NEXTVAL ����
update brands set brand_id='100' where brand_name = '�Ｚ';
update brands set brand_id='200' where brand_name = '����';                                                        
                                                        
                                                        
--Ȯ�ο�
select * from brands;
-- PRODUCTS ���̺� ������ ����

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S8', 800000, 100, 'S8','Y');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S9', 900000, 100, 'S9','N');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S10', 1000000, 100, 'S10','N');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������9S', 900000, 200, '9S','N');

INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������10S', 1000000, 200, '10S','N');

-- ��� ��ȸ
rollback;
SELECT PRODUCT_NAME, PRODUCT_PRICE, BRAND_NAME, SOLD_OUT
FROM PRODUCTS JOIN BRANDS ON (BRAND_ID = BRAND_CODE);

select * from BRANDS;
