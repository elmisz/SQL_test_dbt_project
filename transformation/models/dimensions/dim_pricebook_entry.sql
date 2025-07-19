/*
{{
  config(
    unique_key = ['pricebook_entry_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage as (
    select * from
    {{ ref("stg_salesforce__pricebook_entry") }}
), 

enriched as
(
    select 
        stage.*
        , 'salesforce' AS source
    from stage
)
select * from enriched 