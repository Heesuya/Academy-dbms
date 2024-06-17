create table user_tbl(
    user_id     varchar2(20)    primary key,
    user_pw     varchar2(30)    not null,
    user_name   varchar2(20)    not null
);

create table del_user(
    user_id     varchar2(20)    primary key,
    del_date    date
);

insert into user_tbl values('user01','1111','����1');
insert into user_tbl values('user02','2222','����2');
insert into user_tbl values('user03','3333','����3');
insert into user_tbl values('user04','4444','����4');
insert into user_tbl values('user05','5555','����5');

select * from user_tbl;
commit;-- ���� ������ ���·� ����, ����� savepoint�� ��� ���� 
delete from user_tbl where user_id = 'user05';
savepoint sp2;
delete from user_tbl where user_id = 'user04';
--savepoint spl;-- ������ �۾��� �ӽ� ���� ������ ����(�̸��� spl)
delete from user_tbl where user_id = 'user03';
rollback;-- ���� �ֱٿ� Ŀ�Ե� �������� �ǵ��� �� 
rollback to sp2;


/*
ȸ���� Ż���ϰ� �Ǹ�
user_tbl���� �ش��ϴ� ���̵� ����
������ ���̵� ����ð������ؼ� del_user�� ���� 
*/

select * from user_tbl;
select * from del_user;
-- user03ȸ���� Ż���Ѵٸ� 
delete from user_tbl where user_id='user03';
insert into del_user values('user03',sysdate);
commit;

-- user03ȸ���� Ż���Ѵٸ� 
delete from user_tbl where user_id='user04';

insert into del_user values('user04',sysdate,123);
rollback;


create table test_tbl(
    data1       number,
    data2       varchar2(30)
);