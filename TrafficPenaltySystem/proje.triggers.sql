CREATE TRIGGER update_trigger
AFTER UPDATE OF uyg_kisi_tc ,uyg_plaka_no
ON ceza_kaydi
FOR EACH ROW EXECUTE PROCEDURE trig_fonk3();


		 
CREATE or REPLACE FUNCTION trig_fonk3() 
RETURNS TRIGGER AS $$

DECLARE
	ihlaltutar ihlal.ceza_miktari%type;
	borcu kisi.borc%type;
	plaka_tc arac.arac_tc_no%type;
BEGIN	
	SELECT b.ceza_miktari INTO ihlaltutar FROM ihlal b WHERE b.ceza_tipi_id = old.ceza_tipi;

	IF (old.uyg_kisi_tc IS NOT NULL) AND (new.uyg_kisi_tc IS NULL) THEN
		SELECT borc INTO borcu from kisi where tc_no=old.uyg_kisi_tc;

		RAISE NOTICE 'Kisinin borcundan azaltiliyor';
		update kisi 
		set borc = borc- ihlaltutar
		WHERE tc_no = old.uyg_kisi_tc AND (borc-ihlaltutar)>=0;

		IF (borcu<ihlaltutar) THEN
			update kisi 
			set borc = 0
			WHERE tc_no = old.uyg_kisi_tc;
		END IF;
		
	END IF;
	
	IF (old.uyg_plaka_no IS NOT NULL) AND (new.uyg_plaka_no IS NULL)THEN
		SELECT arac_tc_no INTO plaka_tc FROM arac WHERE old.uyg_plaka_no = plaka_no;		

		SELECT borc INTO borcu from kisi where tc_no =plaka_tc ;
		
		RAISE NOTICE 'Arac sahibinin borcundan azaltiliyor';
		update kisi 
		set 	borc = borc - ihlaltutar
		WHERE tc_no =plaka_tc and (borc-ihlaltutar)>=0;
	
		IF (borcu<ihlaltutar) THEN
			update kisi 
			set borc = 0
			WHERE tc_no =plaka_tc;
		END IF;
	END IF;	
		
	IF (new.uyg_plaka_no IS NULL) AND (new.uyg_kisi_tc IS NULL) THEN
	RAISE NOTICE 'Ceza kaydi siliniyor';
	delete from ceza_kaydi
		WHERE ceza_id= new.ceza_id;
	END IF;	
	
	RETURN new;
END; 
$$ LANGUAGE 'plpgsql';

------------------------------------------------
CREATE TRIGGER insert_trigger
AFTER INSERT
ON ceza_kaydi
FOR EACH ROW EXECUTE PROCEDURE trig_fonk1();


CREATE or REPLACE FUNCTION trig_fonk1() 
RETURNS TRIGGER AS $$
BEGIN	
	IF (new.uyg_plaka_no IS NOT NULL)  THEN
	RAISE NOTICE 'Araci sahibine ceza yaziliyor';
	update kisi 
	set ceza_puani = ceza_puani + (SELECT a.ihlal_ceza_puani FROM ihlal a WHERE new.ceza_tipi = a.ceza_tipi_id),
		borc = borc + (SELECT b.ceza_miktari FROM ihlal b WHERE new.ceza_tipi = b.ceza_tipi_id)
		WHERE tc_no IN(SELECT arac_tc_no FROM arac WHERE new.uyg_plaka_no = plaka_no);
	END IF;
	
	IF  (new.uyg_kisi_tc IN (SELECT arac_tc_no FROM arac WHERE new.uyg_plaka_no = plaka_no) ) THEN
	RAISE NOTICE 'Araci kullanan kisi plaka sahibiyle ayni kisi, plaka_no null yapiliyor ve plakaya yazılan ceza silinecek ';
	update ceza_kaydi set uyg_plaka_no=NULL where ceza_id=new.ceza_id ;
	END IF;
	
	IF (new.uyg_kisi_tc IS NOT NULL) THEN
	RAISE NOTICE 'Sahsa ceza yaziliyor';
	update kisi 
	set ceza_puani = ceza_puani + (SELECT a.ihlal_ceza_puani FROM ihlal a WHERE new.ceza_tipi = a.ceza_tipi_id),
		borc = borc + (SELECT b.ceza_miktari FROM ihlal b WHERE new.ceza_tipi = b.ceza_tipi_id)
		WHERE tc_no = new.uyg_kisi_tc;
	END IF;
	RETURN new;
END; 
$$ LANGUAGE 'plpgsql';