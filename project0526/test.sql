select * from register;
insert into register values('asdf', '1234', '홍길동', 'asdf@naver.com');
delete from register where id = 'asdf';
update register set pwd = ?, name = ?, email = ? where id = ?;