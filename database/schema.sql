PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Task_Labels;
DROP TABLE IF EXISTS Task_Categories;
DROP TABLE IF EXISTS Tasks;
DROP TABLE IF EXISTS Labels;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    username   TEXT NOT NULL UNIQUE,
    email      TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE Projects (
    project_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    description TEXT,
    user_id     INTEGER,
    created_at  TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Labels (
    label_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name     TEXT NOT NULL,
    color    TEXT
);

CREATE TABLE Tasks (
    task_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT NOT NULL,
    description TEXT,
    due_date    TEXT,
    priority    TEXT DEFAULT 'medium' CHECK(priority IN ('low', 'medium', 'high')),
    status      TEXT DEFAULT 'pending' CHECK(status IN ('pending', 'in progress', 'completed')),
    created_at  TEXT DEFAULT (datetime('now')),
    updated_at  TEXT DEFAULT (datetime('now')),
    user_id     INTEGER NOT NULL,
    project_id  INTEGER,
    FOREIGN KEY (user_id)    REFERENCES Users(user_id)       ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE SET NULL
);

CREATE TABLE Task_Categories (
    task_id     INTEGER,
    category_id INTEGER,
    PRIMARY KEY (task_id, category_id),
    FOREIGN KEY (task_id)     REFERENCES Tasks(task_id)           ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)  ON DELETE CASCADE
);

CREATE TABLE Task_Labels (
    task_id  INTEGER,
    label_id INTEGER,
    PRIMARY KEY (task_id, label_id),
    FOREIGN KEY (task_id)  REFERENCES Tasks(task_id)   ON DELETE CASCADE,
    FOREIGN KEY (label_id) REFERENCES Labels(label_id) ON DELETE CASCADE
);

CREATE INDEX idx_tasks_user_id     ON Tasks(user_id);
CREATE INDEX idx_tasks_project_id  ON Tasks(project_id);
CREATE INDEX idx_tasks_due_date    ON Tasks(due_date);
CREATE INDEX idx_tasks_status      ON Tasks(status);
CREATE INDEX idx_projects_user_id  ON Projects(user_id);
