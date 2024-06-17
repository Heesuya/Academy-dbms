-- 계정생성방법
-- create user  계정이름 identified by 비밀번호; 
create user test01 identified by 1234;

-- 관리자 계정에서 계정을 생성하면 계정은 잘 생성되지만 권한이 없어서 접속이 불가능
-- 생성된 계정에 접속권한을 부여해야 접속 가능 
-- 권한부여 방법 : grant role to 계정이름 
grant connect to test01;
-- 부여된 권한을 다시 회수하는 방법 : revoke role from 계정이름 
revoke connect from test01;

grant connect,resource to test01;