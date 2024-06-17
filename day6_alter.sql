create table dept_copy
as
select dept_id, dept_title from department;--select문을 통해 조회된결과를 그대로 테이블로 만드는 방법
-- 조회된 결과의 자료형과, 컬럼이름을 그대로 복사해서 테이블을 생성 
-- 단, 제약조건은 not null만 복사되고 나머지 제약조건은 복사되지 않음 
-- epartemnt DEPT_ID 는 primary 인데 이런거는 복사 못해옴 

select * from dept_copy;

-- alter : DDL의 한 종류로 create로 정의된 객체의 내용을 수정할 때 사용 



-- 컬럼 추가 
alter table dept_copy add (kname varchar2(20) default '기본값');
select * from dept_copy;
--copy2와 다르게 데이터가 있기에 null 값이 안들어가서 default로 기본값을 세팅해야 한다.
alter table dept_copy add (kname varchar2(20));
alter table dept_copy add(name varchar2(30) default '기본값' not null);

-- 데이터를 조회한 형식만 복사할수 있다.  1=0  false
select dept_id, dept_title from department where 1 = 0;

create table dept_copy2
as
select dept_id, dept_title from department where 1 = 0; 
-- select 조회결과가 0개 row가 나오게 조회해서 테이블을 만들면 컬러명과, 자료형만 가져오고 데이터는 가져오지 않음 

select * from dept_copy2;
alter table dept_copy2 add (name varchar2(30) not null);


select * from dept_copy;
--컬럼 수정 
alter table dept_copy 
modify dept_id char(2); --자료형도 맞춰야 한다. 
alter table dept_copy
modify dept_title varchar2(30);
  

--컬럼 삭제 
alter table dept_copy drop column name;
alter table dept_copy drop column kname; --제약조건을 위배하면서까지는 불가능 


select * from dept_copy;
--제약조건 추가 
select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'DEPT_COPY'; --data dictionary?? 

--제약조건 추가 alter table 테이블이름 add constraint 제약조건이름 제약조건명(컬럼이름)
select * from dept_copy;
alter table dept_copy 
add constraint dcopy_id_pk primary key(dept_id);

alter table dept_copy
add constraint dtitle_unq unique(dept_title);

--not null 제약조건 추가하는 방법 (modify로 추가)
alter table dept_copy
modify kname constraint kname_nn not null;


--제약조건 삭제
alter table dept_copy
drop constraint dtitle_unq;

alter table dept_copy
modify kname null;

--제약조건의 수정개념은 없음 -> 수정하고 싶으면 삭제 후 다시 적용 

--컬럼이름 변경 
select * from dept_copy;

alter table dept_copy
rename column kname to name;

--제약조건 이름 변경
select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'ALTER_TEST'; 

--제약조건 이름 변경
alter table dept_copy
rename constraint SYS_C007103 to D_ID_NN;

--테이블 이름 변경
alter table dept_copy
rename to alter_test;

--alter 필요할때 찾아서 쓰면 된다. 