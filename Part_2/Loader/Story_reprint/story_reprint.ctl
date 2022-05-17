load data 
CHARACTERSET UTF8
into table GCD_STORY_REPRINT
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    ORIGIN_ID,
    TARGET_ID
)