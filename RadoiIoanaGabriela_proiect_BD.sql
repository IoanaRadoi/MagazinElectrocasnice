drop database proiect;
create database proiect;
use proiect;


create table localitate(
id_localitate int(20) not null auto_increment primary key,
den_localitate varchar(100)
);


create table functie(
id_functie int(20) not null auto_increment primary key,
nume_functie varchar(100)
);

create table angajat(
id_angajat int(20) not null auto_increment primary key,
cod int(20),
nume varchar(100),
cnp varchar(13),
localitate varchar(100),
functie int(20),
salariu_de_incadrare double(7,2),
foreign key (localitate) references localitate(id_localitate),
foreign key (functie) references functie(id_functie),
unique(cnp)
);


create table clienti(
id_client int(20) not null auto_increment primary key,
nume varchar(100),
cif_cnp varchar(13),
localitate int(20),
foreign key (localitate) references localitate(id_localitate),
unique(cif_cnp)
);

create table furnizor(
id_furnizor int(20) not null auto_increment primary key,
den_furnizor varchar(100),
cif varchar(9),
unique(cif)
);


create table produs(
id_produs int(20) not null auto_increment primary key,
den_produs varchar(100),
pret_unitar double(7,2),
furnizor int(20),
stoc int(100),
foreign key (furnizor) references furnizor(id_furnizor)
);


create table factura(
id_factura int(20) not null auto_increment primary key,
nr_factura varchar(100),
clientt int(20),
angajat int(20),
data_emitere date,
foreign key (clientt) references clienti(id_client),
foreign key (angajat) references angajat(id_angajat)
);




create table comanda(
id_comanda int(20) not null auto_increment primary key,
factura int(20),
produs int(20),
cantitate int(100),
foreign key (factura) references factura(id_factura),
foreign key (produs) references produs(id_produs)
);

insert into localitate values
(null, 'Bucuresti'),
(null, 'Valcea'),
(null, 'Horezu'),
(null, 'Berbesti'),
(null, 'Targu Jiu'),
(null, 'Pitesti'),
(null, 'Constanta'),
(null, 'Ploiesti'),
(null, 'Timisoara'),
(null, 'Cluj');

insert into functie values
(null, 'vanzator'),
(null, 'consultant'),
(null, 'secretar'),
(null, 'agent de paza'),
(null, 'contabil'),
(null, 'contabil sef'),
(null, 'vanzator sef'),
(null, 'programator'),
(null, 'tester'),
(null, 'manager general');



insert into angajat values
(null, 100, 'Popescu Petre', '1203047656833', 1, 1, 900),
(null, 200, 'Iliescu Maria', '1203047656234', 2, 1, 900),
(null, 300, 'Georgescu Ana-Maria', '1207895683334', 1, 1, 900),
(null, 400, 'Dumitru Mihaela', '1203234556833', 4, 1, 900),
(null, 500, 'Alexandru Maria', '1203047657890', 5 , 1, 4000),
(null, 600, 'Sandulescu Sandru', '1203047656999', 6, 2, 1100),
(null, 700, 'Enache Adrian', '1203047656333', 7 , 3, 2000),
(null, 800, 'Dumitru Catalina', '1203047656098', 8, 4, 3000),
(null, 900, 'Popa Mihai', '1203047656222', 9, 5, 3500),
(null, 1000,'Bumbar Florin', '1203047656111', 6, 6, 3600);





insert into furnizor values
(null, 'Philips', 'RO1234564'),
(null, 'Brown', 'RO1234345'),
(null, 'Arctic', 'RO1234YYY'),
(null, 'Westwood', 'RO1236XXX'),
(null, 'Whirlpool', 'ROYYY4564'),
(null, 'Zanussi', 'RO12YYY64'),
(null, 'Samsung', 'RO1XXX564'),
(null, 'Beko', 'RO1234999'),
(null, 'Electrolux', 'ROTTYYXX4'),
(null, 'Sony', 'RO1555564');



insert into produs values
(null, 'Masina de spalat WF 658', 1000, 1, 10),
(null, 'Masina de spalat AWO/D 3100', 1200, 6, 10),
(null, 'Masina de spalat ZWG6100P', 1300, 8, 10),
(null, 'Masina de spalat vase ADP', 900, 7, 10),
(null, 'Grill electric', 2300, 3, 10),
(null, 'Cuptor cu microunde MW 71E', 500, 3, 10),
(null, 'Cuptor cu microunde ZW 21M', 450, 5, 10),
(null, 'Cuptor cu microunde MWD 31E', 400, 3, 10),
(null, 'Aragaz WE C345', 780, 6, 10),
(null, 'Frigider RN 230Q', 780, 5, 10);


insert into clienti values
(null, 'FC COMPAGNA SA', 'RO3456789', 1),
(null, 'FC FLORENTINA SRL', 'RO3456999', 2),
(null, 'FC VIALUX SA', 'ROYY56789', 8),
(null, 'FC ALEX SRL', 'RO345688Y', 5),
(null, 'FC MIHAI SRL', 'RO3456333', 1),
(null, 'ROXY SRL', 'RO3456XXX', 6),
(null, 'Alexandru Tudor', '1121456783444', 7),
(null, 'Dumitru Mihai', '1121456783222', 7),
(null,'Popescu Pavel', '1121456783111', 9),
(null, 'Dumitru Ion', '1121456783555', 2);


insert into factura values
(null, 'MMVBVY', 1, 1, '2013-11-12'),
(null, 'MMVBYY', 2, 1, '2013-11-13'),
(null, 'MMVBXX', 3, 1, '2013-11-14'),
(null, 'MMVB11', 4, 1, '2013-11-15'),
(null, 'MMVB22', 5, 1, '2013-11-16'),
(null, 'MMVB33', 6, 3, '2013-12-11'),
(null, 'MMVB44', 7, 5, '2013-12-12');




insert into comanda values
(null, 1, 1, 5),
(null, 1, 2, 3),  
(null, 1, 3, 1),
(null, 2, 5, 1),
(null, 3, 4, 2),
(null, 4, 9, 1),
(null, 5, 1, 3),
(null, 5, 4, 1),
(null, 6, 2, 6),
(null, 7, 3, 1);




create table banca(
id_banca int(11) not null auto_increment primary key,
den_banca varchar(100)
);


insert into banca values
(null, 'RAIFFEISEN BANK'),
(null, 'BCR'),
(null, 'CEC BZNK'),
(null, 'BANCA TRANSILVANIA'),
(null, 'BANCA ROMANEASCA'),
(null, 'CEC'),
(null, 'PROCREDIT BANK'),
(null, 'BANCA CARPATICA'),
(null,'ALPHA BANK'),
(null, 'OTP BANK');


/*modific structura tabelei banca*/

/*modific numele tabelei */
alter table banca rename to bank;

/*modific denumirea coloanei den_banca */
alter table bank change den_banca denumire_banca varchar(100);

/*adaug coloane noi */
alter table bank add telefon varchar(20);
alter table bank add localitate varchar(100);

describe bank;

/*streg coloana localitate */
alter table bank drop localitate;

describe bank;


/*modific denumirea bancii cu id-ul 1*/

update bank set denumire_banca='ZZZZZ' where id_banca=1;

select * from bank;

/*sterg o inregistrare*/

delete from bank where id_banca=1;

select * from bank;

/*sterg cheia primara */

alter table  bank change id_banca id_banca int(11) not null;
alter table bank drop primary key;

describe bank;

show create table bank;

drop table bank;




/*afisam toate facturile cu produsele, pret-ul, cantitatea, clientul si angajatul care  a emis factura */

select nr_factura, clienti.nume as nume_client, angajat.nume as nume_angajat, den_produs, pret_unitar, cantitate 
                        from clienti, angajat, factura, comanda, produs
                        where clienti.id_client=factura.clientt
                        and angajat.id_angajat=factura.angajat
                        and factura.id_factura= comanda.factura
                        and produs.id_produs=comanda.produs;          
                
                
                


/*stocul initial si stocul curent pentru fiecare produs */


select id_produs, den_produs, stoc as stoc_initial,  (stoc-sum(cantitate)) as stoc_final 
                from  produs, comanda
                where id_produs=produs
                group by id_produs, stoc;
                    
                    
                    
                           
/*produsele care au o cantitate vanduta >=5 */



select id_produs, den_produs, sum(cantitate) as cantitate_vanduta from produs, comanda
                    where id_produs=produs
                    group by id_produs
                    having (cantitate_vanduta>=5);



/*toate preturile din tabela produs*/

select id_produs, pret_unitar from produs order by pret_unitar desc;


/*valoarea totala a vanzarilor pentru fiecare produs, mai putin pentru cele cu pretul
mai mic de 700*/


select id_produs, den_produs, pret_unitar, sum(cantitate) as cantitate_vanduta, (pret_unitar * sum(cantitate))as valoare_totala
        from produs, comanda  
        where id_produs=produs
        group by id_produs
        having (pret_unitar>700);




/*afisam toti angajatii cu localitatile lor */

select id_angajat, nume, den_localitate from angajat, localitate
            where id_localitate=localitate;

/*sa se afiseze toti angajati care sunt din Pitesti*/


select id_angajat, nume, den_localitate from angajat, localitate
    where id_localitate=localitate
    and den_localitate = 'Pitesti';
    


/*produsul concatenat cu cantitatea vanduta; pentru sirul astfel creat afisam lungimea sa. */



select id_produs, concat_ws('   -   ',den_produs,sum(cantitate)) as produs_cantitate , length(concat_ws('   -   ',den_produs,sum(cantitate))) as lungime 
                from produs, comanda
                where id_produs=produs 
                group by id_produs;
                    
                                
    

                            
/*valoarea totala pentru fiecare comanda si sa se ordoneze descrescator*/



select nr_factura, clienti.nume as nume_client, angajat.nume as nume_angajat, sum(pret_unitar*cantitate) as valoare_totala 
        from clienti, angajat, factura, comanda, produs
        where clienti.id_client=factura.clientt
        and angajat.id_angajat=factura.angajat
        and factura.id_factura=comanda.factura
        and produs.id_produs=comanda.produs
        group by id_factura
        order by valoare_totala desc;
            




/*toate produsele impreuna cu cantitatea vanduta, daca au cantitatea vanduta 0, atunci  afisam null */


select id_produs, den_produs, sum(cantitate) from produs left join comanda
            on (id_produs=produs)
            group by id_produs;
            




                
/*toti furnizorii din baza de date impreuna cu produsele corespunzatoare, daca nu
au niciun produs in baza de date, afisam null */


select id_produs, den_produs, id_furnizor, den_furnizor, cif from produs right join furnizor
                on (id_furnizor=furnizor);
                
                


/*toti angajatii firmei si functia ocupata, daca exista posturi vacante afisam null */


select id_angajat, cod, nume, cnp, salariu_de_incadrare, id_functie, nume_functie 
        from angajat right join functie
        on (id_functie=functie);
        


/*angajatii care au salariu de incadrare mai mare de 1000 reuniti cu cei care stau in Bucuresti */

select id_angajat, nume from angajat
	where salariu_de_incadrare > 1000
union
select id_angajat, nume  from angajat, localitate
	where id_localitate=localitate   and den_localitate = 'Bucuresti';



/*angajatii care au salariu egal cu salariu angajatul cu id-ul 2*/

select id_angajat, nume from angajat
        where salariu_de_incadrare = (select salariu_de_incadrare from angajat
                                where id_angajat=2);


/*sa se afiseze informatii despre clientii care au comandat in aceeasi luna cu clientul 2*/


select id_client, month(data_emitere), nume from clienti, factura
    where id_client=clientt
    and  month(data_emitere) = (select month(data_emitere) from clienti, factura
                        where id_client=clientt
                        and id_client=2);


/*sa se afiseze numarul de angajati la firma*/


select count(id_angajat) from angajat;



/*produsele care au furnizori ce incep cu litera 'W' */


select id_produs, den_produs, den_furnizor from produs, 
    (select * from furnizor where den_furnizor like 'W%') as furnizori1
    where furnizori1.id_furnizor=produs.furnizor;





/*un view cu furnizorii care incep cu 'W'*/


create view v1 as 

select id_furnizor, den_furnizor
        from furnizor
            where den_furnizor like 'W%';
                
                


select * from v1;



/*modificam numele furnizorului cu id 4*/


update v1 set den_furnizor = 'WWWWWW' where id_furnizor = 4;

select * from v1;

select * from furnizor;



/*adaugam o valoare in v1 */


insert into v1 values(null, 'WXXXXX');

select * from v1;

select * from furnizor;


/*stergem o valoare din v1 */


delete from v1 where id_furnizor = 11;

select * from v1;

select * from furnizor;



/*stergem vederea v1*/

drop view v1; 


/*o tranzactie care insereaza clienti */

select * from clienti;

start transaction ;

insert into clienti values(null, 'FC RRRR SA', 'RO3459999', 1);

savepoint s1;  

insert into clienti values(null, 'FC XXXXX SA', 'RO4456889', 1);

update clienti set nume = 'XXXXXXXXX' where id_client = 9;

rollback to s1; 

rollback; 

commit;   


select * from clienti;





/*o procedura primeste ca date de intrare un numar ce va fi id-ul produsului, si va returna stocul pentru produsul respectiv*/



delimiter //

create procedure procedura1(in id int(20), out valoare double(7,2))

begin
	
	select den_produs from produs where id_produs= id;	
    
    select (stoc - sum(cantitate)) into valoare 
        from produs, comanda where id_produs=comanda.produs and id_produs=id
                group by id_produs;
 
  
end;

//
delimiter ;




set @x = 1;

call procedura1(@x, @y);

select @y; 


/*o procedura ce primeste ca date de intrare un id, si returneaza pretul maxim platit pentru acel produs */



delimiter //

create procedure procedura2(in id int(11), out pret_maxim double(7,2))

begin
	
	select max(pret_unitar*cantitate) into pret_maxim from produs, comanda 
                where id_produs=produs  and id_produs=id;
                
 
  
end;

//
delimiter ;



call procedura2(1, @z);

select @z; 




/*o functie ce primeste ca date de intrare un nume de produs si returneaza id-ul produsului, daca acesta nu exista, afisam null */



delimiter //

create function functie1(n varchar(100)) returns int(11)

begin

declare id int(11);

select id_produs into id from produs
	where den_produs=n;
    
return id;

end;



//
delimiter ;



set @a= functie1('Cuptor cu microunde MWD 31E');

select @a;




/*O procedura ce primeste ca date de intrare id-ul rezultat la functia anterioara si schimba numele produsului respectiv 
in 'XXXXXX', apoi afiseaza toate produsele din baza de date*/




delimiter //

create procedure procedura4(in id int(11))

begin

update produs set den_produs = 'XXXXX' where id_produs=id;
select * from produs;

end;

//
delimiter ;


call procedura4(@a);



/*afisam toti angajatii si localitatile lor */



select id_angajat, nume,  den_localitate from angajat, localitate
    where id_localitate=localitate;


/*afisam facturile pe care le-au emis angajatii din Bucuresti */


select id_angajat, nume, nume_functie, nr_factura, den_localitate 
                from angajat, functie, localitate, factura
                    where id_localitate=localitate 
                    and id_angajat=angajat 
                    and id_functie=functie 
                    and den_localitate like 'Bucuresti';
    


/*o functie care returneaza numarul total de facturi pe care le-au emis angajatii care sunt din Bucuresti */


delimiter //

create function functie3() returns int(11)

begin

declare nr int(11);


select count(id_factura) into nr  
                from angajat, functie, localitate, factura
                    where id_localitate=localitate 
                    and id_angajat=angajat 
                    and id_functie=functie 
                    and den_localitate like 'Bucuresti';



return nr;

end;



//
delimiter ;



set @a= functie3();

select @a;



/*afisam suma primelor n numere */


delimiter //

create function functie4(n int) returns int


begin
	
declare s int default 0;

b: loop 
	set s:= s+ n;
	set n:=n-1;

	if(n <= 0) then
		leave b;
	end if;
end loop b;
return s;
end;


//
delimiter ;

select functie4(5);

drop function functie4;




        
/*o procedura care ne returneaza cantitatile totale pt fiecare produs in parte, concatenate cu furnizorii corespunzatori */


delimiter //

create procedure procedura5()

begin

select concat(sum(cantitate),"   ~   ",den_furnizor) from produs,comanda,furnizor
                where id_produs=produs
                and id_furnizor=furnizor
                group by id_produs;       


end;

//
delimiter ;

call procedura5();



/*afisam cu ajutorul unui cursor clientii si cnp -ul lor*/

delimiter //
create procedure clienti()

begin
declare n varchar(200);
declare cnp varchar(13);

declare c1 cursor for select nume, cif_cnp from clienti;
declare exit handler for not found 

begin
		set @ok = 0;
end;

open c1;

set @ok = 1;
while @ok = 1 do
	fetch c1 into n, cnp;
	select concat(n, ' are cnp-ul:  ',cnp);
end while;
close c1;

end;

//
delimiter ;

call clienti();


/*afisam cu ajutorul unui cursor toate facturile existente cu produsele corespunzatoare*/



delimiter //
create procedure facturi()

begin
declare nr varchar(100);
declare prod varchar(100);

declare c2 cursor for select nr_factura, den_produs from factura,comanda,produs
            where id_factura=factura
            and id_produs=produs;
            
declare continue handler for not found 

begin
		set @ok = 0;
end;

open c2;

set @ok = 1;
while @ok = 1 do
	fetch c2 into nr, prod;
        select concat(nr,' contine produsul ', prod); 
end while;
close c2;

end;

//
delimiter ;


call facturi();






/*cu ajutorul unui cursor produsele si pretul total platit pentru fiecare in parte */

/*pas 1: facem o tabela cu nume-produs si pret_total*/

create table produs_pret(
id int(11) not null auto_increment primary key,
id_produs int(11),
nume_produs varchar(200),
pret_total double(7,2)
);

/*pas 2: inseram in tabela datele */

delimiter //
create procedure produse()

begin
declare id int(11);
declare n varchar(200);
declare p double(7,2);

declare c3 cursor for select id_produs, den_produs, sum(pret_unitar*cantitate) from produs,comanda
                where id_produs=produs
                group by id_produs;
declare continue handler for not found 

begin
		set @ok = 0;
end;

open c3;

set @ok = 1;
while @ok = 1 do
	fetch c3 into id, n, p;
    if @ok=1 then
        insert into produs_pret values(null,id,n,p);
    end if;
end while;
close c3;

select * from produs_pret;

end;

//
delimiter ;

call produse();





/*cu ajutorul unui trigger, setam conditia ca atunci cand inseram in tabela produse
un produs cu un pret < 0, atunci automat pretul se va seta ca fiind 0*/


delimiter //
create trigger trig1 before insert on produs for each row

begin

if new.pret_unitar< 0 then set new.pret_unitar = 0;
end if;

end;

//
delimiter ;


insert into produs values(null, 'TRIGGER1' , -100, 1, 10);
insert into produs values(null, 'TRIGGER2' , 100, 1, 10);

select * from produs;




/* un trigger care inainte de a sterge un produs, il adauga intr-o alta tabela */

create table produs_sters(
id int(11) not null auto_increment primary key,
nume varchar(100),
stoc int(100)
);


delimiter //
create trigger trig2 before delete on produs for each row
begin
insert into produs_sters values(null, old.den_produs, old.stoc);

end;

//
delimiter ;


delete from produs where id_produs = 10; 
select * from produs;
select * from produs_sters;





