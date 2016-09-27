- view: questions
  sql_table_name: screen_fields
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: check
    hidden: true
    type: yesno
    sql: ${TABLE}.`check`

  - dimension: default_value
    type: string
    sql: ${TABLE}.default_value

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name
    
  - dimension: field_data_name
    type: string
    sql: ${fields.name}    

  - dimension_group: edit
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.edit_date

  - dimension: external_id
    type: string
    hidden: true
    sql: ${TABLE}.external_id

  - dimension: inline_with
    type: number
    hidden: true    
    sql: ${TABLE}.inline_with

  - dimension: mandatory
    type: yesno
    sql: ${TABLE}.mandatory

  - dimension: maxlength
    type: number
    sql: ${TABLE}.maxlength

  - dimension: protected
    type: number
    hidden: true    
    sql: ${TABLE}.protected

  - dimension: readonly
    type: yesno
    sql: ${TABLE}.readonly

  - dimension: ref_field
    hidden: true
    type: number
    sql: ${TABLE}.ref_field

  - dimension: ref_screen
    type: number
    hidden: true
    sql: ${TABLE}.ref_screen

  - dimension: rows
    type: number
    sql: ${TABLE}.rows

  - dimension: size
    type: number
    sql: ${TABLE}.size

  - dimension: sort
    type: number
    sql: ${TABLE}.sort

  - dimension: type
    sql: ${TABLE}.type

  - dimension: width
    type: number
    sql: ${TABLE}.width

  - measure: count
    type: count
    drill_fields: [id, display_name]

