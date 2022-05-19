SELECT publi.name
FROM GCD_PUBLISHER publi, STDDATA_COUNTRY country
WHERE publi.year_began < 1995 AND publi.year_ended > 2000 AND 
publi.country_id = country.id AND country.name = 'Netherlands'
ORDER BY publi.name DESC;