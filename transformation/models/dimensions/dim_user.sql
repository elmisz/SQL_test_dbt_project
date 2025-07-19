/*
{{
  config(
    unique_key = ['user_id', 'user_role_id', 'source'],
    incremental_strategy = 'merge'
  )
}}
*/

with stage__user as (
    select * from
    {{ ref("stg_salesforce__user") }}
),
stage__user_role as (
    select * from
    {{ ref("stg_salesforce__user_role") }}
),

enriched__user as
(
    select 
        stage__user.*
        , 'salesforce' AS source
    from stage__user
),
enriched__user_role as
(
    select 
        stage__user_role.*
        , 'salesforce' AS source 
    from stage__user_role
), 
user_joined as (
  select * from
  enriched__user inner join enriched__user_role
    on enriched__user.userroleid = enriched__user_role.user_role_id
    and enriched__user.source = enriched__user_role.source
)

select * from user_joined 