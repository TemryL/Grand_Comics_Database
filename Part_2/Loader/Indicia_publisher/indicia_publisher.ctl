load data
CHARACTERSET UTF8
into table GCD_INDICIA_PUBLISHER
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    NAME,
    PUBLISHER_ID,
    COUNTRY_ID,
    YEAR_BEGAN,
    YEAR_ENDED,
    IS_SURROGATE,
    NOTES char(4000),
    URL
)