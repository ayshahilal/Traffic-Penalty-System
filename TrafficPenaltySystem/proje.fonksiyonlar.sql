	-- Ortalama ceza puanının altındakilere %x indirim yap:

CREATE OR REPLACE FUNCTION indir(indirim INTEGER)

RETURNS integer AS $$
DECLARE
	sayi integer;

BEGIN	
	WITH rows AS (
	UPDATE kisi SET borc= borc- borc*(indirim/100.0) WHERE tc_no IN
	(SELECT e.tc_no FROM kisi e ,kisi e2 GROUP BY e.tc_no HAVING avg(e2.ceza_puani)>e.ceza_puani) AND (ceza_puani >0)
	RETURNING 1)
	
	SELECT count(*) INTO sayi FROM rows;
	
	return sayi;
END;
$$ LANGUAGE 'plpgsql';



	-- TC'si verilen kullancının isim, soyisim, borç ve cezasının üzerinden geçen gün sayısını ekrana alır 

CREATE TYPE yeni_tur AS (isim VARCHAR(15), soyisim VARCHAR(15), borc INTEGER, gun int);

CREATE OR REPLACE FUNCTION RECORD(tc numeric)
RETURNS yeni_tur AS $$

DECLARE 
	bilgi yeni_tur;
	gun int := 0;
	
BEGIN
	SELECT min(current_date - ceza_tarihi) INTO gun from ceza_kaydi,kisi WHERE tc=uyg_kisi_tc AND tc=tc_no;
	SELECT isim, soyisim, borc,gun INTO bilgi
	FROM kisi, ceza_kaydi
	WHERE tc=uyg_kisi_tc AND tc=tc_no;	
	RETURN bilgi;

END;
$$ LANGUAGE 'plpgsql';

	-- Ceza puani 50'nin altında olan ve ödenecek tutarı 0 olan kullanıcıların ceza puanından azalt
	

CREATE OR REPLACE FUNCTION indir2(indirim int)
RETURNS  integer AS $$

DECLARE
	sayi integer;
	kisi_cursor CURSOR FOR SELECT e.tc_no, e.ceza_puani, e.borc
	FROM kisi e
	WHERE (e.ceza_puani < 50) AND (e.borc=0) and e.ceza_puani<>0;

BEGIN
	sayi:=0;
	FOR satir IN kisi_cursor LOOP
	sayi:=sayi+1;
	UPDATE kisi 
	SET ceza_puani= ceza_puani - indirim
	Where tc_no = satir.tc_no AND ceza_puani > indirim;
	END LOOP;
Return sayi;

END;
$$ LANGUAGE 'plpgsql';