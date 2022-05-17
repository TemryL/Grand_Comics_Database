create table STDDATA_LANGUAGE
(
    ID   NUMBER(3) primary key,
    CODE VARCHAR2(3) unique not null,
    NAME VARCHAR2(64)
);

create table STDDATA_COUNTRY
(
    ID   NUMBER(3) primary key ,
    CODE VARCHAR2(4) unique not null,
    NAME VARCHAR2(64)
);

create table GCD_STORY_TYPE
(
    ID   NUMBER(2) primary key,
    NAME VARCHAR2(64)
);

create table GCD_SERIES_PUBLICATION_TYPE
(
    ID   NUMBER(1) primary key,
    NAME VARCHAR2(16)
);

create table GCD_SERIES_PUBLISHING_FORMAT
(
    ID                NUMBER(38) primary key,
    PUBLISHING_FORMAT VARCHAR2(256) not null
);

create table GCD_PUBLISHER
(
    URL        VARCHAR2(256),
    NOTES      VARCHAR2(4000),
    YEAR_ENDED NUMBER(4),
    YEAR_BEGAN NUMBER(4),
    COUNTRY_ID NUMBER(3),
    NAME       VARCHAR2(256),
    ID         INTEGER primary key,
    constraint GCD_PUBLISHER_COUNTRY_FK
        foreign key (COUNTRY_ID) references STDDATA_COUNTRY(ID)
);
create table GCD_INDICIA_PUBLISHER
(
    ID           INTEGER primary key,
    NAME         VARCHAR2(256),
    PUBLISHER_ID INTEGER,
    COUNTRY_ID   NUMBER(3),
    YEAR_BEGAN   NUMBER(4),
    YEAR_ENDED   NUMBER(4),
    IS_SURROGATE NUMBER(38),
    NOTES        VARCHAR2(4000),
    URL          VARCHAR2(256),
    constraint GCD_INDICIA_PUBLISHER_COUNTRY_FK
        foreign key (COUNTRY_ID) references STDDATA_COUNTRY(ID),
    constraint GCD_INDICIA_PUBLISHER_PUBLISHER_FK
        foreign key (PUBLISHER_ID) references GCD_PUBLISHER
);
create table GCD_BRAND_GROUP
(
    ID           NUMBER(38) primary key,
    NAME         VARCHAR2(256),
    YEAR_BEGAN   NUMBER(4),
    YEAR_ENDED   NUMBER(4),
    NOTES        VARCHAR2(4000),
    URL          VARCHAR2(256),
    PUBLISHER_ID INTEGER not null,
    constraint GCD_BRAND_GROUP_PUB_FK
        foreign key (PUBLISHER_ID) references GCD_PUBLISHER(ID)
);
create table GCD_ISSUE
(
    ID                   NUMBER(38) primary key,
    EDITION_NUMBER       VARCHAR2(64),
    SERIES_ID            NUMBER(38),
    INDICIA_PUBLISHER_ID INTEGER,
    PUBLICATION_DATE     VARCHAR2(64),
    PRICE                NUMBER(38, 2),
    CURRENCY             VARCHAR2(26),
    PAGE_COUNT           INTEGER,
    INDICIA_FREQUENCY    VARCHAR2(256),
    EDITING              VARCHAR2(2048),
    NOTES                VARCHAR2(4000),
    ISBN                 VARCHAR2(64),
    VALID_ISBN           VARCHAR2(16),
    BARCODE              VARCHAR2(64),
    TITLE                VARCHAR2(128),
    ON_SALE_DATE         VARCHAR2(26),
    RATING               VARCHAR2(128)
);

create table GCD_ISSUE_REPRINT
(
    ID              NUMBER(20) primary key,
    ORIGIN_ISSUE_ID NUMBER(20),
    TARGET_ISSUE_ID NUMBER(20),
    constraint GCD_ORIGIN_ISSUE_FK
        foreign key (ORIGIN_ISSUE_ID) references GCD_ISSUE,
    constraint GCD_TARGET_ISSUE_FK
        foreign key (TARGET_ISSUE_ID) references GCD_ISSUE
);

create table GCD_STORY_GENRE
(
    ID    NUMBER(3) primary key,
    GENRE VARCHAR2(128) not null
);



create table GCD_SERIES
(
    ID                  NUMBER(38) primary key,
    NAME                VARCHAR2(256),
    FORMAT              VARCHAR2(256),
    YEAR_BEGAN          NUMBER(4),
    YEAR_ENDED          NUMBER(4),
    PUBLICATION_DATES   VARCHAR2(128),
    FIRST_ISSUE_ID      NUMBER(38),
    LAST_ISSUE_ID       NUMBER(38),
    PUBLISHER_ID        INTEGER,
    COUNTRY_ID          NUMBER(3),
    LANGUAGE_ID         NUMBER(3),
    NOTES               VARCHAR2(4000),
    COLOR               VARCHAR2(256),
    DIMENSIONS          VARCHAR2(256),
    PAPER_STOCK         VARCHAR2(256),
    BINDING             VARCHAR2(256),
    PUBLICATION_TYPE_ID NUMBER(1),
    constraint GCD_SERIES_COUNTRY_FK
        foreign key (COUNTRY_ID) references STDDATA_COUNTRY(ID),
    constraint GCD_SERIES_FIRST_ISSUE_FK
        foreign key (FIRST_ISSUE_ID) references GCD_ISSUE,
    constraint GCD_SERIES_LANGUAGE_FK
        foreign key (LANGUAGE_ID) references STDDATA_LANGUAGE(ID),
    constraint GCD_SERIES_LAST_ISSUE_FK
        foreign key (LAST_ISSUE_ID) references GCD_ISSUE,
    constraint GCD_SERIES_PUBLICATION_TYPE_FK
        foreign key (PUBLICATION_TYPE_ID) references GCD_SERIES_PUBLICATION_TYPE,
    constraint GCD_SERIES_PUBLISHER_FK
        foreign key (PUBLISHER_ID) references GCD_PUBLISHER
);

create table GCD_SERIES_TO_PUBLISHING_FORMAT
(
    SERIES_ID            NUMBER(38) references GCD_SERIES,
    PUBLISHING_FORMAT_ID NUMBER(38) references GCD_SERIES_PUBLISHING_FORMAT,
    constraint GCD_SERIES_TO_PUBLISHING_FORMAT_PK
        primary key (SERIES_ID, PUBLISHING_FORMAT_ID)
);
create table GCD_STORY
(
    ID            NUMBER(38) primary key,
    TITLE         VARCHAR2(512),
    FEATURE       VARCHAR2(512),
    ISSUE_ID      NUMBER(38) not null references GCD_ISSUE(ID),
    SCRIPT        VARCHAR2(2048),
    PENCILS       VARCHAR2(2048),
    INKS          VARCHAR2(2048),
    COLORS        VARCHAR2(2048),
    LETTERS       VARCHAR2(2048),
    EDITING       VARCHAR2(2048),
    CHARACTERS    VARCHAR2(4000),
    SYNOPSIS      VARCHAR2(4000),
    REPRINT_NOTES VARCHAR2(4000),
    NOTES         VARCHAR2(4000),
    TYPE_ID       NUMBER(2) references GCD_STORY_TYPE(ID)
);

create table GCD_STORY_REPRINT
(
    ID        NUMBER(20) primary key ,
    ORIGIN_ID NUMBER(38) references GCD_STORY,
    TARGET_ID NUMBER(38) references GCD_STORY
);

create table GCD_STORY_TO_GENRE
(
    STORY_ID NUMBER(38),
    GENRE_ID NUMBER(3),
    constraint GCD_STORY_TO_GENRE_PK
        primary key (STORY_ID, GENRE_ID),
    constraint GCD_STORY_TO_GENRE_GENRE_FK
        foreign key (GENRE_ID) references GCD_STORY_GENRE,
    constraint GCD_STORY_TO_GENRE_STORY_FK
        foreign key (STORY_ID) references GCD_STORY
);


-- sometimes the constraints are impossible to specify inline, at create table time since there are dependencies - in this case we must add the constraints subsequently
alter table GCD_ISSUE
add constraint GCD_ISSUE_INDICIA_PUBLISHER_ID_FK foreign key (INDICIA_PUBLISHER_ID) references GCD_INDICIA_PUBLISHER(ID);

alter table GCD_ISSUE
add constraint GCD_ISSUE_SERIES_ID_FK foreign key (SERIES_ID) references GCD_SERIES(ID);
