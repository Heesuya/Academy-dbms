create table member_tbl(
    member_id       varchar2(20)        primary key,                            --ȸ�� ���̵�
    member_pw       varchar2(30)        not null,                               --ȸ�� ��й�ȣ
    member_name     varchar2(30)        not null,                               --ȸ�� �̸�
    member_phone    char(13)            not null,                               --ȸ�� ��ȭ��ȣ
    member_age      number              not null,                               --ȸ�� ����
    member_gender   char(3)             check(member_gender in ('��','��')),  -- ����
    enroll_date     date                not null                                -- ȸ��������
);

insert into member_tbl values('user01','1111','����1','010-1111-1111',30,'��',sysdate);
insert into member_tbl values('user02','2222','����2','010-2222-2222',20,'��',sysdate);
insert into member_tbl values('user03','3333','����3','010-3333-3333',35,'��',sysdate);
insert into member_tbl values('test01','1234','�׽�Ʈ1','010-1234-1234',35,'��',sysdate);
insert into member_tbl values('user04','4444','����1','010-4444-4444',40,'��',sysdate);
insert into member_tbl values('test03','3123','�׽�Ʈ3','010-3234-3234',20,'��',sysdate);

select * from member_tbl;
--commit�� ���ϸ� �ڹٿ��� ��ȸ�� �ȵ�. 

select count(*) from member_tbl;
commit;
