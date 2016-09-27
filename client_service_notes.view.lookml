- view: client_service_notes
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: notes
    sql: fn_getSkipAllContentTags(${TABLE}.notes)
    
    
  - dimension: ref_client_service
    type: int
    sql: ${TABLE}.ref_client_service

  - dimension: ref_service_item
    type: int
    sql: ${TABLE}.ref_service_item

  - measure: count
    type: count
    drill_fields: [id]

