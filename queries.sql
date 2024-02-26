SELECT b.name, COUNT(la.application_id) AS total_applications
FROM brokers b
         LEFT JOIN loan_applications la ON b.broker_id = la.broker_id
GROUP BY b.broker_id;

SELECT b.name AS broker_name, la.application_id, asc.old_status, asc.new_status, asc.changed_at
FROM brokers b
         JOIN loan_applications la ON b.broker_id = la.broker_id
         JOIN application_status_changes asc
ON la.application_id = asc.application_id
ORDER BY b.name, la.application_id, asc.changed_at;

SELECT c.full_name
FROM customers c
         JOIN customer_address_history cah ON c.customer_id = cah.customer_id
GROUP BY c.customer_id
HAVING SUM(IF(cah.end_date IS NULL, 1, 0)) = 0;
