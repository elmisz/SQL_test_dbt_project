/*
{{
  config(
    unique_key = ['opportunity_history_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage as (
    select * from
    {{ ref("stg_salesforce__opportunity_history") }}
), 

enriched as
(
    select 
        stage.*
        , 'salesforce' AS source
    from stage
)
select * from enriched 