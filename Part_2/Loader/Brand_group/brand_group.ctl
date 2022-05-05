load data
CHARACTERSET UTF8
into table GCD_BRAND_GROUP
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    NAME,
    YEAR_BEGAN,
    YEAR_ENDED,
    NOTES char(4000),
    URL,
    PUBLISHER_ID
)