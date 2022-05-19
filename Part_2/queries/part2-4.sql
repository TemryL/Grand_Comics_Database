SELECT COUNT(*) AS n_series, year_began
FROM GCD_SERIES
WHERE year_began >= 1990 AND year_began <= 2017
GROUP BY year_began
ORDER BY year_began DESC;