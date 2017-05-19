view: intelematics_push_event_attributes {
  #sql_table_name: public.aa_push_event_attributes ;;
  derived_table: {
    sql:  select * from public.aa_push_event_attributes where rs_environment = 'prod';;
  }

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

  dimension: rs_pusheventid {
    label: "Event ID"
    group_label: "ID"
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_pusheventid ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: total_event_attributes {
    label: "# Event Attributes"
    group_label: "Count"
    type: count
  }

}
