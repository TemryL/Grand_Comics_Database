SELECT COUNT(*)
FROM GCD_PUBLISHER publi
WHERE NOT EXISTS (
    SELECT id
    FROM GCD_SERIES ser
    WHERE ser.country_id = publi.country_id AND ser.publisher_id = publi.id
) AND EXISTS (
    SELECT id
    FROM GCD_SERIES ser
    WHERE ser.country_id != publi.country_id AND ser.publisher_id = publi.id
);