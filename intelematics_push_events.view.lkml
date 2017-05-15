view: intelematics_push_events {
  #sql_table_name: public.aa_push_events ;;
  derived_table: {
    sql:  select * from public.aa_push_events where rs_environment = 'prod';;
  }

  dimension: id {
    label: "Push Event ID"
    group_label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
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

  dimension: driverid {
    label: "Driver ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.driverid ;;
  }

  dimension: latitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.longitude ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: validity {
    type: string
    sql: ${TABLE}.validity ;;
  }

  dimension: vehicleid {
    label: "Vehicle ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.vehicleid ;;
  }

  measure: total_push_events {
    label: "# Push Events"
    group_label: "Count"
    type: count
    drill_fields: [id]
  }
}
