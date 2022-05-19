SELECT country.name, COUNT(*) AS n_occur
FROM GCD_PUBLISHER publi, GCD_SERIES ser, STDDATA_COUNTRY country
WHERE publi.id = ser.publisher_id AND publi.country_id != ser.country_id AND ser.country_id = country.id
GROUP BY country.name
ORDER BY n_occur DESC;