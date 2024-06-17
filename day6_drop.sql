create table user_tbl(
    user_id     varchar2(20)     primary key,
    user_pw     varchar2(30)     not null,
    user_name   varchar2(30)     not null,
    user_phone  char(13)         unique
);

create table cart_tbl(
    cart_no         number          primary key,
    product_name    varchar2(100)   not null,
    buyer           varchar2(20)    references user_tbl
);

insert into user_tbl values('user01','1111','����1','010-1111-1111');
insert into user_tbl values('user02','2222','����2','010-2222-2222');
insert into user_tbl values('user03','3333','����3','010-3333-3333');
select * from user_tbl;
insert into cart_tbl values(1,'������','user01');
insert into cart_tbl values(2,'������','user03');
select * from cart_tbl;

commit;

drop table cart_tbl;
--user_tbl�� �����Ϸ��� �Ҷ�, user_tbl�� �����ϰ� �ִ� �ٸ� ���̺��� ������ ���� �Ұ�����
-- -> �����ϰ��ִ� ���̺��� ���������� �̻������� ������ 
-- -> cascade constraint �ɼ��� ����ϸ� user_tbl�� �����ϰ� �ִ� �ٸ� ���̺���� �ܷ�Ű�� ��� �����ϰ� ����
drop table user_tbl cascade constraint; 
--�����ϰ� ������� ���� �Ұ��� // �ܷ�Ű�� ������� user_tlb�� ����
--cascade constraint >> ����� �������� ������ ������. -- ������ �����ϴ� (�ܷ�Ű �̾��ִ� �۾��� ���� �ؾ���) 
drop table user_tbl; 

select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'CART_TBL'; 

alter table cart_tbl
drop constraint SYS_C007130;