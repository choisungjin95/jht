-- guestboard.sql
create table guestboard
(
	num number(5) primary key, -- 글번호
	writer varchar2(10),
	title varchar2(10), 
	content varchar2(50), 
	ref number(5),  -- 그룹번호
	lev number(5),  -- 레벨(답글인지,답글의답글인지..)
	step number(5)  -- 출력순서
);
