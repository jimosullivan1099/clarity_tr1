- view: clients

  fields:

  - dimension: id
    label: 'Personal Id '
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: id_with_profile_link
    label: 'Personal Id with Profile Link'
    sql: ${TABLE}.id
    html: |
      {{ linked_value }}
      <a href=https://{{ _access_filters["site.name"]] }}.clarityhs.com/clients/{{ value }}/profile target=_new> [Profile]</a>
#       
#   - dimension: client_photo
#     sql: ${id}
#     html: |
#       <img src="https://{{ _access_filters["site.name"]] }}.clarityhs.com/clients/{{ value }}/profile/photo/thumb/photo.jpg" />      
#       
  - dimension_group: added
    label: 'Date Created'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: alias
    sql: ${TABLE}.alias

  - dimension_group: birth
    label: 'Date of Birth'
    description: ' This is the clients date of birth'
    type: time
    timeframes: [date, week, month, year]
    convert_tz: false
    sql: ${TABLE}.birth_date
    
  - dimension: age
    label: 'Current Age'
    description: ' This is the age of the client as of when this report was last run'
    type: number
    sql: YEAR(NOW()) - YEAR(${birth_date}) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(${birth_date}, '%m%d'))

  - dimension: age_tier
    type: tier
    style: integer
    tiers: [0,18,25,35,45,55,65]
    suggest: true
    sql: ${age}
    
  - measure: average_age
    type: average
    sql: ${age}

  - dimension: dob_quality
    label: 'DoB Data Quality'
    sql: fn_getPicklistValueName('dob_quality', ${TABLE}.dob_quality)


  - dimension: first_name
    sql: ${TABLE}.first_name

  - dimension: private
    type: yesno
    sql: ${TABLE}.private

  - dimension: image
    hidden: true
    type: yesno
    sql: ${TABLE}.image

  - dimension: last_name
    label: 'Last Name'
    sql: ${TABLE}.last_name
    
  - dimension: full_name
    label: 'Client Full Name'
    sql: CONCAT(${first_name},' ',${last_name})
    required_fields: [id]



  - dimension_group: last_updated_date
    label: 'Date Updated'
    type: date
    sql: ${TABLE}.last_updated

  - dimension: name_quality
    label: 'Name Data Quality'
    sql: fn_getPicklistValueName('name_quality', ${TABLE}.name_quality)
    
  - dimension: ref_agency_created
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency_created

  - dimension: ref_user_updated 
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)

  - dimension: ssn
    label: 'SSN'
    sql: ${TABLE}.ssn

  - dimension: ssn1
    hidden: true
    sql: ${TABLE}.ssn1

  - dimension: ssn2
    hidden: true
    sql: ${TABLE}.ssn2

  - dimension: ssn3
    label: 'SSN - Last 4'
    sql: ${TABLE}.ssn3

  - dimension: ssn_quality
    label: 'SSN Data Quality'
    sql: fn_getPicklistValueName('ssn_quality', ${TABLE}.ssn_quality)

  - dimension: unique_identifier
    sql: ${TABLE}.unique_identifier
    
  - dimension: general_id
    sql: ${TABLE}.general_id    

  - measure: count
    label: 'Number of Clients'
    type: count_distinct
    drill_fields: detail*
    sql: ${TABLE}.id

    



# SETS #

  sets:
    detail:
      - clients.id
      - id_with_profile_link
      - clients.full_name
      - clients.age
      - programs.name
      - client_programs.start_date
      - client_programs.end_date

