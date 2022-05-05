load data 
CHARACTERSET UTF8
into table GCD_STORY_TYPE
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    NAME
)