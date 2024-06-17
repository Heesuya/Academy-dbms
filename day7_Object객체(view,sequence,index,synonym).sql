--객체 (*)view / (**중요 계속 사용)sequence / (*)index / synonym
--신입은 기능이 중요,, 이후 성능이 중요 


--view  // inline view 할때 사용했는뎅  가상의 뷰
--view를 쓰는 목적?  개발할때는 데이터베이스 특정 컬럼만 보여주고 권한만 줌. 
--1) admin 에서 grant create view to kh;  // view를 만들수 있는 권한을 주어야 함. 
--from (select * from test_tbl)

select * from asdfjkl;




--view : select조회결과를 가상의 테이블로 저장 
-- view 만들기   // 데이터 연결
create view emp_view
as
select emp_id, emp_name, email, phone from employee;

create view emp_view2
as
select emp_name, salary*12 salary from employee;

-- table 복사   // 테이블 물리적으로 복사 
create table emp_copy
as
select emp_id, emp_name, email, phone from employee;


-- view 와 copy 의 차이                               
-- 220번 학생의 전화번호 null -> 01012341234  입력해보자. 
update employee set phone ='01012341234' where emp_id=220;
update emp_view set phone ='01099999999' where emp_id=219;

select * from employee;

--원본데이터 링크를 걸어놓은 것과 아닌것의 차이. 
--번호 반영됨. (직접적으로 연결된 경우에만 update 가능) 
select * from emp_view; --물리적 저장이 아닌, 참조하고 있는 위치를 따로 모아서 실제로 보여주는 개념 // 자바의 깊은 복사랑 비슷
select * from emp_view2; --수정 불가 : join, grop by, 산술연산(데이터에 변화를 줘서 가져올 경우)을 역으로 계산하는건 불가능하다. 
--수정 불가 : not null 제약조건이 지정된 경우 


--바뀐 핸드폰번호 반영되지 않음. 
select * from emp_copy; --물리적 저장 테이블을 복사 // 자바의 얕은 복사랑 비슷






--데이터 딕셔너리 : 데이터베이스 자원을 효율적으로 관리하기위한 시스템의 테이블 
-- 데이터 딕셔너리 뷰  (3가지 분류)    // 이정도는 보여줄게
-- DBA_XXXX : 데이터베이스 관리자가 접근 가능한 객체 정보 
-- ALL_XXXX : 자신의 계정이 소유하거나 권한을 부여받은 객체 정보 조회
-- USER_XXXX : 자신의 계정이 소유한 객체 정보 조회 

select * from user_tables; -- 테이블 목록 볼수 있다. 
select * from user_cons_columns; -- 소유하고 있는 객체 중 컬럼의 제약조건에 대한 것 확인 
--user은 해당된 계정    all은 외의 다른 계정까지 조회 가능   dba는 관리자가 전체적으로 다 볼수 있음




drop sequence test_seq;
--sequence : 번호발생기
--순차적으로 정수 값을 자동으로 생성하는 객체, 자동 번호 발생기의 역할 
create sequence test_seq
start with 100              --시작번호 100 
increment by 10             --다음번호 요청 시 10씩 증가 
maxvalue 200                --시퀀스로 발생시킬 수 있는 최대 값 200 
nocycle                     --시퀀스로 최대값에 도달한 이후 추가로 번호요청하면 다시 start 값부터 시작
nocache                     --cache메모리 사용하지 않음
;

--시퀀스이름.currval : 현재 시퀀스값 반환
--시퀀스이름.nextval : 다음 시퀀스값 반환
-- 시퀀스를 생성하고 첫 시작값은 없으므로 currval사용전에는 반드시 nextval을 먼저 한번은 사용해야 함. 

select test_seq.nextval from dual; 


--cycle
create sequence test_seq
start with 100              --시작번호 100 
increment by 10             --다음번호 요청 시 10씩 증가 
maxvalue 200                --시퀀스로 발생시킬 수 있는 최대 값 200 
cycle                     --시퀀스로 최대값에 도달한 이후 추가로 번호요청하면 다시 1 값부터 시작
nocache                     --cache메모리 사용하지 않음
;


create sequence test_seq2
start with 10
;
select test_seq2.nextval from dual;  --10부터 시작해서 1씩 증가, 다음번호 줘  
select test_seq2.currval from dual;  --지금 시퀀스 몇까지 썻어? 

select * from emp_copy;
create sequence emp_copy_seq
start with 223 
;
                         -- 바뀌는 숫자(시퀀스), 변수, 변수, 변수
insert into emp_copy values(emp_copy_seq.nextval,'신입3','new3@kh.or.kr','010222233332');
--시퀀스가 emp_copy의 전용이 아니기에 실패하면 
select * from emp_copy;

-- alter 로 수정 가능  단, start를 바꾸고 싶을때는 drop 후 다시 만들어야함. 




--index 사용시 select가 빨라진다.   //index 단점 : 저장 공간 필요, 정렬 시간 필요, 수정사항 많으면 부하가 걸린다. 
--전체 데이터 중 일부(10~15% 볼때), where절 join조건 자주 상용될때, 데이터의 변경 자주 일어나지 않을때, 용량이 클 경우 
-- 자주 사용하면 primary key 쓰면 자동으로 index 설정이 됨. 
select * from user_indexes;
--chun 데이터로 확인



--SYNONYM    // 별명 만들기~ 

select * from employee;
select * from emp;

--create synonym 동의어 for 테이블명; 
--kh계정으로 접속해서 kh계정이 소유하고 있는 테이블에 대한 동의어 생성 -> 비공개동의어 
create synonym emp for employee; --employee의 동의어로 emp를 생성
drop synonym emp;

--공개 동의어는 관리자(admin)가 만들어야함. 
select * from dept;

