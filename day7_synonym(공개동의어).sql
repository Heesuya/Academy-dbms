grant create view to kh;
grant create synonym to kh;

select * from dba_tables;

--공개동의어 : 관리자계정에서 특정 user의 테이블을 동의어로 만드는 경우 -> 공개동의어(public 키워드 필수)
create public synonym dept for kh.department; 

select * from dept;

drop public synonym dept;


--test01계정에 kh계정이 소유하고 있는 department테이블의 조회 권한 부여 
grant select on kh.department to test01;
revoke select on kh.department from test01; -- 권한 회수




-----------------실습-----------------
create user khtest identified by 1234;
grant connect, resource to khtest;

grant create view to khtest;
grant create synonym to khtest;