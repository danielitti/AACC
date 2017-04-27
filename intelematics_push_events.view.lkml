view: intelematics_push_events {
  sql_table_name: public.aa_push_events ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: deviceid {
    type: string
    sql: ${TABLE}.deviceid ;;
  }

  dimension_group: devicetimestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.devicetimestamp ;;
  }

  dimension: driverid {
    type: string
    sql: ${TABLE}.driverid ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension_group: reportedtimestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reportedtimestamp ;;
  }

  dimension: rs_club {
    type: string
    sql: ${TABLE}.rs_club ;;
  }

  dimension: rs_environment {
    type: string
    sql: ${TABLE}.rs_environment ;;
  }

  dimension: rs_id {
    type: string
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
    type: string
    sql: ${TABLE}.vehicleid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
