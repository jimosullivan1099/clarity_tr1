- view: service_time_tracking
  sql_table_name: |
    client_service_time_tracking
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension_group: last_updated
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: ref_client_service
    hidden: true
    sql: ${TABLE}.ref_client_service

  - dimension: ref_date
    hidden: true
    type: int
    sql: ${TABLE}.ref_date

  - dimension: ref_user_updated
    hidden: true
    type: int
    sql: ${TABLE}.ref_user_updated

  - dimension: tracking_hour
    type: int
    sql: ${TABLE}.tracking_hour

  - dimension: tracking_minute
    type: int
    sql: ${TABLE}.tracking_minute

  - dimension: tracking_time
    label: 'Total Time in Minutes'
    type: int
    sql: coalesce(${tracking_hour},0) * 60 +  coalesce(${tracking_minute},0)
    
  - measure: total_time_in_hours
    type: sum
    value_format_name: decimal_2
    sql: ${tracking_time}/60

  - measure: count
    type: count
    drill_fields: [id]

