create table user_tbl(
    user_id     varchar2(20)    primary key,
    user_pw     varchar2(30)    not null,
    user_name   varchar2(20)    not null
);

create table del_user(
    user_id     varchar2(20)    primary key,
    del_date    date
);

insert into user_tbl values('user01','1111','유저1');
insert into user_tbl values('user02','2222','유저2');
insert into user_tbl values('user03','3333','유저3');
insert into user_tbl values('user04','4444','유저4');
insert into user_tbl values('user05','5555','유저5');

select * from user_tbl;
commit;-- 현재 데이터 상태로 저장, 저장된 savepoint를 모두 제거 
delete from user_tbl where user_id = 'user05';
savepoint sp2;
delete from user_tbl where user_id = 'user04';
--savepoint spl;-- 데이터 작업의 임시 저장 지점을 만듬(이름이 spl)
delete from user_tbl where user_id = 'user03';
rollback;-- 가장 최근에 커밋된 시점으로 되돌아 감 
rollback to sp2;


/*
회원을 탈퇴하게 되면
user_tbl에서 해당하는 아이디를 삭제
삭제된 아이디를 현재시간으로해서 del_user에 삽입 
*/

select * from user_tbl;
select * from del_user;
-- user03회원이 탈퇴한다면 
delete from user_tbl where user_id='user03';
insert into del_user values('user03',sysdate);
commit;

-- user03회원이 탈퇴한다면 
delete from user_tbl where user_id='user04';

insert into del_user values('user04',sysdate,123);
rollback;


create table test_tbl(
    data1       number,
    data2       varchar2(30)
);