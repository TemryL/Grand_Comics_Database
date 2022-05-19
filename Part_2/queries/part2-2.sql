SELECT id, name
FROM GCD_PUBLISHER publi
WHERE id IN (
    SELECT ser.publisher_id
    FROM GCD_SERIES ser, GCD_SERIES_PUBLICATION_TYPE typ, STDDATA_LANGUAGE lang
    WHERE SER.PUBLICATION_TYPE_ID = typ.id AND typ.name = 'album' AND
    ser.language_id = lang.id AND lang.name = 'Italian'
)
ORDER BY id DESC;