load data
CHARACTERSET UTF8
into table STDDATA_COUNTRY
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    CODE,
    NAME
)