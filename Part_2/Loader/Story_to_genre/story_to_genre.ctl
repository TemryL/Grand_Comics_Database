load data 
CHARACTERSET UTF8
into table GCD_STORY_TO_GENRE
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    STORY_ID,
    GENRE_ID
)
