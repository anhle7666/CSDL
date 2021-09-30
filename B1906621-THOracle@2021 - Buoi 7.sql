--Le Phuc Anh
--B1906621  --Thuc hanh buoi 7

--cau1
select NT, tua
from Tacpham
where tacgia = 'Guy de Maupassant';

--cau2
select Ho, Ten, Tel
from Docgia
where dchi = '32 rue des Alouettes, 75003 Paris';

--Cau3
select NXB, tua
from Sach s, Tacpham t
where s.NT = t.NT and tua like '%Fleur%';

--Cau4
select tua
from Tacpham
where tua like 'Le%';

--Cau5
select ten
from muon, docgia
where muon.ND = docgia.ND and ngaymuon between '15-SEP-07' and '20-SEP-07';

--Cau6
select count(NT)
from tacpham;

--Cau7
select count(NT), tacgia
from tacpham
group by tacgia

--Cau8: SAI
select tacgia, count(*) 
from tacpham
group by tacgia
having count(*)>=2;

--cau9
select t.tua, count(*) as sosach
from tacpham t, sach s
where t.nt = s.nt
group by t.tua;

--cau10
select t.tua, count(*) as sosach
from tacpham t, sach s
where t.nt = s.nt
group by t.tua
having count(*) = (select max(count(*))
                   from tacpham t, sach s
                   where t.nt=s.nt
                   group by t.tua);
                   
--Cau 11:
select nxb, count(*) as sosach
from sach s
group by nxb
having count(*)=(select max(count(*))
                 from sach
                 group by nxb);

--Cau 12:
select *-- s.nxb, t.tua
from tacpham t, sach s
where t.nt=s.nt and t.tua = 'Germinal';

--Cau 13:
select t.tua, count(*)
from tacpham t left join sach s
on t.nt = s.nt
group by t.tua
having count(*)>=2;

--Cau 14:
select dg.ho ||' '|| dg.ten as Hoten, tp.tua, m.ngaymuon
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      tp.tua='Poésie';

--Cau 15:
select dg.ho ||' '|| dg.ten as Hoten, tp.tua, m.ngaymuon
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      tp.tua='Les Fleurs du mal';
      
--Cau 16:
select d.ten||' '||d.ho as name, 
       extract(year from ngaymuon)as year
from docgia d join muon m
on d.nd=m.nd
group by extract(year from ngaymuon),
         d.ten||' '||d.ho
order by d.ten||' '||d.ho;

--Cau 17:
select dg.ho||' '||dg.ten as chuatra, tp.tua, m.ngaytra
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      m.ngaytra is null;
--Cau 19:
select dg.ho||' '||dg.ten as chuatra, tp.tua, m.ngaytra, m.hantra
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      m.ngaytra<m.hantra;

--Cau 20: 
select tp.tua, count(*) as lanmuon
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd
group by tp.tua      
having count(*)= (select max(count(*))
                 from tacpham tp, docgia dg, sach s, muon m
                 where tp.nt=s.nt and
                       s.ns=m.ns and
                       m.nd=dg.nd
                 group by tp.tua)

--Cau 21:
select tp.tua, count(*) as lanmuon
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd
group by tp.tua      
having count(*)= (select min(count(*))
                 from tacpham tp, docgia dg, sach s, muon m
                 where tp.nt=s.nt and
                       s.ns=m.ns and
                       m.nd=dg.nd
                 group by tp.tua)
                
--Cau 22:
select dg. ten, count(distinct tp.tua) as sotuasach
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd
group by dg.ten
having count(distinct tp.tua)= (select max(count(distinct tp.tua))
                                from tacpham tp, docgia dg, sach s, muon m
                                where tp.nt=s.nt and
                                      s.ns=m.ns and
                                      m.nd=dg.nd
                                group by dg.ten)
                                
--Cau 23:
select dg. ten, count(distinct tp.tua) as sotuasach
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd
group by dg.ten
having count(distinct tp.tua)= (select min(count(distinct tp.tua))
                                from tacpham tp, docgia dg, sach s, muon m
                                where tp.nt=s.nt and
                                      s.ns=m.ns and
                                      m.nd=dg.nd
                                group by dg.ten)
                                
--Cau 24:
select distinct dg.ten, tp.tacgia
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      tp.tacgia='Victor Hugo'
      
--Cau 25: 
select distinct dg.ten, tp.tua, extract(year from m.ngaymuon) as nam
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd
group by (extract(year from m.ngaymuon)),
          dg.ten,
          tp.tua
having (extract(year from m.ngaymuon)=2007)

--Cau 26:
--drop table chuamuon
create table chuamuon(
    nt smallint,
    foreign key (nt) references tacpham(nt));

select * from chuamuon;
insert into chuamuon(nt)
select nt
from (select distinct s.nt
      from sach s left join muon m
      on s.ns = m.ns
      where m.ngaymuon is null
      order by s.nt)

select t.tua as tacphamchuamuon
from chuamuon cm left join tacpham t
on cm.nt=t.nt;

--Cau 28:
select d.ho, d.ten
from docgia d left join muon m
on d.nd=m.nd
where m.ngaymuon is null

--Cau 30:
select t.tua, count(*)
from tacpham t join sach s
on t.nt=s.nt
group by t.tua
having count(*) >=3;

--Cau 31:
select dg.ten, tp.tua, tp.tacgia, m.ngaymuon, s.nxb
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      tp.tua='Madame Bovary';
    
    
--Cau 32: 
select dg.ho, dg.ten, dg.dchi, dg.tel
from tacpham tp, docgia dg, sach s, muon m
where tp.nt=s.nt and
      s.ns=m.ns and
      m.nd=dg.nd and
      s.ns = (select s.ns
              from tacpham tp, docgia dg, sach s, muon m
              where tp.nt=s.nt and
                    s.ns=m.ns and
                    m.nd=dg.nd and
                    dg.ho||' '||dg.ten='Raymond Carole');
