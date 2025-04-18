
with employees as 
(SELECT * from {{ref("int_employees")}} ),



department as 
( SELECT * FROM {{ref("int_department")}} ),


employee_master as 
( SELECT employees.businessentityid,
       employees.org,
       employees.organizationlevel,
       employees.birthdate,
       employees.gender,
       employees.hiredate,
       employees.full_name,
       employees.seniority_category,
       employees.age_in_years,
       department.departmentid,
       department.department_name,
       department.business_unit,
       department.startdate,
       department.enddate

FROM employees

LEFT JOIN department
ON employees.businessentityid = department.businessentityid  )

SELECT * FROM employee_master