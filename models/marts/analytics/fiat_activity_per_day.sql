
with cte as (
    select *
    from {{ ref('stablecoin_activity_per_day') }}
)

select * from cte
where type = 'Fiat-backed'   