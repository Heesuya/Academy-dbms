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

insert into user_tbl values('user01','1111','유저1','010-1111-1111');
insert into user_tbl values('user02','2222','유저2','010-2222-2222');
insert into user_tbl values('user03','3333','유저3','010-3333-3333');
select * from user_tbl;
insert into cart_tbl values(1,'아이폰','user01');
insert into cart_tbl values(2,'갤럭시','user03');
select * from cart_tbl;

commit;

drop table cart_tbl;
--user_tbl을 삭제하려고 할때, user_tbl을 참조하고 있는 다른 테이블이 있으면 삭제 불가능함
-- -> 참조하고있는 테이블의 제약조건이 이상해지기 때문에 
-- -> cascade constraint 옵션을 사용하면 user_tbl을 참조하고 있는 다른 테이블들의 외래키를 모두 제거하고 삭제
drop table user_tbl cascade constraint; 
--참조하고 있을경우 삭제 불가능 // 외래키를 지우고나서 user_tlb을 삭제
--cascade constraint >> 연결된 제약조건 날리고 지워라. -- 굉장히 위험하다 (외래키 이어주는 작업을 따로 해야함) 
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