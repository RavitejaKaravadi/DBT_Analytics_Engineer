


select 
address,
block_number,
bytecode,
date,
last_modified
from {{ source('dbt_analytics_engineer','contracts') }}

