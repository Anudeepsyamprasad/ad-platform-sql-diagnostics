CREATE TABLE accounts (
    account_id INTEGER PRIMARY KEY,
    account_name TEXT NOT NULL,
    region TEXT NOT NULL,
    status TEXT CHECK(status IN ('active', 'paused')) NOT NULL
);

CREATE TABLE campaigns (
    campaign_id INTEGER PRIMARY KEY,
    account_id INTEGER NOT NULL,
    campaign_name TEXT NOT NULL,
    start_date DATE,
    status TEXT CHECK(status IN ('active', 'paused')) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE ad_events (
    event_id INTEGER PRIMARY KEY,
    campaign_id INTEGER NOT NULL,
    event_type TEXT CHECK(event_type IN ('impression', 'click', 'error')) NOT NULL,
    error_code TEXT,
    event_timestamp DATETIME NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

CREATE TABLE support_tickets (
    ticket_id INTEGER PRIMARY KEY,
    account_id INTEGER NOT NULL,
    issue_type TEXT,
    severity TEXT CHECK(severity IN ('low', 'medium', 'high')) NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
