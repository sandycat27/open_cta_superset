CREATE OR REPLACE TABLE l_stops AS
SELECT
    stop_id,
    direction_id,
    stop_name,
    station_name,
    station_descriptive_name,
    map_id,
    ada,
    red,
    blue,
    g,
    brn,
    p,
    pexp,
    y,
    pnk,
    o,
    regexp_extract(location, '\((\d+.\d+), (-?\d+.\d+)\)', 1)::DECIMAL(8, 6) AS latitude,
    regexp_extract(location, '\((\d+.\d+), (-?\d+.\d+)\)', 2)::DECIMAL(9, 6) AS longitude
FROM read_csv('CTA_L_Stops.csv');


CREATE OR REPLACE TABLE bus_ridership AS
SELECT route, date, daytype, rides
FROM read_csv('CTA_Ridership.csv', dateformat = '%m/%d/%Y');


CREATE OR REPLACE TABLE l_station_entries AS
SELECT station_id, stationname, date, daytype, rides
FROM read_csv('CTA_Ridership_Station_Entries.csv', dateformat = '%m/%d/%Y');

