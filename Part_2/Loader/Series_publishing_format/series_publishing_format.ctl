load data 
CHARACTERSET UTF8
into table GCD_SERIES_PUBLISHING_FORMAT
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    PUBLISHING_FORMAT    
)