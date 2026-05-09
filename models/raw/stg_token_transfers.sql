{{
    config(materialized = 'table')

}}


select 
transaction_hash,
date,
token_address,
value 
from {{ source('dbt_analytics_engineer','token_transfers') }}