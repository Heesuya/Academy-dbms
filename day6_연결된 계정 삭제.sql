create user test02 identified by 1234;
grant connect, resource to test02;

drop user test02 cascade;--살려야하는데라면 자료복구 불가능