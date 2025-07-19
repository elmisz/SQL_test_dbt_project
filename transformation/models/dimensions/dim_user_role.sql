/*
{{
  config(
    unique_key = ['user_id', 'user_role_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage as (
    select * from
    {{ ref("stg_salesforce__user_role") }}
),

enriched as
(
    select 
        stage.*
        , 'salesforce' AS source 
    from stage
)

select * from enriched 