--Le Phuc Anh  B1906621

--Cau 1: Cho biet loai cua may P8
select idmay, idloai
from May
where IDMAY = 'P8';

--Cau 2: Ten cua cac phan mem loai UNIX
select tenphanmem, idloai
from Phanmem
where idloai = 'UNIX';

--Cau 3: Ten phong, IP phong, ma phong cua may loai unix hoac pcws
select tenPhong, p.IP, m.maPhong, idloai
from May m, Phong p
where m.maPhong = p.maPhong and (idloai = 'UNIX' or idLoai = 'PCWS');

--Cau 4:Ten,IP,ma phong cua may loai 'UNIX' va 'PCWS' o khuvuc
--130.120.80, sap xep tang dan

select tenkhuvuc,tenmay, k.ip, idloai, p.maphong, tenphong 
from khuvuc k, phong p, may m
where k.ip = p.ip and p.maphong = m.maphong
and m.ip = '130.120.80' and (idloai = 'UNIX' or idLoai = 'PCWS');


--Cau 5: So cac phan mem duoc cai dat tren may p6
select count(idphanmem) as Soluong
from Caidat
where idmay = 'P6';

--Cau 6: So may da cai dat phan mem 'Log1'
select count(idmay) as So_may
from Caidat 
where idphanmem = 'Log1';

--Cau 7: Ten va IP day du cua may loai TX
select tenmay, ip ||'.'||ad as IP_Day_du 
from May
where idloai = 'TX';

--Cau 8: Gia trung binh cua cac phan mem 'UNIX'
select round(AVG(gia),2) as Trung_binh
from Phanmem
where idloai = 'UNIX';

--Cau 9: ten phong cai Oracle
select tenphong, tenphanmem
from Phong p, Phanmem pm, Caidat c, May m
where p.maphong = m.maphong and c.idPhanmem = pm.idPhanmem
and c.idMay = m.idMay
and tenphanmem like 'Oracle%';

--Cau 10 ten phan mem co san trong phong salle 1
select tenphong, tenphanmem
from Phong p, Phanmem pm, Caidat c, May m
where p.maphong = m.maphong and c.idPhanmem = pm.idPhanmem
and c.idMay = m.idMay
and tenphong = 'Salle 1';


--Cau 11: ten phan mem mua trong nam 1997
select tenphanmem, ngaymua
from phanmem
where ngaymua between to_date('1-JAN-1997') and to_date('31-DEC-1997');


--Cau 12: Phan mem cai dat tren may UNIX gia >2000
select tenPhanmem, tenMay, Gia
from Caidat c, May m, Phanmem p
where c.idmay = m.idmay and p.idphanmem = c.idphanmem
and p.idLoai = 'UNIX' and p.Gia >= 2000;
