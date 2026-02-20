-- Import CSV into DuckDB (adjust paths if needed)

CREATE OR REPLACE TABLE main.users AS
SELECT * FROM read_csv_auto('/Users/coumbaguaye/Documents/DataPortfolio/NeuroFlowAI/data/neuroflow_data/users.csv');

CREATE OR REPLACE TABLE main.events AS
SELECT * FROM read_csv_auto('/Users/coumbaguaye/Documents/DataPortfolio/NeuroFlowAI/data/neuroflow_data/events.csv');

CREATE OR REPLACE TABLE main.subscriptions AS
SELECT * FROM read_csv_auto('/Users/coumbaguaye/Documents/DataPortfolio/NeuroFlowAI/data/neuroflow_data/subscriptions.csv');

CREATE OR REPLACE TABLE main.support_tickets AS
SELECT * FROM read_csv_auto('/Users/coumbaguaye/Documents/DataPortfolio/NeuroFlowAI/data/neuroflow_data/support_tickets.csv');
