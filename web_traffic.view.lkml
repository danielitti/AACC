view: web_traffic {
  sql_table_name: SYSTEM.MRT_CONCAR_STG_WEB_TRAFFIC ;;

  dimension: cookie_id {
    type: string
    sql: ${TABLE}.COOKIE_ID ;;
  }

  dimension: devic_emobile_model {
    label: "Device Mobile Model"
    type: string
    sql: ${TABLE}.DEVIC_EMOBILE_MODEL ;;
  }

  dimension: device_browser {
    type: string
    sql: ${TABLE}.DEVICE_BROWSER ;;
  }

  dimension: device_is_mobile {
    type: string
    sql: ${TABLE}.DEVICE_IS_MOBILE ;;
  }

  dimension: device_mobile_branding {
    type: string
    sql: ${TABLE}.DEVICE_MOBILE_BRANDING ;;
  }

  dimension: device_operating_system {
    type: string
    sql: ${TABLE}.DEVICE_OPERATING_SYSTEM ;;
  }

  dimension: geo_network_city {
    type: string
    sql: ${TABLE}.GEO_NETWORK_CITY ;;
  }

  dimension: geo_network_country {
    type: string
    sql: ${TABLE}.GEO_NETWORK_COUNTRY ;;
  }

  dimension: membership_number {
    type: string
    sql: ${TABLE}.MEMBERSHIP_NUMBER ;;
  }

  dimension: page_source {
    type: string
    sql: ${TABLE}.PAGE_SOURCE ;;
  }

  dimension: page_source_medium {
    type: string
    sql: ${TABLE}.PAGE_SOURCE_MEDIUM ;;
  }

  dimension: page_source_referral_path {
    type: string
    sql: ${TABLE}.PAGE_SOURCE_REFERRAL_PATH ;;
  }

  dimension: page_visited {
    type: string
    sql: ${TABLE}.PAGE_VISITED ;;
  }

  dimension: funnel_journey_page {
    label: "Funnel Journey"
    type: string
    sql: case
            when ${TABLE}.PAGE_VISITED = '/breakdown-cover/connected-car' then '1 - Product Page'
            when ${TABLE}.PAGE_VISITED = '/breakdown-cover/connected-car/enquiry' then '2 - Register your interest'
            else 'Undefined'
        end;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension: visit_day_of_week {
    type: string
    sql: case
            when ${TABLE}.VISIT_DAY_OF_WEEK = '1' then '7 - Sunday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = '2' then '1 - Monday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = '3' then '2 - Tuesday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = '4' then '3 - Wednesday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = '5' then '4 - Thursday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = '6' then '5 - Friday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = '7' then '6 - Saturday'
            else null
        end;;
  }

  dimension_group: visit_timestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.VISIT_TIMESTAMP ;;
  }

  measure: visits {
    label: "# Views"
    type: count
  }

  measure: visits_funnel_1 {
    label: "# Visits Funnel 1"
    type: count
    filters: {
      field: page_visited
      value: "/breakdown-cover/connected-car"
    }
  }

  measure: visits_funnel_2 {
    label: "# Visits Funnel 2"
    type: count
    filters: {
      field: page_visited
      value: "/breakdown-cover/connected-car/enquiry"
    }
  }


  measure: visitors {
    label: "# Visitors"
    type: count_distinct
    sql:  ${cookie_id} ;;
  }

  measure: sessions {
    label: "# Sessions"
    type: count_distinct
    sql:  ${session_id} ;;
  }

  measure: session_duration_in_seconds {
    label: "Session Duration In Seconds"
    type: sum
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS ;;
  }

  measure: avg_session_duration_in_seconds {
    label: "AVG Session Duration In Seconds"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS ;;
  }
}
