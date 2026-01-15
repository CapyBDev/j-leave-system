
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    role TEXT NOT NULL CHECK(role IN ('admin','user')),
    created_at TEXT NOT NULL,
    entitlement INTEGER DEFAULT 0,
    department_id INTEGER REFERENCES departments(id),
    position TEXT,
    approver_role TEXT,
    ic_number TEXT,
    email TEXT,
    phone TEXT,
    address TEXT,
    enrollment_date TEXT
);

CREATE TABLE IF NOT EXISTS departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS leaves (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL REFERENCES users(id),
    leave_type TEXT NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    reason TEXT,
    status TEXT NOT NULL DEFAULT 'Pending',
    created_at TEXT NOT NULL,
    next_approver TEXT,
    contact_address TEXT,
    contact_phone TEXT,
    notes TEXT,
    checked_by_position TEXT,
    checked_status TEXT DEFAULT 'Pending',
    next_approver_position TEXT,
    next_approver_department TEXT,
    checked_by_user_id INTEGER REFERENCES users(id),
    approved_by_user_id INTEGER REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS holidays (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    date TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value TEXT
);

-- SELECT id, full_name, position, status, checker_name, approver_name
-- FROM leave_applications;
