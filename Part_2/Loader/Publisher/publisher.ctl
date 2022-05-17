load data 
CHARACTERSET UTF8
into table GCD_PUBLISHER
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    NAME,
    COUNTRY_ID,
    YEAR_BEGAN,
    YEAR_ENDED,
    NOTES char(4000),
    URL
)