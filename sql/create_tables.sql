-- ============================
-- 🎭 Shows Table
-- ============================
CREATE TABLE shows (
    show_id INTEGER PRIMARY KEY AUTOINCREMENT,
    show_name TEXT NOT NULL,
    show_date DATE NOT NULL,
    is_release BOOLEAN NOT NULL
);

-- ============================
-- 🎟️ Sections Table
-- ============================
CREATE TABLE sections (
    section_id INTEGER PRIMARY KEY AUTOINCREMENT,
    show_id INTEGER NOT NULL,
    section_name TEXT NOT NULL,
    capacity INTEGER,
    open_seats INTEGER,
    sold INTEGER,
    comps INTEGER,
    price REAL,
    revenue REAL,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- ============================
-- 📊 Annual Summary Table
-- ============================
CREATE TABLE annual_summary (
    year INTEGER PRIMARY KEY,
    shows_with_release INTEGER,
    shows_without_release INTEGER,
    revenue_with_release REAL,
    revenue_without_release REAL,
    release_revenue REAL,
    tickets_with_release INTEGER,
    tickets_without_release INTEGER,
    release_tickets INTEGER,
    comps_with_release INTEGER,
    comps_without_release INTEGER,
    release_comps INTEGER,
    total_with_release INTEGER,
    total_without_release INTEGER,
    total_release_tickets INTEGER
);

