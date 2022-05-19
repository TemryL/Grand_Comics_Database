SELECT name
FROM STDDATA_COUNTRY
WHERE name != 'Switzerland' AND id IN (
    SELECT ser.country_id
    FROM GCD_SERIES ser, GCD_PUBLISHER publi
    WHERE ser.publisher_id = publi.id AND publi.id IN (
        SELECT publisher_id
        FROM GCD_SERIES ser, STDDATA_COUNTRY country
        WHERE ser.country_id = country.id AND country.name = 'Switzerland'
    )
);