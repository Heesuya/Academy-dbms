create table MEMBER(
       MEMBER_NO        NUMBER		     PRIMARY KEY,         -- 회원 고유 순번 (자동 증가), 
       MEMBER_USERID    VARCHAR2(20)	 UNIQUE NOT NULL,     -- 회원 아이디			
       MEMBER_USERPWD   VARCHAR2(20)  	 not null,            -- 회원 비밀번호		
       MEMBER_NICKNAME  VARCHAR2(20) 	 UNIQUE NOT NULL,     -- 회원 닉네임			
       MEMBER_GENDER    CHAR(3)          check(MEMBER_GENDER in ('남','여')) NOT NULL , -- 회원 성별('남' 혹은 '여')
       MEMBER_EMAIL     VARCHAR2(30)	 NOT NULL             -- 회원 이메일			
);

create sequence member_seq
start with 1000
--increment by 1
maxvalue 1000000
;

select * from member;
insert into member values(member_seq.nextval,'user01','1111','유저01','남','user01@kh.or.kr');
insert into member values(member_seq.nextval,'user02','2222','유저02','여','user02@kh.or.kr');
insert into member values(member_seq.nextval,'user03','2222','유저03','남','user03@kh.or.kr');
insert into member values(member_seq.nextval,'user04','4444','유저04','남','user04@kh.or.kr');

create table BOARD(
    board_no        number       primary key,
    board_title     varchar(20)  not null,
    board_content   varchar(200) not null,
    board_writedate date         not null,
    board_nickname  varchar2(20) references MEMBER(MEMBER_NICKNAME) on delete set null
);

alter table board 
modify board_nickman null;


create sequence board_seq
start with 1
--increment by 1
maxvalue 500000
;

select * from board;
insert into board values(board_seq.nextval,'테스트01','테스트1111',sysdate, '유저01');
insert into board values(board_seq.nextval,'테스트02','테스트2222',sysdate, '유저02');
insert into board values(board_seq.nextval,'테스트03','테스트3333',sysdate, '유저03');
insert into board values(board_seq.nextval,'테스트04','테스트4444',sysdate, '유저02');
insert into board values(board_seq.nextval,'테스트05','테스트5555',sysdate, '유저05');

delete from member where member_userid= 'user01';

create view member_view
as
select member_no, member_nickname, member_email, board_title 
from member 
join board on (member_nickname = board_nickname);


select * from member_view;

create synonym M for member;
select * from M;

create synonym B for board;
select * from b;

commit;