SELECT DISTINCT publi.name
FROM GCD_PUBLISHER publi, GCD_SERIES ser
WHERE publi.id = ser.publisher_id AND publi.country_id != ser.country_id
ORDER BY publi.name;