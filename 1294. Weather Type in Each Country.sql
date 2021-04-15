SELECT c.country_name, 
(CASE WHEN ROUND(COALESCE(AVG(w.weather_state),0),2) <= 15 THEN 'Cold'
      WHEN ROUND(COALESCE(AVG(w.weather_state),0),2) >= 25 THEN 'Hot'
      ELSE 'Warm'
      END) AS weather_type
FROM Countries c
JOIN Weather w
ON c.country_id = w.country_id
WHERE MONTH(w.day) = 11
GROUP BY c.country_name
