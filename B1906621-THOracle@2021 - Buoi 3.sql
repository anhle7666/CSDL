--Le Phuc Anh
--B1906621


create table Sanpham (
    maSP varchar2(5) Primary Key,
    tenSP nvarchar2(30) not null,
    DVT varchar(5) not null
);

insert into Sanpham values ('SP01', 'Bot chien min 100g', 'Goi');
insert into Sanpham values ('SP02', 'Bot chien xu 100g', 'Goi');
insert into Sanpham values ('SP03', 'Dau Cai lan 1L', 'Chai');
insert into Sanpham values ('SP04', 'Hat nem 3 ngot 900g', 'Goi');
insert into Sanpham values ('SP05', 'Hat nem AjiNgon 200g', 'Goi');
insert into Sanpham values ('SP06', 'Hat nem Knorr 200g', 'Goi');
insert into Sanpham values ('SP07', 'My chinh Ajinomoto 150g', 'Goi');
insert into Sanpham values ('SP08', 'My chinh Ajinomoto 2kg', 'Goi');
insert into Sanpham values ('SP09', 'My chinh Ajinomoto 400g', 'Goi');
insert into Sanpham values ('SP10', 'Nestcafe hop', 'Hop');
insert into Sanpham values ('SP11', 'Nuoc mam De Nhi', 'Chai');
insert into Sanpham values ('SP12', 'Nuoc mam Nam Ngu 500ML', 'Chai');
insert into Sanpham values ('SP13', 'Sua Bavi 110ml', 'Hop');
insert into Sanpham values ('SP14', 'Sua Bavi 180ml', 'Hop');
insert into Sanpham values ('SP15', 'Sua co gai Ha Lan Socola', 'Hop');
insert into Sanpham values ('SP16', 'Sua Izzi 110ml', 'Hop');
insert into Sanpham values ('SP17', 'Sua Izzi 180ml', 'Hop');
insert into Sanpham values ('SP18', 'Sua Moc Chau 110ml', 'Hop');
insert into Sanpham values ('SP19', 'Sua Moc Chau 180ml', 'Hop');
insert into Sanpham values ('SP20', 'Sua TH Truemilk 110ml', 'Hop');

select *from Sanpham;

create table Nhanvien (
    maNV char(5) Primary KEY,
    tenNV varchar(50) not null,
    SDT varchar(11) not null,
    email varchar(30) null
);

insert into Nhanvien values ('NV01', 'Phan Thanh Duy', '0913244123', 'phanthanhduy@gmail.com');
insert into Nhanvien values ('NV02', 'Lam Dai Ngoc', '0913455988', 'lamdaingoc@gmail.com');
insert into Nhanvien values ('NV03', 'Tran Chau Khoa', '0908111222', 'tranchaukhoa@gmail.com');
insert into Nhanvien values ('NV04', 'Le Chi Kien', '0123456123', 'lechikien@gmail.com');
insert into Nhanvien values ('NV05', 'Phan Thanh Tam', '0978992633', 'phanthanhtam@gmail.com');
insert into Nhanvien values ('NV06', 'Mai Thi Luu', '0971224551', 'maithiluu@gmail.com');
insert into Nhanvien values ('NV07', 'Dao Thi Hong', '0839970944', 'daothihong@gmail.com');
insert into Nhanvien values ('NV08', 'Phan Thanh Nhan', '0839970944', 'phanthanhnhan@gmail.com');
insert into Nhanvien values ('NV09', 'Phan Nguyen Anh Duong', '0839770941', 'phannguyenanhduong@gmail.com');
insert into Nhanvien values ('NV10', 'Phan Nguyen Anh Nguyet', '0918183404', 'phannguyenanhnguyet@gmail.com');

select * from Nhanvien;

create table Khachhang (
    maKH char(5) primary Key,
    tenKH varchar(40) not null,
    SDT varchar(11) not null,
    Email varchar(30) null
);

insert into Khachhang values ('KH01', 'Phan Thanh Duy', '0913244123', 'phanthanhduy@gmail.com');
insert into Khachhang values ('KH02', 'Lam Dai Ngoc', '0913455988', 'lamdaingoc@gmail.com');
insert into Khachhang values ('KH03', 'Tran Chau Khoa', '0908111222', 'tranchaukhoa@gmail.com');
insert into Khachhang values ('KH04', 'Le Chi Kien', '0123456123', 'lechikien@gmail.com');
insert into Khachhang values ('KH05', 'Phan Thanh Tam', '0978992633', 'phanthanhtam@gmail.com');
insert into Khachhang values ('KH06', 'Mai Thi Luu', '0971224551', 'maithiluu@gmail.com');
insert into Khachhang values ('KH07', 'Dao Thi Hong', '0839970944', 'daothihong@gmail.com');
insert into Khachhang values ('KH08', 'Phan Thanh Nhan', '0839970944', 'phanthanhnhan@gmail.com');
insert into Khachhang values ('KH09', 'Phan Nguyen Anh Duong', '0839770941', 'phannguyenanhduong@gmail.com');
insert into Khachhang values ('KH10', 'Phan Nguyen Anh Nguyet', '0918183404', 'phannguyenanhnguyet@gmail.com');

select * from Khachhang;
create table Phieuxuat (
    soPX varchar(5) primary Key,
    maNV char(5) constraint fk_maNV REFERENCES Nhanvien(maNV),
    maKH char(5) constraint fk_maKH REFERENCES Khachhang(maKH),
    Ngayban date not null
);

insert into Phieuxuat values ('PX001','NV02','KH01',TO_DATE('03/05/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX002','NV03','KH02',TO_DATE('12/05/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX003','NV01','KH03',TO_DATE('10/05/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX004','NV05','KH08',TO_DATE('15/05/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX005','NV06','KH07',TO_DATE('01/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX006','NV02','KH05',TO_DATE('15/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX007','NV07','KH10',TO_DATE('22/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX008','NV10','KH04',TO_DATE('23/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX009','NV09','KH09',TO_DATE('25/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX010','NV02','KH10',TO_DATE('26/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX011','NV08','KH07',TO_DATE('26/06/2013','dd/mm/yyyy'));
insert into Phieuxuat values ('PX012','NV04','KH04',TO_DATE('26/06/2013','dd/mm/yyyy'));

select *from Phieuxuat;

create table CTPhieuXuat(
    soPX varchar(5) Constraint fk_SoPX2 references Phieuxuat(soPX),
    maSP varchar2(5) Constraint fk_MaSP2 references Sanpham(maSP),
    SoLuong int CHeck (SoLuong >0),
    GiaBan int check (GiaBan >0)
);

insert into CTPhieuXuat values ('PX001','SP01',12,160000);
insert into CTPhieuXuat values ('PX001','SP02',150,15000);
insert into CTPhieuXuat values ('PX002','SP03',2,50000);
insert into CTPhieuXuat values ('PX002','SP07',20,18000);
insert into CTPhieuXuat values ('PX003','SP06',2,250000);
insert into CTPhieuXuat values ('PX003','SP10',20,3600);
insert into CTPhieuXuat values ('PX004','SP07',25,18000);
insert into CTPhieuXuat values ('PX004','SP15',5,100000);
insert into CTPhieuXuat values ('PX005','SP06',10,250000);
insert into CTPhieuXuat values ('PX005','SP20',16,15000);
insert into CTPhieuXuat values ('PX006','SP01',23,160000);
insert into CTPhieuXuat values ('PX006','SP10',10,3600);
insert into CTPhieuXuat values ('PX007','SP04',56,26000);
insert into CTPhieuXuat values ('PX007','SP13',12,75000);
insert into CTPhieuXuat values ('PX007','SP15',3,100000);
insert into CTPhieuXuat values ('PX008','SP02',80,15000);
insert into CTPhieuXuat values ('PX008','SP09',5,5000000);
insert into CTPhieuXuat values ('PX009','SP04',5,26000);
insert into CTPhieuXuat values ('PX009','SP17',80,22000);
insert into CTPhieuXuat values ('PX010','SP16',500,5000);
insert into CTPhieuXuat values ('PX011','SP18',7,98000);
insert into CTPhieuXuat values ('PX012','SP19',2,7800000);

select *from CTPhieuxuat;