{{
    config(
        materialized = 'table',
        tags = ['stable_coin'],
        grants = {'+select': ['TESTER']}
    )
}}


select
t.date,
-- t.token_address,
s.type,
-- s.symbol,
{{ conversion('t.value','s.decimals') }} as total_usd_value

from {{ ref('stg_token_transfers') }} t
left join {{ ref('stablecoins') }} s 
on t.token_address = s.contract_address

where s.contract_address is not null 
-- and lower(t.token_address) in ({{ random_macro() }})
-- (
-- {% for item in random_macro() -%}
--     '{{ item }}'{{ ',' if not loop.last }}
-- {%- endfor %})
group by t.date, 
-- t.token_address,
s.type
-- s.symbol