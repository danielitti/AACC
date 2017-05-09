view: calls {
  sql_table_name: SYSTEM.V_MRT_CONCAR_STG_CALLS ;;


  dimension_group: call {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.CALL_DATE ;;
  }

  dimension: intrvl {
    type: string
    hidden:  yes
    sql: ${TABLE}.INTRVL ;;
  }

  dimension: level_0 {
    type: string
    sql: ${TABLE}.LEVEL_0 ;;
  }

  dimension: level_1 {
    type: string
    sql: ${TABLE}.LEVEL_1 ;;
  }

  dimension: level_2 {
    type: string
    sql: ${TABLE}.LEVEL_2 ;;
  }

  dimension: level_3 {
    type: string
    sql: ${TABLE}.LEVEL_3 ;;
  }

  dimension: level_4 {
    type: string
    sql: ${TABLE}.LEVEL_4 ;;
  }

  dimension: level_5 {
    type: string
    sql: ${TABLE}.LEVEL_5 ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.TIME ;;
  }

  dimension: vdn {
    type: string
    sql: ${TABLE}.VDN ;;
  }

  dimension: vdn_category {
    type: string
    sql: ${TABLE}.VDN_CATEGORY ;;
  }

  dimension: vdn_name {
    type: string
    sql: ${TABLE}.VDN_NAME ;;
  }

  measure: acd_calls {
    label: "# of Processed Calls"
    group_label: "Calls"
    value_format: "0"
    type: sum
    sql: ${TABLE}.ACD_CALLS ;;
  }

  measure: acd_time {
    label: "Duration of Processed Calls (s)"
    group_label: "Duration"
    type: sum
    sql: ${TABLE}.ACD_TIME ;;
  }

  measure: abn_calls {
    label: "# of Abbandoned Calls"
    group_label: "Calls"
    value_format: "0"
    type: sum
    sql: ${TABLE}.ABN_CALLS ;;
  }

  measure: abn_time {
    label: "Duration of Abbandoned Calls (s)"
    group_label: "Duration"
    type: sum
    sql: ${TABLE}.ABN_TIME ;;
  }

  measure: other_calls {
    label: "# of Other Calls"
    group_label: "Calls"
    value_format: "0"
    type: sum
    sql: ${TABLE}.OTHER_CALLS ;;
  }

  measure: other_time {
    label: "Duration of Other Calls (s)"
    group_label: "Duration"
    type: sum
    sql: ${TABLE}.OTHER_TIME ;;
  }

  measure: total_calls {
    label: "Total # of Calls"
    group_label: "Calls"
    value_format: "0"
    type: sum
    sql: ${TABLE}.ACD_CALLS + ${TABLE}.ABN_CALLS + ${TABLE}.OTHER_CALLS ;;
    link: {
      label: "Total Calls Breakdown By Day"
      url: "/looks/272?f[calls.call_date]=7%20days"
    }
  }

  measure: total_time {
    label: "Total Duration of Calls (s)"
    group_label: "Duration"
    type: sum
    sql: ${TABLE}.ACD_TIME + ${TABLE}.ABN_TIME + ${TABLE}.OTHER_TIME ;;
  }

  measure: acw_time {
    label: "Duration of After Calls (s)"
    type: sum
    sql: ${TABLE}.ACW_TIME ;;
  }


}
