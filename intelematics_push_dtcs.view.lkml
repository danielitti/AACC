view: intelematics_push_dtcs {
  #sql_table_name: public.aa_push_dtcs ;;
  derived_table: {
    sql:  select * from public.aa_push_dtcs where rs_environment = 'prod';;
  }

  dimension: id {
    label: "Push DTCS ID"
    group_label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: classcode {
    label: "Class Code"
    type: string
    sql: ${TABLE}.classcode ;;
  }

  dimension: classdescription {
    label: "Class Description"
    type: string
    sql: ${TABLE}.classdescription ;;
  }

  dimension: code {
    label: "Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: deviceid {
    label: "Device ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.deviceid ;;
  }

  dimension_group: devicetimestamp {
    label: "Device"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.devicetimestamp ;;
  }

  dimension: extendeddescription {
    label: "Extended Description"
    type: string
    sql: ${TABLE}.extendeddescription ;;
  }

  dimension: faultnumber {
    label: "Fault Number"
    type: number
    sql: ${TABLE}.faultnumber ;;
  }

  dimension: faulttype {
    label: "Fault Type"
    type: string
    sql: ${TABLE}.faulttype ;;
  }

  dimension: firstreportedodometer {
    type: number
    hidden:  yes
    sql: ${TABLE}.firstreportedodometer ;;
  }

  dimension_group: firstreportedtimestamp {
    label: "First Reported"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.firstreportedtimestamp ;;
  }

  dimension: iscurrent {
    label: "Is Current"
    type: number
    sql: ${TABLE}.iscurrent ;;
  }

  dimension: mismatched {
    label: "Mismatched"
    type: number
    sql: ${TABLE}.mismatched ;;
  }

  dimension: recommendationcode {
    label: "Recommendation Code"
    type: string
    sql: ${TABLE}.recommendationcode ;;
  }

  dimension: recommendationdescription {
    label: "Recommendation Description"
    type: string
    sql: ${TABLE}.recommendationdescription ;;
  }

  dimension_group: reportedtimestamp {
    label: "Reported"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reportedtimestamp ;;
  }

  dimension: rs_club {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_club ;;
  }

  dimension: rs_environment {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_environment ;;
  }

  dimension: rs_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_id ;;
  }

  dimension: tripid {
    label: "Trip ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.tripid ;;
  }

  measure: total_push_DTCS {
    label: "# Push DTCS"
    group_label: "Count"
    type: count
    drill_fields: [id]
  }
}
