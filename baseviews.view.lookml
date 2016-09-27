

- explore: base
  from: client_program_screening_base
  persist_for: 60 minutes
  label: 'HMIS Performance'
  conditionally_filter: 
    enrollments.date_filter: 'last quarter'
#     enrollments.start_date: 'before today'
#     enrollments.end_date_or_today_date: 'after 3 months ago'
  access_filter_fields: [agencies.id, agencies.coc, agencies.county]
  always_join: [clients]
  sql_always_where: clients.deleted is NULL or clients.deleted =0

  joins:
    - join: entry_screen
      sql_on: ${base.first_entry_screen_id} = ${entry_screen.id}  
      type: inner
      sql_always_where: ref_agency = 0

    - join: household_entry_screen
      view_label: 'Entry Screen'
      type: inner
      sql_on:  ${enrollments.ref_household} =  ${household_entry_screen.household_id}     

      
    - join: entry_custom
      view_label: 'Entry Screen'
      type: inner
      fields: [entry_custom_fields*]
      sql_on: ${entry_custom.ref_client_program_demographics} = ${entry_screen.id} 
        
    - join: last_screen
      sql_on: ${base.last_screening_to_analyze} = ${last_screen.id}
      type: left_outer
      
    - join: last_custom
      view_label: 'Update/Exit Screen'
      type: left_outer
      fields: [last_custom_fields*]
      sql_on: ${last_screen.id} = ${last_custom.ref_client_program_demographics}        
      
    - join: outbound_recidivism
      type: left_outer
      sql_on: ${last_screen.id} = ${outbound_recidivism.screen_id}
    
    - join: enrollments
      sql_on: ${base.ref_program} = ${enrollments.id}
      

    - join: client_program_staff
      fields: []
      sql_on: ${client_program_staff.ref_client_program} = ${enrollments.id}
      
    - join: members
      fields: []
      sql_on: ${client_program_staff.ref_user} = ${members.ref_user}    
      
    - join: programs
      fields: [ref_agency, name, project_type_code,  agency_project_name, id, list_of_program_names, added_date, description, geocode, tracking_method, template,  count]
      sql_on: ${enrollments.ref_program} = ${programs.id}
      
    - join: program_funding_sources
      sql_on: ${programs.id} = ${program_funding_sources.ref_program}     
      
    - join: program_templates
      fields: []
      sql_on: ${programs.ref_template} = ${program_templates.id}      
      
    - join: agencies
      fields: [id, coc, name, county]
      sql_on: ${programs.ref_agency} = ${agencies.id}
      
    - join: counties
      fields: []
      sql_on: ${counties.id} = ${agencies.ref_county}
            
      
    - join: household_makeup
      sql_on: ${enrollments.ref_household} = ${household_makeup.id}

    - join: clients
      sql_on: ${base.ref_client} = ${clients.id}

      
    - join: client_addresses
      sql_on: ${base.ref_client} = ${client_addresses.ref_client}  


    - join: static_demographics
      from: client_demographics
      view_label: 'Clients'
      type: inner
      fields: [id, gender, gender_text, ethnicity, ethnicity_text, name_middle, ref_client, race , race_text, veteran, veteran_text, veteran_branch, veteran_discharge,  veteran_theater_afg, veteran_theater_iraq1, veteran_theater_iraq2, veteran_theater_kw, veteran_theater_other, veteran_theater_pg, veteran_theater_vw, veteran_theater_ww2, veteran_entered, veteran_separated, zipcode]
      sql_on: ${clients.id} = ${static_demographics.ref_client}
      
    - join: static_demographics_custom
      from: client_custom
      fields: [client_custom_fields*]
      sql_on:  ${static_demographics.id} = ${static_demographics_custom.ref_client_demographics}
      
    - join: client_service_programs
      fields: []
      type: left_outer
      sql_on: ${enrollments.id} = ${client_service_programs.ref_client_program}
      
    - join: client_services
      fields: []
      relationship: one_to_one
      sql_on: ${client_services.id} = ${client_service_programs.ref_client_service} and ( ${client_services.deleted} is null OR ${client_services.deleted} =0 ) 
      
      
    - join: service_items
      fields: []
      relationship: one_to_one
      sql_on: ${service_items.id} = ${client_services.ref_service_item}

    - join: client_service_notes
      fields: []
      sql_on: ${client_service_notes.ref_client_service} = ${client_services.id}
      
    - join: service_expenses
      relationship: one_to_one
      sql_on: ${service_expenses.ref_client_service} = ${client_services.id}
      
    - join:  service_time_tracking
      relationship: one_to_one
      sql_on: ${service_time_tracking.ref_client_service} = ${client_services.id}      

    - join: services
      sql_on: ${service_items.ref_service} = ${services.id}
      
    - join: service_dates
      type: left_outer
      sql_on: ${service_dates.ref_client_service} = ${client_services.id}
      
    - join: client_assessments
      sql_on: ${clients.id} = ${client_assessments.ref_client} and  ( ${client_assessments.deleted} is null OR ${client_assessments.deleted} =0 ) 
      
    - join: client_assessment_scores
      fields: []
      sql_on: ${client_assessments.id} = ${client_assessment_scores.ref_assessment}
      
    - join: screens
      fields: []
      type: inner
      sql_on: ${screens.id} = ${client_assessments.ref_assessment}
      
    - join: client_assessment_custom
      sql_on: ${client_assessments.id} =${client_assessment_custom.ref_client_assessment_demographics}

    - join: release_of_information
      sql_on: ${release_of_information.ref_client} =${clients.id}  and ( ${release_of_information.deleted} is null OR ${release_of_information.deleted} =0 ) 

    - join: roi_agencies
      from: agencies
      fields: []
      sql_on: ${release_of_information.ref_agency} =${roi_agencies.id}


- explore: population
  label: 'HMIS Population over Time'
  access_filter_fields: [agencies.id, agencies.coc, agencies.county]
  always_join: [clients]
  sql_always_where: clients.deleted is NULL or clients.deleted =0
  joins:
   - join: entry_screen
     sql_on: ${population.first_entry_screen_id} = ${entry_screen.id}
     type: left_outer
 # #     - join: inbound_recidivism
# #       sql_on: ${entry_screen.id} = ${inbound_recidivism.screen_id}
# 
   - join: last_screen
     sql_on: ${population.last_screening_to_analyze} = ${last_screen.id}
     type: left_outer
#       
# #     - join: outbound_recidivism
# #       sql_on: ${last_screen.id} = ${outbound_recidivism.screen_id}
#     
   - join: enrollments
     sql_on: ${population.ref_program} = ${enrollments.id}
#       
   - join: programs
     fields: [ref_agency, name, project_type_code,  agency_project_name, id, list_of_program_names, added_date, description, tracking_method, template, count]
     sql_on: ${enrollments.ref_program} = ${programs.id}

   - join: program_templates
     fields: []
     sql_on: ${programs.ref_template} = ${program_templates.id}     
#       
   - join: agencies
     fields: [id, coc,  name, county]
     sql_on: ${programs.ref_agency} = ${agencies.id}
     
   - join: counties
     fields: []
     sql_on: ${counties.id} = ${agencies.ref_county}     
# 
#     - join: household_makeup
#       sql_on: ${enrollments.ref_household} = ${household_makeup.id}
#       
   - join: clients
     sql_on: ${population.ref_client} = ${clients.id}
# 
   - join: static_demographics
     from: client_demographics
#      required_joins: clients
     fields: [id, gender, gender_text, ethnicity, ethnicity_text, ref_client, race, race_text, veteran, veteran_text]
     sql_on: ${clients.id} = ${static_demographics.ref_client}






- explore: clients
  persist_for: 60 minutes
  label: 'Services Model'
  access_filter_fields: [agencies.id, agencies.coc, agencies.county]

  joins:

    - join: static_demographics
      from: client_demographics
      type: inner
      fields: [id, gender, gender_text, ethnicity, ethnicity_text, ref_client, race , race_text, veteran, veteran_text, veteran_branch, veteran_discharge,  veteran_theater_afg, veteran_theater_iraq1, veteran_theater_iraq2, veteran_theater_kw, veteran_theater_other, veteran_theater_pg, veteran_theater_vw, veteran_theater_ww2,   zipcode]
      sql_on: ${clients.id} = ${static_demographics.ref_client}
      
    - join: static_demographics_custom
      from: client_custom
      fields: [static_demographics_custom.client_custom_fields*]
#      sql_on:  ${clients.id} = ${static_demographics_custom.ref_client}
      sql_on:  ${static_demographics.id} = ${static_demographics_custom.ref_client_demographics}      

    - join: client_services
      relationship: one_to_many
      fields: []
      sql_on: ${client_services.ref_client} = ${clients.id} and ( ${client_services.deleted} is null OR ${client_services.deleted} =0 ) 

    - join: service_items
      fields: []
      type: inner
#       required_joins: client_services
      sql_on: ${service_items.id} = ${client_services.ref_service_item}
      
    - join: service_dates
      type: left_outer
      sql_on: ${service_dates.ref_client_service} = ${client_services.id}      

    - join: client_service_notes
      fields: []
      sql_on: ${client_service_notes.ref_client_service} = ${client_services.id}
      
    - join: service_expenses
#       fields: []
      relationship: one_to_one
      sql_on: ${service_expenses.ref_client_service} = ${client_services.id}

    - join:  service_time_tracking
      relationship: one_to_one
      sql_on: ${service_time_tracking.ref_client_service} = ${client_services.id}            


    - join: services
      type: inner
      sql_on: ${service_items.ref_service} = ${services.id}


    - join: agencies
      fields: [id, coc, county, name]
      sql_on: ${client_services.ref_agency} = ${agencies.id}

    - join: counties
      fields: []
      sql_on: ${counties.id} = ${agencies.ref_county}         
      
    - join: client_addresses
      sql_on: ${clients.id} = ${client_addresses.ref_client}  
      
    - join: client_assessments
      sql_on: ${clients.id} = ${client_assessments.ref_client}
      
    - join: client_assessment_scores
      fields: []
      sql_on: ${client_assessments.id} = ${client_assessment_scores.ref_assessment}
      
    - join: screens
      fields: []
      type: inner
      sql_on: ${screens.id} = ${client_assessments.ref_assessment}
      
    - join: client_assessment_custom
      sql_on: ${client_assessments.id} =${client_assessment_custom.id}     
      
    - join: enrollments
      sql_on: ${clients.id} = ${enrollments.ref_client}  

    - join: members
      fields: []
      sql_on: ${enrollments.ref_user} = ${members.ref_user}          
      
      
- explore: client
  from: clients
  persist_for: 60 minutes
  label: '** BETA ** Coordinated Entry'
  access_filter_fields: [agencies.id, agencies.coc, agencies.county]
  sql_always_where: client.deleted is NULL or client.deleted =0
  joins:


    - join: client_addresses
      sql_on: ${client.id} = ${client_addresses.ref_client}  
    

    - join: static_demographics
      from: client_demographics
      fields: [id, gender, gender_text, ethnicity, ethnicity_text, ref_client, race , race_text, veteran, veteran_text]
      sql_on: ${client.id} = ${static_demographics.ref_client}
      
    - join: static_demographics_custom
      from: client_custom
      fields: [static_demographics_custom.client_custom_fields*]
      sql_on:  ${static_demographics.id} = ${static_demographics_custom.ref_client_demographics}

    - join: agencies 
      from: agencies
      fields: [id, coc, name, county]
      sql_on: ${client_assessments.ref_agency} = ${agencies.id}
      
    - join: counties
      fields: []
      sql_on: ${counties.id} = ${agencies.ref_county}      
      
    - join: client_assessments
      sql_on: ${client.id} = ${client_assessments.ref_client} and  ( ${client_assessments.deleted} is null OR ${client_assessments.deleted} =0 ) 
      required_joins: client_assessment_scores
      
    - join: client_assessment_scores
      fields: []
    #  type: inner  -- commented out until the yspdat processor is really per JS request.
      sql_on: ${client_assessments.id} = ${client_assessment_scores.ref_assessment}
      
    - join: screens
      fields: []
      type: inner
      sql_on: ${screens.id} = ${client_assessments.ref_assessment}
      
    - join: client_assessment_custom
      sql_on: ${client_assessments.id} =${client_assessment_custom.ref_client_assessment_demographics}     

    - join: referrals
      sql_on: ${client.id} = ${referrals.ref_client}  and ${client_assessments.id} = ${referrals.ref_assessment} and ${referrals.deleted} is NULL
     # sql_on: ${client_assessments.id} = ${referrals.ref_assessment}
    
    - join: referring_agencies
      from: agencies
      fields: []
      sql_on: ${referrals.ref_agency} = ${referring_agencies.id}  
      
    - join: referto_program
      from: programs
      fields: [ref_agency, name, project_type_code, id,  list_of_program_names, added_date, description, geocode, availability, tracking_method, count]
      sql_on: ${referrals.ref_program} = ${referto_program.id}  
      
    - join: referto_program_openings
      from: program_openings
      sql_on: ${referto_program_openings.id} = ${referrals.ref_opening} #  and referto_program_openings.status =1 #${referto_program_openings.ref_program} = ${referto_program.id} 
      
    - join: enrollments
      sql_on: ${client.id} = ${enrollments.ref_client}     

    - join: members
      fields: []
      sql_on: ${enrollments.ref_user} = ${members.ref_user}    
      
    - join: programs
      fields: [ref_agency, name, project_type_code, id, list_of_program_names, added_date, description, geocode, count]
      sql_on: ${enrollments.ref_program} = ${programs.id}      
            
      
      
- explore: agencies
  label: 'Project Descriptor Model'
  access_filter_fields: [agencies.id, agencies.coc, agencies.county]
#  always_join: [programs]
  sql_always_where:  agencies.status = 1
  joins:

    - join: counties
      fields: []
      sql_on: ${counties.id} = ${agencies.ref_county}  
      
    - join: programs
      from: programs
      relationship: one_to_many
      sql_on: ${agencies.id} = ${programs.ref_agency} and  ( programs.deleted is null OR programs.deleted =0 )  
      
    - join: program_funding_sources
      sql_on: ${programs.id} = ${program_funding_sources.ref_program}
      
    - join: program_openings
      sql_on: ${program_openings.ref_program} = ${programs.id}       
            

    - join: program_templates
      fields: []
      sql_on: ${programs.ref_template} = ${program_templates.id}
      
    - join: agency_assessments
      fields: []
      sql_on: ${agencies.id} = ${agency_assessments.ref_agency}

    - join: screens
      type: inner
      sql_on: ${screens.id} = ${agency_assessments.ref_assessment}
      
    - join: questions
      sql_on: ${screens.id} = ${questions.ref_screen}
      
    - join: fields
      fields: []
      sql_on: ${fields.id} = ${questions.ref_field}
      
      
      
      

    - join: members
      sql_on: ${agencies.id} = ${members.ref_agency} 
    
    - join: users
      fields: []
      sql_on: ${users.id} = ${members.ref_user}
      
    - join: user_agencies
      fields: []
      sql_on: ${users.id} = ${user_agencies.ref_user}
      
    - join: member_additional_agencies
      field: [name, county, id, coc]
      from: agencies
      sql_on: ${user_agencies.ref_agency} = ${member_additional_agencies.id}    
            
      
    - join: user_groups
      fields: []
      sql_on: ${users.ref_user_group} = ${user_groups.id}     
      
            
      
    - join: agency_services
      from: agency_services
      sql_on: ${agencies.id} = ${agency_services.ref_agency}  
      
    - join: service_items
      fields: []
      sql_on: ${service_items.ref_service} = ${agency_services.id}      
      
    - join: bed_inventories
      from: service_items_housing
      type: inner
      sql_on: ${service_items.id} = ${bed_inventories.ref_service_item}
      sql_always_where: deleted = 0 or deleted is null






