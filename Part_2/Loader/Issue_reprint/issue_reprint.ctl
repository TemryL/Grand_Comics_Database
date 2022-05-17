load data
CHARACTERSET UTF8
into table GCD_ISSUE_REPRINT
insert 
fields terminated by ","
TRAILING NULLCOLS
(
    ID,
    ORIGIN_ISSUE_ID,
    TARGET_ISSUE_ID
)