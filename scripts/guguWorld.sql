-- ����� 
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
   values('�̽���','cjstmd120@gmail.com','1111',900101,'01012345678'); -- ����
insert into guguUser(name,email,password,birth,gender,phone_number) 
   values('���ܿ�','winter12@gmail.com','1111',991225, 'F', '01012345678');
select * from guguUser;
-- -----------------------------------------------------------------------------
-- Ȩ 
create table guguHome(
   u_idx int ,
   title varchar(30),   -- �빮 ����   
   todayCount int default 0, -- ���� �湮��   
   totalCount int default 0,   -- �� �湮��
   primary key(u_idx),
   foreign key(u_idx) references guguUser(idx)
); -- �ڱ�Ұ�introduce varchar(60), -- �ڱ�Ұ�

insert into guguHome(title,introduce) 
   values('�ݰ����ϴ�','�ȳ��ϼ��� ���� ��00�Դϴ�. ��̴� ~~'); -- ����
select * from guguHome;

-- -----------------------------------------------------------------------------
-- ����ø
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
-- �Խ���
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
-- ����
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
-- ģ��
create table mate(
   u_idx int, -- ģ�� idx
   v_idx int, -- �� idx
   state char(1) check (state in('H','O','X')), -- ģ�� ��û : O, ģ���� �� : H
   nickName varchar(20),
   foreign key(u_idx) references guguUser(idx)
);

drop table mate;

-- -----------------------------------------------------------------------------
-- �Խ��� ���
create table boardComment(
   board_idx int,   
   name varchar(10) not null,   
   content   varchar(100) not null,   
   wdate timestamp   default current_timestamp,   
   foreign key(board_idx) references guguBoard(idx)
);

-- -----------------------------------------------------------------------------
-- ������ ���
create table galleryComment(
   gallery_idx   int,
   name varchar(10) not null,   
   content   varchar(100) not null,   
   wdate timestamp   default current_timestamp,
   foreign key(gallery_idx) references guguGallery(idx)
);

-- -----------------------------------------------------------------------------
-- ���� ���
create table gbookComment(
   board_idx int,
   name varchar(10) not null,   
   content   varchar(100) not null,   
   wdate timestamp default current_timestamp,   
   foreign key(board_idx) references guestbook(idx)
);