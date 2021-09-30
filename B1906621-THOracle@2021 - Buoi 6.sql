--Lê Phúc Anh
--B1906621
--Bài th?c hành 6

--Câu 8
select idmay, count(idphanmem)
from Caidat
group by idmay;

--Câu 9
select maPhong, count(idmay)
from May
group by maPhong;

--Câu 10
select idMay, idPhanmem, count(*)
from Caidat
group by idMay, idPhanmem;

--Câu 11:
select avg(gia)
from phanmem
where idLoai='UNIX';
--Câu 12:
select *
from Phanmem
where ngayMua =(select max(ngayMua) from Phanmem);

--Câu 13
select idmay,count(idmay), count(idPhanmem)
from Caidat
group by idmay
having (count(idPhanmem)) >=2;

--Câu 14

--Câu 15
select idLoai
from loai
where idLoai not in (select idLoai from May);

--Câu 16
select idLoai
from Loai
where idLoai in (select idLoai from Phanmem);

--Câu 17
select idLoai
from loai
where idLoai not in (select idLoai from phanmem);

--Câu 18
select idmay, ip || '.' || ad as FULL_IP
from may
where idmay in (select idmay from caidat where idPhanmem ='log6');

--Câu 19
select idmay, ip || '.' || ad as FULL_IP
from may
where idmay in 
    (select idmay from caidat where idPhanmem in
        (select idPhanmem from phanmem where tenPhanMem like '%Oracle 8%'));
        
--Câu 20
select tenphong
from Phong
where MaPhong in (select Maphong from may
            where idMay in
                (select idMay from caidat 
                    where idPhanMem in
                        (select idPhanMem from phanmem 
                            where tenPhanMem='Oracle 6')));
select tenphong,m.idMay,c.idPhanMem
from phong p,may m,caidat c,phanmem pm
where p.MaPhong=m.MaPhong and m.idMay=c.idMay and pm.idPhanMem=c.idPhanMem and tenPhanMem='Oracle 6';

--Câu 22:
select tenPhanMem
from phanmem
where tenphanmem in (select tenPhanmem from phanmem 
    where ngaymua = (select max(ngaymua) from phanmem));

