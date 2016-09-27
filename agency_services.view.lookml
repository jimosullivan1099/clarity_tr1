- view: agency_services
  sql_table_name: |
    services
    
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id
    
  - dimension: name
    bypass_suggest_restrictions: true
    sql: ${TABLE}.name

  - dimension: service_item_name
    sql: ${service_items.name}
    
  - dimension: service_item_id
    sql: ${service_items.id}
    
  - dimension: deleted
    type: yesno
    sql: ${service_items.deleted}    
        

  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_category
    label: 'Service Category'
    bypass_suggest_restrictions: true
    sql: fn_getPicklistValueName('service_categories',${TABLE}.ref_category)  
    
    
  - dimension: delivery_type
    bypass_suggest_restrictions: true
    sql_case:
       Long Term: ${service_items.ref_delivery_type} = 1
       Daily Attendance: ${service_items.ref_delivery_type} = 2
       Multiple Attendance: ${service_items.ref_delivery_type} = 3    

  - measure: count
    type: count


