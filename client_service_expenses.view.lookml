- view: service_expenses
  sql_table_name: |
    client_service_expenses

  fields:

  - dimension: id
    hidden: true
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: amount
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount

  - measure: total_amount
    type: sum
    value_format_name: usd
    sql: ${TABLE}.amount


  - dimension: check_number
    sql: ${TABLE}.check_number

  - dimension_group: date
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date

  - dimension_group: last_updated
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client_service
    hidden: true
    type: int
    sql: ${TABLE}.ref_client_service

  - dimension: ref_date
    hidden: true
    type: int
    sql: ${TABLE}.ref_date

  - dimension: ref_funding
    hidden: true
    type: int
    sql: ${TABLE}.ref_funding

  - dimension: ref_service_item
    hidden: true
    type: int
    sql: ${TABLE}.ref_service_item

  - dimension: ref_user_updated
    hidden: true
    type: int
    sql: ${TABLE}.ref_user_updated

  - dimension: vendor
    sql: ${TABLE}.vendor

  - measure: count
    type: count
    drill_fields: [id]

