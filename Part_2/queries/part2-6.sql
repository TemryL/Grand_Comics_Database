SELECT DISTINCT lang.name
FROM STDDATA_COUNTRY country, STDDATA_LANGUAGE lang
WHERE country.name != 'Switzerland' AND lang.id IN (
    SELECT ser.language_id
    FROM GCD_SERIES ser, GCD_PUBLISHER publi, STDDATA_COUNTRY cou
    WHERE ser.country_id != cou.id AND cou.name= 'Switzerland' AND 
    ser.publisher_id = publi.id AND publi.country_id = cou.id
); 