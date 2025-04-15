SELECT date, sum(rides) AS total_riders
FROM l_station_entries
GROUP BY date
ORDER BY date ASC;
