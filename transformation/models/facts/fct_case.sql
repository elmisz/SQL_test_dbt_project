/*
{{
  config(
    unique_key = ['case_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage as (
    select * from
    {{ ref("stg_salesforce__case") }}
), 

enriched as
(
    select 
        stage.*
        , 'salesforce' AS source
    from stage
)
select * from enriched 