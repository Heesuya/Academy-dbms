select * from member_tbl;

--���� ȸ�� ���̺�(ȸ���� �����ϸ� ����ȸ���� ���� ������ �����ϴ� ���̺�)
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
--���� Member / MemberController / MemberService / MemberDao
--������ ���̽� �� ���� �þ�鼭 �ϳ��� �߰��ؼ� ���� 
--MemberService : ������ ���� ��� , ������ �������� �ľ��� ��츦 ����ؼ� ���α׷����� �غ���. 
--6. ȸ��Ż�� 
--delete from member_tbl where member_id  -> transaction  ������ �������. 
--insert into del_member_tbl values
--serice���� ������ �ް� dao�� ������ ������ memeber delete �� del insert �ͷ� �Ǹ� commit or rollback. 