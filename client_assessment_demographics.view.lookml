- view: client_assessments
  sql_table_name: |
    client_assessment_demographics


  fields:

  - dimension: id
    primary_key: true
    label: 'Assessment ID'
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date


  - dimension: assessment_name
    sql: ${screens.name}
    
  - dimension: assessment_score
    type: int
    sql: ${client_assessment_scores.score}  

  - measure: count_assessment_score
    type: count
    filters: 
      assessment_score: 'NOT NULL'

  - dimension: deleted
    hidden: true
    sql: ${TABLE}.deleted    


    
    
  - dimension: sub_score_general
    type: int
    group_label: 'VI--SPDAT assessment_questions'
    sql: ${client_assessment_scores.e}     
    
  - dimension: sub_score_housing
    type: int
    group_label: 'VI--SPDAT assessment_questions'
    sql: ${client_assessment_scores.a}   

  - dimension: sub_score_risks
    type: int
    group_label: 'VI--SPDAT assessment_questions'
    sql: ${client_assessment_scores.b}   
    
  - dimension: sub_score_socilization
    type: int
    label: 'Sub Score Socialization'
    group_label: 'VI--SPDAT assessment_questions'
    sql: ${client_assessment_scores.c}   
    
  - dimension: sub_score_wellness
    type: int
    group_label: 'VI--SPDAT assessment_questions'
    sql: ${client_assessment_scores.d}       
    
  - dimension: vi_spdat_q13_v2
    label: 'Basic Needs Self Care'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q13_v2',${TABLE}.vi_spdat_q13_v2)    
    
  - dimension: vi_spdat_q15_v2
    label: 'Physical Health Reason Lose Housing'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q15_v2',${TABLE}.vi_spdat_q15_v2)

  - dimension: vi_spdat_q18_v2
    label: 'Physical Disability Restrict Access to Housing'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q18_v2',${TABLE}.vi_spdat_q18_v2)
    
  - dimension: vi_spdat_q23c_v2
    label: 'Learning disability, developmental disability, or other impairment'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q23c_v2',${TABLE}.vi_spdat_q23c_v2)

  - measure: assessment_score_average
    type: average
    sql: ${client_assessment_scores.score}   

  - dimension: assessment_score_tier
    type: tier
    style: integer
    tiers: [1,5,10,21,30]
    suggest: true
    sql: ${assessment_score}

  - dimension_group: assessment
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.assessment_date

#   - dimension: benefit_snap
#     type: int
#     sql: ${TABLE}.benefit_snap
# 
#   - dimension: benefits_medicaid
#     type: int
#     sql: ${TABLE}.benefits_medicaid
# 
#   - dimension: benefits_medicare
#     type: int
#     sql: ${TABLE}.benefits_medicare
# 
#   - dimension: benefits_no_insurance
#     type: int
#     sql: ${TABLE}.benefits_no_insurance
# 
#   - dimension: benefits_noncash
#     type: int
#     sql: ${TABLE}.benefits_noncash
# 
#   - dimension: benefits_other
#     type: int
#     sql: ${TABLE}.benefits_other
# 
#   - dimension: benefits_other_source
#     sql: ${TABLE}.benefits_other_source
# 
#   - dimension: benefits_private_insurance
#     type: int
#     sql: ${TABLE}.benefits_private_insurance
# 
#   - dimension: benefits_schip
#     type: int
#     sql: ${TABLE}.benefits_schip
# 
#   - dimension: benefits_section8
#     type: int
#     sql: ${TABLE}.benefits_section8
# 
#   - dimension: benefits_tanf_childcare
#     type: int
#     sql: ${TABLE}.benefits_tanf_childcare
# 
#   - dimension: benefits_tanf_other
#     type: int
#     sql: ${TABLE}.benefits_tanf_other
# 
#   - dimension: benefits_tanf_transportation
#     type: int
#     sql: ${TABLE}.benefits_tanf_transportation
# 
#   - dimension: benefits_temp_rent
#     type: int
#     sql: ${TABLE}.benefits_temp_rent
# 
#   - dimension: benefits_va_medical
#     type: int
#     sql: ${TABLE}.benefits_va_medical
# 
#   - dimension: benefits_wic
#     type: int
#     sql: ${TABLE}.benefits_wic
# 
#   - dimension: birth_nation
#     type: int
#     sql: ${TABLE}.birth_nation
# 
#   - dimension: chronic_1
#     type: int
#     sql: ${TABLE}.chronic_1
# 
#   - dimension: chronic_2
#     type: int
#     sql: ${TABLE}.chronic_2
# 
#   - dimension: chronic_3
#     type: int
#     sql: ${TABLE}.chronic_3
# 
#   - dimension: chronic_4
#     type: int
#     sql: ${TABLE}.chronic_4
# 
#   - dimension: chronic_5
#     type: int
#     sql: ${TABLE}.chronic_5
# 
#   - dimension: chronic_homeless
#     type: int
#     sql: ${TABLE}.chronic_homeless
# 
#   - dimension: citizen_status
#     type: int
#     sql: ${TABLE}.citizen_status
# 
#   - dimension: client_location
#     sql: ${TABLE}.client_location
# 
#   - dimension: deleted
#     type: yesno
#     sql: ${TABLE}.deleted
# 
#   - dimension: disabled
#     type: int
#     sql: ${TABLE}.disabled
# 
#   - dimension: dob_quality
#     type: int
#     sql: ${TABLE}.dob_quality
# 
#   - dimension: domain_01
#     type: int
#     sql: ${TABLE}.domain_01
# 
#   - dimension: domain_02
#     type: int
#     sql: ${TABLE}.domain_02
# 
#   - dimension: domain_03
#     type: int
#     sql: ${TABLE}.domain_03
# 
#   - dimension: domain_04
#     type: int
#     sql: ${TABLE}.domain_04
# 
#   - dimension: domain_05
#     type: int
#     sql: ${TABLE}.domain_05
# 
#   - dimension: domain_06
#     type: int
#     sql: ${TABLE}.domain_06
# 
#   - dimension: domain_07
#     type: int
#     sql: ${TABLE}.domain_07
# 
#   - dimension: domain_08
#     type: int
#     sql: ${TABLE}.domain_08
# 
#   - dimension: domain_09
#     type: int
#     sql: ${TABLE}.domain_09
# 
#   - dimension: domain_10
#     type: int
#     sql: ${TABLE}.domain_10
# 
#   - dimension: domain_11
#     type: int
#     sql: ${TABLE}.domain_11
# 
#   - dimension: domain_12
#     type: int
#     sql: ${TABLE}.domain_12
# 
#   - dimension: domain_13
#     type: int
#     sql: ${TABLE}.domain_13
# 
#   - dimension: domain_14
#     type: int
#     sql: ${TABLE}.domain_14
# 
#   - dimension: domain_15
#     type: int
#     sql: ${TABLE}.domain_15
# 
#   - dimension: domain_16
#     type: int
#     sql: ${TABLE}.domain_16
# 
#   - dimension: domain_17
#     type: int
#     sql: ${TABLE}.domain_17
# 
#   - dimension: domain_18
#     type: int
#     sql: ${TABLE}.domain_18
# 
#   - dimension: drivers_license
#     sql: ${TABLE}.drivers_license
# 
#   - dimension: education_child_barriers
#     type: int
#     sql: ${TABLE}.education_child_barriers
# 
#   - dimension: education_child_enrolled
#     type: int
#     sql: ${TABLE}.education_child_enrolled
# 
#   - dimension_group: education_child_last
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.education_child_last_date
# 
#   - dimension: education_child_liaison
#     type: int
#     sql: ${TABLE}.education_child_liaison
# 
#   - dimension: education_child_school
#     sql: ${TABLE}.education_child_school
# 
#   - dimension: education_child_type
#     type: int
#     sql: ${TABLE}.education_child_type
# 
#   - dimension: education_degree
#     type: int
#     sql: ${TABLE}.education_degree
# 
#   - dimension: education_enrolled
#     type: int
#     sql: ${TABLE}.education_enrolled
# 
#   - dimension: education_level
#     type: int
#     sql: ${TABLE}.education_level
# 
#   - dimension: education_vocational
#     type: int
#     sql: ${TABLE}.education_vocational
# 
#   - dimension: employment_hours
#     type: int
#     sql: ${TABLE}.employment_hours
# 
#   - dimension: employment_is
#     type: int
#     sql: ${TABLE}.employment_is
# 
#   - dimension: employment_seeking
#     type: int
#     sql: ${TABLE}.employment_seeking
# 
#   - dimension: employment_status
#     type: int
#     sql: ${TABLE}.employment_status
# 
#   - dimension: employment_tenure
#     type: int
#     sql: ${TABLE}.employment_tenure
# 
#   - dimension: ethnicity
#     type: int
#     sql: ${TABLE}.ethnicity
# 
#   - dimension: exit_destination
#     type: int
#     sql: ${TABLE}.exit_destination
# 
#   - dimension: exit_destination_other
#     sql: ${TABLE}.exit_destination_other
# 
#   - dimension: exit_reason
#     type: int
#     sql: ${TABLE}.exit_reason
# 
#   - dimension: gender
#     type: int
#     sql: ${TABLE}.gender
# 
#   - dimension: gender_other
#     sql: ${TABLE}.gender_other
# 
#   - dimension: gross_ann_hsld_income
#     type: number
#     sql: ${TABLE}.gross_ann_hsld_income
# 
#   - dimension: gross_ann_ind_income
#     type: number
#     sql: ${TABLE}.gross_ann_ind_income
# 
#   - dimension: health_chronic
#     type: int
#     sql: ${TABLE}.health_chronic
# 
#   - dimension: health_chronic_documented
#     type: int
#     sql: ${TABLE}.health_chronic_documented
# 
#   - dimension: health_chronic_longterm
#     type: int
#     sql: ${TABLE}.health_chronic_longterm
# 
#   - dimension: health_chronic_services
#     type: int
#     sql: ${TABLE}.health_chronic_services
# 
#   - dimension: health_dev_disability
#     type: int
#     sql: ${TABLE}.health_dev_disability
# 
#   - dimension: health_dev_disability_documented
#     type: int
#     sql: ${TABLE}.health_dev_disability_documented
# 
#   - dimension: health_dev_disability_independence
#     type: int
#     sql: ${TABLE}.health_dev_disability_independence
# 
#   - dimension: health_dev_disability_services
#     type: int
#     sql: ${TABLE}.health_dev_disability_services
# 
#   - dimension: health_dv
#     type: int
#     sql: ${TABLE}.health_dv
# 
#   - dimension: health_dv_occurred
#     type: int
#     sql: ${TABLE}.health_dv_occurred
# 
#   - dimension: health_general
#     type: int
#     sql: ${TABLE}.health_general
# 
#   - dimension: health_hiv
#     type: int
#     sql: ${TABLE}.health_hiv
# 
#   - dimension: health_hiv_documented
#     type: int
#     sql: ${TABLE}.health_hiv_documented
# 
#   - dimension: health_hiv_independence
#     type: int
#     sql: ${TABLE}.health_hiv_independence
# 
#   - dimension: health_hiv_services
#     type: int
#     sql: ${TABLE}.health_hiv_services
# 
#   - dimension: health_ins_cobra
#     type: int
#     sql: ${TABLE}.health_ins_cobra
# 
#   - dimension: health_ins_emp
#     type: int
#     sql: ${TABLE}.health_ins_emp
# 
#   - dimension: health_ins_ppay
#     type: int
#     sql: ${TABLE}.health_ins_ppay
# 
#   - dimension: health_ins_state
#     type: int
#     sql: ${TABLE}.health_ins_state
# 
#   - dimension: health_insurance
#     type: int
#     sql: ${TABLE}.health_insurance
# 
#   - dimension: health_mental
#     type: int
#     sql: ${TABLE}.health_mental
# 
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
# 
#   - dimension: health_phys_disability
#     type: int
#     sql: ${TABLE}.health_phys_disability
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
# 
#   - dimension: health_substance_abuse
#     type: int
#     sql: ${TABLE}.health_substance_abuse
# 
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
# 
#   - dimension: housing_status
#     type: int
#     sql: ${TABLE}.housing_status
# 
#   - dimension: income_cash
#     type: number
#     sql: ${TABLE}.income_cash
# 
#   - dimension: income_cash_is
#     type: int
#     sql: ${TABLE}.income_cash_is
# 
#   - dimension: income_childsupport
#     type: number
#     sql: ${TABLE}.income_childsupport
# 
#   - dimension: income_childsupport_is
#     type: int
#     sql: ${TABLE}.income_childsupport_is
# 
#   - dimension: income_earned
#     type: number
#     sql: ${TABLE}.income_earned
# 
#   - dimension: income_earned_is
#     type: int
#     sql: ${TABLE}.income_earned_is
# 
#   - dimension: income_ga
#     type: number
#     sql: ${TABLE}.income_ga
# 
#   - dimension: income_ga_is
#     type: int
#     sql: ${TABLE}.income_ga_is
# 
#   - dimension: income_individual
#     type: number
#     sql: ${TABLE}.income_individual
# 
#   - dimension: income_other
#     type: number
#     sql: ${TABLE}.income_other
# 
#   - dimension: income_other_is
#     type: int
#     sql: ${TABLE}.income_other_is
# 
#   - dimension: income_other_source
#     sql: ${TABLE}.income_other_source
# 
#   - dimension: income_private_disability
#     type: number
#     sql: ${TABLE}.income_private_disability
# 
#   - dimension: income_private_disability_is
#     type: int
#     sql: ${TABLE}.income_private_disability_is
# 
#   - dimension: income_private_pension
#     type: number
#     sql: ${TABLE}.income_private_pension
# 
#   - dimension: income_private_pension_is
#     type: int
#     sql: ${TABLE}.income_private_pension_is
# 
#   - dimension: income_spousal_support
#     type: number
#     sql: ${TABLE}.income_spousal_support
# 
#   - dimension: income_spousal_support_is
#     type: int
#     sql: ${TABLE}.income_spousal_support_is
# 
#   - dimension: income_ss_retirement
#     type: number
#     sql: ${TABLE}.income_ss_retirement
# 
#   - dimension: income_ss_retirement_is
#     type: int
#     sql: ${TABLE}.income_ss_retirement_is
# 
#   - dimension: income_ssdi
#     type: number
#     sql: ${TABLE}.income_ssdi
# 
#   - dimension: income_ssdi_is
#     type: int
#     sql: ${TABLE}.income_ssdi_is
# 
#   - dimension: income_ssi
#     type: number
#     sql: ${TABLE}.income_ssi
# 
#   - dimension: income_ssi_is
#     type: int
#     sql: ${TABLE}.income_ssi_is
# 
#   - dimension: income_tanf
#     type: number
#     sql: ${TABLE}.income_tanf
# 
#   - dimension: income_tanf_is
#     type: int
#     sql: ${TABLE}.income_tanf_is
# 
#   - dimension: income_unemployment
#     type: number
#     sql: ${TABLE}.income_unemployment
# 
#   - dimension: income_unemployment_is
#     type: int
#     sql: ${TABLE}.income_unemployment_is
# 
#   - dimension: income_vet_disability
#     type: number
#     sql: ${TABLE}.income_vet_disability
# 
#   - dimension: income_vet_disability_is
#     type: int
#     sql: ${TABLE}.income_vet_disability_is
# 
#   - dimension: income_vet_pension
#     type: number
#     sql: ${TABLE}.income_vet_pension
# 
#   - dimension: income_vet_pension_is
#     type: int
#     sql: ${TABLE}.income_vet_pension_is
# 
#   - dimension: income_workers_comp
#     type: number
#     sql: ${TABLE}.income_workers_comp
# 
#   - dimension: income_workers_comp_is
#     type: int
#     sql: ${TABLE}.income_workers_comp_is
# 
#   - dimension: jewish
#     type: int
#     sql: ${TABLE}.jewish
# 
#   - dimension: jewish_affiliation
#     type: int
#     sql: ${TABLE}.jewish_affiliation
# 
#   - dimension: jewish_rabbi
#     sql: ${TABLE}.jewish_rabbi
# 
#   - dimension: jewish_referred
#     type: int
#     sql: ${TABLE}.jewish_referred
# 
#   - dimension_group: last_updated
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.last_updated
# 
#   - dimension: marital_status
#     type: int
#     sql: ${TABLE}.marital_status
# 
#   - dimension_group: move_in
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.move_in_date
# 
#   - dimension: name_middle
#     sql: ${TABLE}.name_middle
# 
#   - dimension: name_quality
#     type: int
#     sql: ${TABLE}.name_quality
# 
#   - dimension: name_suffix
#     type: int
#     sql: ${TABLE}.name_suffix
# 
#   - dimension: pantry_bags
#     type: int
#     sql: ${TABLE}.pantry_bags
# 
#   - dimension: parental_status
#     type: int
#     sql: ${TABLE}.parental_status
# 
#   - dimension: path_engagement
#     type: int
#     sql: ${TABLE}.path_engagement
# 
#   - dimension_group: path_engagement
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.path_engagement_date
# 
#   - dimension: path_not_enrolled_reason
#     type: int
#     sql: ${TABLE}.path_not_enrolled_reason
# 
#   - dimension: path_status
#     type: int
#     sql: ${TABLE}.path_status
# 
#   - dimension_group: path_status_determination
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.path_status_determination
# 
#   - dimension: path_status_is
#     type: int
#     sql: ${TABLE}.path_status_is
# 
#   - dimension: permanent_housing_is
#     type: int
#     sql: ${TABLE}.permanent_housing_is
# 
#   - dimension: photo_auth
#     type: int
#     sql: ${TABLE}.photo_auth
# 
#   - dimension: previous_foster_care
#     type: int
#     sql: ${TABLE}.previous_foster_care
# 
#   - dimension: previous_jail
#     type: int
#     sql: ${TABLE}.previous_jail
# 
#   - dimension: previous_prison
#     type: int
#     sql: ${TABLE}.previous_prison
# 
#   - dimension: primary_language
#     type: int
#     sql: ${TABLE}.primary_language
# 
#   - dimension: prior_address_quality
#     type: int
#     sql: ${TABLE}.prior_address_quality
# 
#   - dimension: prior_city
#     sql: ${TABLE}.prior_city
# 
#   - dimension: prior_duration
#     type: int
#     sql: ${TABLE}.prior_duration
# 
#   - dimension: prior_residence
#     type: int
#     sql: ${TABLE}.prior_residence
# 
#   - dimension: prior_residence_other
#     sql: ${TABLE}.prior_residence_other
# 
#   - dimension: prior_state
#     sql: ${TABLE}.prior_state
# 
#   - dimension: prior_street_address
#     sql: ${TABLE}.prior_street_address
# 
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
# 
#   - dimension: race
#     type: int
#     sql: ${TABLE}.race
# 
  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency
# 
#   - dimension: ref_agency_deleted
#     type: int
#     sql: ${TABLE}.ref_agency_deleted
# 
  - dimension: ref_assessment
    type: int
    hidden: true
    sql: ${TABLE}.ref_assessment
# 
  - dimension: ref_client
    hidden: true
    type: int
    sql: ${TABLE}.ref_client
# 
  - dimension: ref_user
    label: 'User Creating'
    sql: fn_getUserNameById(${TABLE}.ref_user)

  - dimension: ref_user_updated
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)
# 
#   - dimension: rhy_bcp_is
#     type: int
#     sql: ${TABLE}.rhy_bcp_is
# 
#   - dimension: rhy_completion_involuntary_reason
#     type: int
#     sql: ${TABLE}.rhy_completion_involuntary_reason
# 
#   - dimension: rhy_completion_status
#     type: int
#     sql: ${TABLE}.rhy_completion_status
# 
#   - dimension: rhy_completion_voluntary_reason
#     type: int
#     sql: ${TABLE}.rhy_completion_voluntary_reason
# 
#   - dimension: rhy_crit_abuse_family
#     type: int
#     sql: ${TABLE}.rhy_crit_abuse_family
# 
#   - dimension: rhy_crit_abuse_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_abuse_youth
# 
#   - dimension: rhy_crit_disability_mental_family
#     type: int
#     sql: ${TABLE}.rhy_crit_disability_mental_family
# 
#   - dimension: rhy_crit_disability_mental_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_disability_mental_youth
# 
#   - dimension: rhy_crit_disability_physical_family
#     type: int
#     sql: ${TABLE}.rhy_crit_disability_physical_family
# 
#   - dimension: rhy_crit_disability_physical_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_disability_physical_youth
# 
#   - dimension: rhy_crit_health_family
#     type: int
#     sql: ${TABLE}.rhy_crit_health_family
# 
#   - dimension: rhy_crit_health_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_health_youth
# 
#   - dimension: rhy_crit_household
#     type: int
#     sql: ${TABLE}.rhy_crit_household
# 
#   - dimension: rhy_crit_housing_family
#     type: int
#     sql: ${TABLE}.rhy_crit_housing_family
# 
#   - dimension: rhy_crit_housing_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_housing_youth
# 
#   - dimension: rhy_crit_identity_family
#     type: int
#     sql: ${TABLE}.rhy_crit_identity_family
# 
#   - dimension: rhy_crit_identity_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_identity_youth
# 
#   - dimension: rhy_crit_incarcerated_parent
#     type: int
#     sql: ${TABLE}.rhy_crit_incarcerated_parent
# 
#   - dimension: rhy_crit_incarcerated_specify
#     type: int
#     sql: ${TABLE}.rhy_crit_incarcerated_specify
# 
#   - dimension: rhy_crit_income_family
#     type: int
#     sql: ${TABLE}.rhy_crit_income_family
# 
#   - dimension: rhy_crit_mental_family
#     type: int
#     sql: ${TABLE}.rhy_crit_mental_family
# 
#   - dimension: rhy_crit_mental_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_mental_youth
# 
#   - dimension: rhy_crit_military_family
#     type: int
#     sql: ${TABLE}.rhy_crit_military_family
# 
#   - dimension: rhy_crit_school_family
#     type: int
#     sql: ${TABLE}.rhy_crit_school_family
# 
#   - dimension: rhy_crit_school_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_school_youth
# 
#   - dimension: rhy_crit_substance_family
#     type: int
#     sql: ${TABLE}.rhy_crit_substance_family
# 
#   - dimension: rhy_crit_substance_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_substance_youth
# 
#   - dimension: rhy_crit_unemployment_family
#     type: int
#     sql: ${TABLE}.rhy_crit_unemployment_family
# 
#   - dimension: rhy_crit_unemployment_youth
#     type: int
#     sql: ${TABLE}.rhy_crit_unemployment_youth
# 
#   - dimension: rhy_dental_health
#     type: int
#     sql: ${TABLE}.rhy_dental_health
# 
#   - dimension: rhy_education_level
#     type: int
#     sql: ${TABLE}.rhy_education_level
# 
#   - dimension: rhy_employment_type
#     type: int
#     sql: ${TABLE}.rhy_employment_type
# 
#   - dimension: rhy_exploitation
#     type: int
#     sql: ${TABLE}.rhy_exploitation
# 
#   - dimension: rhy_exploitation_ask
#     type: int
#     sql: ${TABLE}.rhy_exploitation_ask
# 
#   - dimension: rhy_exploitation_freq
#     type: int
#     sql: ${TABLE}.rhy_exploitation_freq
# 
#   - dimension: rhy_family_reunification
#     type: int
#     sql: ${TABLE}.rhy_family_reunification
# 
#   - dimension: rhy_former_justice
#     type: int
#     sql: ${TABLE}.rhy_former_justice
# 
#   - dimension: rhy_foster_length_months
#     type: int
#     sql: ${TABLE}.rhy_foster_length_months
# 
#   - dimension: rhy_foster_length_years
#     type: int
#     sql: ${TABLE}.rhy_foster_length_years
# 
#   - dimension: rhy_fysb_youth
#     type: int
#     sql: ${TABLE}.rhy_fysb_youth
# 
#   - dimension: rhy_justice_length_months
#     type: int
#     sql: ${TABLE}.rhy_justice_length_months
# 
#   - dimension: rhy_justice_length_years
#     type: int
#     sql: ${TABLE}.rhy_justice_length_years
# 
#   - dimension: rhy_mental_health
#     type: int
#     sql: ${TABLE}.rhy_mental_health
# 
#   - dimension: rhy_no_svc_reason
#     type: int
#     sql: ${TABLE}.rhy_no_svc_reason
# 
#   - dimension: rhy_reason_not_employed
#     type: int
#     sql: ${TABLE}.rhy_reason_not_employed
# 
#   - dimension: rhy_referral_freq_approached
#     type: int
#     sql: ${TABLE}.rhy_referral_freq_approached
# 
#   - dimension: rhy_referral_src
#     type: int
#     sql: ${TABLE}.rhy_referral_src
# 
#   - dimension: rhy_school_status
#     type: int
#     sql: ${TABLE}.rhy_school_status
# 
#   - dimension: rhy_sexual_orientation
#     type: int
#     sql: ${TABLE}.rhy_sexual_orientation
# 
#   - dimension_group: rhy_status_determination
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.rhy_status_determination
# 
#   - dimension: rhy_transition_advice
#     type: int
#     sql: ${TABLE}.rhy_transition_advice
# 
#   - dimension: rhy_transition_counseling
#     type: int
#     sql: ${TABLE}.rhy_transition_counseling
# 
#   - dimension: rhy_transition_meeting
#     type: int
#     sql: ${TABLE}.rhy_transition_meeting
# 
#   - dimension: rhy_transition_other
#     type: int
#     sql: ${TABLE}.rhy_transition_other
# 
#   - dimension: rhy_transition_package
#     type: int
#     sql: ${TABLE}.rhy_transition_package
# 
#   - dimension: rhy_transition_permanent
#     type: int
#     sql: ${TABLE}.rhy_transition_permanent
# 
#   - dimension: rhy_transition_plan
#     type: int
#     sql: ${TABLE}.rhy_transition_plan
# 
#   - dimension: rhy_transition_shelter
#     type: int
#     sql: ${TABLE}.rhy_transition_shelter
# 
#   - dimension: rhy_transition_treatment
#     type: int
#     sql: ${TABLE}.rhy_transition_treatment
# 
#   - dimension: soar_alj_attorney
#     type: int
#     sql: ${TABLE}.soar_alj_attorney
# 
#   - dimension: soar_alj_exp_hearing
#     type: int
#     sql: ${TABLE}.soar_alj_exp_hearing
# 
#   - dimension_group: soar_alj_hearing
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.soar_alj_hearing_date
# 
#   - dimension: soar_alj_outcome
#     type: int
#     sql: ${TABLE}.soar_alj_outcome
# 
#   - dimension: soar_alj_review_req
#     type: int
#     sql: ${TABLE}.soar_alj_review_req
# 
#   - dimension: soar_appeal_filed
#     type: int
#     sql: ${TABLE}.soar_appeal_filed
# 
#   - dimension: soar_appeal_level
#     type: int
#     sql: ${TABLE}.soar_appeal_level
# 
#   - dimension: soar_connected
#     type: int
#     sql: ${TABLE}.soar_connected
# 
#   - dimension_group: soar_consent_faxed
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.soar_consent_faxed
# 
#   - dimension: soar_consult_exam
#     type: int
#     sql: ${TABLE}.soar_consult_exam
# 
#   - dimension: soar_county
#     sql: ${TABLE}.soar_county
# 
#   - dimension: soar_decision_not_reason
#     type: int
#     sql: ${TABLE}.soar_decision_not_reason
# 
#   - dimension: soar_decision_received
#     type: int
#     sql: ${TABLE}.soar_decision_received
# 
#   - dimension: soar_denial_reason
#     type: int
#     sql: ${TABLE}.soar_denial_reason
# 
#   - dimension: soar_ga_reimbursement
#     type: number
#     sql: ${TABLE}.soar_ga_reimbursement
# 
#   - dimension: soar_hours
#     type: int
#     sql: ${TABLE}.soar_hours
# 
#   - dimension_group: soar_housed
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.soar_housed
# 
#   - dimension_group: soar_initial_decision
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.soar_initial_decision
# 
#   - dimension: soar_initial_outcome
#     type: int
#     sql: ${TABLE}.soar_initial_outcome
# 
#   - dimension: soar_med_cosign
#     type: int
#     sql: ${TABLE}.soar_med_cosign
# 
#   - dimension: soar_med_records
#     type: int
#     sql: ${TABLE}.soar_med_records
# 
#   - dimension: soar_med_summary
#     type: int
#     sql: ${TABLE}.soar_med_summary
# 
#   - dimension: soar_medicaid_reimbursement
#     type: number
#     sql: ${TABLE}.soar_medicaid_reimbursement
# 
#   - dimension: soar_medicare_reimbursement
#     type: number
#     sql: ${TABLE}.soar_medicare_reimbursement
# 
#   - dimension: soar_not_submitted
#     type: int
#     sql: ${TABLE}.soar_not_submitted
# 
#   - dimension: soar_not_submitted_reason
#     type: int
#     sql: ${TABLE}.soar_not_submitted_reason
# 
#   - dimension: soar_path
#     type: int
#     sql: ${TABLE}.soar_path
# 
#   - dimension: soar_payee_needed
#     type: int
#     sql: ${TABLE}.soar_payee_needed
# 
#   - dimension: soar_payee_provided
#     type: int
#     sql: ${TABLE}.soar_payee_provided
# 
#   - dimension: soar_pending_status
#     type: int
#     sql: ${TABLE}.soar_pending_status
# 
#   - dimension: soar_quality_review
#     type: int
#     sql: ${TABLE}.soar_quality_review
# 
#   - dimension: soar_reconsideration
#     type: int
#     sql: ${TABLE}.soar_reconsideration
# 
#   - dimension_group: soar_reconsideration
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.soar_reconsideration_date
# 
#   - dimension: soar_reconsideration_outcome
#     type: int
#     sql: ${TABLE}.soar_reconsideration_outcome
# 
#   - dimension: soar_region
#     sql: ${TABLE}.soar_region
# 
#   - dimension: soar_ssa
#     type: int
#     sql: ${TABLE}.soar_ssa
# 
#   - dimension: soar_ssa_form
#     type: int
#     sql: ${TABLE}.soar_ssa_form
# 
#   - dimension: soar_ssdi_approved
#     type: int
#     sql: ${TABLE}.soar_ssdi_approved
# 
#   - dimension_group: soar_ssi_app
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.soar_ssi_app
# 
#   - dimension: soar_ssi_approved
#     type: int
#     sql: ${TABLE}.soar_ssi_approved
# 
#   - dimension: soar_staff
#     sql: ${TABLE}.soar_staff
# 
#   - dimension: soar_staff_initiated
#     type: int
#     sql: ${TABLE}.soar_staff_initiated
# 
#   - dimension: soar_staff_ssa
#     type: int
#     sql: ${TABLE}.soar_staff_ssa
# 
#   - dimension: soar_trained
#     type: int
#     sql: ${TABLE}.soar_trained
# 
#   - dimension: ssn_quality
#     type: int
#     sql: ${TABLE}.ssn_quality
# 
#   - dimension: us_citizen
#     type: int
#     sql: ${TABLE}.us_citizen
# 
#   - dimension: veteran
#     type: int
#     sql: ${TABLE}.veteran
# 
#   - dimension: veteran_branch
#     type: int
#     sql: ${TABLE}.veteran_branch
# 
#   - dimension: veteran_discharge
#     type: int
#     sql: ${TABLE}.veteran_discharge
# 
#   - dimension: veteran_duration
#     type: int
#     sql: ${TABLE}.veteran_duration
# 
#   - dimension: veteran_entered
#     type: int
#     sql: ${TABLE}.veteran_entered
# 
#   - dimension: veteran_era
#     type: int
#     sql: ${TABLE}.veteran_era
# 
#   - dimension: veteran_fire
#     type: int
#     sql: ${TABLE}.veteran_fire
# 
#   - dimension: veteran_separated
#     type: int
#     sql: ${TABLE}.veteran_separated
# 
#   - dimension: veteran_theater_afg
#     type: int
#     sql: ${TABLE}.veteran_theater_afg
# 
#   - dimension: veteran_theater_iraq1
#     type: int
#     sql: ${TABLE}.veteran_theater_iraq1
# 
#   - dimension: veteran_theater_iraq2
#     type: int
#     sql: ${TABLE}.veteran_theater_iraq2
# 
#   - dimension: veteran_theater_kw
#     type: int
#     sql: ${TABLE}.veteran_theater_kw
# 
#   - dimension: veteran_theater_other
#     type: int
#     sql: ${TABLE}.veteran_theater_other
# 
#   - dimension: veteran_theater_pg
#     type: int
#     sql: ${TABLE}.veteran_theater_pg
# 
#   - dimension: veteran_theater_vw
#     type: int
#     sql: ${TABLE}.veteran_theater_vw
# 
#   - dimension: veteran_theater_ww2
#     type: int
#     sql: ${TABLE}.veteran_theater_ww2
# 
#   - dimension: veteran_warzone
#     type: int
#     sql: ${TABLE}.veteran_warzone
# 
#   - dimension: veteran_warzone_duration
#     type: int
#     sql: ${TABLE}.veteran_warzone_duration
# 
#   - dimension: veteran_warzone_is
#     type: int
#     sql: ${TABLE}.veteran_warzone_is

#   - dimension_group: vi_f_spdat_child10_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child10_dob
# 
#   - dimension: vi_f_spdat_child10_fullname
#     sql: ${TABLE}.vi_f_spdat_child10_fullname
# 
#   - dimension_group: vi_f_spdat_child1_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child1_dob
# 
#   - dimension: vi_f_spdat_child1_fullname
#     sql: ${TABLE}.vi_f_spdat_child1_fullname
# 
#   - dimension_group: vi_f_spdat_child2_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child2_dob
# 
#   - dimension: vi_f_spdat_child2_fullname
#     sql: ${TABLE}.vi_f_spdat_child2_fullname
# 
#   - dimension_group: vi_f_spdat_child3_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child3_dob
# 
#   - dimension: vi_f_spdat_child3_fullname
#     sql: ${TABLE}.vi_f_spdat_child3_fullname
# 
#   - dimension_group: vi_f_spdat_child4_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child4_dob
# 
#   - dimension: vi_f_spdat_child4_fullname
#     sql: ${TABLE}.vi_f_spdat_child4_fullname
# 
#   - dimension_group: vi_f_spdat_child5_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child5_dob
# 
#   - dimension: vi_f_spdat_child5_fullname
#     sql: ${TABLE}.vi_f_spdat_child5_fullname
# 
#   - dimension_group: vi_f_spdat_child6_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child6_dob
# 
#   - dimension: vi_f_spdat_child6_fullname
#     sql: ${TABLE}.vi_f_spdat_child6_fullname
# 
#   - dimension_group: vi_f_spdat_child7_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child7_dob
# 
#   - dimension: vi_f_spdat_child7_fullname
#     sql: ${TABLE}.vi_f_spdat_child7_fullname
# 
#   - dimension_group: vi_f_spdat_child8_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child8_dob
# 
#   - dimension: vi_f_spdat_child8_fullname
#     sql: ${TABLE}.vi_f_spdat_child8_fullname
# 
#   - dimension_group: vi_f_spdat_child9_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_child9_dob
# 
#   - dimension: vi_f_spdat_child9_fullname
#     sql: ${TABLE}.vi_f_spdat_child9_fullname
# 
#   - dimension: vi_f_spdat_children_num
#     type: int
#     sql: ${TABLE}.vi_f_spdat_children_num
# 
#   - dimension_group: vi_f_spdat_hh2_dob
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.vi_f_spdat_hh2_dob
# 
#   - dimension: vi_f_spdat_hh2_fullname
#     sql: ${TABLE}.vi_f_spdat_hh2_fullname
# 
#   - dimension: vi_f_spdat_hh2_gender
#     type: int
#     sql: ${TABLE}.vi_f_spdat_hh2_gender
# 



  - dimension: vi_f_spdat_child1_dob
    type: date_date
    label: 'Child  1 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child1_dob

  - dimension: vi_f_spdat_child2_dob
    type: date_date
    label: 'Child  2 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child2_dob

  - dimension: vi_f_spdat_child3_dob
    type: date_date
    label: 'Child  3 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child3_dob    

  - dimension: vi_f_spdat_child4_dob
    type: date_date
    label: 'Child  4 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child4_dob

  - dimension: vi_f_spdat_child5_dob
    type: date_date
    label: 'Child  5 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child5_dob
    
  - dimension: vi_f_spdat_child6_dob
    type: date_date
    label: 'Child  6 DoB'
    group_label: 'VI-FSPDAT assessment_questions'  
    sql: ${TABLE}.vi_f_spdat_child6_dob
    
  - dimension: vi_f_spdat_child7_dob
    type: date_date
    label: 'Child  7 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child7_dob
    
  - dimension: vi_f_spdat_child8_dob
    type: date_date
    label: 'Child  8 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child8_dob    

  - dimension: vi_f_spdat_child9_dob
    type: date_date
    label: 'Child  9 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child8_dob

  - dimension: vi_f_spdat_child10_dob
    type: date_date
    label: 'Child 10 DoB'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: ${TABLE}.vi_f_spdat_child10_dob
    
    
  - dimension: vi_f_spdat_pregnancy
    group_label: 'VI-FSPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_f_spdat_pregnancy',${TABLE}.vi_f_spdat_pregnancy)    


  - dimension: vi_spdat_q23a_v2
    label: 'Mental health issue or concern?'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q23a_v2',${TABLE}.vi_spdat_q23a_v2)    

  - dimension: vi_spdat_q23b_v2
    label: 'Head injury?'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q23b_v2',${TABLE}.vi_spdat_q23b_v2)    
    
  - dimension: vi_f_spdat_q28_v2
    label: 'Tri-morbidity of one household member?'
    group_label: 'VI-FSPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_f_spdat_q28_v2',${TABLE}.vi_f_spdat_q28_v2)  
    
  - dimension: vi_spdat_q1
    label: 'Time since housing'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q1',${TABLE}.vi_spdat_q1)  
    
  - dimension: vi_y_spdat_q1
    label: 'Where do you sleep most frequently?'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_y_spdat_q1',${TABLE}.vi_y_spdat_q1)  

  - dimension: vi_spdat_q8
    label: 'Have you been attacked or beaten up since you’ve become homeless?'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q8',${TABLE}.vi_spdat_q8)  
        
        
  - dimension: vi_spdat_q9
    label: 'Have you threatened to or tried to harm yourself or anyone else in the last year?'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q9',${TABLE}.vi_spdat_q9)  
    
  - dimension: vi_spdat_q24_v2
    label: 'Mental health or brain issues'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q24_v2',${TABLE}.vi_spdat_q24_v2)  
        
        
  - dimension: benefits_medicaid
    label: 'Medicaid'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('benefits_medicaid',${TABLE}.benefits_medicaid)  

  - dimension: previous_foster_care
    label: 'Previous Foster Care'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('previous_foster_care',${TABLE}.previous_foster_care)  
        
        
  - dimension: income_individual
    label: 'Total Monthly Income'
    group_label: 'VI--SPDAT assessment_questions'
    sql: ${TABLE}.income_individual


    
# 
#   - dimension: vi_f_spdat_q41
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q41
# 
#   - dimension: vi_f_spdat_q50
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q50
# 
#   - dimension: vi_f_spdat_q53
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q53
# 
#   - dimension: vi_f_spdat_q54
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q54
# 
#   - dimension: vi_f_spdat_q55
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q55
# 
#   - dimension: vi_f_spdat_q56
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q56
# 
#   - dimension: vi_f_spdat_q57
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q57
# 
#   - dimension: vi_f_spdat_q58
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q58
# 
#   - dimension: vi_f_spdat_q59
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q59
# 
#   - dimension: vi_f_spdat_q60
#     type: int
#     sql: ${TABLE}.vi_f_spdat_q60
# 
#   - dimension: vi_f_spdat_second_hoh
#     type: int
#     sql: ${TABLE}.vi_f_spdat_second_hoh
# 
#   - dimension: vi_spdat_flwup_1
#     type: int
#     sql: ${TABLE}.vi_spdat_flwup_1
# 
#   - dimension: vi_spdat_flwup_2
#     sql: ${TABLE}.vi_spdat_flwup_2
# 
#   - dimension: vi_spdat_q1
#     type: int
#     sql: ${TABLE}.vi_spdat_q1
# 
#   - dimension: vi_spdat_q10
#     type: int
#     sql: ${TABLE}.vi_spdat_q10
# 
#   - dimension: vi_spdat_q11
#     type: int
#     sql: ${TABLE}.vi_spdat_q11
# 
#   - dimension: vi_spdat_q12
#     type: int
#     sql: ${TABLE}.vi_spdat_q12
# 
#   - dimension: vi_spdat_q13
#     type: int
#     sql: ${TABLE}.vi_spdat_q13
# 
#   - dimension: vi_spdat_q14
#     type: int
#     sql: ${TABLE}.vi_spdat_q14
# 
#   - dimension: vi_spdat_q15
#     type: int
#     sql: ${TABLE}.vi_spdat_q15
# 
#   - dimension: vi_spdat_q16
#     type: int
#     sql: ${TABLE}.vi_spdat_q16
# 
#   - dimension: vi_spdat_q17
#     type: int
#     sql: ${TABLE}.vi_spdat_q17
# 
#   - dimension: vi_spdat_q18
#     type: int
#     sql: ${TABLE}.vi_spdat_q18
# 
#   - dimension: vi_spdat_q19
#     type: int
#     sql: ${TABLE}.vi_spdat_q19
# 
  - dimension: vi_spdat_q2
    label: 'Homeless Number of Times'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q2',${TABLE}.vi_spdat_q2)
# 
#   - dimension: vi_spdat_q20
#     type: int
#     sql: ${TABLE}.vi_spdat_q20
# 
#   - dimension: vi_spdat_q21
#     type: int
#     sql: ${TABLE}.vi_spdat_q21
# 
#   - dimension: vi_spdat_q22
#     type: int
#     sql: ${TABLE}.vi_spdat_q22
# 
#   - dimension: vi_spdat_q23
#     type: int
#     sql: ${TABLE}.vi_spdat_q23
# 
#   - dimension: vi_spdat_q24
#     type: int
#     sql: ${TABLE}.vi_spdat_q24
# 
#   - dimension: vi_spdat_q25
#     type: int
#     sql: ${TABLE}.vi_spdat_q25
# 
#   - dimension: vi_spdat_q26
#     type: int
#     sql: ${TABLE}.vi_spdat_q26
# 
#   - dimension: vi_spdat_q27
#     type: int
#     sql: ${TABLE}.vi_spdat_q27
# 
#   - dimension: vi_spdat_q28
#     type: int
#     sql: ${TABLE}.vi_spdat_q28
# 
#   - dimension: vi_spdat_q29
#     type: int
#     sql: ${TABLE}.vi_spdat_q29
# 
#   - dimension: vi_spdat_q3
#     type: int
#     sql: ${TABLE}.vi_spdat_q3
# 
#   - dimension: vi_spdat_q30
#     type: int
#     sql: ${TABLE}.vi_spdat_q30
# 
#   - dimension: vi_spdat_q31
#     type: int
#     sql: ${TABLE}.vi_spdat_q31
# 
#   - dimension: vi_spdat_q32
#     type: int
#     sql: ${TABLE}.vi_spdat_q32
# 
#   - dimension: vi_spdat_q33
#     type: int
#     sql: ${TABLE}.vi_spdat_q33
# 
#   - dimension: vi_spdat_q34
#     type: int
#     sql: ${TABLE}.vi_spdat_q34
# 
#   - dimension: vi_spdat_q35
#     type: int
#     sql: ${TABLE}.vi_spdat_q35
# 
#   - dimension: vi_spdat_q36
#     type: int
#     sql: ${TABLE}.vi_spdat_q36
# 
#   - dimension: vi_spdat_q37
#     type: int
#     sql: ${TABLE}.vi_spdat_q37
# 
#   - dimension: vi_spdat_q38
#     type: int
#     sql: ${TABLE}.vi_spdat_q38
# 
#   - dimension: vi_spdat_q39
#     type: int
#     sql: ${TABLE}.vi_spdat_q39
# 
#   - dimension: vi_spdat_q4
#     type: int
#     sql: ${TABLE}.vi_spdat_q4
# 
#   - dimension: vi_spdat_q40
#     type: int
#     sql: ${TABLE}.vi_spdat_q40
# 
#   - dimension: vi_spdat_q41
#     type: int
#     sql: ${TABLE}.vi_spdat_q41
# 
#   - dimension: vi_spdat_q42
#     type: int
#     sql: ${TABLE}.vi_spdat_q42
# 
#   - dimension: vi_spdat_q43
#     type: int
#     sql: ${TABLE}.vi_spdat_q43
# 
#   - dimension: vi_spdat_q44
#     type: int
#     sql: ${TABLE}.vi_spdat_q44
# 
#   - dimension: vi_spdat_q45
#     type: int
#     sql: ${TABLE}.vi_spdat_q45
# 
#   - dimension: vi_spdat_q46
#     type: int
#     sql: ${TABLE}.vi_spdat_q46
# 
#   - dimension: vi_spdat_q47
#     type: int
#     sql: ${TABLE}.vi_spdat_q47
# 
#   - dimension: vi_spdat_q48
#     type: int
#     sql: ${TABLE}.vi_spdat_q48
# 
#   - dimension: vi_spdat_q49
#     type: int
#     sql: ${TABLE}.vi_spdat_q49
# 
#   - dimension: vi_spdat_q5
#     type: int
#     sql: ${TABLE}.vi_spdat_q5
# 
#   - dimension: vi_spdat_q50
#     type: int
#     sql: ${TABLE}.vi_spdat_q50
# 
  - dimension: vi_spdat_q6
    label: 'Crisis Services Number of Times'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q6',${TABLE}.vi_spdat_q6)
# 
  - dimension: vi_spdat_q7
    label: 'Hospitalization Number Times Inpatient'
    group_label: 'VI--SPDAT assessment_questions'
    sql: fn_getPicklistValueName('vi_spdat_q7',${TABLE}.vi_spdat_q7)
# 
#   - dimension: vi_spdat_q8
#     type: int
#     sql: ${TABLE}.vi_spdat_q8
# 
#   - dimension: vi_spdat_q9
#     type: int
#     sql: ${TABLE}.vi_spdat_q9

#   - dimension: zipcode
#     type: number
#     sql: ${TABLE}.zipcode
# 
#   - dimension: zipcode_quality
#     type: int
#     sql: ${TABLE}.zipcode_quality

  - measure: count
    type: count
    drill_fields: detail*
    
 
    


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - vi_f_spdat_child1_fullname
    - vi_f_spdat_child8_fullname
    - vi_f_spdat_child9_fullname
    - vi_f_spdat_child10_fullname
    - vi_f_spdat_hh2_fullname
    - vi_f_spdat_child7_fullname
    - vi_f_spdat_child2_fullname
    - vi_f_spdat_child3_fullname
    - vi_f_spdat_child4_fullname
    - vi_f_spdat_child5_fullname
    - vi_f_spdat_child6_fullname

