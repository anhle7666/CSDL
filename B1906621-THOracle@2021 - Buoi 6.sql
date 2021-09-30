--L� Ph�c Anh
--B1906621
--B�i th?c h�nh 6

--C�u 8
select idmay, count(idphanmem)
from Caidat
group by idmay;

--C�u 9
select maPhong, count(idmay)
from May
group by maPhong;

--C�u 10
select idMay, idPhanmem, count(*)
from Caidat
group by idMay, idPhanmem;

--C�u 11:
select avg(gia)
from phanmem
where idLoai='UNIX';
--C�u 12:
select *
from Phanmem
where ngayMua =(select max(ngayMua) from Phanmem);

--C�u 13
select idmay,count(idmay), count(idPhanmem)
from Caidat
group by idmay
having (count(idPhanmem)) >=2;

--C�u 14

--C�u 15
select idLoai
from loai
where idLoai not in (select idLoai from May);

--C�u 16
select idLoai
from Loai
where idLoai in (select idLoai from Phanmem);

--C�u 17
select idLoai
from loai
where idLoai not in (select idLoai from phanmem);

--C�u 18
select idmay, ip || '.' || ad as FULL_IP
from may
where idmay in (select idmay from caidat where idPhanmem ='log6');

--C�u 19
select idmay, ip || '.' || ad as FULL_IP
from may
where idmay in 
    (select idmay from caidat where idPhanmem in
        (select idPhanmem from phanmem where tenPhanMem like '%Oracle 8%'));
        
--C�u 20
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

--C�u 22:
select tenPhanMem
from phanmem
where tenphanmem in (select tenPhanmem from phanmem 
    where ngaymua = (select max(ngaymua) from phanmem));

