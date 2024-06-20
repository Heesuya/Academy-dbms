select * from member_tbl;

--삭제 회원 테이블(회원을 삭제하면 삭제회원에 대한 정보를 저장하는 테이블)
create table del_member_tbl(
    member_id       varchar2(20)        primary key,
    member_name     varchar2(30)        not null,
    member_phone    char(13)            not null,
    out_date        date
);
select * from member_tbl;
select * from del_member_tbl;
delete del_member_tbl where member_id='test1111';
commit;

--6.17 
--기존 Member / MemberController / MemberService / MemberDao
--데이터 베이스 의 양이 늘어나면서 하나더 추가해서 관리 
--MemberService : 데이터 편집 담당 , 쿼리를 여러개를 쳐야할 경우를 대비해서 프로그래밍을 해보자. 
--6. 회원탈퇴 
--delete from member_tbl where member_id  -> transaction  관리가 힘들어짐. 
--insert into del_member_tbl values
--serice에서 정보를 받고 dao에 정보를 보내고 memeber delete 와 del insert 와료 되면 commit or rollback. 