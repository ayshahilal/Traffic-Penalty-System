insert into kisi values(23456789076,'Fatma','Tanrikulu','11/09/1993','Basak Mah. No:27 Basaksehir/Istanbul',5417543010,'Kadin');
insert into kisi values(34567890234, 'Betul', 'Ozmaral', '25/06/1995' , 'Mimoza Sok. D: 18 Kemer/Antalya', 5365244513, 'Kadin');
insert into kisi values(34567890298,'Ahmet','Yildiz','2/12/1974','Keneddy Cad. No:66/A Bakirkoy/Istanbul',5438023430, 'Erkek');
insert into kisi values(67890456734,'Zeynep','Colak','21/05/1992','Yildiz Mah. Ahu Sok. No:48 Buca/Izmir',5310064621, 'Kadin');
insert into kisi values(45678923456,'Ayse','Dogan','18/08/1985','Altinsehir Mah. Cicek Apt. Kat:2 Bornova/Izmir',5527595471,'Kadin');
insert into kisi values(56789034567,'Burak','Acar','30/11/1987','Sarayburnu Mah. No:37 Seyhan/Adana',5454151918,'Erkek');
insert into kisi values(45608923456,'Hakan','Bilgin','4/09/1982','Kilic Sok. Yilmaz Apt. Kat:1 Pendik/Istanbul',5392275040,'Erkek');
insert into kisi values(45678923406,'Dilara', 'Cicek','16/03/1990','Cigdem Mah. Deniz Sok. No:11 Corlu/Tekirdag',5377359532, 'Kadin');
insert into kisi values(43267890345,'Secil','Eker','24/12/1988','Pinar Mah. Gocuk Apt. Kat:8 Kecioren/Ankara',5485451997, 'Kadin');
insert into kisi values(34567823456,'Deniz','Turan','2/02/1991','Zafer Mah. Issiz Sok. No:178 Bagcilar/Istanbul',5325480242	,'Erkek');
insert into kisi values(56437878965,'Emre','Yalcinkaya','20/07/1977','Cagri Sok. Yasemin Apt. No:23 Kadikoy/Istanbul',5561791913,'Erkek');
insert into kisi values(23628915743,'Yasemin','Yesilsu'	,'15/04/1968','Elmali Mah. Yesil Apt. Kat:4 Zeytinburnu/Istanbul',5492167673, 'Kadin');
insert into kisi values(74495261318,'Huseyin','Akin','1/08/1988','Sakarya Mah. No:88 Avcilar/Istanbul',4307382419,'Erkek');


insert into arac values('34SV5959',23456789076,'BMW','SEDAN','520 I');
insert into arac values('34BB9092',34567890298,'MERCEDES','SUV','GLA');
insert into arac values('34CS5042',45678923456,'AUDI','HATCHBACK','A6');
insert into arac values('34MTK44',34567890234,'VOLKSWAGEN','SUV','TIGUAN');
insert into arac values('34MHD99',56789034567,'VOLVO','SEDAN','S90');
insert into arac values('34DNU986',56437878965,'FIAT','SUV'	,'500X');
insert into arac values('34YSF386',45678923456,'RENAULT','SEDAN','MEGANE');
insert into arac values('34SV9041',67890456734,'FORD','HATCHBACK','FOCUS');
insert into arac values('34BBF965',34567823456,'NISSAN','SUV','QASQHAI');
insert into arac values('34UK1032',74495261318,'FORD','SUV','KUGA');

insert into ihlal values(536,'Alkollu arac kullanimi',1,20,1002);
insert into ihlal values(449,'Trafik isiklarina uymama',2,20,235);
insert into ihlal values(302,'Sehir ici azami hiz asimi',2,10,235);
insert into ihlal values(434, 'Arac tescil belgesinin aracta bulunmamasi',1,10,92);
insert into ihlal values(506,'Surucu belgesi yetkisi disinda arac kullanma',1,20,1002);
insert into ihlal values(289,'Yayalar icin belirtilen isaretlere uymamak',1,5,108);
insert into ihlal values(374,'Tasit yolunda yurumek',1,5,108);
insert into ihlal values(672,'Muayenesi yapilmamis bir arac kullanmak',1,10,235);
insert into ihlal values(123,'Aracta olmasi gereken isaretleri bulundurmamak',2,5,108);
insert into ihlal values(741,'Sesli isaretlerin izin verilmeyen araclarda olmasi',2,10,1002);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(536,'9/03/2019','Mercan Sok. Eminonu/Istanbul',23456789076);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(672,'10/02/2017','Bahariye Sok. Kadikoy/Istanbul',56437878965);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(536,'11/05/2018','Basak Mah. Basaksehir/Istanbul',56789034567);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(434,'13/09/2020','Saklicesme Sok. Kemer/Antalya',34567890234);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(672,'10/01/2018','Polat Sok. Kecioren/Ankara',45678923456);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(536,'5/04/2019','Camkusu Sok. Edremit/ Balikesir',56437878965);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(289,'15/08/2020','E5 Karayolu Bahcelievler/Istanbul',23628915743);

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc)
	values(374,'23/06/2019','Vatan Cad. Fatih/Istanbul',74495261318);


insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc,uyg_plaka_no)
         values(449,'27/10/2020','Cumhuriyet Sok. Seyhan/Adana',34567823456,'34UK1032');

insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc,uyg_plaka_no)
         values(302,'16/07/2017','Yasemin Sok. Sariyer/Istanbul',56789034567,'34YSF386');


insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc,uyg_plaka_no)   ---plaka sahibi ve sürücü farklı
         values(449,'1/11/2020','Cigdem Sok. Bornova/Izmir',56789034567,'34MTK44');


insert into ceza_kaydi ( ceza_tipi, ceza_tarihi, ceza_adres,uyg_kisi_tc,uyg_plaka_no)
         values(302, '01/01/2019' ,'Buyukhendek Cad. Beyoglu/Istanbul',34567823456,'34BBF965');