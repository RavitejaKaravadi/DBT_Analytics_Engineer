

def model(dbt, session):
    my_sql_model_df = dbt.source("dbt_analytics_engineer", "contracts")

    return my_sql_model_df