-- �����������
-- create user  �����̸� identified by ��й�ȣ; 
create user test01 identified by 1234;

-- ������ �������� ������ �����ϸ� ������ �� ���������� ������ ��� ������ �Ұ���
-- ������ ������ ���ӱ����� �ο��ؾ� ���� ���� 
-- ���Ѻο� ��� : grant role to �����̸� 
grant connect to test01;
-- �ο��� ������ �ٽ� ȸ���ϴ� ��� : revoke role from �����̸� 
revoke connect from test01;

grant connect,resource to test01;