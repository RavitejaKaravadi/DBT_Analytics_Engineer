{{
    config(
        materialized='table',
        tags = ['daily'],
        group = 'analytics_engineering',
        access = 'private'
    )
}}


select 
date,
transaction_category,

count(*) as tc_count,
{{ conversion('value', '18') }} as sum_eth_value

from
{{ ref('transactions_enriched') }}
group by 1, 2

