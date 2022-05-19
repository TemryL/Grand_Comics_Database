SELECT brand.name, COUNT(*) nb_indicia_us
FROM GCD_BRAND_GROUP brand, GCD_PUBLISHER publi, GCD_INDICIA_PUBLISHER indicia, 
STDDATA_COUNTRY country 
WHERE brand.publisher_id = publi.id AND indicia.publisher_id = publi.id AND
indicia.country_id = country.id AND country.name = 'United States'
GROUP BY brand.name
ORDER BY nb_indicia_us DESC;