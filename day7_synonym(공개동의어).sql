grant create view to kh;
grant create synonym to kh;

select * from dba_tables;

--�������Ǿ� : �����ڰ������� Ư�� user�� ���̺��� ���Ǿ�� ����� ��� -> �������Ǿ�(public Ű���� �ʼ�)
create public synonym dept for kh.department; 

select * from dept;

drop public synonym dept;


--test01������ kh������ �����ϰ� �ִ� department���̺��� ��ȸ ���� �ο� 
grant select on kh.department to test01;
revoke select on kh.department from test01; -- ���� ȸ��




-----------------�ǽ�-----------------
create user khtest identified by 1234;
grant connect, resource to khtest;

grant create view to khtest;
grant create synonym to khtest;