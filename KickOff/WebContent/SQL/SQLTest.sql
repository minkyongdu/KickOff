  drop table member
  create sequence memberNum_seq start with 1 increment by 1;
  create sequence companyNum_seq start with 1 increment by 1;
  select * from replynotice
  insert into member values (memberNum_seq.nextval, 'minkyongdu', '1234', '민경두', 
  '19930101', '113-234', '서울시 강동구','010-0000-0000', 'Hongju@naver.com', 6, SYSDATE, '당신이 사는곳은?', '우리집');
  insert into company values (companyNum_seq.nextval, #{comid}, #{compassword}, #{comCEO},	#{comname}, 
		#{comemail}, #{addr1}, #{addr2}, #{combusinnum},#{comphonenum}, 6)
		
  insert into company values (companyNum_seq.nextval, 'ruden55', '4995791', '���罻', '���ȸ��', 'ruden55@naver.com',
  '132-343', '����� ������', '134-34-32142', '010-3211-3232', 6);
  select * from member

create table member 
( memberNum number primary key,
  id varchar2(20) not null, password varchar2(30) not null, name varchar2(50) not null, 
  birthday varchar2(30) not null, addr1 varchar2(30) not null, addr2 varchar2(500) not null, phonenum varchar2(15) not null, 
  email varchar2(30) not null,  memGrade number not null, 
  joindate date, pwdQ varchar2(100) not null, pwdA varchar2(30) not null);

  drop table company
create table company
( companyNum number primary key,
  id varchar2(20) not null, password varchar2(30) not null, comceo varchar2(20) not null, comname varchar2(50) not null, comemail varchar2(30) not null,
  addr1 varchar2(30) not null, addr2 varchar2(500) not null, combusinnum varchar2(12) not null, comphonenum varchar2(15) not null,
   comGrade number not null);
drop table article 

create table article 
(ArticleNum number primary key, Aname varchar2(50) not null, 
  groupNum number not null,
  price number not null, companyNum number not null, articleDate date);
  
create table articlegroup
(groupNum number primary key,
	Mgroup varchar2(30) not null, Sgroup varchar2(30));  
  
 create table articleFile
(ArticleNum number not null, imgFile1 varchar2(100), imgFile2 varchar2(100), imgFile3 varchar2(100),
imgFile4 varchar2(100), imgFile5 varchar2(100))

select size, amount from articleSizeAmount where ArticleNum = 1;
drop table articleSizeAmount
create table articleSizeAmount 
(ArticleNum number not null, Asize varchar2(20) not null, amount number not null);
 
 create sequence articleNum_seq start with 1 increment by 1; -- ��ǰ
 create sequence articleFileNum_seq start with 1 increment by 1; -- ����
 create sequence articleSizeAmount_seq start with 1 increment by 1; -- ���� ������
 
drop sequence articleNum_seq;
drop sequence articleFileNum_seq;
drop sequence articleSizeEng_seq;
drop sequence articleSizeNum_seq;
create table buy
(buyNum number primary key,
  memberNum number not null, subname varchar2(15) not null, subaddr1 varchar2(7) not null, subaddr2 varchar2(200) not null, 
  subphonenum varchar2(15) not null, price number not null, Aname varchar2(50) not null,
  buyamount number not null, Asize varchar2(5) not null, ArticleNum number not null,
  buydate date, buyStatus varchar2(100) not null, sendContent varchar2(100),
  sendNum number, sendpackage number);

create sequence buyNum_seq start with 1 increment by 1;


create table sendpackage
( buyNum number primary key, sendname varchar2(30) not null, 
sendpay varchar2(5) not null, sendstatus varchar2(30) not null );


insert into grade values(1, '일반회원');
insert into grade values(5, '기업회원');
insert into grade values(6, '관리자');
create table grade
( gradeNum number primary key, gradeName varchar2(30) not null);

drop table grade
create table basket
( groupNum number primary key, 
  ArticleNum number not null, basketdate date not null, basketstatus varchar2(30));
 
-- ���������� 1
create table notice( 
   noticeno number primary key,
   title varchar2(300) not null,
   contents varchar2(1000) not null,
   fileName varchar2(100),
   fileName2 varchar2(100),
   fileName3 varchar2(100),
   writer varchar2(20) not null,
   hit    number,
   noticeDate Date not null,
   boardNum number not null
)
create sequence noticeno_seq start with 1 increment by 1; -- �۹�ȣ
drop table eventboard
-- �̺�Ʈ �Խ����� 2
create table eventboard(
   eventno number primary key,
   title varchar2(300) not null,
   contents varchar2(1000) not null,
   fileName varchar2(100),
   fileName2 varchar2(100),
   fileName3 varchar2(100),
   writer varchar2(20) not null,
   hit    number,
   eventDate Date not null,
   boardNum number not null
)
create sequence eventboard_seq start with 1 increment by 1;
-- Q&A�� 3
create table QnAboard(
   QnAno number primary key,
   title varchar2(50) not null,
   contents varchar2(1000) not null,
   fileName varchar2(50),
   fileName2 varchar2(50),
   fileName3 varchar2(50),
   writer varchar2(20) not null,
   hit    number,
   QnADate Date not null,
   boardNum number not null
) 
create sequence QnAboard_seq start with 1 increment by 1;
drop table QnAboard
drop table replyNotice
create table replyNotice
( replyNum number primary key, --��۹�ȣ
  replyid varchar2(20) not null,  --�����id
  replycontent varchar2(100) not null,  --����
  writeNum number not null, --�۹�ȣ 
  boardNum number not null );  --�Խ��ǹ�ȣ
create table replyQnA
( replyNum number primary key, --��۹�ȣ
  replyid varchar2(20) not null,  --�����id
  replycontent varchar2(100) not null,  --����
  writeNum number not null, --�۹�ȣ 
  boardNum number not null );  
  drop sequence replyNum_seq
create sequence replyNum_seq start with 1 increment by 1;
create sequence replyQnANum_seq start with 1 increment by 1;

create sequence buyepliNum_seq start with 1 increment by 1;
create table epilogue
( buyepliNum number primary key, 
  id varchar2(20) not null, content varchar2(100) not null, ArticleNum number not null,
  star number not null);

 drop table epilogue
  
insert into articlegroup values (1,'축구화','퓨마');
insert into articlegroup values (2,'축구화','나이키');
insert into articlegroup values (3,'축구화','아디다스');
insert into articlegroup values (4,'축구화','미즈노');
insert into articlegroup values (5,'축구화','뉴발란스');
insert into articlegroup values (6,'축구공','나이키');
insert into articlegroup values (7,'축구공','아디다스');
insert into articlegroup values (8,'축구공','스타');
insert into articlegroup values (9,'축구의류','');
insert into articlegroup values (10,'유니폼','레알마드리드');
insert into articlegroup values (11,'유니폼','바르셀로나');
insert into articlegroup values (12,'유니폼','맨체스터 유나이티드');
insert into articlegroup values (13,'유니폼','아스날');
insert into articlegroup values (14,'유니폼','바이에른 뮌헨');
insert into articlegroup values (15,'가방','퓨마');
insert into articlegroup values (16,'가방','아디다스');
insert into articlegroup values (17,'가방','나이키');
insert into articlegroup values (18,'가방','스타');
insert into articlegroup values (19,'보호용품','양말');
insert into articlegroup values (20,'보호용품','골기퍼장갑');
insert into articlegroup values (21,'보호용품','보호대');
insert into articlegroup values (22,'진행용품','호각');
insert into articlegroup values (23,'진행용품','주장완장');
insert into articlegroup values (24,'진행용품','경고카드');
insert into articlegroup values (25,'진행용품','라인기');
insert into articlegroup values (26,'진행용품','작전판');
insert into articlegroup values (27,'기타','콘');
insert into articlegroup values (28,'기타','사다리');
insert into articlegroup values (29,'기타','허들');
  
alter table "JAVAUSER"."BUY" add constraint buy_memNum foreign key("MEMBERNUM") references "MEMBER"("MEMBERNUM") ON DELETE CASCADE
alter table "JAVAUSER"."MEMBER" add constraint mem_grade foreign key("MEMGRADE") references "GRADE"("GRADENUM") ON DELETE CASCADE
alter table "JAVAUSER"."COMPANY" add constraint com_grade foreign key("COMGRADE") references "GRADE"("GRADENUM") ON DELETE CASCADE
alter table "JAVAUSER"."BASKET" add constraint basket_article foreign key("ARTICLENUM") references "ARTICLE"("ARTICLENUM") ON DELETE CASCADE
alter table "JAVAUSER"."ARTICLE" add constraint article_com foreign key("COMPANYNUM") references "COMPANY"("COMPANYNUM") ON DELETE CASCADE
alter table "JAVAUSER"."ARTICLE" add constraint article_company foreign key("COMPANYNUM") references "EPILOGUE"("BUYEPLINUM") ON DELETE CASCADE
alter table "JAVAUSER"."BUY" add constraint buy_article foreign key("ARTICLENUM") references "ARTICLE"("ARTICLENUM") ON DELETE CASCADE
alter table "JAVAUSER"."BUY" add constraint buy_sendpack foreign key("BUYNUM") references "SENDPACKAGE"("BUYNUM") ON DELETE CASCADE
alter table "JAVAUSER"."REPLYNOTICE" add constraint reply_notice foreign key("WRITENUM") references "NOTICE"("NOTICENO") ON DELETE CASCADE
alter table "JAVAUSER"."REPLYQNA" add constraint replyQnA_QnA foreign key("WRITENUM") references "QNABOARD"("QNANO") ON DELETE CASCADE
alter table "JAVAUSER"."ARTICLE" add constraint article_group foreign key("GROUPNUM") references "ARTICLEGROUP"("GROUPNUM") ON DELETE CASCADE
alter table "JAVAUSER"."ARTICLEFILE" add constraint file_article foreign key("ARTICLENUM") references "ARTICLE"("ARTICLENUM") ON DELETE CASCADE

select * from qnaboard
drop table member 
drop table company
drop table article cascade constraints;
drop table articleFile cascade constraints;
drop table articleSizeEng
drop table articleSizeNum
drop table buy
drop table sendpackage
drop table grade
drop table basket
drop table notice cascade constraints;
drop table replyNotice cascade constraints;
drop table QnAboard cascade constraints;
drop table epilogue

select a.articlenum, a.aname, a.price, b.imgfile1
	from (select articlenum, aname, price from article order by articledate desc) a,
	(select articlenum, imgfile1 from articlefile) b
	where a.articlenum = b.articlenum and rownum < 4
	
select * from (select replynum,replyid,replycontent,writenum, boardnum, rownum r from 
(select * from replyNotice where boardNum = 1 and writeNum=21 order by replynum desc ) ) 
where r between 1 and 100000000
