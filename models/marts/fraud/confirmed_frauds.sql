{{
    config(
        materialized = 'table',
        group = 'fraud_risk',
        access = 'private')
}}

select *
from {{ref('stg_fraud')}}
where from_address = '0x0f6666bc699aec39b846e898473e9caec5a6b821'