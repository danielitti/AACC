view: web_traffic_ga {
  derived_table: {
    sql: SELECT  --STRFTIME_UTC_USEC(SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000),"%Y-%m-%d %H:%M:%S") as visit_Timestamp,
        SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000) as visit_Timestamp,
        visitStartTime,
        DAYOFWEEK(date) AS visit_Day_Of_Week, #Where 1 = Sunday,
        fullVisitorId AS cookie_ID,
        '' as membership_number,
        visitId as session_ID,
        hits.page.pagePath as page_Visited,
        totals.timeOnSite as session_Duration_In_Seconds,
        device.mobileDeviceBranding as device_Mobile_Branding,
        device.mobileDeviceModel as device_Mobile_Model,
        device.operatingSystem as device_Operating_System,
        device.browser as device_Browser,
        geoNetwork.city as geo_network_city,
        geoNetwork.country as geo_network_country,
        trafficSource.referralPath as page_source_referral_path,
        trafficSource.source as page_source,
        trafficSource.medium as page_source_medium,
        device.isMobile as device_is_mobile
        FROM
          (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_],
                        TIMESTAMP('20170324'),
                        TIMESTAMP('20180401')))
        WHERE (REGEXP_MATCH(hits.page.pagePath,r"(/breakdown-cover/connected-car|/breakdown-cover/connected-car/enquiry)"))
        AND hits.type = "PAGE"

        ;;

    }

  #[the-aa-1470042790750:110663916.ga_sessions_20151028]

  dimension: cookie_id {
    type: string
    sql: ${TABLE}.COOKIE_ID ;;
  }

  dimension: device_mobile_model {
    type: string
    sql: ${TABLE}.DEVICE_MOBILE_MODEL ;;
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
            when ${TABLE}.VISIT_DAY_OF_WEEK = 1 then '7 - Sunday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = 2 then '1 - Monday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = 3 then '2 - Tuesday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = 4 then '3 - Wednesday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = 5 then '4 - Thursday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = 6 then '5 - Friday'
            when ${TABLE}.VISIT_DAY_OF_WEEK = 7 then '6 - Saturday'
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

  measure: visits_pp {
    label: "# Visits Product Page"
    hidden: no
    type: count
    filters: {
      field: page_visited
      value: "/breakdown-cover/connected-car"
    }
    link: {
      label: "Visits Product Page"
      url: "/explore/ga_big_query_web_data/web_traffic_ga?fields=web_traffic_ga.visit_timestamp_date,web_traffic_ga.visits_pp&fill_fields=web_traffic_ga.visit_timestamp_date&sorts=web_traffic_ga.visit_timestamp_date&limit=30&column_limit=50&query_timezone=Europe%2FLondon&vis=%7B%7D&filter_config=%7B%7D&origin=share-expanded"
    }
  }

  measure: visits_ryi {
    label: "# Visits Register your interest"
    hidden: no
    type: count
    filters: {
      field: page_visited
      value: "/breakdown-cover/connected-car/enquiry"
    }
  }

  measure: visits_ratio {
    label: "Visits Ratio %"
    type: number
    value_format: "0\%"
    sql:  ${visits_ryi}/${visits_pp}*100 ;;
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
