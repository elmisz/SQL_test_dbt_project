/*
{{
  config(
    unique_key = ['case_history_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage as (
    select * from
    {{ ref("stg_salesforce__case_history_2") }}
), 

enriched as
(
    select 
        stage.*
        , 'salesforce' AS source
    from stage
)
select * from enriched 