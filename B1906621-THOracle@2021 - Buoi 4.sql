--Le Phuc Anh
--B1906621

--Cau 1
select * 
from SANPHAM
where DVT = 'Chai';

--Cau 2
select *
from SANPHAM
where tenSP like 'Sua%';

--Cau 3
select count(ngayban)
from Phieuxuat
where ngayban ='26-JUN-2013';

--Cau 4
select *
from Phieuxuat p,Nhanvien n
where p.maNV = n.maNV and n.tenNV = 'Lam Dai Ngoc';

--Cau 5
select count(soPX)
from Phieuxuat p, Nhanvien n
where p.maNV = n.maNV and n.tenNV = 'Lam Dai Ngoc';

--Cau 6
select count(ngayban)
from Phieuxuat
where ngayban between '15-JUN-2013' and '26-JUN-2013';

--Cau 7
select p.soPX, ngayban, tenSP
from ctphieuxuat c,sanpham s, phieuxuat p
where c.maSP = s.maSP and c.sopx = p.soPX
and s.tenSP like 'Nuoc mam%'
and p.ngayban between '15-JUN-2013' and '26-JUn-2013';

--Cau 8
select sum(soluong)*sum(giaban)
from CTphieuxuat c
where soPX = 'PX001';

--Cau 9
select soluong
from CTPhieuxuat
where soluong >=50;

--Cau 10
select tenNV, SDT, tenSP, soluong
from Nhanvien n, CTPhieuxuat c, Sanpham s, Phieuxuat p
where n.maNV = p.maNV and s.maSP = c.maSP and p.soPX = c.soPX
and ngayban between '15-jun-2013' and '26-jun-2013'
and tenSP like 'Nestcafe %' and soluong >5
