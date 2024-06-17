create table member_tbl(
    member_id       varchar2(20)        primary key,                            --회원 아이디
    member_pw       varchar2(30)        not null,                               --회원 비밀번호
    member_name     varchar2(30)        not null,                               --회원 이름
    member_phone    char(13)            not null,                               --회원 전화번호
    member_age      number              not null,                               --회원 나이
    member_gender   char(3)             check(member_gender in ('남','여')),  -- 성별
    enroll_date     date                not null                                -- 회원가입일
);

insert into member_tbl values('user01','1111','유저1','010-1111-1111',30,'남',sysdate);
insert into member_tbl values('user02','2222','유저2','010-2222-2222',20,'여',sysdate);
insert into member_tbl values('user03','3333','유저3','010-3333-3333',35,'여',sysdate);
insert into member_tbl values('test01','1234','테스트1','010-1234-1234',35,'남',sysdate);
insert into member_tbl values('user04','4444','유저1','010-4444-4444',40,'남',sysdate);
insert into member_tbl values('test03','3123','테스트3','010-3234-3234',20,'남',sysdate);

select * from member_tbl;
--commit을 안하면 자바에서 조회가 안됨. 

select count(*) from member_tbl;
commit;
