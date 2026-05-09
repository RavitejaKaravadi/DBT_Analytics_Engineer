{{
    config(
        materialized = 'table',
        alias = var('token_name_var')~'_activity_per_day' 
    )
}}


select
date,
token_address,
{{ conversion('value', var('token_decimals_var') ) }} as total_usd_value

from {{ ref('stg_token_transfers') }}
where lower(token_address) = lower('{{ var("token_address_var") }}')

group by date, token_address