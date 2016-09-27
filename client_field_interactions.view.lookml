- view: client_field_interactions
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude
    
  - dimension: client_location
    type: location
    sql_latitude:  ${TABLE}.latitude
    sql_longitude: ${TABLE}.longitude

  - dimension: ref_agency
    type: number
    sql: ${TABLE}.ref_agency

  - dimension: ref_client
    type: number
    sql: ${TABLE}.ref_client

  - dimension: ref_user
    type: number
    sql: ${TABLE}.ref_user

  - dimension: ref_user_updated
    type: number
    sql: ${TABLE}.ref_user_updated

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: zip
    type: string
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: [id]

