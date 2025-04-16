with employees as 
(SELECT businessentityid,
       org,
       organizationlevel,
       birthdate,
       gender,
       hiredate,
       seniority_category,
       age_in_years
from {{ref("stg_employee")}} ),


employee_names as 
(SELECT businessentityid,
         full_name
FROM {{ref("stg_person") }} ),


employees_with_names as 
( SELECT employees.businessentityid,
       employees.org,
       employees.organizationlevel,
       employees.birthdate,
       employees.gender,
       employees.hiredate,
       employees.seniority_category,
       employees.age_in_years,

       employee_names.full_name
 
FROM employees

LEFT JOIN employee_names
ON employees.businessentityid = employee_names.businessentityid )

SELECT * FROM employees_with_names
