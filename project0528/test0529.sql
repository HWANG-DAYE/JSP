select * from member;
insert into member(id, pwd, name, email) values('asdf', '1234', '홍길동', 'asdf@naver.com');
update member set pwd='12345', name='김길동', email='asdf@daum.net' where id='asdf';
delete from member where id = 'asdf';