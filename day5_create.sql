-- create : ��ü �����ϴ� ����
-- ���̺� ���� ���� 
/*
create table ���̺��̸� (�÷��̸�    �ڷ���(ũ��), �÷��̸� �ڷ���(ũ��), �÷��̸� �ڷ���(ũ��)...)
create table ���̺��̸� (
    �÷��̸�    �ڷ���(ũ��),
    �÷��̸�    �ڷ���(ũ��),
    �÷��̸�    �ڷ���(ũ��),
    ....
    �÷��̸�    �ڷ���(ũ��)
);
���̺� �̸� : ���� ��/�ҹ��� ������ ���� ->  �ܾ�� �ܾ ���յɶ� _ �� ��� -> ������ũ ǥ���
�÷� �̸� : ���� ��/�ҹ��� ������ ���� -> �ܾ�� �ܾ ���յɶ� _ �� ���
�ڷ��� : �ش� �÷��� ������ �����͸��� �������� ���尡���� ����
*/
-- ȸ�� ������ ������ ���̺��� ���� 
-- ���̺��̸� : member_tbl
/*
-- �ڷ��� : char, varchar2, number, date
���� �� ȸ�� ���� ��� 
���̵�        varchar2        ���� 30    member_id
�̸�          varchar2        ���� 21    member_name
��й�ȣ       varchar2        ���� 30    member_password      -- ���������� ��ȣȭ ������ char Ÿ������ ���� �Ȱ��� ��.
�������       char            ���� 10    member_birth    ex. 19990605/1999-06-05
����          varchar2        ���� 30     member_nickname
�ּ�          varchar2        ���� 300    member_address        --�����ͺ��̽� �Ը� Ŀ���� �տ� �ش��ϴ¼Ӽ� �ְ� ���Ӹ� �� �Ⱦ�. 
*/

drop table memeber_tbl;

create table member_tbl (
    member_id       varchar2(30),       --ȸ�����̵�
    member_name     varchar2(21),       --ȸ���̸�
    member_password varchar2(30),       --ȸ����й�ȣ
    member_birth    char(10),           --ȸ���������
    member_nickname varchar2(30),       --ȸ������
    member_address  varchar2(300)       --ȸ���ּ�
);

select * from member_tbl;

-- ���̺� �÷��� �ּ��� �ۼ��ϴ� ��� 
comment on column member_tbl.member_id is 'ȸ�����̵�';
comment on column member_tbl.member_name is 'ȸ���̸�';
comment on column member_tbl.member_password is 'ȸ����й�ȣ';
comment on column member_tbl.member_birth is 'ȸ���������';
comment on column member_tbl.member_nickname is 'ȸ������';
comment on column member_tbl.member_address is 'ȸ���ּ�';

insert into member_tbl values ('user01','����1','1111','2000-01-01','������','����Ư���� �߱�');
insert into member_tbl values ('user02','����2','2222','1998-11-01','������','��õ �߱�');
insert into member_tbl values ('user01','����3','3333','1995-01-23','�ߺ�','����� ��õ�� ��');



create table user_tbl(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20),       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11)            --��ȭ��ȣ
);

insert into user_tbl values(1,'user01','1111','����1','����','01011111111');
insert into user_tbl values(null,null,null,null,null,null);
select * from user_tbl;

--�÷��������� ���������� �����Ѵ�. 
create table user_tbl_notnull(
    user_no     number          not null,             --ȸ����ȣ
    user_id     varchar2(20)    not null,       --ȸ�����̵�
    user_pw     varchar2(30)    not null,       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11)            --��ȭ��ȣ
);

select * from user_tbl_notnull;
insert into user_tbl_notnull values(1,'user01','1111','����1','����','01011111111');
insert into user_tbl_notnull values(2,'user02','2222',null,null,null);
insert into user_tbl_notnull values(3,'user03','3333','����3','����','01033333333');
insert into user_tbl_notnull values(4,'user03','4444','����4','����','01044444444');



--�÷��������� ���������� �����Ѵ�. 
create table user_tbl_unique(
    user_no     number  unique,             --ȸ����ȣ
    user_id     varchar2(20)    unique,       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11)    unique            --��ȭ��ȣ
);

insert into user_tbl_unique values(1,'user01','1111','����1','����','01011111111');
insert into user_tbl_unique values(2,'user02','2222','����2','����','01022222222');
insert into user_tbl_unique values(3,'user03','3333','����3','����','01011111112');
insert into user_tbl_unique values(4,'user04','4444','����4','����','01044444444');
insert into user_tbl_unique values(5,'user05','5555','����5','����',null);
insert into user_tbl_unique values(6,'user06','6666','����6','����',null);  --null�� �����Ͱ� �ƴ�
select * from user_tbl_unique;


--���̺��� �������� ����
create table user_tbl_unique2(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20),       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11),            --��ȭ��ȣ
    unique(user_no),
    unique(user_id)
    --���ε��� �ɾ���
);

insert into user_tbl_unique2 values(1,'user01','1111','����1','����','01011111111');
insert into user_tbl_unique2 values(2,'user02','2222','����2','����','01022222222');
insert into user_tbl_unique2 values(2,'user03','2222','����3','����','01033333333');

select * from user_tbl_unique2;


--���� �ٸ� �����̴�. 
create table user_tbl_unique3(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20),       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11),            --��ȭ��ȣ
    unique(user_no, user_id)
    --���ÿ� ��ĥ�� ����ũ�� �ɸ���.
);

insert into user_tbl_unique3 values(1,'user01','1111','����1','����','01011111111');
insert into user_tbl_unique3 values(2,'user02','2222','����2','����','01022222222');
insert into user_tbl_unique3 values(3,'user02','3333','����3','����','01033333333');
insert into user_tbl_unique3 values(2,'user02','4444','����4','����','01044444444');

commit;

-- not null uniuqe �������� 
create table user_tbl_nn_unq(
    user_no     number not null unique,             --ȸ����ȣ
    user_id     varchar2(20) not null,       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11),            --��ȭ��ȣ
    unique(user_id)
);
insert into user_tbl_nn_unq values(1,'user01','1111','����1','����','01011111111');
insert into user_tbl_nn_unq values(2,'user02','2222','����2','����','01022222222');

select * from user_tbl_nn_unq;


--da6(24.06.10)
--primary key �ϳ��ۿ� ����   unique + not null
create table user_tbl_pk1(
    user_no     number primary key,             --ȸ����ȣ
    user_id     varchar2(20) unique not null,       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11)            --��ȭ��ȣ
);
insert into user_tbl_pk1 values(1, 'user01','1111','����1','����','01011111111');
insert into user_tbl_pk1 values(2, 'user02','2222','����2','����','01022222222');

create table user_tbl_pk2(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20) unique not null,       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11),            --��ȭ��ȣ
    primary key(user_no) --�÷����� �� �ƴ϶�, ���̺������� ������ �ִ�. 
);

create table user_tbl_pk3(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20) unique not null,       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11),            --��ȭ��ȣ
    primary key(user_no, user_id) --���ļ� pk�� ���(unique)�� ���� // �������� ������ ������, �ΰ� ���ļ� primary key �̴�.  
);

create table user_tbl_pk4(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20) unique not null,       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11),            --��ȭ��ȣ
    primary key(user_no),
    primary key(user_id)  --pk�� ���̺�� 1���� ������ �����ϹǷ� ����ó�� �ۼ��ϸ� ���� 
                          --"table can have only one primary key"
);



-- �ܷ�Ű(Foreign Key, FK) : ������ �ٸ� ���̺��� �����ϴ� ���� ����� �� �ֵ��� �����ϴ� �� 
-- �ܷ�Ű ����ϱ� ���ؼ��� primary key(�⺻������), unique �� �;� �Ѵ�. 
/*
���θ� �����ͺ��̽��� ����
-> �ش���θ��� �ݵ�� �α����� �� �α����� �� ������ ����
-> ���α��Ÿ�Ͽ��� �α����� ȸ�� ���̵� ��� 
*/

CREATE TABLE SHOP_MEMBER1(
    MEMBER_ID      VARCHAR2(20),
    MEMBER_PW       VARCHAR2(30),
    MEMBER_NAME     VARCHAR2(21),
    MEMBER_PHONE    CHAR(13)
);
insert into shop_member1 values('user01','1111','����1','010-1111-1111');
insert into shop_member1 values('user02','2222','����2','010-2222-2222');
insert into shop_member1 values('user03','3333','����3','010-3333-3333');
select * from shop_member1;

create table shop_cart1(
    cart_no         number,             --���Ź�ȣ
    product_name    varchar2(100),      --���Ż�ǰ�̸�
    member_id       varchar2(20),       --����ȸ�����̵�
    buy_date        date                --���ų�¥
);
insert into shop_cart1 values(1,'������','user01',sysdate);
insert into shop_cart1 values(2,'������','user03',sysdate);
insert into shop_cart1 values(3,'����','user11',sysdate);

select * from shop_cart1;
select * from shop_member1;


select
    cart_no,product_name,buy_date, member_name, member_phone
from 
    shop_cart1
left join
    shop_member1 using (member_id);
    
    
create table shop_member2(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart2(
    cart_no         number,
    product_name    varchar2(100),
    member_id       varchar2(20) references shop_member2(member_id),--�����ϴ� Ű�� primary key�̰ų� �ּ��� uniqe ������ �Ǿ��Ѵ�. 
    buy_date        date
);
insert into shop_member2 values(1,'user01','1111','����1','010-1111-1111');
insert into shop_member2 values(2,'user02','2222','����2','010-2222-2222');
insert into shop_member2 values(3,'user03','3333','����3','010-3333-3333');
select * from shop_member2;
select * from shop_cart2;
insert into shop_cart2 values(1,'������','user01',sysdate);
insert into shop_cart2 values(2,'������','user03',sysdate);
insert into shop_cart2 values(3,'����','test11',sysdate); --error : parent key not found
insert into shop_cart2 values(3,'����',null,sysdate);--null�� ���� �ִ�.  



create table shop_member3(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart3(
    cart_no         number,
    product_name    varchar2(100),
    member_id       varchar2(20), 
    buy_date        date,
    foreign key (member_id) references shop_member3(member_id)
);



-- priamry key �� ���̺��� ���� �ĺ��ڴ� ���� ~~ 
-- ������ ���� �������� ���
create table shop_member4(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart4(
    cart_no         number,
    product_name    varchar2(100),
    member_no       number      references shop_member4, -- ������ ���̺�� �ۼ��ϸ� �ش� ���̺��� pk�� ����
    buy_date        date
);
insert into shop_member4 values(1,'user01','1111','����1','010-1111-1111');
insert into shop_member4 values(2,'user02','2222','����2','010-2222-2222');
insert into shop_member4 values(3,'user03','3333','����3','010-3333-3333');
select * from shop_member4;
update shop_member4 set member_no=100 where member_id = 'user01';
-- ������Ʈ�Ҷ� �� �ٲ��� �� �ϴ� mySQL �� ���� ���
select * from shop_cart4;
insert into shop_cart4 values(1,'������',1,sysdate);
insert into shop_cart4 values(2,'������',3,sysdate);
insert into shop_cart4 values(3,'����',10,sysdate);

delete from shop_member4 where member_no=2;
delete from shop_member4 where member_no=3;
delete from shop_cart4 where cart_no=2;



-- foreign key - ���� �ɼ� 
create table shop_member5(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);

create table shop_cart5(
    cart_no         number,
    product_name    varchar2(100),
    --member_no       number     not null references shop_member5 on delete set null, 
    --not null�� ���� ������ �ɼ�, ���ﶧ null�� �����ϴµ� ���� 
    member_no       number      references shop_member5 on delete set null, 
    buy_date        date
);
insert into shop_member5 values(1,'user01','1111','����1','010-1111-1111');
insert into shop_member5 values(2,'user02','2222','����2','010-2222-2222');
insert into shop_member5 values(3,'user03','3333','����3','010-3333-3333');
select * from shop_member5;
select * from shop_cart5;
delete from shop_member5 where member_no=1;
insert into shop_cart5 values(1,'������',1,sysdate);
insert into shop_cart5 values(2,'������',3,sysdate);



--on delete cascade(����)
--�� �θ� �����Ͱ� �������� �ʵ� ���� ����
create table shop_member6(
    member_no      number           primary key,
    member_id      varchar2(20)     unique not null,
    member_pw      varchar2(30),
    member_name    varchar2(21),
    member_phone   char(13)
);



create table shop_cart6(
    cart_no         number,
    product_name    varchar2(100),
    member_no       number      references shop_member6 on delete cascade, 
    buy_date        date
);

insert into shop_member6 values(1,'user01','1111','����1','010-1111-1111');
insert into shop_member6 values(2,'user02','2222','����2','010-2222-2222');
insert into shop_member6 values(3,'user03','3333','����3','010-3333-3333');
insert into shop_cart6 values(1,'������',1,sysdate);
insert into shop_cart6 values(2,'������',3,sysdate);

select * from shop_member6;
delete from shop_member6 where member_no=1;
select * from shop_cart6; --�����ϴ� �����͵� ���� ��������. �����Ͱ� �������⿡ ����~
--�ɼ� �߸� ��������� �����Ͱ� �� ���ư��⿡ �� �����. db�ڵ尡 �ٲ�� �ڹ��ڵ� ������ ���� �ޱ⿡ ó���� �� ��ƾ���. 



--�������� - CHECK
--�ٸ����̺���� ����� ����.
create table user_tbl(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20),       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����
    phone       char(11)            --��ȭ��ȣ
);

select * from user_tbl;
select * from user_tbl where gender = '����' or gender = '��';
select * from user_tbl where gender in ('����','M');
delete from user_tbl where user_no is null;
insert into user_tbl values(2,'user02','2222','����2','����','01022222222');
insert into user_tbl values(3,'user03','3333','����3','����','01033333333');
insert into user_tbl values(4,'user04','4444','����4','����','01044444444');
insert into user_tbl values(5,'user05','5555','����5','��','01055555555');
insert into user_tbl values(6,'user06','6666','����6','M','01066666666');


create table user_tbl_check(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20),       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6) check(gender in ('����','����')),  --����   --�����ϴ� ���׿��� �̷��� �ִ´�. 
    phone       char(11)            --��ȭ��ȣ
);

insert into user_tbl_check values(2,'user02','2222','����2','����','01022222222');
insert into user_tbl_check values(4,'user04','4444','����4','����','01044444444');
insert into user_tbl_check values(5,'user05','5555','����5','��','01055555555');
insert into user_tbl_check values(6,'user06','6666','����6','M','01066666666');



--���� �������� ������ �ڵ����� ���� ��(insert�ÿ��� ����)
create table user_tbl_default(
    user_no     number,             --ȸ����ȣ
    user_id     varchar2(20),       --ȸ�����̵�
    user_pw     varchar2(30),       --ȸ����й�ȣ
    user_name   varchar2(30),       --ȸ���̸�
    gender      char(6),            --����   
    phone       char(11) default '01000000000'            --��ȭ��ȣ
);

insert into user_tbl_default values(1,'user01','1234','����1','����','01011111111');
insert into user_tbl_default (user_no,user_id,user_pw,user_name,gender,phone)
values (1,'user02','2222','����2','����','01022222222');
select * from user_tbl_default;

insert into user_tbl_default (user_no,user_id,user_pw,user_name,gender)
values (3,'user03','3333','����3','����');

--6���� ������ �� ��� �������� �ν� ����
insert into user_tbl_default values(4,'user04','4444','����4','����');
insert into user_tbl_default values(4,'user04','4444','����4','����', default);

-- ���������� ���� ���� ���� �������� ���� �ִ�. 
update user_tbl_default set phone = default where user_no=1;
select * from user_tbl_default where phone = default; -- ������������ ����� �Ұ��� 


create table runningman(
    no          number  primary key,
    id          varchar2(20) unique,
    pass        varchar2(20) not null,
    name        varchar2(20) not null,
    nickname    varchar2(20) unique,
    gender      char(1),
    tel         varchar2(20) default '010-0000-0000',
    address     varchar2(90)
);
rollback;
select * from runningman;
insert into runningman values(1,'muhan','1234','���缮','��������','M','010-4958-2333','�б���');
insert into runningman values(2,'bignese','4444','������','������','M',default,'����');
insert into runningman values(3,'tiger','6658','������','�Ȳ�','M','010-6674-8986','�Ⱦ�');
insert into runningman values(4,'haha','5356','����','�źм�Ź','M','010-8997-1122','��������');
insert into runningman values(5,'ace','5555','����ȿ','õ����','F',default,'�����');
insert into runningman values(6,'girrafe','9999','�̱��� ','�߱�ģ��','M','010-4958-2333','�б���');
insert into runningman values(7,'ssapssap','5356','�缼��','��������','M','010-1215-7777','����õ');
insert into runningman values(8,'doli','5555','���ҹ�','���θ�','F',default,'�ϻ�');
update runningman set pass = '9999' where nickname = '�߱�ģ��';
update runningman set tel = '����' where tel = '010-0000-0000';
delete from runningman where name = '���缮';
delete from runningman;
--���� �ȴ޸� ��ü����
delete from runningman where no in(2,3,4,5,6,7,8);

commit;


