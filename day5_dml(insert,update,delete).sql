create table test_tbl(
    data1       varchar2(20),
    data2       char(10),
    data3       number,
    data4       date,
    data5       varchar2(30)
);

drop table test_tb1;
select * from test_tbl;
--���̺� �����͸� �����ϴ� ���� 
-- ���1)
-- insert into ���̺��̸� (�÷��̸�1, �÷��̸�2, �÷��̸�3, �÷��̸�4, �÷��̸�5) values(��1, ��2, ��3, ��4, ��,5)
insert into test_tbl (data1,data2,data3,data4,data5) values('���ڿ�1','���ڿ�2',100,sysdate,'���ڿ�3');
-- intsert�Ҷ� �÷��� ������ �÷����� �����Ͱ� ���Եǰ�, ������������ �÷��� null�� �������
insert into test_tbl (data1,data3,data4) values('���ڿ�4',200,sysdate-1);
-- insert�Ҷ� �÷� ������ ���缭 balues�� �ۼ�
-- �̶� �ڵ�����ȯ���� ��ȯ�� �� ���� �����͸� insert ����
insert into test_tbl (data3,data1,data4) values('500',300,sysdate+1);--���ڿ� 5�� data3 �÷��� ���Եɶ� ����ȯ�� �Ұ����ؼ� ����
insert into test_tbl (data3,data1,data4) values(500,'���ڿ�5',sysdate+1);--����� �÷� ������ ���缭 �ۼ��ؾ� ����
insert into test_tbl (data3,data1,data4) values('600',400,sysdate+1);--�̶� �ڵ����� ����ȯ�� �����ϸ� ���� ����

-- ���2) �÷����� ������� �ʴ� ���
-- �÷��� ���� ������ ����������� -> ����÷��� ���̺��ۼ� ������� 
-- insert into ���̺��̸� values(��1,��2,��3,��4,��5)
insert into test_tbl values ('���ڿ�7','���ڿ�8',500,sysdate,'���ڿ�9');
-- insert �� �����Ͱ� �Ϻ��ΰ�� null�� ������ ����
insert into test_tbl values('���ڿ�10',1000,sysdate+2);
insert into test_tbl values('���ڿ�10',null,1000,sysdate+2,null);

-- ���̺��� �����͸� �����ϴ� ����
-- update ���̺��̸� set �÷��̸�1 = ������1, �÷��̸�2 = ������2 
update test_tbl set data2 = '������1', data5='������2' where data1='���ڿ�4';
-- update �Ҷ� where�� �ۼ����� ������ ��� �÷����� �ѹ��� ���� 
update test_tbl set data2 = '������3' where to_char(data4, 'yyyy-mm-dd') = to_char(sysdate+1, 'yyyy-mm-dd');
select * from test_tbl;
-- sysdate�� ��¥�� �Ȱ����ص� ��� �ٸ���.
select data1, data2, data3, to_char(data4, 'yyyy-mm-dd hh24:mi:ss') data4, data5 from test_tbl;
rollback;

select * from test_tbl;
--���̺��� �����͸� �����ϴ� ���� 
-- delete from ���̺��̸� where ���ǽ� 
delete from test_tbl where data1 = '300';
delete from test_tbl where data5 is null;

--�������� �����ϴ�. 
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
insert into user_tbl values ('����1',27,'010-2385-3672','����� �������� ��굿');
insert into user_tbl values ('ȫ�浿',34,'010-6253-7740','����� ���Ǳ� �Ÿ���');
insert into user_tbl values ('�׽���',30,'010-5572-2738','����� ����� ��赿');

select * from user_tbl;

update user_tbl set user_name = '����11' where user_name = '����1';
update user_tbl set user_addr = '����� ������ �ֹ���' where user_name = 'ȫ�浿';

delete from user_tbl where user_name ='�׽���';

commit;