USE LibraryManagement;

INSERT INTO authors (author_name) VALUES 
('J.K. Rowling'),
('George Orwell');

INSERT INTO genres (genre_name) VALUES 
('Fantasy'),
('Dystopian');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES 
('Harry Potter and the Philosopher\'s Stone', 1997, 1, 1),
('1984', 1949, 2, 2);

INSERT INTO users (username, email) VALUES 
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES 
(1, 1, '2025-01-01', '2025-01-10'),
(2, 2, '2025-01-05', NULL);