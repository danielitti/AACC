view: stock {
  sql_table_name: SYSTEM.V_MRT_CONCAR_STG_STOCK  ;;

  dimension: part_description {
    type: string
    sql: ${TABLE}.PART_DESCRIPTION ;;
  }

  dimension: part_no {
    type: string
    sql: ${TABLE}.PART_NO ;;
  }

  dimension_group: stock {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.STOCK_DATE ;;
  }

  measure: qty_available {
    group_label: "# Available"
    label: "# Available"
    type: sum
    sql: ${TABLE}.QTY_AVAILABLE ;;
  }

  measure: qty_on_hand {
    group_label: "# On Hand"
    label: "# On Hand"
    type: sum
    sql: ${TABLE}.QTY_ON_HAND ;;
  }

  measure: qty_reserved {
    group_label: "# Reserved"
    label: "# Reserved"
    type: sum
    sql: ${TABLE}.QTY_RESERVED ;;
  }

  measure: qty_stock {
    group_label: "# Stock"
    label: "# Stock"
    type: min
    sql:  ${TABLE}.QTY_IN_STOCK ;;
  }

}
