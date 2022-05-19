SELECT ser.name
FROM GCD_SERIES ser, GCD_SERIES_PUBLICATION_TYPE typ, STDDATA_COUNTRY country
WHERE ser.publication_type_id = typ.id AND typ.name = 'book' AND
ser.country_id = country.id AND country.name = 'Switzerland'
ORDER BY ser.name;