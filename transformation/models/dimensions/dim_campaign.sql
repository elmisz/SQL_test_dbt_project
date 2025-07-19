/*
{{
  config(
    unique_key = ['campaign_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage as (
    select * from
    {{ ref("stg_salesforce__campaign") }}
), 

enriched as
(
    select 
        stage.*
        , 'salesforce' AS source
    from stage
)
select * from enriched 