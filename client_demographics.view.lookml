- view: client_demographics

  fields:

  - dimension: id
    primary_key: true
    hidden: true
    type: int
    sql: ${TABLE}.id

  - dimension: ethnicity
    type: int
    hidden: true
    sql: ${TABLE}.ethnicity
    
    
  - dimension: ethnicity_text
    label: 'Ethnicity'
    suggest: true
    bypass_suggest_restrictions: true
    sql: fn_getPicklistValueName('ethnicity',${ethnicity})    


      
  - dimension: name_middle
    label: 'Middle Name'
    sql: ${TABLE}.name_middle


  - dimension: gender
    type: int
    hidden: true
    sql: ${TABLE}.gender
    
  - dimension: gender_text
    label: 'Gender'
    sql: fn_getPicklistValueName('gender',${gender})
    bypass_suggest_restrictions: true
    suggestions: ['Male','Female','Transgender Female to Male','Transgender Male to Female','Other','Client doesn`t know','Client refused','Data not collected']

  - dimension: race
    type: int
    hidden: true
    sql: ${TABLE}.race
    
  - dimension: race_text
    label: 'Race'
    bypass_suggest_restrictions: true
    sql:  fn_getRaceStringByRaceCode(${TABLE}.race)  
   

    
  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client
    hidden: true
    type: int
    sql: ${TABLE}.ref_client

  - dimension: veteran
    hidden: true
    type: int
    sql: ${TABLE}.veteran
    
  - dimension: veteran_text
    label: 'Veteran Status'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran',${veteran})
    bypass_suggest_restrictions: true

  - dimension: veteran_branch
    label: 'Branch of Military'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_branch',${TABLE}.veteran_branch)

  - dimension: veteran_discharge
    label: 'Discharge Status'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_discharge',${TABLE}.veteran_discharge)

  - dimension: veteran_duration
    type: int
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_duration

  - dimension: veteran_entered
    label: 'Year Entered Military Service'
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_entered

  - dimension: veteran_era
    type: int
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_era

  - dimension: veteran_fire
    type: int
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_fire

  - dimension: veteran_separated
    label: 'Year Separated from Military Service'
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_separated

  - dimension: veteran_theater_afg
    label: 'Theatre - Afghanistan OEF'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_afg',${TABLE}.veteran_theater_afg)

  - dimension: veteran_theater_iraq1
    label: 'Theatre - Iraq OIF'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_iraq1',${TABLE}.veteran_theater_iraq1)

  - dimension: veteran_theater_iraq2
    label: 'Theatre - Iraq OND'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_iraq2',${TABLE}.veteran_theater_iraq2)

  - dimension: veteran_theater_kw
    label: 'Theatre - Korean War'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_kw',${TABLE}.veteran_theater_kw)

  - dimension: veteran_theater_other
    label: 'Theatre - Other'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_other',${TABLE}.veteran_theater_other)

  - dimension: veteran_theater_pg
    label: 'Theatre - Persian Gulf ODS'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_pg',${TABLE}.veteran_theater_pg)

  - dimension: veteran_theater_vw
    label: 'Theatre - Vietnam War'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_vw',${TABLE}.veteran_theater_vw)


  - dimension: veteran_theater_ww2
    label: 'Theatre - World War II'
    group_label: 'Veteran Information' 
    sql: fn_getPicklistValueName('veteran_theater_ww2',${TABLE}.veteran_theater_ww2)

  - dimension: veteran_warzone
    type: int
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_warzone

  - dimension: veteran_warzone_duration
    type: int
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_warzone_duration

  - dimension: veteran_warzone_is
    type: int
    group_label: 'Veteran Information' 
    sql: ${TABLE}.veteran_warzone_is
    
  - dimension: zipcode
    label: 'Zipcode on Profile'
    type: zipcode
    sql: ${TABLE}.zipcode

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:


