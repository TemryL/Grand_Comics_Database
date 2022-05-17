load data 
CHARACTERSET UTF8
into table GCD_STORY_GENRE
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    GENRE
)