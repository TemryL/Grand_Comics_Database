CREATE TABLE 'Story' (
    'sid' INTEGER NOT NULL,
    'title' VARCHAR2(255),
    'feature' VARCHAR2(255),
    'issue_id' INTEGER NOT NULL,
    'script' VARCHAR2,
    'pencils' VARCHAR2(255),
    'inks' VARCHAR2(255),
    'colors' VARCHAR2(255),
    'letters' VARCHAR2(255),
    'editing' VARCHAR2(255),
    'genre' VARCHAR2(255),
    'characters' VARCHAR2,
    'synopsis' VARCHAR2,
    'reprint_notes' VARCHAR2(255),
    'notes' VARCHAR2(255),
    'type_id' INTEGER NOT NULL,
    PRIMARY KEY ('sid'),
    CONSTRAINT 'Issued_in'
        FOREIGN KEY ('issue_id')
        REFERENCES 'Issue' ('iid'),
    CONSTRAINT 'Story_of_type'
        FOREIGN KEY ('type_id')
        REFERENCES 'Story_Type' ('stid')
);

CREATE TABLE 'Issue' (
    'iid' INTEGER NOT NULL,
    'number' VARCHAR2(50),
    'series_id' INTEGER NOT NULL,
    'indicia_publisher_id' INTEGER,
    'publication_dates' VARCHAR2(255), 
    'price' VARCHAR2(50),
    'page_count' INTEGER,
    'indicia_frequency' VARCHAR2(50),
    'editing' VARCHAR2(255),
    'notes' VARCHAR2(255),
    'isbn' VARCHAR2(50),
    'valid_isbn' VARCHAR2(50),
    'barcode' VARCHAR2(50),
    'title' VARCHAR2(255),
    'on_sale_date' VARCHAR2(255),
    'rating' VARCHAR2(50),
    PRIMARY KEY ('iid'),
    UNIQUE ('isbn', 'valid_isbn', 'barcode'),
    CONSTRAINT 'Issue_of'
        FOREIGN KEY ('series_id')
        REFERENCES 'Series' ('seid'),
    CONSTRAINT 'Published_by'
        FOREIGN KEY ('indicia_publisher_id')
        REFERENCES 'Indicia_Publisher' ('ipid')
        ON DELETE SET NULL
);

CREATE TABLE 'Series' (
    'seid' INTEGER NOT NULL,
    'name' VARCHAR2(255) NOT NULL,
    'format' VARCHAR2(255),
    'year_began' INTEGER,
    'year_ended' INTEGER,
    'publication_dates' VARCHAR2(255),
    'first_issue_id' INTEGER,
    'last_issue_id' INTEGER,
    'publisher_id' INTEGER NOT NULL,
    'country_id' INTEGER NOT NULL,
    'language_id' INTEGER NOT NULL,
    'notes' VARCHAR2(255),
    'color' VARCHAR2(255),
    'dimensions' VARCHAR2(255),
    'paper_stock' VARCHAR2(255),
    'binding' VARCHAR2(255),
    'publishing_format' VARCHAR2(255),
    'publication_type_id' INTEGER,
    PRIAMRY KEY ('seid'),
    CONSTRAINT 'First_issue_of'
        FOREIGN KEY ('first_issue_id')
        REFERENCES 'Issue' ('iid')
        ON DELETE SET NULL,
    CONSTRAINT 'Last_issue_of'
        FOREIGN KEY ('last_issue_id')
        REFERENCES 'Issue' ('iid')
        ON DELETE SET NULL,
    CONSTRAINT 'Produces'
        FOREIGN KEY ('publisher_id')
        REFERENCES 'Publisher' ('pid'),
    CONSTRAINT 'Series_from'
        FOREIGN KEY ('country_id')
        REFERENCES 'Country' ('cid'),
    CONSTRAINT 'Written_in'
        FOREIGN KEY ('language_id')
        REFERENCES 'Language' ('lid'),
    CONSTRAINT 'Series_of_type'
        FOREIGN KEY ('publication_type_id')
        REFERENCES 'Series_Publication_Type' ('sptid')
        ON DELETE SET NULL
);

CREATE TABLE 'Indicia_Publisher' (
    'ipid' INTEGER NOT NULL,
    'name' VARCHAR2(255) NOT NULL,
    'publisher_id' INTEGER NOT NULL,
    'country_id' INTEGER NOT NULL,
    'year_began' INTEGER,
    'year_ended' INTEGER,
    'is_surrogate' INTEGER,
    'notes' VARCHAR2(255),
    'url' VARCHAR2(255),
    PRIMARY KEY (ipid),
    UNIQUE ('name'),
    CHECK ((is_surrogate = 0) OR (is_surrogate = 1) OR (is_surrogate IS NULL)),
    CONSTRAINT 'Owned_by'
        FOREIGN KEY ('publisher_id')
        REFERENCES 'Publisher' ('pid'),
    CONSTRAINT 'Indicia_from'
        FOREIGN KEY ('country_id')
        REFERENCES 'Country' ('cid')
);

CREATE TABLE 'Publisher' (
    'pid' INTEGER NOT NULL,
    'name' VARCHAR2(255) NOT NULL,
    'country_id' INTEGER NOT NULL,
    'year_began' INTEGER,
    'year_ended' INTEGER,
    'notes' VARCHAR2(255),
    'url' VARCHAR2(255),
    PRIMARY KEY ('pid'),
    UNIQUE ('name'),
    CONSTRAINT 'Publisher_from'
        FOREIGN KEY ('country_id')
        REFERENCES 'Country' ('cid')
);

CREATE TABLE 'Brand_Group' (
    'bgid' INTEGER NOT NULL,
    'name' VARCHAR2(255) NOT NULL,
    'year_began' INTEGER,
    'year_ended' INTEGER,
    'notes' VARCHAR2(255),
    'url' VARCHAR2(255),
    'publisher_id' INTEGER NOT NULL,
    PRIMARY KEY ('bgid'),
    UNIQUE ('name'),
    CONSTRAINT 'Held_by'
        FOREIGN KEY ('publisher_id')
        REFERENCES 'Publisher' ('pid')
);

CREATE TABLE 'Story_Type' (
    'stid' INTEGER NOT NULL,
    'name' VARCHAR2(50),
    PRIMARY KEY ('sptid'),
    UNIQUE ('name')
);

CREATE TABLE 'Series_Publication_Type' (
    'sptid' INTEGER NOT NULL,
    'name' VARCHAR2(50) NOT NULL,
    PRIMARY KEY ('sptid'),
    UNIQUE ('name')
);

CREATE TABLE 'Language' (
    'lid' INTEGER NOT NULL,
    'code' VARCHAR2(4) NOT NULL,
    'name' VARCHAR2(50) NOT NULL,
    PRIMARY KEY ('lid'),
    UNIQUE ('code')
);

CREATE TABLE 'Country' (
    'cid' INTEGER NOT NULL,
    'code' VARCHAR2(4) NOT NULL,
    'name' VARCHAR2(50) NOT NULL,
    PRIMARY KEY ('cid'),
    UNIQUE ('code')
);

CREATE TABLE 'Story_reprint' (
    'srid' INTEGER NOT NULL,
    'origin_story_id' INTEGER NOT NULL,
    'target_story_id' INTEGER NOT NULL,
    PRIMARY KEY ('origin_story_id', 'target_story_id'),
    FOREIGN KEY 'origin_story_id' REFERENCES 'Story' ('sid'),
    FOREIGN KEY 'target_story_id' REFERENCES 'Story' ('sid')
);

CREATE TABLE 'Issue_reprint' (
    'irid' INTEGER NOT NULL,
    'origin_issue_id' INTEGER NOT NULL,
    'target_issue_id' INTEGER NOT NULL,
    PRIMARY KEY ('origin_issue_id', 'target_issue_id'),
    FOREIGN KEY 'origin_issue_id' REFERENCES 'Issue' ('iid'),
    FOREIGN KEY 'target_issue_id' REFERENCES 'Issue' ('iid')
);
