-- 사용자 
create table guguUser(
   idx int auto_increment,
   name varchar(10) not null,      
   email varchar(30) not null,   
   password varchar(10) not null,   
   birth int not null,
   gender char(1) not null check (gender in('F','M')),
   phone_number varchar(13) not null,
   hobby varchar(30),
   school varchar(20),
   job varchar(20),
   mbti char(4),
   introduce varchar(60),
   filename varchar(50),
   primary key(idx)
);

drop table guguuser;

insert into guguUser(name,email,password,birth,gender,phone_number) 
   values('이승준','cjstmd120@gmail.com','1111',900101,'01012345678'); -- 예시
insert into guguUser(name,email,password,birth,gender,phone_number) 
   values('정겨울','winter12@gmail.com','1111',991225, 'F', '01012345678');
select * from guguUser;
-- -----------------------------------------------------------------------------
-- 홈 
create table guguHome(
   u_idx int ,
   title varchar(30),   -- 대문 제목   
   todayCount int default 0, -- 오늘 방문자   
   totalCount int default 0,   -- 총 방문자
   primary key(u_idx),
   foreign key(u_idx) references guguUser(idx)
); -- 자기소개introduce varchar(60), -- 자기소개

insert into guguHome(title,introduce) 
   values('반갑습니다','안녕하세요 저는 이00입니다. 취미는 ~~'); -- 예시
select * from guguHome;

-- -----------------------------------------------------------------------------
-- 사진첩
create table guguGallery(         
   idx   int   auto_increment,   
   u_idx int,   
   title varchar(20) not null,   
   filename varchar(50) not null,   
   gdate timestamp default current_timestamp,
   gcontent varchar(100), 
   heart int default 0,
   primary key(idx),
   foreign key(u_idx) references guguUser(idx)
);

select * from guguGallery;

-- -----------------------------------------------------------------------------
-- 게시판
create table guguBoard(
   idx   int auto_increment,   
   u_idx int,   
   subject   varchar(40)   not null,   
   content   varchar(1000),      
   heart int default 0,   
   wdate datetime default current_timestamp,   
   commentCount smallint default 0,
   primary key(idx),
   foreign key(u_idx) references guguUser(idx)
);

-- -----------------------------------------------------------------------------
-- 방명록
create table guestBook(
   idx int auto_increment,
   u_idx int,
   v_idx int,   
   content   varchar(200),      
   name varchar(10) not null,   
   wdate datetime default current_timestamp,
   primary key(idx),
   foreign key(u_idx) references guguUser(idx)
);

-- -----------------------------------------------------------------------------
-- 친구
create table mate(
   u_idx int, -- 친구 idx
   v_idx int, -- 내 idx
   state char(1) check (state in('H','O','X')), -- 친구 신청 : O, 친구일 때 : H
   nickName varchar(20),
   foreign key(u_idx) references guguUser(idx)
);

drop table mate;

-- -----------------------------------------------------------------------------
-- 게시판 댓글
create table boardComment(
   board_idx int,   
   name varchar(10) not null,   
   content   varchar(100) not null,   
   wdate timestamp   default current_timestamp,   
   foreign key(board_idx) references guguBoard(idx)
);

-- -----------------------------------------------------------------------------
-- 갤러리 댓글
create table galleryComment(
   gallery_idx   int,
   name varchar(10) not null,   
   content   varchar(100) not null,   
   wdate timestamp   default current_timestamp,
   foreign key(gallery_idx) references guguGallery(idx)
);

-- -----------------------------------------------------------------------------
-- 방명록 댓글
create table gbookComment(
   board_idx int,
   name varchar(10) not null,   
   content   varchar(100) not null,   
   wdate timestamp default current_timestamp,   
   foreign key(board_idx) references guestbook(idx)
);