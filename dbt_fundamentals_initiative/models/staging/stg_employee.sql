SELECT businessentityid,
       cast(nationalidnumber as integer) as nationalidnumber,
       org,
       organizationlevel,
       birthdate,
       gender,
       hiredate,
       vacationhours,
       sickleavehours,
       modifieddate

from {{ source('AdventureWorks', 'employee') }}
