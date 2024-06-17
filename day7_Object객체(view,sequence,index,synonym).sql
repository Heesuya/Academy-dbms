--��ü (*)view / (**�߿� ��� ���)sequence / (*)index / synonym
--������ ����� �߿�,, ���� ������ �߿� 


--view  // inline view �Ҷ� ����ߴµ�  ������ ��
--view�� ���� ����?  �����Ҷ��� �����ͺ��̽� Ư�� �÷��� �����ְ� ���Ѹ� ��. 
--1) admin ���� grant create view to kh;  // view�� ����� �ִ� ������ �־�� ��. 
--from (select * from test_tbl)

select * from asdfjkl;




--view : select��ȸ����� ������ ���̺�� ���� 
-- view �����   // ������ ����
create view emp_view
as
select emp_id, emp_name, email, phone from employee;

create view emp_view2
as
select emp_name, salary*12 salary from employee;

-- table ����   // ���̺� ���������� ���� 
create table emp_copy
as
select emp_id, emp_name, email, phone from employee;


-- view �� copy �� ����                               
-- 220�� �л��� ��ȭ��ȣ null -> 01012341234  �Է��غ���. 
update employee set phone ='01012341234' where emp_id=220;
update emp_view set phone ='01099999999' where emp_id=219;

select * from employee;

--���������� ��ũ�� �ɾ���� �Ͱ� �ƴѰ��� ����. 
--��ȣ �ݿ���. (���������� ����� ��쿡�� update ����) 
select * from emp_view; --������ ������ �ƴ�, �����ϰ� �ִ� ��ġ�� ���� ��Ƽ� ������ �����ִ� ���� // �ڹ��� ���� ����� ���
select * from emp_view2; --���� �Ұ� : join, grop by, �������(�����Ϳ� ��ȭ�� �༭ ������ ���)�� ������ ����ϴ°� �Ұ����ϴ�. 
--���� �Ұ� : not null ���������� ������ ��� 


--�ٲ� �ڵ�����ȣ �ݿ����� ����. 
select * from emp_copy; --������ ���� ���̺��� ���� // �ڹ��� ���� ����� ���






--������ ��ųʸ� : �����ͺ��̽� �ڿ��� ȿ�������� �����ϱ����� �ý����� ���̺� 
-- ������ ��ųʸ� ��  (3���� �з�)    // �������� �����ٰ�
-- DBA_XXXX : �����ͺ��̽� �����ڰ� ���� ������ ��ü ���� 
-- ALL_XXXX : �ڽ��� ������ �����ϰų� ������ �ο����� ��ü ���� ��ȸ
-- USER_XXXX : �ڽ��� ������ ������ ��ü ���� ��ȸ 

select * from user_tables; -- ���̺� ��� ���� �ִ�. 
select * from user_cons_columns; -- �����ϰ� �ִ� ��ü �� �÷��� �������ǿ� ���� �� Ȯ�� 
--user�� �ش�� ����    all�� ���� �ٸ� �������� ��ȸ ����   dba�� �����ڰ� ��ü������ �� ���� ����




drop sequence test_seq;
--sequence : ��ȣ�߻���
--���������� ���� ���� �ڵ����� �����ϴ� ��ü, �ڵ� ��ȣ �߻����� ���� 
create sequence test_seq
start with 100              --���۹�ȣ 100 
increment by 10             --������ȣ ��û �� 10�� ���� 
maxvalue 200                --�������� �߻���ų �� �ִ� �ִ� �� 200 
nocycle                     --�������� �ִ밪�� ������ ���� �߰��� ��ȣ��û�ϸ� �ٽ� start ������ ����
nocache                     --cache�޸� ������� ����
;

--�������̸�.currval : ���� �������� ��ȯ
--�������̸�.nextval : ���� �������� ��ȯ
-- �������� �����ϰ� ù ���۰��� �����Ƿ� currval��������� �ݵ�� nextval�� ���� �ѹ��� ����ؾ� ��. 

select test_seq.nextval from dual; 


--cycle
create sequence test_seq
start with 100              --���۹�ȣ 100 
increment by 10             --������ȣ ��û �� 10�� ���� 
maxvalue 200                --�������� �߻���ų �� �ִ� �ִ� �� 200 
cycle                     --�������� �ִ밪�� ������ ���� �߰��� ��ȣ��û�ϸ� �ٽ� 1 ������ ����
nocache                     --cache�޸� ������� ����
;


create sequence test_seq2
start with 10
;
select test_seq2.nextval from dual;  --10���� �����ؼ� 1�� ����, ������ȣ ��  
select test_seq2.currval from dual;  --���� ������ ����� ����? 

select * from emp_copy;
create sequence emp_copy_seq
start with 223 
;
                         -- �ٲ�� ����(������), ����, ����, ����
insert into emp_copy values(emp_copy_seq.nextval,'����3','new3@kh.or.kr','010222233332');
--�������� emp_copy�� ������ �ƴϱ⿡ �����ϸ� 
select * from emp_copy;

-- alter �� ���� ����  ��, start�� �ٲٰ� �������� drop �� �ٽ� ��������. 




--index ���� select�� ��������.   //index ���� : ���� ���� �ʿ�, ���� �ð� �ʿ�, �������� ������ ���ϰ� �ɸ���. 
--��ü ������ �� �Ϻ�(10~15% ����), where�� join���� ���� ���ɶ�, �������� ���� ���� �Ͼ�� ������, �뷮�� Ŭ ��� 
-- ���� ����ϸ� primary key ���� �ڵ����� index ������ ��. 
select * from user_indexes;
--chun �����ͷ� Ȯ��



--SYNONYM    // ���� �����~ 

select * from employee;
select * from emp;

--create synonym ���Ǿ� for ���̺��; 
--kh�������� �����ؼ� kh������ �����ϰ� �ִ� ���̺� ���� ���Ǿ� ���� -> ��������Ǿ� 
create synonym emp for employee; --employee�� ���Ǿ�� emp�� ����
drop synonym emp;

--���� ���Ǿ�� ������(admin)�� ��������. 
select * from dept;

