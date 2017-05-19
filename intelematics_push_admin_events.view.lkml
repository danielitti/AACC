view: intelematics_push_admin_events {
  #sql_table_name: public.aa_push_admin_events ;;
  derived_table: {
    sql:  select * from public.aa_push_admin_events where rs_environment = 'prod';;
  }

  dimension: deviceid {
    label: "Device ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.deviceid ;;
  }

  dimension: driverid {
    label: "Driver ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.driverid ;;
  }

  dimension_group: reportedtimestamp {
    label: "Reported"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reportedtimestamp ;;
  }

  dimension: rs_club {
    type: string
    hidden: yes
    sql: ${TABLE}.rs_club ;;
  }

  dimension: rs_environment {
    type: string
    hidden: yes
    sql: ${TABLE}.rs_environment ;;
  }

  dimension: rs_id {
    label: "Admin Event ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.rs_id ;;
  }

  dimension: simid {
    type: string
    hidden: yes
    sql: ${TABLE}.simid ;;
  }

  dimension: vehicleid {
    label: "Vehicle ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.vehicleid ;;
  }

  measure: total_admin_events {
    label: "# Admin Events"
    group_label: "Count"
    type: count_distinct
    sql: ${rs_id} ;;
    drill_fields: [rs_id]
  }
}
