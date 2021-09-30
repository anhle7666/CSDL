--Le Phuc Anh
--B1906621

--cau 1.
drop table Khuvuc;
create table Khuvuc(
    IP char(10) CONSTRAINT pk_IP PRIMARY KEY,
    tenKhuvuc varchar(60) not null,
    tang char(10)  null
);
select * from Khuvuc;
drop table Phong;
create table Phong(
    MP char(10) CONSTRAINT ck_MP PRIMARY KEY,
    tenphong varchar(60) not null,
    somay smallint not null,
    IP char(10) CONSTRAINT fk_IP REFERENCES Khuvuc(IP)
);
select * from phong;
drop table Loai;
create table Loai(
    idloai char(5) CONSTRAINT ak_idloai PRIMARY KEY,
    tenloai varchar(60) not null
);
drop table May;
create table May(
    IdMay char(10) CONSTRAINT id_may PRIMARY KEY,
    tenmay char(12) not null,
    IP char(10) CONSTRAINT jk_IP REFERENCES Khuvuc(IP),
    ad NUMBER(4,1) check (ad >=0 and ad <= 255),
    idloai char(5)  REFERENCES Loai(idloai),
    MP char(10) CONSTRAINT fk_MP REFERENCES Phong(MP)
);
select * from May;
drop table Phanmem;
create table Phanmem(
    idPM char(10) CONSTRAINT ik_idPM PRIMARY KEY,
    tenPM char(30) not null,
    ngaymua date,
    version varchar(5),
    idloai char(5)  REFERENCES Loai(idloai),
    gia int check( gia >= 0)
);
select * from phanmem;
drop table Caidat;
create table Caidat(
    id1 smallint CONSTRAINT jk_id PRIMARY KEY,
    tenmay char(12) not null,
    IdMay char(10) CONSTRAINT gk_IdMay REFERENCES May(IdMay),
    idPM char(10) CONSTRAINT dk_idPM REFERENCES Phanmem(idPM),
    ngaicai  default sysdate
);
select * from Caidat;
select sysdate from dual;
--cau 2
Insert into Khuvuc values('130.120.80','Brin RDC',' ');
Insert into Khuvuc values('130.120.81','Brin tang 1 ',' ');
Insert into Khuvuc values('130.120.82','Brin tang 2 ',' ');
Insert into Khuvuc values('130.120.83','Brin tang 3 ',' ');
select * from Khuvuc;
-------------------------------------------------------------
Insert into Phong values ('s01','Salle 1','3','130.120.80');
Insert into Phong values ('s02','Salle 2','2','130.120.80');
Insert into Phong values ('s03','Salle 3','2','130.120.80');
Insert into Phong values ('s11','Salle 11','2','130.120.81');
Insert into Phong values ('s12','Salle 12','1','130.120.81');
Insert into Phong values ('s21','Salle 21','2','130.120.82');
Insert into Phong values ('s22','Salle 22','0','130.120.83');
Insert into Phong values ('s23','Salle 23','0','130.120.83');
select * from Phong;
------------------------------------------------------------
Insert into Loai values ('TX','Teminal X-Window');
Insert into Loai values ('UNIX','System Unix');
Insert into Loai values ('PCNT','Windows NT');
Insert into Loai values ('PCWS','PC Windows');
Insert into Loai values ('NC','Network Computer');
Insert into Loai values ('BeOS','Dreamweaver');
select * from Loai;
--------------------------------------------------------------------
Insert into May values ('p1','Poste 1','130.120.80','01','TX','s01');
Insert into May values ('p2','Poste 2','130.120.80','02','UNIX','s01');
Insert into May values ('p3','Poste 3','130.120.80','03','TX','s01');
Insert into May values ('p4','Poste 4','130.120.80','04','PCWS','s02');
Insert into May values ('p5','Poste 5','130.120.80','05','PCWS','s02');
Insert into May values ('p6','Poste 6','130.120.80','06','UNIX','s03');
Insert into May values ('p7','Poste 7','130.120.80','07','TX','s03');
Insert into May values ('p8','Poste 8','130.120.81','01','UNIX','s11');
Insert into May values ('p9','Poste 9','130.120.81','02','TX','s11');
Insert into May values ('p10','Poste 10','130.120.81','03','UNIX','s12');
Insert into May values ('p11','Poste 11','130.120.82','01','PCNT','s21');
Insert into May values ('p12','Poste 12','130.120.82','02','PCWS','s21');
select * from May;
------------------------------------------------------------------------
insert into Phanmem values('log1','Oracle 6','1995-05-13','6.2','UNIX',3000);
insert into Phanmem values('log2','Oracle 8','1999-09-15','8i','UNIX',5600);
insert into Phanmem values('log3','SQL Server','1998-04-12','7','PCNT',2700);
insert into Phanmem values('log4','Front Page','1997-06-03','5','PCWS',500);
insert into Phanmem values('log5','WinDev','1997-05-12','5','PCWS',750);
insert into Phanmem values('log6','SQL*Net',Null,'2.0','UNIX',500);
insert into Phanmem values('log7','I.I.S.','2002-04-12','2','PCNT',810);
insert into Phanmem values('log8','Dreamweaver','2003-09-21','2.0','BeOS',1400);
select * from Phanmem;
------------------------------------------------------------------------------------
insert into Caidat values('p2', 'log1', '1', 'sysdate');
insert into Caidat values('p2', 'log2', '2', 'sysdate');
insert into Caidat values('p4', 'log5', '3', 'sysdate');
insert into Caidat values('p6', 'log6', '4', 'sysdate');
insert into Caidat values('p6', 'log1', '5', 'sysdate');
insert into Caidat values('p8', 'log2', '6', 'sysdate');
insert into Caidat values('p8', 'log6', '7', 'sysdate');
insert into Caidat values('p11', 'log3', '8', 'sysdate');
insert into Caidat values('p12', 'log4', '9', 'sysdate');
insert into Caidat values('p11', 'log7', '10', 'sysdate');
insert into Caidat values('p7', 'log7', '11', 'sysdate');
----------------------------------------------------------
--cau 3
update Khuvuc set tang = '0' where IP = '130.120.80';
update Khuvuc set tang ='1' where IP = '130.120.81';
update Khuvuc set tang ='2' where IP = '130.120.82';
update Khuvuc set tang ='3' where IP = '130.120.83';
select * from Khuvuc;
----------------------------------------------------------
--cau 4
update Phanmem set gia=gia-gia*0.1 where idLoai='PCNT';
---------------------------------------------------------
--cau 5
alter table May add nbLog smallint;
update May set nbLog = '0' where IdMay ='p1';
update May set nbLog = '2' where IdMay ='p2';
update May set nbLog = '0' where IdMay ='p3';
update May set nbLog = '1' where IdMay ='p4';
update May set nbLog = '0' where IdMay ='p5';
update May set nbLog = '2' where IdMay ='p6';
update May set nbLog = '1' where IdMay ='p7';
update May set nbLog = '2' where IdMay ='p8';
update May set nbLog = '0' where IdMay ='p9';
update May set nbLog = '0' where IdMay ='p10';
update May set nbLog = '2' where IdMay ='p11';
update May set nbLog = '1' where IdMay ='p12';

alter table Phanmem add nbInstall smallint;
update Phanmem set nbInstall = '2' where idPM ='log1';
update Phanmem set nbInstall = '2' where idPM ='log2';
update Phanmem set nbInstall = '1' where idPM ='log3';
update Phanmem set nbInstall = '1' where idPM ='log4';
update Phanmem set nbInstall = '1' where idPM ='log5';
update Phanmem set nbInstall = '2' where idPM ='log6';
update Phanmem set nbInstall = '2' where idPM ='log7';
--------------------------------------------------------
--cau 6->10
drop table PhanmemUNIX;
create table PhanmemUNIX(
    idPM char(10) NOT NULL,
    tenPM char(30) not null,
    ngaymua date,
    version varchar(5)
);
alter table PhanmemUNIX add PRIMARY KEY (idPM);
alter table PhanmemUNIX add gia int check( gia >= 0);
alter table PhanmemUNIX alter column version VARCHAR (15);
select * from phanmemunix;
----------------------------------------------------------
--cau 11
insert into PhanmemUNIX(idPM,tenPM,ngaymua,version,gia)
select idPM, tenPM, ngaymua, version, gia from Phanmem;
select * from PhanmemUNIX;
----------------------------------------------------------
--cau 12
alter table PhanmemUNIX drop column version;
----------------------------------------------------------------------------------
--cau 13-14
delete from  Phanmem where gia > 5000; --IdPM log2 bi xoa khoi rang buoc dk > 5000;
delete from  PhanmemUNIX where gia > 5000; 
select * from Phanmem;
select * from PhanmemUNIX; --IdPM log2 bi xoa khoi rang buoc dk > 5000;
--------------------------------------------------------------------------
--cau 15-16-17
drop table Phanmem; -- Thuc hien binh thuong
drop table PhanmemUNIX; -- Thuc hien binh thuong
alter table May drop column nblog;
select *from May;
alter table Phannmem drop column nbInstall;