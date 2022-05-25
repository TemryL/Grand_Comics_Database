SELECT C.NAME AS Country_Name, 
    Max_years AS Max_Years_Publishing_Per_Country, 
    Average_years AS Average_Years_Per_Country
FROM STDDATA_COUNTRY C, (
    SELECT COUNTRY_ID, 
        MAX(Publishing_period) AS Max_years, 
        ROUND(AVG(Publishing_period), 4) AS Average_years
    FROM (
        SELECT COUNTRY_ID, YEAR_ENDED-YEAR_BEGAN AS Publishing_period
        FROM GCD_PUBLISHER
        WHERE YEAR_BEGAN>=1600 AND YEAR_BEGAN<=2020 AND YEAR_ENDED>=1600 AND YEAR_ENDED<=2020
    )
    GROUP BY COUNTRY_ID
    ORDER BY Max_years DESC
)
WHERE C.ID=COUNTRY_ID AND ROWNUM<=10;