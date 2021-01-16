create table kisi(
		tc_no numeric(11) not null primary key,
		isim varchar(15) not null,
		soyisim varchar(15) not null,
	--sayı kısıtı
		dogum_tarihi date,
		check (dogum_tarihi>'01/01/1920'),
		adres varchar(50),
		telefon numeric(10),
		cinsiyet char(5),
		check(cinsiyet in('Kadin', 'Erkek')),
		ceza_puani smallint default 0,
		borc int default 0

);

create table ihlal(
		ceza_tipi_id numeric(3) not null primary key,
		ihlal_konusu varchar(50) not null,
		--sayı kısıtı
		uygulama_tipi numeric(1) not null,
		check(uygulama_tipi in (1,2)),
		ihlal_ceza_puani smallint,
		ceza_miktari int	
);

create table arac(
		plaka_no varchar(10) not null primary key,
		arac_tc_no numeric(11) not null,
		arac_marka varchar(15),
		arac_tipi varchar(10),
		arac_model varchar(25),
		foreign key(arac_tc_no) references kisi(tc_no)
);

create table ceza_kaydi(
		ceza_id int primary key,
		ceza_tipi numeric(3) not null,
		ceza_tarihi date,
		ceza_adres varchar(50),
		uyg_kisi_tc numeric(11),
		uyg_plaka_no varchar(10),
		constraint fk_ceza_kaydi foreign key(ceza_tipi) references ihlal(ceza_tipi_id) on delete cascade,
		foreign key(uyg_plaka_no) references arac(plaka_no),
		foreign key(uyg_kisi_tc) references kisi(tc_no)
);

create sequence ceza_id_seq
		start 1
		maxvalue 999
		increment by 1
		owned by ceza_kaydi.ceza_id;
ALTER TABLE ceza_kaydi ALTER COLUMN ceza_id SET DEFAULT nextval('ceza_id_seq');
CREATE VIEW tipler AS SELECT ceza_tipi_id, ihlal_konusu, uygulama_tipi from ihlal;