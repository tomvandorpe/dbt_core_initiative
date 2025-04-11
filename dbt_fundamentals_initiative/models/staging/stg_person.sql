select businessentityid,
       persontype,
       firstname,
       lastname,
       CONCAT(firstname, ' ', lastname) as full_name,
       modifieddate
from {{ source('AdventureWorks', 'person') }}
