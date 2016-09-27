- view: entry_screen
  sql_table_name: |
    client_program_demographics
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: age
    label: 'Age at Entry'
    type: number
    sql: YEAR(${enrollments.start_date}) - YEAR(${clients.birth_date}) - (DATE_FORMAT(${enrollments.start_date}, '%m%d') < DATE_FORMAT(${clients.birth_date}, '%m%d'))

  - dimension: age_tier
    type: tier
    style: integer
    tiers: [0,18,25,35,45,55,65]
    sql: ${age}

  - dimension: relationship_to_hoh
    sql: fn_getPicklistValueName('relationship_to_hoh',${TABLE}.relationship_to_hoh)

  - measure: total_adults
    type: count_distinct   # can be average, sum, min, max, count, count_distinct, or number
    sql: ${ref_client}
    filters:
      age: '>=18'

  - measure: total_children
    type: count_distinct   # can be average, sum, min, max, count, count_distinct, or number
    sql: ${ref_client}
    filters:
      age: '<18'

  - dimension: benefits_snap
    label: 'SNAP'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefit_snap
    
  - dimension: benefits_medicaid
    label: 'Medicaid'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.benefits_medicaid

  - dimension: benefits_medicare
    label: 'Medicare'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.benefits_medicare

  - dimension: benefits_no_insurance
    label: 'No Health Insurance'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.benefits_no_insurance

  - dimension: benefits_noncash
    label: '_Any Non Cash Benefit'
#     sql: ${TABLE}.benefits_noncash
    group_label: 'Non-Cash Benefits'
    sql: fn_getPicklistValueName('benefits_noncash', ${TABLE}.benefits_noncash)

  - dimension: benefits_other
    hidden: true
    type: int
    sql: ${TABLE}.benefits_other

  - dimension: benefits_other_source
    hidden: true
    sql: ${TABLE}.benefits_other_source

  - dimension: benefits_private_insurance
    label: 'Private Insurance'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.benefits_private_insurance

  - dimension: benefits_schip
    label: 'SCHIP'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.benefits_schip

  - dimension: benefits_section8
    label: 'Section 8'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefits_section8

  - dimension: benefits_tanf_childcare
    label: 'TANF Childcare'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefits_tanf_childcare

  - dimension: benefits_tanf_other
    label: 'TANF Other'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefits_tanf_other

  - dimension: benefits_tanf_transportation
    label: 'TANF Transportaion'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefits_tanf_transportation

  - dimension: benefits_temp_rent
    label: 'Temporary Rental Assistance'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefits_temp_rent

  - dimension: benefits_va_medical
    label: 'VA Medical Insurance'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.benefits_va_medical

  - dimension: benefits_wic
    label: 'WIC'
    type: yesno
    group_label: 'Non-Cash Benefits'
    sql: ${TABLE}.benefits_wic

  - dimension: chronic_1
    hidden: true
    type: int
    sql: ${TABLE}.chronic_1

  - dimension: chronic_2
    label: 'Times Homeless in the Past Three Years'
    sql: fn_getPicklistValueName('chronic_2',${TABLE}.chronic_2)

  - dimension: chronic_3
    label: 'Length of time on street, in an emergency shelter, or safe haven'
    sql: fn_getPicklistValueName('chronic_3',${TABLE}.chronic_3)


  - dimension: chronic_4
    hidden: true
    type: int
    sql: ${TABLE}.chronic_4

  - dimension: chronic_5
    hidden: true
    type: int
    sql: ${TABLE}.chronic_5
    
  - dimension: chronic_6
    label: "Client Entering from Streets..."
    sql: fn_getPicklistValueName('chronic_6',${TABLE}.chronic_6)

  - dimension: chronic_7
    label: 'Approximate Date Homelessness Started'
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.chronic_7    


  - dimension: chronic_homeless_calculation_2014
    bypass_suggest_restrictions: true  
    type: yesno
    sql: |
      ${enrollments.head_of_household} = 1
      AND ${TABLE}.disabled = 1 AND  
      ( ${TABLE}.chronic_1 = 1 OR  ${TABLE}.chronic_2 = 4)

  - dimension: chronic_homeless_calculation
    label: 'Chronic Homeless at Project Entry'
    type: yesno
    sql: fn_isChronicallyHomelessProjectStay(${enrollments.ref_household},${enrollments.start_date},CURDATE())
    
  - dimension: chronic_homeless_calculation_PIT
    label: 'Chronic Homeless at PIT/Current Date'
    type: yesno
    sql: fn_isChronicallyHomelessPit(${enrollments.ref_household},CURDATE())    
 
  - dimension: client_location
    label: 'CoC Code of Client on Enrollment'
    sql: ${TABLE}.client_location

  - dimension: disabled
    hidden: true
    type: int
    sql: ${TABLE}.disabled

  - dimension: any_disability
    label: '_Any Disability'
    group_label: 'Disability Types'
    sql_case:
            No Disability: ${disabled} = 0
            Disability: ${disabled} = 1
            else: Unknown


  - dimension: disabiing_condition
    label: 'Disabling Condition'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('disabled',${TABLE}.disabled)


  - dimension: health_chronic
    label: 'Chronic Health'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_chronic',${TABLE}.health_chronic)
  
  - dimension: health_chronic_services
    label: 'Chronic Health Services'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_chronic_services',${TABLE}.health_chronic_services)

  #- dimension: health_chronic_documented
  #  type: int
  #  sql: ${TABLE}.health_chronic_documented

  #- dimension: health_chronic_longterm
  #  type: int
  #  sql: ${TABLE}.health_chronic_longterm

  #- dimension: health_chronic_services
  #  type: int
  #  sql: ${TABLE}.health_chronic_services

  - dimension: health_dev_disability
    label: 'Developmental'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_dev_disability',${TABLE}.health_dev_disability)    

  - dimension: health_dev_disability_services
    label: 'Developmental Services'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_dev_disability_services',${TABLE}.health_dev_disability_services)



  #- dimension: health_dev_disability_documented
  #  type: int
  #  sql: ${TABLE}.health_dev_disability_documented

  #- dimension: health_dev_disability_independence
  #  type: int
  #  sql: ${TABLE}.health_dev_disability_independence

  #- dimension: health_dev_disability_services
  #  type: int
  #  sql: ${TABLE}.health_dev_disability_services

  - dimension: health_dv
    label: 'Domestic Violence'
    sql: fn_getPicklistValueName('health_dv',${TABLE}.health_dv)    

  - dimension: health_dv_occurred
    sql: fn_getPicklistValueName('health_dv_occurred',${TABLE}.health_dv_occurred)

  - dimension: Employed
    sql: fn_getPicklistValueName('employment_is',${TABLE}.employment_is)

  - dimension: health_general
    sql: fn_getPicklistValueName('health_general',${TABLE}.health_general)

  - dimension: health_hiv
    label: 'HIV/AIDS'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_hiv',${TABLE}.health_hiv)    
    
  - dimension: health_hiv_services
    label: 'HIV/AIDS Services'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_hiv_services',${TABLE}.health_hiv_services)    


#  - dimension: health_hiv_documented
#    type: int
#    sql: ${TABLE}.health_hiv_documented

#  - dimension: health_hiv_independence
#    type: int
#    sql: ${TABLE}.health_hiv_independence

#  - dimension: health_hiv_services
#    type: int
#    sql: ${TABLE}.health_hiv_services

  - dimension: health_ins_cobra
    label: 'COBRA'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.health_ins_cobra

  - dimension: health_ins_emp
    label: 'Employer Provided'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.health_ins_emp

  - dimension: health_ins_ppay
    label: 'Private Pay'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.health_ins_ppay

  - dimension: health_ins_state
    label: 'State Insurance for Adults'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.health_ins_state

  - dimension: health_insurance
    label: '_Covered by Health Insurance'
    type: yesno
    group_label: 'Health Insurance'
    sql: ${TABLE}.health_insurance

  - dimension: health_mental
    label: 'Mental Health'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_mental',${TABLE}.health_mental)

  - dimension: health_mental_services
    label: 'Mental Health Services'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_mental_services',${TABLE}.health_mental_services)


#   - dimension: health_mental_confirmed
#     type: int
#     sql: ${TABLE}.health_mental_confirmed
# 
#   - dimension: health_mental_documented
#     type: int
#     sql: ${TABLE}.health_mental_documented
# 
#   - dimension: health_mental_longterm
#     type: int
#     sql: ${TABLE}.health_mental_longterm
# 
#   - dimension: health_mental_services
#     type: int
#     sql: ${TABLE}.health_mental_services
# 
#   - dimension: health_mental_smi
#     type: int
#     sql: ${TABLE}.health_mental_smi

  - dimension: health_phys_disability
    label: 'Physical'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_phys_disability',${TABLE}.health_phys_disability)
    
  - dimension: health_phys_disability_services
    label: 'Physical Services'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_phys_disability_services',${TABLE}.health_phys_disability_services)
    
# 
#   - dimension: health_phys_disability_documented
#     type: int
#     sql: ${TABLE}.health_phys_disability_documented
# 
#   - dimension: health_phys_disability_longterm
#     type: int
#     sql: ${TABLE}.health_phys_disability_longterm
# 
#   - dimension: health_phys_disability_services
#     type: int
#     sql: ${TABLE}.health_phys_disability_services
# 
  - dimension: health_pregnancy
    label: 'Pregnancy Status'
    sql: fn_getPicklistValueName('health_pregnancy',${TABLE}.health_pregnancy)
# 
#   - dimension_group: health_pregnancy
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.health_pregnancy_date

  - dimension: health_substance_abuse
    label: 'Substance Abuse'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_substance_abuse',${TABLE}.health_substance_abuse)
    
  - dimension: health_substance_abuse_services
    label: 'Substance Abuse Services'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_substance_abuse_services',${TABLE}.health_substance_abuse_services)    

#   - dimension: health_substance_abuse_confirmed
#     type: int
#     sql: ${TABLE}.health_substance_abuse_confirmed
# 
#   - dimension: health_substance_abuse_documented
#     type: int
#     sql: ${TABLE}.health_substance_abuse_documented
# 
#   - dimension: health_substance_abuse_longterm
#     type: int
#     sql: ${TABLE}.health_substance_abuse_longterm
# 
#   - dimension: health_substance_abuse_services
#     type: int
#     sql: ${TABLE}.health_substance_abuse_services

  #- dimension: housing_ass_exit
   # type: int
  #  sql: ${TABLE}.housing_ass_exit

  #- dimension: housing_ass_exit_1
  #  type: int
  #  sql: ${TABLE}.housing_ass_exit_1

  #- dimension: housing_ass_exit_2
  #  type: int
  #  sql: ${TABLE}.housing_ass_exit_2

  - dimension: housing_status
    hidden: true
    type: int
    sql: ${TABLE}.housing_status

  - dimension: housing_status_text
    label: 'Housing Status @ Entry'
    sql: fn_getPicklistValueName('housing_status',${housing_status})

  - dimension: entered_stably_housed
    type: yesno
    sql: ${housing_status_text} = 'Stably housed'

  - measure: count_stably_housed
    type: count_distinct
    sql: ${ref_client}
    filters:
      housing_status_text: 'Stably housed'
      
  - measure: count_asked_about_housing
    hidden: true
    type: count_distinct
    sql: ${ref_client}
    filters:
      housing_status_text: -NULL
      
  - measure: percent_stably_housed
    hidden: true
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_stably_housed} / NULLIF(${count_asked_about_housing},0)

  - dimension: income_cash
    hidden: true
    type: number
    value_format_name: usd
    sql: ${TABLE}.income_cash

  - dimension: income_cash_is
    hidden: true
    type: int
    sql: ${TABLE}.income_cash_is

  - dimension: any_income
    label: '_Income from any Source'
    group_label: 'Income Sources and Amounts'
    sql_case:
            No Income: ${income_cash_is} = 0
            Income: ${income_cash_is} = 1
            else: Unknown
            
  - dimension: income_childsupport
    label: 'Child Support Amount'
    type: int
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_childsupport

  - dimension: income_childsupport_is
    label: 'Child Support'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_childsupport_is

  - dimension: income_earned
    label: 'Income: Earned Income Amount'
    type: number
    hidden: true
    sql: ${TABLE}.income_earned
    
  - dimension: income_earned_tier
    label: 'Earned Income Tiers'
    type: tier
    style: integer
    tiers: [0,100,500,1000,5000]
    group_label: 'Income Sources and Amounts'
    sql: ${income_earned}
    
  - measure: average_income_earned
    label: 'Earned Income Average'
    type: average   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    drill_fields: [income_earned_tier, count]
    group_label: 'Income Sources and Amounts'
    sql: ${income_earned}
    drill_fields: detail*
    
  - measure: average_cash_income
    label: 'Average Cash Income'
    type: average   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_individual}      

 
  - measure: total_income_earned
    label: 'Earned Income Total'
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_earned}    
    drill_fields: detail*

  - dimension: income_earned_is
    label: 'Earned Income'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_earned_is

  - measure: count_with_income
    type: count_distinct
    group_label: 'Income Sources and Amounts'
    sql: ${ref_client}
    filters:
      any_income: 'Income'
      
  - measure: count_asked_about_income
    hidden: true
    type: count_distinct
    sql: ${ref_client}
    filters:
      any_income: No Income,Income
      
  - measure: percent_with_income
    type: number
    format: '%0.1f%'
    group_label: 'Income Sources and Amounts'
    sql: 100.0 * ${count_with_income} / NULLIF(${count_asked_about_income},0)

  - dimension: income_ga
    type: number
    hidden: true
    label: 'Income: General Assistance Amount'
    sql: ${TABLE}.income_ga

  - dimension: income_ga_is
    label: 'General Assistance'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_ga_is

  - dimension: income_individual  # Total cash income for individual
    label: '_Total Cash Income'
    type: number
    value_format_name: usd 
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_individual
    
  - measure: total_cash_income
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_individual}  


#   - dimension: income_other
#     hidden: true
#     type: number
#     sql: ${TABLE}.income_other
# 
#   - dimension: income_other_is
#     type: int
#      sql: ${TABLE}.income_other_is
# 
#   - dimension: income_other_source
#     sql: ${TABLE}.income_other_source

  - dimension: income_private_disability
    label: 'Income: Private Disability Insurance'
    hidden: true
    type: number
    sql: ${TABLE}.income_private_disability

  - dimension: income_private_disability_is
    label: 'Private Disability Insurance'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_private_disability_is

  - dimension: income_private_pension
    hidden: true
    type: number
    sql: ${TABLE}.income_private_pension

  - dimension: income_private_pension_is
    label: 'Private Pension'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_private_pension_is

  - dimension: income_spousal_support
    hidden: true
    type: number
    sql: ${TABLE}.income_spousal_support

  - dimension: income_spousal_support_is
    label: 'Spousal Support'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_spousal_support_is

  - dimension: income_ss_retirement
    hidden: true
    type: number
    sql: ${TABLE}.income_ss_retirement

  - dimension: income_ss_retirement_is
    label: 'Soc Sec Retirement'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_ss_retirement_is

  - dimension: income_ssdi
    hidden: true
    type: number
    sql: ${TABLE}.income_ssdi

  - dimension: income_ssdi_is
    label: 'SSDI'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_ssdi_is
        
  - dimension: income_ssi
    hidden: true
    type: number
    sql: ${TABLE}.income_ssi

  - dimension: income_ssi_is
    label: 'SSI'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_ssi_is

  - dimension: income_tanf
    hidden: true
    type: number
    sql: ${TABLE}.income_tanf

  - dimension: income_tanf_is
    label: 'TANF'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_tanf_is

  - dimension: income_unemployment
    hidden: true
    label: 'Unemployment Amount'
    type: number
    sql: ${TABLE}.income_unemployment
    
  - measure: total_unemployment_income
    hidden: true
    label: 'Income: Total Unemployment Income'
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    format: '$%0.0f'
    sql: ${income_unemployment}      

  - dimension: income_unemployment_is
    label: 'Unemployment Income'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_unemployment_is

  - dimension: income_vet_disability
    hidden: true
    type: number
    sql: ${TABLE}.income_vet_disability

  - dimension: income_vet_disability_is
    label: 'Veteran Disability'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_vet_disability_is

  - dimension: income_vet_pension
    hidden: true
    type: number
    sql: ${TABLE}.income_vet_pension

  - dimension: income_vet_pension_is
    label: 'Veteran Pension'    
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_vet_pension_is

  - dimension: income_workers_comp
    hidden: true
    type: number
    sql: ${TABLE}.income_workers_comp

  - measure: total_workers_comp_income
    hidden: true
    label: 'Income: Total Unemployment Income'
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    format: '$%0.0f'
    sql: ${income_workers_comp}    

  - dimension: income_workers_comp_is
    label: 'Workers Comp'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_workers_comp_is

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: marital_status
    hidden: true
    type: int
    sql: ${TABLE}.marital_status

  - dimension_group: move_in
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.move_in_date

  - dimension: permanent_housing_is
    type: int
    sql: ${TABLE}.permanent_housing_is
    
  - dimension: path_engagement_date
    group_label: 'PATH Questions'  
    type: date_date
    sql: ${TABLE}.path_engagement_date
    
  - dimension: path_status_determination
    group_label: 'PATH Questions'  
    type: yesno
    sql: ${TABLE}.path_status_is   
    
  - dimension: path_enrollment_status
    group_label: 'PATH Questions'  
    type: yesno
    sql: ${TABLE}.path_status     
    
  - dimension: path_status_determination_date
    group_label: 'PATH Questions'  
    type: date_date
    sql: ${TABLE}.path_status_determination   

  - dimension: path_not_enrolled_reason    
    group_label: 'PATH Questions'
    sql: fn_getPicklistValueName('path_not_enrolled_reason',${TABLE}.path_not_enrolled_reason)   


  - dimension: prior_duration_text
    label: 'Length of Stay at Prior Place'
    sql: fn_getPicklistValueName('prior_duration',${prior_duration})   

  - dimension: prior_city
    sql: ${TABLE}.prior_city

  - dimension: prior_duration
    type: int
    sql: ${TABLE}.prior_duration


  - dimension: prior_residence
    hidden: true
    type: int
    sql: ${TABLE}.prior_residence

  - dimension: prior_residence_text
    label: 'Residence Prior to Project Entry'
    sql: fn_getPicklistValueName('prior_residence',${prior_residence})    

  - dimension: prior_residence_other
    hidden: true
    sql: ${TABLE}.prior_residence_other

  - dimension: prior_state
    sql: ${TABLE}.prior_state

  - dimension: prior_street_address
    hidden: true
    sql: ${TABLE}.prior_street_address
    
  - dimension_group: program
    label: 'Information Date'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.program_date

#   - dimension_group: program_entry
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.program_entry
# 
#   - dimension_group: program_exit
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.program_exit

  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client
    hidden: true
    type: int
    sql: ${TABLE}.ref_client

  - dimension: ref_program
    hidden: true
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_user 
    label: 'User Creating'
    sql: fn_getUserNameById(${TABLE}.ref_user)

  - dimension: ref_user_updated 
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)

  - dimension: screen_type
    hidden: true
    type: int
    sql: ${TABLE}.screen_type

  - dimension: screen_type_text
    hidden: true
    sql: |
      CASE
      WHEN ${screen_type} = 2 THEN '1 - Enrollment'
      WHEN ${screen_type} = 3 THEN '2 - Update'
      WHEN ${screen_type} = 4 THEN '4 - Exit'
      WHEN ${screen_type} = 5 THEN '3 - Annual Assessment'
      END
    

  - dimension: zipcode
    type: zipcode
    sql: ${TABLE}.zipcode

  - dimension: zipcode_quality
    type: int
    sql: ${TABLE}.zipcode_quality

  - dimension: rhy_bcp_is
    label: 'BCP Status Determined'
    group_label: 'RHY Questions'
    type: yesno
    sql: ${TABLE}.rhy_bcp_is
    
  - dimension: rhy_fysb_youth
    label: 'FYSB Youth'
    group_label: 'RHY Questions'
    type: yesno
    sql: ${TABLE}.rhy_fysb_youth  

  - dimension: rhy_no_svc_reason
    label: 'BCP Status: Reason for not providing services'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_no_svc_reason',${TABLE}.rhy_no_svc_reason)
    
  - dimension: rhy_sexual_orientation
    label: 'Sexual Orientation'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_sexual_orientation',${TABLE}.rhy_sexual_orientation)    
    
  - dimension: rhy_education_level
    label: 'Last Grade Completed'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_education_level',${TABLE}.rhy_education_level)  
    
  - dimension: rhy_school_status
    label: 'School Status'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_school_status',${TABLE}.rhy_school_status)
    
  - dimension: rhy_employment_type
    label: 'Employment Type'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_employment_type',${TABLE}.rhy_employment_type)
    
  - dimension: rhy_reason_not_employed
    label: 'Employed: Why not'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_reason_not_employed',${TABLE}.rhy_reason_not_employed)

  - dimension: rhy_dental_health
    label: 'Dental Health Status'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_dental_health',${TABLE}.rhy_dental_health)    
    
  - dimension: rhy_mental_health
    label: 'Mental Health Status'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_mental_health',${TABLE}.rhy_mental_health) 
    
  - dimension: previous_foster_care
    label: 'Foster Care: Former Ward'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('previous_foster_care',${TABLE}.previous_foster_care)       
    
  - dimension: rhy_foster_length_years
    label: 'Foster Care: Number of Years'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_foster_length_years',${TABLE}.rhy_foster_length_years)  
    
  - dimension: rhy_former_justice
    label: 'Juvenile Justice: Former Ward'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_former_justice',${TABLE}.rhy_former_justice)     
    
  - dimension: rhy_justice_length_years
    label: 'Juvenile Justice: Number of Years'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_justice_length_years',${TABLE}.rhy_justice_length_years) 
    
  - dimension: rhy_crit_household
    label: 'Household Dynamics - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_household',${TABLE}.rhy_crit_household) 
    
  - dimension: rhy_crit_identity_youth
    label: 'Sexual Orientation/Gender Identity - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_identity_youth',${TABLE}.rhy_crit_identity_youth)     
    
  - dimension: rhy_crit_housing_youth
    label: 'Housing Issues - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_housing_youth',${TABLE}.rhy_crit_housing_youth)      

  - dimension: rhy_crit_school_youth
    label: 'School or Educational Issues - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_school_youth',${TABLE}.rhy_crit_school_youth)         
    
  - dimension: rhy_crit_unemployment_youth
    label: 'Unemployment - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_unemployment_youth',${TABLE}.rhy_crit_unemployment_youth)  
    
  - dimension: rhy_crit_disability_mental_youth
    label: 'Mental Disability- Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_disability_mental_youth',${TABLE}.rhy_crit_disability_mental_youth) 
    
  - dimension: rhy_crit_health_youth
    label: 'Health Issues - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_health_youth',${TABLE}.rhy_crit_health_youth)     

  - dimension: rhy_crit_disability_physical_youth
    label: 'Physical Disability - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_disability_physical_youth',${TABLE}.rhy_crit_disability_physical_youth)    
    
  - dimension: rhy_crit_abuse_youth
    label: 'Abuse & Neglect - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_abuse_youth',${TABLE}.rhy_crit_abuse_youth)        
    
  - dimension: rhy_crit_mental_youth
    label: 'Mental Health Issues - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_mental_youth',${TABLE}.rhy_crit_mental_youth)          

  - dimension: rhy_crit_substance_youth
    label: 'Alcohol or Other Drug Abuse - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_substance_youth',${TABLE}.rhy_crit_substance_youth)          
    
  - dimension: rhy_crit_incarcerated_parent
    label: 'Incarcerated Parent - Youth'
    type: yesno
    group_label: 'RHY Critical Issues - Youth'
    sql: fn_getPicklistValueName('rhy_crit_incarcerated_parent',${TABLE}.rhy_crit_incarcerated_parent) 
    
  - dimension: rhy_crit_identity_family
    label: 'Sexual Orientation/Gender Identity - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_identity_family',${TABLE}.rhy_crit_identity_family)     
    
  - dimension: rhy_crit_housing_family
    label: 'Housing Issues - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_housing_family',${TABLE}.rhy_crit_housing_family)         
    
  - dimension: rhy_crit_school_family
    label: 'School or Educational Issues - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_school_family',${TABLE}.rhy_crit_school_family)             
    
  - dimension: rhy_crit_unemployment_family
    label: 'Unemployment - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_unemployment_family',${TABLE}.rhy_crit_unemployment_family)                 
    
  - dimension: rhy_crit_mental_family
    label: 'Mental Health Issues - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_mental_family',${TABLE}.rhy_crit_mental_family)
    
  - dimension: rhy_crit_health_family
    label: 'Health Issues - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_health_family',${TABLE}.rhy_crit_health_family)
    
  - dimension: rhy_crit_disability_physical_family
    label: 'Physical Disability - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_disability_physical_family',${TABLE}.rhy_crit_disability_physical_family)
    
  - dimension: rhy_crit_disability_mental_family
    label: 'Mental Disability - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_disability_mental_family',${TABLE}.rhy_crit_disability_mental_family)
    
  - dimension: rhy_crit_abuse_family
    label: 'Abuse & Neglect - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_abuse_family',${TABLE}.rhy_crit_abuse_family)
    
  - dimension: rhy_crit_substance_family
    label: 'Alcohol or Other Drug Abuse - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_substance_family',${TABLE}.rhy_crit_substance_family)
    
  - dimension: rhy_crit_income_family
    label: 'Insufficient Income - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_income_family',${TABLE}.rhy_crit_income_family)
    
  - dimension: rhy_crit_military_family
    label: 'Active Military Parent - Family'
    type: yesno
    group_label: 'RHY Critical Issues - Family'
    sql: fn_getPicklistValueName('rhy_crit_military_family',${TABLE}.rhy_crit_military_family)

  - dimension: rhy_referral_src
    label: 'Referral Source'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_referral_src',${TABLE}.rhy_referral_src)

  - dimension: rhy_referral_freq_approached
    label: 'Referral Source: Times Approached Prior to Entry'
    group_label: 'RHY Questions'
    sql: fn_getPicklistValueName('rhy_referral_freq_approached',${TABLE}.rhy_referral_freq_approached)
    
  - dimension: rhy_exploitation
    label: 'Exchange for sex, ever received anything'
    group_label: 'RHY Commercial Sexual Exploitation'
    sql: fn_getPicklistValueName('rhy_exploitation',${TABLE}.rhy_exploitation)
    
  - dimension: rhy_exploitation_times
    label: 'Exchange for sex, in last three months'
    group_label: 'RHY Commercial Sexual Exploitation'
    sql: fn_getPicklistValueName('rhy_exploitation_times',${TABLE}.rhy_exploitation_times)
 
  - dimension: rhy_exploitation_frequency
    label: 'Exchange for sex, number of times'
    group_label: 'RHY Commercial Sexual Exploitation'
    sql: fn_getPicklistValueName('rhy_exploitation_frequency',${TABLE}.rhy_exploitation_frequency)
    
  - dimension: rhy_exploitation_ask
    label: 'Made/persuaded to have sex in exchange for something'
    group_label: 'RHY Commercial Sexual Exploitation'
    sql: fn_getPicklistValueName('rhy_exploitation_ask',${TABLE}.rhy_exploitation_ask)

  - dimension: rhy_exploitation_ask_times
    label: 'Made/persuaded to have sex, in last three months'
    group_label: 'RHY Commercial Sexual Exploitation'
    sql: fn_getPicklistValueName('rhy_exploitation_ask_times',${TABLE}.rhy_exploitation_ask_times)
    
  - dimension: rhy_labor_exploitation_threats
    label: 'Afraid to quit/leave work due to threats'
    group_label: 'RHY Commercial Labor Exploitation'
    sql: fn_getPicklistValueName('rhy_labor_exploitation_threats',${TABLE}.rhy_labor_exploitation_threats)
    
  - dimension: rhy_labor_exploitation_payment
    label: 'Promised work, work or payment different'
    group_label: 'RHY Commercial Labor Exploitation'
    sql: fn_getPicklistValueName('rhy_labor_exploitation_payment',${TABLE}.rhy_labor_exploitation_payment)
    
  - dimension: rhy_labor_exploitation_forced_tricked
    label: 'Felt forced/pressured/tricked into continuing job'
    group_label: 'RHY Commercial Labor Exploitation'
    sql: fn_getPicklistValueName('rhy_labor_exploitation_forced_tricked',${TABLE}.rhy_labor_exploitation_forced_tricked)
    
  - dimension: rhy_labor_exploitation_times
    label: 'Exploited by work, in last three months'
    group_label: 'RHY Commercial Labor Exploitation'
    sql: fn_getPicklistValueName('rhy_labor_exploitation_times',${TABLE}.rhy_labor_exploitation_times)

  - dimension: ami_percent
    label: 'Percent of AMI'
    group_label: 'SSVF/VASH'
    sql: fn_getPicklistValueName('ami_percent',${TABLE}.ami_percent)

  - dimension: prior_address_quality
    label: 'Prior Address Data Quality'
    group_label: 'SSVF/VASH'
    sql: fn_getPicklistValueName('prior_address_quality',${TABLE}.prior_address_quality)

  - dimension: vamc_station_number
    label: 'VAMC Station Number'
    group_label: 'SSVF/VASH'
    sql: ${TABLE}.vamc_station_number
    
  - dimension: hp_screening_score
    label: 'HP Screening Score'
    group_label: 'SSVF/VASH'
    sql: ${TABLE}.hp_screening_score

  - measure: count
    type: count
    drill_fields: detail*
    
  # ----- Sets of fields for drilling ------
  sets:
    detail:
      - clients.id
      - client_programs.id
      - clients.full_name
      - programs.name
      - client_programs.start_date
      - entry_screen.housing_status_text
      - client_programs.end_date
      - client_programs.still_in_program


