view: intelematics_push_event_attributes {
  sql_table_name: public.aa_push_event_attributes ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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

  dimension: rs_pusheventid {
    type: string
    sql: ${TABLE}.rs_pusheventid ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
