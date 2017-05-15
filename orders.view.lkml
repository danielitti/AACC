view: orders {
  sql_table_name: SYSTEM.MRT_CONCAR_STG_ORDERS ;;

  dimension: car_engine_type {
    type: string
    sql: ${TABLE}.CAR_ENGINE_TYPE ;;
  }

  dimension: car_make {
    type: string
    sql: ${TABLE}.CAR_MAKE ;;
  }

  dimension: car_model {
    type: string
    sql: ${TABLE}.CAR_MODEL ;;
  }

  dimension: car_model_year {
    type: string
    sql: ${TABLE}.CAR_MODEL_YEAR ;;
  }

  dimension: car_vrm {
    hidden: yes
    label: "Car VRM"
    type: string
    sql: ${TABLE}.VRM ;;
  }

  dimension: matchbox_order_id {
    type: string
    sql: ${TABLE}.MATCHBOX_ORDER_ID ;;
  }

  dimension: matchbox_vrm {
    label: "Matchbox VRM"
    type: string
    sql: ${TABLE}.MATCHBOX_VRM ;;
  }

  dimension: membership_number {
    type: string
    hidden:  yes
    sql: ${TABLE}.MEMBERSHIP_NUMBER ;;
  }

  dimension: newsletter {
    type: string
    sql: ${TABLE}.NEWSLETTER ;;
  }

  dimension: order_code {
    type: string
    sql: ${TABLE}.ORDER_CODE ;;
  }

  dimension_group: order {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.ORDER_DATE ;;
  }

  dimension: order_key {
    type: string
    sql: ${TABLE}.ORDER_KEY ;;
  }

  dimension: promotion_code {
    type: string
    sql: ${TABLE}.PROMOTION_CODE ;;
  }

  dimension: realex_order_id {
    type: string
    sql: ${TABLE}.REALEX_ORDER_ID ;;
  }

  dimension: supplier_order_reference {
    type: string
    sql: ${TABLE}.SUPPLIER_ORDER_REFERENCE ;;
  }

  dimension: dimension_discounted_gross_amount {
    hidden:  yes
    type: string
    sql: ${TABLE}.DISCOUNT_VALUE ;;
  }

  measure: gross_amount {
    group_label: "Amount"
    label: "Gross Amount"
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.TOTAL_GROSS ;;
  }

  measure: discounted_gross_amount {
    group_label: "Amount"
    label: "Gross Discount Amount"
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.DISCOUNT_VALUE ;;
  }

  measure: orders_count {
    group_label: "Orders"
    label: "# of Orders"
    type: count
    link: {
      label: "Top Car Makes and Models"
      url: "/dashboards/18"
    }
    link: {
      label: "Customer Demographic"
      url: "/dashboards/19"
    }
    link: {
      label: "Map"
      url: "/looks/253"
    }
  }

  measure: discounted_orders_count {
    group_label: "Orders"
    label: "# of Discounted Orders"
    type: count_distinct
    sql:  ${TABLE}.MATCHBOX_ORDER_ID ;;
    filters: {
     field: dimension_discounted_gross_amount
     value: "-0"
    }
  }

}
