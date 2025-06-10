insert into member(id, pwd, name, email, birth, sns) values('asdf', '1234', '홍길동', 'asdf@naver.com', '2015-12-12', 'insta');
insert into member(id, pwd, name, email, birth, sns) values('qwer', '1234', '홍길동', 'asdf@naver.com', '2015-12-12', 'insta');
select id, pwd, name, email, birth, sns, reg_date from member;
update member set pwd = '1111', name='김길동', email= 'qwer@naver.com', birth='2015-12-12', sns='kakao' where id='qwer';
delete from member where id = 'qwer';
select id, pwd, name, email, birth, sns, reg_date from member where id = 'asdf';

insert into member(id, pwd, name, email, birth, sns) 
values(?,?,?,?,?,?);