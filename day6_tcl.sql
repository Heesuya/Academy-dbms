--TCL (Tool Command Language)

create table test_tb1(
    data1       number,
    data2       varchar2(20)
);
commit;
insert into test_tbl values(1,'김형준');
insert into test_tbl values(1,'바보');

select * from test_tbl;


-- TCL의 동작조건 : insert/update/delete 구문이 동작했을때만 적용- > 테이블 내부 데이터가 변경되었을때
-- TLC의 동작조건이 아닌경우 : ddl동작