load data 
CHARACTERSET UTF8
into table GCD_STORY
insert 
fields terminated by "|"
TRAILING NULLCOLS
(
    ID,
    TITLE char(512),
    FEATURE char(512),
    ISSUE_ID,
    SCRIPT char(2048),
    PENCILS char(2048),
    INKS char(2048),
    COLORS char(2048),
    LETTERS char(2048),
    EDITING char(2048),
    CHARACTERS char(4000),
    SYNOPSIS char(4000),
    REPRINT_NOTES char(4000),
    NOTES char(4000),
    TYPE_ID
)