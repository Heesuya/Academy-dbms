--TCL (Tool Command Language)

create table test_tb1(
    data1       number,
    data2       varchar2(20)
);
commit;
insert into test_tbl values(1,'������');
insert into test_tbl values(1,'�ٺ�');

select * from test_tbl;


-- TCL�� �������� : insert/update/delete ������ ������������ ����- > ���̺� ���� �����Ͱ� ����Ǿ�����
-- TLC�� ���������� �ƴѰ�� : ddl����