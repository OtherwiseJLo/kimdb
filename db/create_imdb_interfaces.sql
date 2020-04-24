DROP TABLE IF EXISTS title_akas;
CREATE TABLE title_akas
(                            -- sv.gz - Contains the following information for titles:
    id              serial primary key,
    titleId         text,    -- (string) - a tconst, an alphanumeric unique identifier of the title
    ordering        integer, -- (integer) – a number to uniquely identify rows for a given titleId
    title           text,    -- (string) – the localized title
    region          text,    -- (string) - the region for this version of the title
    language        text,    -- (string) - the language of the title
    types           text[],-- (array) - Enumerated set of attributes for this alternative title. One or more of the following: "alternative", "dvd", "festival", "tv", "video", "working", "original", "imdbDisplay". New values may be added in the future without warning
    attributes      text[],-- (array) - Additional terms to describe this alternative title, not enumerated
    isOriginalTitle boolean-- (boolean) – 0: not original title; 1: original title
);

DROP TABLE IF EXISTS title_basics;
CREATE TABLE title_basics
(                           -- sv.gz - Contains the following information for titles:
    id             serial primary key,
    tconst         text,    -- (string) - alphanumeric unique identifier of the title
    titleType      text,    -- (string) – the type/format of the title (e.g. movie, short, tvseries, tvepisode, video, etc)
    primaryTitle   text,    -- (string) – the more popular title / the title used by the filmmakers on promotional materials at the point of release
    originalTitle  text,    -- (string) - original title, in the original language
    isAdult        boolean, -- (boolean) - 0: non-adult title; 1: adult title
    startYear      integer, -- (YYYY) – represents the release year of a title. In the case of TV Series, it is the series start year
    endYear        integer, -- (YYYY) – TV Series end year. ‘\N’ for all other title types
    runtimeMinutes integer, -- – primary runtime of the title, in minutes
    genres         text[]-- (string array) – includes up to three genres associated with the title
);

DROP TABLE IF EXISTS title_crew;
CREATE TABLE title_crew
(                     -- sv.gz – Contains the director and writer information for all the titles in IMDb. Fields include:
    id        serial primary key,
    tconst    text,   -- (string) - alphanumeric unique identifier of the title
    directors text[], -- (array of nconsts) - director(s) of the given title
    writers   text[]-- (array of nconsts) – writer(s) of the given title
);

DROP TABLE IF EXISTS title_episode;
CREATE TABLE title_episode
(                          -- sv.gz – Contains the tv episode information. Fields include:
    id            serial primary key,
    tconst        text,    -- (string) - alphanumeric identifier of episode
    parentTconst  text,    -- (string) - alphanumeric identifier of the parent TV Series
    seasonNumber  integer, -- (integer) – season number the episode belongs to
    episodeNumber integer-- (integer) – episode number of the tconst in the TV series
);

DROP TABLE IF EXISTS title_principals;
CREATE TABLE title_principals
(                       -- sv.gz – Contains the principal cast/crew for titles
    id         serial primary key,
    tconst     text,    -- (string) - alphanumeric unique identifier of the title
    ordering   integer, -- (integer) – a number to uniquely identify rows for a given titleId
    nconst     text,    -- (string) - alphanumeric unique identifier of the name/person
    category   text,    -- (string) - the category of job that person was in
    job        text,    -- (string) - the specific job title if applicable, else '\N'
    characters text-- (string) - the name of the character played if applicable, else '\N'
);

DROP TABLE IF EXISTS title_ratings;
CREATE TABLE title_ratings
(                         -- sv.gz – Contains the IMDb rating and votes information for titles
    id            serial primary key,
    tconst        text,   --  (string) - alphanumeric unique identifier of the title
    averageRating real,   -- – weighted average of all the individual user ratings
    numVotes      integer -- - number of votes the title has received
);

DROP TABLE IF EXISTS name_basics;
CREATE TABLE name_basics
(                              -- sv.gz – Contains the following information for names:
    id                serial primary key,
    nconst            text,    -- (string) - alphanumeric unique identifier of the name/person
    primaryName       text,    -- (string)– name by which the person is most often credited
    birthYear         integer, -- – in YYYY format
    deathYear         integer, -- – in YYYY format if applicable, else '\N'
    primaryProfession text[],  -- (array of strings)– the top-3 professions of the person
    knownForTitles    text[]   -- (array of tconsts) – titles the person is known for
);