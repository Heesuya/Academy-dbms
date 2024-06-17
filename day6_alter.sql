create table dept_copy
as
select dept_id, dept_title from department;--select���� ���� ��ȸ�Ȱ���� �״�� ���̺�� ����� ���
-- ��ȸ�� ����� �ڷ�����, �÷��̸��� �״�� �����ؼ� ���̺��� ���� 
-- ��, ���������� not null�� ����ǰ� ������ ���������� ������� ���� 
-- epartemnt DEPT_ID �� primary �ε� �̷��Ŵ� ���� ���ؿ� 

select * from dept_copy;

-- alter : DDL�� �� ������ create�� ���ǵ� ��ü�� ������ ������ �� ��� 



-- �÷� �߰� 
alter table dept_copy add (kname varchar2(20) default '�⺻��');
select * from dept_copy;
--copy2�� �ٸ��� �����Ͱ� �ֱ⿡ null ���� �ȵ��� default�� �⺻���� �����ؾ� �Ѵ�.
alter table dept_copy add (kname varchar2(20));
alter table dept_copy add(name varchar2(30) default '�⺻��' not null);

-- �����͸� ��ȸ�� ���ĸ� �����Ҽ� �ִ�.  1=0  false
select dept_id, dept_title from department where 1 = 0;

create table dept_copy2
as
select dept_id, dept_title from department where 1 = 0; 
-- select ��ȸ����� 0�� row�� ������ ��ȸ�ؼ� ���̺��� ����� �÷����, �ڷ����� �������� �����ʹ� �������� ���� 

select * from dept_copy2;
alter table dept_copy2 add (name varchar2(30) not null);


select * from dept_copy;
--�÷� ���� 
alter table dept_copy 
modify dept_id char(2); --�ڷ����� ����� �Ѵ�. 
alter table dept_copy
modify dept_title varchar2(30);
  

--�÷� ���� 
alter table dept_copy drop column name;
alter table dept_copy drop column kname; --���������� �����ϸ鼭������ �Ұ��� 


select * from dept_copy;
--�������� �߰� 
select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'DEPT_COPY'; --data dictionary?? 

--�������� �߰� alter table ���̺��̸� add constraint ���������̸� �������Ǹ�(�÷��̸�)
select * from dept_copy;
alter table dept_copy 
add constraint dcopy_id_pk primary key(dept_id);

alter table dept_copy
add constraint dtitle_unq unique(dept_title);

--not null �������� �߰��ϴ� ��� (modify�� �߰�)
alter table dept_copy
modify kname constraint kname_nn not null;


--�������� ����
alter table dept_copy
drop constraint dtitle_unq;

alter table dept_copy
modify kname null;

--���������� ���������� ���� -> �����ϰ� ������ ���� �� �ٽ� ���� 

--�÷��̸� ���� 
select * from dept_copy;

alter table dept_copy
rename column kname to name;

--�������� �̸� ����
select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'ALTER_TEST'; 

--�������� �̸� ����
alter table dept_copy
rename constraint SYS_C007103 to D_ID_NN;

--���̺� �̸� ����
alter table dept_copy
rename to alter_test;

--alter �ʿ��Ҷ� ã�Ƽ� ���� �ȴ�. 