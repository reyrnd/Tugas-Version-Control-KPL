SELECT employee_id, 
       first_name || ' ' || last_name AS nama_lengkap, 
       salary, 
       department_id 
FROM employees 
WHERE salary > 6000 
ORDER BY salary DESC;

SELECT DISTINCT job_id 
FROM employees 
WHERE hire_date > DATE '2006-12-31';

SELECT DISTINCT e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.department_id ASC
FETCH FIRST 5 ROWS ONLY;

SELECT employee_id, 
       first_name || ' ' || last_name AS nama, 
       salary 
FROM employees 
WHERE department_id IN (50, 60, 80) 
  AND salary BETWEEN 5000 AND 12000;

SELECT first_name || ' ' || last_name AS nama_lengkap, 
       salary AS gaji_bulanan, 
       (salary * 12) AS gaji_tahunan, 
       'Tahun Aktif' AS keterangan 
FROM employees;

SELECT DISTINCT LOWER(email) AS email_kecil, 
       LENGTH(email) AS panjang_email, 
       SUBSTR(email, 1, 3) AS tiga_karakter_pertama 
FROM employees;

SELECT first_name || ' ' || last_name AS nama_lengkap, 
       hire_date,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS lama_kerja_bulan
FROM employees
ORDER BY hire_date ASC
FETCH FIRST 10 ROWS ONLY;

SELECT first_name || ' ' || last_name AS nama,
       TO_CHAR(salary, '$99,999.00') AS format_gaji,
       TO_CHAR(hire_date, 'YYYY/MM/DD') AS format_tanggal
FROM employees;

SELECT first_name || ' ' || last_name AS nama,
       salary,
       ROUND(salary) AS pembulatan_gaji,
       MOD(salary, 1000) AS sisa_pembagian,
       ABS(salary - 8000) AS selisih_absolut
FROM employees;

SELECT DISTINCT first_name || ' ' || last_name AS nama_lengkap, 
       salary, 
       CASE 
           WHEN salary >= 15000 THEN 'Platinum'
           WHEN salary >= 10000 THEN 'Gold'
           ELSE 'Silver' 
       END AS kategori_gaji,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS peringkat_gaji
FROM employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;