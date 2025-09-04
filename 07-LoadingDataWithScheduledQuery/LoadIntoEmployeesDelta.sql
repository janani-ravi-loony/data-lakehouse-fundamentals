COPY INTO Employees
FROM (
  SELECT id::int, empname, phone, email, city
  FROM '/Volumes/loony_db_ws_1117716205479151/default/emp_data_volume/'
)
FILEFORMAT = CSV
FORMAT_OPTIONS('header' = 'true');