- view: last_screen
  label: 'Update/Exit Screen'
  sql_table_name: |
    client_program_demographics
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date


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
    group_label: 'Health Insurance'
    type: yesno
    sql: ${TABLE}.benefits_no_insurance

  - dimension: benefits_noncash
    label: '_Any Non Cash Benefit'
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
    hidden: true
    type: int
    sql: ${TABLE}.chronic_2

  - dimension: chronic_3
    hidden: true
    type: int
    sql: ${TABLE}.chronic_3

  - dimension: chronic_4
    hidden: true
    type: int
    sql: ${TABLE}.chronic_4

  - dimension: chronic_5
    hidden: true
    type: int
    sql: ${TABLE}.chronic_5

  - dimension: chronic_homeless
    hidden: true
    type: int
    sql: ${TABLE}.chronic_homeless

#   - dimension: chronic_homeless_calculation
#     sql:    CASE WHEN ${client_programs.head_of_household} = 1 AND ${TABLE}.disabled = 1 AND  ( ${TABLE}.chronic_1 = 1 OR  ${TABLE}.chronic_2 = 4) THEN 'Chronic Homeless'    ELSE 'Not Chronic Homeless'    END

  - dimension: Employed
    sql: fn_getPicklistValueName('employment_is',${TABLE}.employment_is)

  - dimension: disabled
    label: '_Any Disability'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('disabled',${TABLE}.disabled)
    
  - dimension: disabiing_condition
    label: 'Disabling Condition'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('disabled',${TABLE}.disabled)    

  - dimension: exit_destination
    hidden: true
    type: int
    sql: ${TABLE}.exit_destination

  - dimension: exit_destination_text
    bypass_suggest_restrictions: true
    label: 'Exit Destination'
    sql: fn_getPicklistValueName('exit_destination',${exit_destination}) 

  - dimension: housed_on_exit
    label: 'Housed on Exit'
    description: 'Client has been Permanently Housed'
    sql_case:
            Housed: ${exit_destination} in (10,11,19,20,21,22,23,26,28,3)
            else: Not Housed

  - dimension: exit_reason
    hidden: true
    type: int
    sql: ${TABLE}.exit_reason
    
  - dimension: exit_reason_text
    label: 'Exit Reason '
    sql: fn_getPicklistValueName('exit_reason',${exit_reason})  




  - dimension: health_chronic
    label: 'Chronic Health'
    group_label: 'Disability Types'
    sql: ${TABLE}.health_chronic
    sql: fn_getPicklistValueName('health_chronic',${TABLE}.health_chronic)

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

  #- dimension: health_dv_occurred
  #  type: int
  #  sql: ${TABLE}.health_dv_occurred

  #- dimension: health_general
  #  type: int
  #  sql: ${TABLE}.health_general

  - dimension: health_hiv
    label: 'HIV/AIDS'
    group_label: 'Disability Types'
    sql: fn_getPicklistValueName('health_hiv',${TABLE}.health_hiv)    
    
  
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
    

  - measure: average_cash_income
    type: average   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_individual}      
    
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
#   - dimension: health_pregnancy
#     type: int
#     sql: ${TABLE}.health_pregnancy
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
# 
#   - dimension: housing_ass_exit
#     type: int
#     sql: ${TABLE}.housing_ass_exit
# 
#   - dimension: housing_ass_exit_1
#     type: int
#     sql: ${TABLE}.housing_ass_exit_1
# 
#   - dimension: housing_ass_exit_2
#     type: int
#     sql: ${TABLE}.housing_ass_exit_2

  - dimension: housing_status
    hidden: true
    type: int
    sql: ${TABLE}.housing_status

  - dimension: housing_status_text
    label: 'Housing Status'
    sql: fn_getPicklistValueName('housing_status',${housing_status})
    
#   - dimension: left_stably_housed
#     type: yesno
#     sql: ${housing_status_text} = 'Stably housed'
# 
# 
#   - measure: count_stably_housed
#     type: count_distinct
#     sql: ${ref_client}
#     filters:
#       housing_status_text: 'Stably housed'
      
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
    group_label: 'Income Sources and Amounts'
    drill_fields: [income_earned_tier, count]
    sql: ${income_earned}
    drill_fields: detail*

 
  - measure: total_income_earned
    label: 'Earned Income Total'
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_earned}    
    drill_fields: detail*


  - measure: count_with_income
    type: count_distinct
    group_label: 'Income Sources and Amounts'
    sql: ${ref_client}
    filters:
      any_income: 'Income'
      
  - measure: count_asked_about_income
    hidden: true
    type: count_distinct
    group_label: 'Income Sources and Amounts'
    sql: ${ref_client}
    filters:
      any_income: No Income, Income
      
    
      
  - measure: percent_with_income
    type: number
    format: '%0.1f%'
    group_label: 'Income Sources and Amounts'
    sql: 100.0 * ${count_with_income} / NULLIF(${count_asked_about_income},0)

  - dimension: income_ga
    type: number
    hidden: true
    label: 'General Assistance Amount'
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_ga

  - dimension: income_ga_is
    label: 'General Assistance'
    type: yesno
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_ga_is

  - dimension: income_individual  # TOtal cash income for individual
    label: '_Total Cash Income'
    type: number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_individual
    
  - dimension: income_change  # TOtal cash income for individual
    label: '_Total Change in Cash Income'
    type: number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${TABLE}.income_individual   -   ${entry_screen.income_individual}
    
    
  - dimension: income_change_tier
    label: '_Changed Tiers'
    type: tier
    style: integer
    group_label: 'Income Sources and Amounts'
    tiers: [0,100,500,1000,5000]
    sql: ${income_change}
        
  - measure: average_income_change
    type: average   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_change}      
    
    
  - measure: total_cash_income
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    group_label: 'Income Sources and Amounts'
    sql: ${income_individual}  

#   - dimension: income_other
#     type: number
#     sql: ${TABLE}.income_other
# 
#   - dimension: income_other_is
#     type: yesno
#     sql: ${TABLE}.income_other_is
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
    group_label: 'Income Sources and Amounts'
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
    label: 'Income: Unemployment Amount'
    type: number
    sql: ${TABLE}.income_unemployment
    
  - measure: total_unemployment_income
    hidden: true
    label: 'Income: Total Unemployment Income'
    type: sum   # can be average, sum, min, max, count, count_distinct, or number
    value_format_name: usd
    sql: ${income_unemployment}      

  - dimension: income_unemployment_is
    label: 'Unemployement Income'
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

#   - dimension: marital_status
#     type: int
#     sql: ${TABLE}.marital_status

  - dimension_group: move_in
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.move_in_date

  - dimension: permanent_housing_is
    type: int
    sql: ${TABLE}.permanent_housing_is
    
  - dimension_group: path_engagement_date
    label: 'PATH Engagement Date'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.path_engagement_date
    
  - dimension: path_status_determination
    type: yesno
    sql: ${TABLE}.path_status_is   
    
  - dimension: path_enrollment_status
    type: yesno
    sql: ${TABLE}.path_status     
    
  - dimension_group: path_status_determination_date
    label: 'PATH Determination Date'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.path_status_determination      


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
    label: 'Screen Type'
    sql: |
      CASE
      WHEN ${screen_type} = 2 THEN '1 - Enrollment'
      WHEN ${screen_type} = 3 THEN '2 - Update'
      WHEN ${screen_type} = 4 THEN '4 - Exit'
      WHEN ${screen_type} = 6 THEN '3 - Annual Assessment'
      END
    

  - dimension: zipcode
    type: zipcode
    sql: ${TABLE}.zipcode

  - dimension: zipcode_quality
    type: int
    sql: ${TABLE}.zipcode_quality

#   - dimension: days_since_first_screen  <---- Comparison between two screens
#     type: number
#     sql: datediff(${added_date},${entry_screen.added_date}) 

  - measure: count
    type: count
    drill_fields: detail*



  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - vi_f_spdat_child1_fullname
    - vi_f_spdat_child2_fullname
    - vi_f_spdat_child3_fullname
    - vi_f_spdat_child4_fullname
    - vi_f_spdat_hh2_fullname
    - vi_f_spdat_child10_fullname
    - vi_f_spdat_child9_fullname
    - vi_f_spdat_child5_fullname
    - vi_f_spdat_child6_fullname
    - vi_f_spdat_child7_fullname
    - vi_f_spdat_child8_fullname

