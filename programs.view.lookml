- view: programs
  sql_table_name: |
    programs

  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id


  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: aff_res_proj
    label: 'Affiliated with a Residential Project'
    type: int
    sql: ${TABLE}.aff_res_proj

  - dimension: aff_res_proj_ids
    label: 'Affiliated Project Ids'
    sql: ${TABLE}.aff_res_proj_ids

  - dimension: allow_autoservice_placement
    type: int
    sql: ${TABLE}.allow_autoservice_placement

  - dimension: allow_goals
    type: yesno
    sql: ${TABLE}.allow_goals

  - dimension: allow_history_link
    type: yesno
    sql: ${TABLE}.allow_history_link

  - dimension: autoexit_duration
    type: int
    sql: ${TABLE}.autoexit_duration

  - dimension_group: availability_end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.availability_end

  - dimension_group: availability_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.availability_start

  - dimension: cascade_threshold
    type: int
    sql: ${TABLE}.cascade_threshold
    
  - dimension: availability
    sql_case:
            Limited: ${TABLE}.availability = 1
            Full: ${TABLE}.availability = 2
            else: None  



  - dimension: close_services
    type: yesno
    sql: ${TABLE}.close_services

  - dimension: cross_agency
    type: yesno
    sql: ${TABLE}.cross_agency

  - dimension: description
    sql: ${TABLE}.description

  - dimension: eligibility_enabled
    type: int
    sql: ${TABLE}.eligibility_enabled

  - dimension: enable_autoexit
    type: yesno
    sql: ${TABLE}.enable_autoexit

  - dimension: enable_cascade
    type: yesno
    sql: ${TABLE}.enable_cascade

  - dimension: enable_charts
    type: int
    sql: ${TABLE}.enable_charts

  - dimension: enable_files
    type: int
    sql: ${TABLE}.enable_files

  - dimension: enable_notes
    type: int
    sql: ${TABLE}.enable_notes

  - dimension: enable_assessments
    type: yesno
    sql: ${TABLE}.enable_assessments

  - dimension: funding_source
    hidden: true
    type: int
    sql: ${TABLE}.funding_source

  - dimension: geocode
    sql: ${TABLE}.geocode

  - dimension: identifier
    sql: ${TABLE}.identifier

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: name
    bypass_suggest_restrictions: true  
    sql: ${TABLE}.name
    
    
  - dimension: agency_project_name
    label: 'Full Name'
    bypass_suggest_restrictions: true
    sql: CONCAT(${agencies.name},' - ',${name})    

  - measure: list_of_program_names
    type: list
    list_field: agency_project_name


  - dimension: program_applicability
    hidden: true
    type: int
    sql: ${TABLE}.program_applicability

  - dimension: public_listing
    type: int
    sql: ${TABLE}.public_listing

  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_category
    hidden: true
    type: int
    sql: ${TABLE}.ref_category
    
  - dimension: project_type_code
    label: 'Project Type Code'
    bypass_suggest_restrictions: true
    sql: fn_getPicklistValueName('program_categories',${ref_category})   #program_categories

  - dimension: ref_site_type
    label: 'Site Type'
    sql: fn_getPicklistValueName('site_types',${TABLE}.ref_site_type)     

  - dimension: ref_target_b
    label: 'Target Population B'
    sql: fn_getPicklistValueName('targets_b',${TABLE}.ref_target_b)   

  - dimension: ref_template
    hidden: true
    type: int
    sql: ${TABLE}.ref_template

  - dimension: template
    bypass_suggest_restrictions: true
    sql: ${program_templates.name}    



  - dimension: ref_user_updated 
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)

  - dimension: site_id
    type: int
    hidden: true
    sql: ${TABLE}.site_id

  - dimension: status
    hidden: true
    type: yesno
    sql: ${TABLE}.status

  - dimension: tracking_method
    sql: fn_getPicklistValueName('tracking_method',${TABLE}.tracking_method)   
    
    
  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - sites.name
    - sites.id

