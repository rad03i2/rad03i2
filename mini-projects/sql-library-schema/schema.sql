CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    country VARCHAR(80)
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title VARCHAR(180) NOT NULL,
    author_id INTEGER NOT NULL,
    published_year INTEGER,
    copies_available INTEGER DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE members (
    id INTEGER PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(160) UNIQUE NOT NULL,
    joined_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE loans (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    borrowed_at DATE DEFAULT CURRENT_DATE,
    returned_at DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

INSERT INTO authors (id, name, country) VALUES
(1, 'Naguib Mahfouz', 'Egypt'),
(2, 'Ali Al-Wardi', 'Iraq');

INSERT INTO books (id, title, author_id, published_year, copies_available) VALUES
(1, 'Palace Walk', 1, 1956, 3),
(2, 'Social Glimpses', 2, 1969, 2);

SELECT books.title, authors.name AS author
FROM books
JOIN authors ON books.author_id = authors.id;
