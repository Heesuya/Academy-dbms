create table MEMBER(
       MEMBER_NO        NUMBER		     PRIMARY KEY,         -- ȸ�� ���� ���� (�ڵ� ����), 
       MEMBER_USERID    VARCHAR2(20)	 UNIQUE NOT NULL,     -- ȸ�� ���̵�			
       MEMBER_USERPWD   VARCHAR2(20)  	 not null,            -- ȸ�� ��й�ȣ		
       MEMBER_NICKNAME  VARCHAR2(20) 	 UNIQUE NOT NULL,     -- ȸ�� �г���			
       MEMBER_GENDER    CHAR(3)          check(MEMBER_GENDER in ('��','��')) NOT NULL , -- ȸ�� ����('��' Ȥ�� '��')
       MEMBER_EMAIL     VARCHAR2(30)	 NOT NULL             -- ȸ�� �̸���			
);

create sequence member_seq
start with 1000
--increment by 1
maxvalue 1000000
;

select * from member;
insert into member values(member_seq.nextval,'user01','1111','����01','��','user01@kh.or.kr');
insert into member values(member_seq.nextval,'user02','2222','����02','��','user02@kh.or.kr');
insert into member values(member_seq.nextval,'user03','2222','����03','��','user03@kh.or.kr');
insert into member values(member_seq.nextval,'user04','4444','����04','��','user04@kh.or.kr');

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
insert into board values(board_seq.nextval,'�׽�Ʈ01','�׽�Ʈ1111',sysdate, '����01');
insert into board values(board_seq.nextval,'�׽�Ʈ02','�׽�Ʈ2222',sysdate, '����02');
insert into board values(board_seq.nextval,'�׽�Ʈ03','�׽�Ʈ3333',sysdate, '����03');
insert into board values(board_seq.nextval,'�׽�Ʈ04','�׽�Ʈ4444',sysdate, '����02');
insert into board values(board_seq.nextval,'�׽�Ʈ05','�׽�Ʈ5555',sysdate, '����05');

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