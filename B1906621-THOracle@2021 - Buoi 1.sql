create table Sinhvien (
    Masv char(8),
    Hoten varchar(60)
);

select * from Sinhvien;
Insert into Sinhvien values ('B1906621', 'Le Phuc Anh');
Insert into Sinhvien values ('B1906622', 'Phuc Anh');
alter table Sinhvien add Diachi varchar(60);
update Sinhvien set Diachi = '121 NVC, An Khanh' where Masv = 'B1906621';
update Sinhvien set Diachi = '220 Mau Than' where Masv = 'B1906622';
insert into Sinhvien values ('B1906623','Phuc Anh', 'Ninh Kieu');
delete from Sinhvien where Masv = 'B1906622';


