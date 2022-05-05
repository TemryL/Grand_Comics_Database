load data 
CHARACTERSET UTF8
into table GCD_SERIES_PUBLICATION_TYPE
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    NAME
)