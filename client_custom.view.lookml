- view: client_custom
  sql_table_name: |
    client_data
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    type: int
    sql: ${TABLE}.id




  - dimension: ref_client_demographics
    hidden: true
    type: int
    sql: ${TABLE}.ref_client_demographics

  - dimension: c_vet_eligibility
    sql: fn_getPicklistValueName('c_vet_eligibility',COLUMN_GET(${TABLE}.custom_data,'c_vet_eligibility' as INT))

  - dimension: c_vet_verified
    sql: fn_getPicklistValueName('c_vet_verified',COLUMN_GET(${TABLE}.custom_data,'c_vet_verified' as INT))

  - dimension: vet_selfreported
    sql: fn_getPicklistValueName('vet_selfreported',COLUMN_GET(${TABLE}.custom_data,'vet_selfreported' as INT))

  - dimension: c_va_ineligible
    sql: fn_getPicklistValueName('c_va_ineligible',COLUMN_GET(${TABLE}.custom_data,'c_va_ineligible' as INT))




  - measure: count
    type: count
    drill_fields: []
 
    
  sets:
      client_custom_fields:
      - id
      - c_vet_eligibility
      - c_vet_verified
      - vet_selfreported
      - c_va_ineligible

