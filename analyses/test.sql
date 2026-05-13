
--  {{ audit_helper.compare_relations(source('dbt_analytics_engineer', 'contracts'), source('dbt_analytics_engineer', 'contracts_clone')) }}

{{ codegen.generate_model_yaml(['stablecoin_activity_per_day']) }}