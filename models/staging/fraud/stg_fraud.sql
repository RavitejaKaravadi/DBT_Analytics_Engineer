{{
    config(
        group = 'fraud_risk',
        access = 'private')
}}

select 
t.from_address,
c.bytecode,
count(c.bytecode) bytecode_count

from {{ ref('transactions_enriched') }} t

left join {{ ref('stg_contracts') }} c 
on t.receipt_contract_address = c.address

where t.transaction_category = 'contract_creation'
and c.bytecode is not null

group by 1,2

-- 0x0f6666bc699aec39b846e898473e9caec5a6b821
