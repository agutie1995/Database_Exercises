USE codeup_test_db;

-- The name of all albums by Pink Floyd.
SELECT record_name as 'Albums by Pink Floyd' FROM albums WHERE artist = 'Pink Floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date as 'The year Sgt. Pepper\'s Lonely Hearts Club Band was released' FROM albums WHERE record_name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- The genre for Nevermind
SELECT genres as 'Albums with Genre Nevermdind' FROM albums WHERE genres = 'Nevermind';

-- Which albums were released in the 1990s
SELECT record_name as 'Albums rleased in the 1990s' FROM albums WHERE release_date BETWEEN '1989' AND '2000';

-- Which albums had less than 20 million certified sales
SELECT record_name as 'Albums with less than 20 million certified sales' FROM albums WHERE copies_sold < 20;

-- All the albums in the rock genre. Is this all the rock albums in the table?
SELECT record_name as 'Albums in rock genres' FROM albums WHERE genres LIKE '%rock%';