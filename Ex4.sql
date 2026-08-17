CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE BookBorrowing (
    BookID INT,
    BorrowerID INT,
    BorrowedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

INSERT INTO Authors (AuthorID, Name)
VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'J.R.R. Tolkien');

INSERT INTO Books (BookID, Title, AuthorID)
VALUES
(101, 'Harry Potter and the Philosopher\'s Stone', 1),
(102, '1984', 2),
(103, 'The Hobbit', 3),
(104, 'Harry Potter and the Chamber of Secrets', 1);

INSERT INTO Borrowers (BorrowerID, Name)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Alice Johnson');

INSERT INTO BookBorrowing (BookID, BorrowerID)
VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 1);

SELECT * FROM Authors;

SELECT * FROM Books;

SELECT * FROM Borrowers;

SELECT * FROM BookBorrowing;

SELECT UPPER(b.Title) AS Title, a.Name AS Author
FROM Books b
INNER JOIN Authors a
ON b.AuthorID = a.AuthorID;

SELECT Name,
(SELECT COUNT(*)
 FROM Books
 WHERE Books.AuthorID = Authors.AuthorID) AS NumberOfBooks
FROM Authors;

SELECT Title
FROM Books
WHERE BookID IN (
    SELECT BookID
    FROM BookBorrowing
    WHERE BorrowerID = (
        SELECT BorrowerID
        FROM Borrowers
        WHERE Name = 'John Doe'
    )
);

SELECT
    b.Title,
    COALESCE(bb_data.Name, 'Not Borrowed') AS Borrower
FROM Books b
LEFT JOIN (
    SELECT bb.BookID, br.Name
    FROM BookBorrowing bb
    JOIN Borrowers br
    ON bb.BorrowerID = br.BorrowerID
) AS bb_data
ON b.BookID = bb_data.BookID;

SELECT DISTINCT br.Name
FROM Borrowers br
WHERE EXISTS (
    SELECT 1
    FROM BookBorrowing bb
    JOIN Books b
    ON bb.BookID = b.BookID
    WHERE b.AuthorID = (
        SELECT AuthorID
        FROM Authors
        WHERE Name = 'J.K. Rowling'
    )
    AND bb.BorrowerID = br.BorrowerID
);

SELECT Title
FROM Books
WHERE EXISTS (
    SELECT 1
    FROM BookBorrowing bb
    WHERE bb.BookID = Books.BookID
);

SELECT Title
FROM Books
WHERE NOT EXISTS (
    SELECT 1
    FROM BookBorrowing bb
    WHERE bb.BookID = Books.BookID
);
