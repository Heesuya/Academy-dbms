create table test_tbl(
    data1       varchar2(20),
    data2       char(10),
    data3       number,
    data4       date,
    data5       varchar2(30)
);

drop table test_tb1;
select * from test_tbl;
--테이블에 데이터를 삽입하는 구문 
-- 방법1)
-- insert into 테이블이름 (컬럼이름1, 컬럼이름2, 컬럼이름3, 컬럼이름4, 컬럼이름5) values(값1, 값2, 값3, 값4, 값,5)
insert into test_tbl (data1,data2,data3,data4,data5) values('문자열1','문자열2',100,sysdate,'문자열3');
-- intsert할때 컬럼을 지정한 컬러에만 데이터가 삽입되고, 지정하지않은 컬럼은 null이 들어있음
insert into test_tbl (data1,data3,data4) values('문자열4',200,sysdate-1);
-- insert할때 컬럼 순서에 맞춰서 balues를 작성
-- 이때 자동형변환으로 변환될 수 없는 데이터면 insert 실패
insert into test_tbl (data3,data1,data4) values('500',300,sysdate+1);--문자열 5가 data3 컬럼에 삽입될때 형변환이 불가능해서 에러
insert into test_tbl (data3,data1,data4) values(500,'문자열5',sysdate+1);--명시한 컬럼 순서와 맞춰서 작성해야 삽입
insert into test_tbl (data3,data1,data4) values('600',400,sysdate+1);--이때 자동으로 형변환이 가능하면 삽입 가능

-- 방법2) 컬럼명을 명시하지 않는 방법
-- 컬럼의 수와 순서를 명시하지않음 -> 모든컬럼을 테이블작성 순서대로 
-- insert into 테이블이름 values(값1,값2,값3,값4,값5)
insert into test_tbl values ('문자열7','문자열8',500,sysdate,'문자열9');
-- insert 할 데이터가 일부인경우 null도 값으로 대입
insert into test_tbl values('문자열10',1000,sysdate+2);
insert into test_tbl values('문자열10',null,1000,sysdate+2,null);

-- 테이블의 데이터를 수정하는 구문
-- update 테이블이름 set 컬럼이름1 = 수정값1, 컬럼이름2 = 수정값2 
update test_tbl set data2 = '수정값1', data5='수정값2' where data1='문자열4';
-- update 할때 where을 작성하지 않으면 모든 컬럼값이 한번에 변경 
update test_tbl set data2 = '수정값3' where to_char(data4, 'yyyy-mm-dd') = to_char(sysdate+1, 'yyyy-mm-dd');
select * from test_tbl;
-- sysdate는 날짜가 똑같다해도 사실 다르다.
select data1, data2, data3, to_char(data4, 'yyyy-mm-dd hh24:mi:ss') data4, data5 from test_tbl;
rollback;

select * from test_tbl;
--테이블의 데이터를 삭제하는 구문 
-- delete from 테이블이름 where 조건식 
delete from test_tbl where data1 = '300';
delete from test_tbl where data5 is null;

--쿼리문도 가능하다. 
insert into test_tbl values ('test1','test2',3,sysdate,(select emp_name from employee where emp_id=200));

update test_tbl set data5 =(select emp_name from employee where emp_id=200)where data1 = 'test1';

delete from test_tbl where data5 = (select emp_name from employee where emp_id=200);

select emp_name from employee where emp_id=200;

create table user_tbl(
    user_name       varchar2(21),
    user_age        number,
    user_phone      char(13),
    user_addr       varchar2(300)
);
rollback;
insert into user_tbl values ('유저1',27,'010-2385-3672','서울시 영등포구 당산동');
insert into user_tbl values ('홍길동',34,'010-6253-7740','서울시 관악구 신림동');
insert into user_tbl values ('테스터',30,'010-5572-2738','서울시 노원구 상계동');

select * from user_tbl;

update user_tbl set user_name = '유저11' where user_name = '유저1';
update user_tbl set user_addr = '서울시 도봉구 쌍문동' where user_name = '홍길동';

delete from user_tbl where user_name ='테스터';

commit;