view: intelematics_push_dtcs {
  sql_table_name: public.aa_push_dtcs ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: classcode {
    type: string
    sql: ${TABLE}.classcode ;;
  }

  dimension: classdescription {
    type: string
    sql: ${TABLE}.classdescription ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: extendeddescription {
    type: string
    sql: ${TABLE}.extendeddescription ;;
  }

  dimension: faultnumber {
    type: number
    sql: ${TABLE}.faultnumber ;;
  }

  dimension: faulttype {
    type: string
    sql: ${TABLE}.faulttype ;;
  }

  dimension: firstreportedodometer {
    type: number
    sql: ${TABLE}.firstreportedodometer ;;
  }

  dimension_group: firstreportedtimestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.firstreportedtimestamp ;;
  }

  dimension: iscurrent {
    type: number
    sql: ${TABLE}.iscurrent ;;
  }

  dimension: mismatched {
    type: number
    sql: ${TABLE}.mismatched ;;
  }

  dimension: recommendationcode {
    type: string
    sql: ${TABLE}.recommendationcode ;;
  }

  dimension: recommendationdescription {
    type: string
    sql: ${TABLE}.recommendationdescription ;;
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

  dimension: tripid {
    type: string
    sql: ${TABLE}.tripid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
