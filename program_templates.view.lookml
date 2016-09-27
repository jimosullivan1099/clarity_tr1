- view: program_templates
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: auto_provision
    type: yesno
    sql: ${TABLE}.auto_provision

  - dimension: case_screen
    type: number
    sql: ${TABLE}.case_screen

  - dimension: enroll_screen
    type: number
    sql: ${TABLE}.enroll_screen

  - dimension: exit_screen
    type: number
    sql: ${TABLE}.exit_screen

  - dimension: followup_screen
    type: number
    sql: ${TABLE}.followup_screen

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: ref_case_status
    type: number
    sql: ${TABLE}.ref_case_status

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id, name]

