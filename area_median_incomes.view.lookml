- view: area_median_incomes
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: income_amount
    type: number
    sql: ${TABLE}.income_amount

  - dimension: persons_count
    type: int
    sql: ${TABLE}.persons_count

  - dimension: ref_county
    type: int
    sql: ${TABLE}.ref_county

  - dimension: ref_income_type
    type: int
    sql: ${TABLE}.ref_income_type

  - measure: count
    type: count
    drill_fields: [id]

