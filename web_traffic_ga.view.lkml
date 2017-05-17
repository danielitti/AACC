view: web_traffic_ga {
  derived_table: {
    sql:  SELECT  *
          FROM

          (SELECT  --STRFTIME_UTC_USEC(SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000),"%Y-%m-%d %H:%M:%S") as view_timestamp,
                  SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000) as view_timestamp,
                  visitStartTime,
                  DAYOFWEEK(date) AS day_Of_Week, #Where 1 = Sunday,
                  fullVisitorId AS cookie_ID,
                  visitId as session_ID,
                  CASE WHEN hits.page.pagePath like '%/connect-checkout/receipt/%' THEN LEFT(hits.page.pagePath,26) ELSE hits.page.pagePath END as page,
                  totals.timeOnSite as session_Duration_In_Seconds,
                  device.mobileDeviceBranding as device_Mobile_Branding,
                  device.mobileDeviceModel as device_Mobile_Model,
                  device.operatingSystem as device_Operating_System,
                  device.browser as device_Browser,
                  geoNetwork.city as geo_network_city,
                  geoNetwork.country as geo_network_country,
                  trafficSource.referralPath as source_referral_path,
                  trafficSource.source as source,
                  trafficSource.medium as medium,
                  trafficSource.campaign as campaign,
                  device.isMobile as device_is_mobile
                  FROM  (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_],
                        TIMESTAMP('20170324'),
                        TIMESTAMP(replace(string(date_add(current_date(), -1, 'DAY')), '-', ''))))
                  WHERE (hits.page.pagePath = '/breakdown-cover/connected-car'
                        OR hits.page.pagePath = '/car-genie'
                        OR hits.page.pagePath like '%connect-checkout%')
                        AND hits.type = "PAGE"),


          (SELECT  --STRFTIME_UTC_USEC(SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000),"%Y-%m-%d %H:%M:%S") as view_timestamp,
                  SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000) as view_timestamp,
                  visitStartTime,
                  DAYOFWEEK(date) AS day_Of_Week, #Where 1 = Sunday,
                  fullVisitorId AS cookie_ID,
                  visitId as session_ID,
                  CASE WHEN hits.page.pagePath like '%/connect-checkout/receipt/%' THEN LEFT(hits.page.pagePath,26) ELSE hits.page.pagePath END as page,
                  totals.timeOnSite as session_Duration_In_Seconds,
                  device.mobileDeviceBranding as device_Mobile_Branding,
                  device.mobileDeviceModel as device_Mobile_Model,
                  device.operatingSystem as device_Operating_System,
                  device.browser as device_Browser,
                  geoNetwork.city as geo_network_city,
                  geoNetwork.country as geo_network_country,
                  trafficSource.referralPath as source_referral_path,
                  trafficSource.source as source,
                  trafficSource.medium as medium,
                  trafficSource.campaign as campaign,
                  device.isMobile as device_is_mobile
                  FROM  (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_intraday_],
                        TIMESTAMP(replace(string(current_date()), '-', '')),
                        TIMESTAMP(replace(string(current_date()), '-', ''))))
                  WHERE (hits.page.pagePath = '/breakdown-cover/connected-car'
                        OR hits.page.pagePath = '/car-genie'
                        OR hits.page.pagePath like '%connect-checkout%')
                        AND hits.type = "PAGE")
        ;;

    }

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
    type: yesno
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
     sql: ${web_traffic_ga_membership_number.membership_number} ;;
   }

  dimension: source {
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.MEDIUM ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.CAMPAIGN ;;
  }

  dimension: source_referral_path {
    type: string
    sql: ${TABLE}.SOURCE_REFERRAL_PATH ;;
  }

  dimension:page  {
    type: string
    sql: ${TABLE}.PAGE ;;
  }

  dimension: page_name {
    type: string
    sql: case
            when ${page} = '/breakdown-cover/connected-car' then 'Product Page'
            when ${page} = '/car-genie' then 'Shop Home Page'
            when ${page} = '/connect-checkout/eligibility' then 'Eligibility'
            when ${page} = '/connect-checkout/' then 'Eligibility'
            when ${page} = '/connect-checkout/delivery' then 'Delivery'
            when ${page} = '/connect-checkout/order-summary' then 'Order Summary'
            when ${page} = '/connect-checkout/receipt/' then 'Receipt'
            else 'Undefined'
        end;;
  }


  dimension: funnel_journey_page {
    label: "Funnel Journey"
    type: string
    sql: case
            when ${page} = '/breakdown-cover/connected-car' then '1 - Product Page'
            when ${page} = '/connect-checkout/eligibility' then '3 - Eligibility'
            when ${page} = '/connect-checkout/' then '3 - Eligibility'
            when ${page} = '/connect-checkout/delivery' then '4 - Delivery'
            when ${page} = '/connect-checkout/order-summary' then '5 - Order Summary'
            when ${page} = '/connect-checkout/payment' then '6 - Payment'
            when ${page} = '/connect-checkout/receipt/' then '7 - Receipt'
            else 'Undefined'
        end;;
            # when ${page} = '/car-genie' then '2 - Shop Home Page'
    link: {
      label: "Visitors Trend"
      url: "/looks/244?f[web_traffic_ga.view_timestamp_date]=7%20days&f[web_traffic_ga.funnel_journey_page]={{filterable_value}}"
    }
    link: {
      label: "Visitors Trend by Medium"
      url: "/looks/246?f[web_traffic_ga.view_timestamp_date]=7%20days&f[web_traffic_ga.funnel_journey_page]={{filterable_value}}"
    }
  }

  dimension: session_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension: day_of_week {
    type: string
    sql: case
            when ${TABLE}.DAY_OF_WEEK = 1 then '7 - Sunday'
            when ${TABLE}.DAY_OF_WEEK = 2 then '1 - Monday'
            when ${TABLE}.DAY_OF_WEEK = 3 then '2 - Tuesday'
            when ${TABLE}.DAY_OF_WEEK = 4 then '3 - Wednesday'
            when ${TABLE}.DAY_OF_WEEK = 5 then '4 - Thursday'
            when ${TABLE}.DAY_OF_WEEK = 6 then '5 - Friday'
            when ${TABLE}.DAY_OF_WEEK = 7 then '6 - Saturday'
            else null
        end;;
  }

  dimension_group: view_timestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.view_timestamp ;;
  }

  measure: views {
    label: "# Views"
    group_label: "Views"
    type: count
  }

  measure: views_pp {
    label: "# Views Product Page"
    group_label: "Views"
    hidden: no
    type: count
    filters: {
      field: page
      value: "/breakdown-cover/connected-car"
    }
  }

  measure: views_d {
    label: "# Views Delivery Page"
    group_label: "Views"
    hidden: no
    type: count
    filters: {
      field: page
      value: "/connect-checkout/delivery"
    }
  }

  measure: views_fr {
    label: "# Views Final Receipt"
    group_label: "Views"
    hidden: no
    type: count
    filters: {
      field: page
      value: "/connect-checkout/receipt/"
    }
  }

  measure: views_pp_to_fr_ratio {
    label: "Product Page to Final Receipt Views Ratio %"
    group_label: "Views Ratio %"
    type: number
    value_format: "0.00\%"
    sql:  ${views_fr}/${views_pp}*100 ;;
    link: {
      label: "Views Ratio % Analysis"
      url: "/looks/251"
    }
  }

  measure: views_d_to_fr_ratio {
    label: "Delivery Page to Final Receipt Views Ratio %"
    group_label: "Views Ratio %"
    type: number
    value_format: "0.00\%"
    sql:  ${views_fr}/${views_d}*100 ;;
    link: {
      label: "Views Ratio % Analysis"
      url: "/looks/252"
    }
  }

  measure: visitors {
    label: "# Visitors"
    group_label: "Visitors"
    type: count_distinct
    sql:  ${cookie_id} ;;
  }

  measure: visitors_pp {
    label: "# Visitors Product Page"
    group_label: "Visitors"
    hidden: no
    type: count_distinct
    sql:  ${cookie_id} ;;
    filters: {
      field: page
      value: "/breakdown-cover/connected-car"
    }
  }

  measure: visitors_d {
    label: "# Visitors Delivery Page"
    group_label: "Visitors"
    hidden: no
    type: count_distinct
    sql:  ${cookie_id} ;;
    filters: {
      field: page
      value: "/connect-checkout/delivery"
    }
  }

  measure: visitors_fr {
    label: "# Visitors Final Receipt"
    group_label: "Visitors"
    hidden: no
    type: count_distinct
    sql:  ${cookie_id} ;;
    filters: {
      field: page
      value: "/connect-checkout/receipt/"
    }
  }

  measure: visitors_pp_to_fr_ratio {
    label: "Product Page to Final Receipt Visitors Ratio %"
    group_label: "Visitors Ratio %"
    type: number
    value_format: "0.00\%"
    sql:  ${visitors_fr}/${visitors_pp}*100 ;;
    link: {
      label: "Visitors Ratio % Analysis"
      url: "/looks/251?f[web_traffic_ga.view_timestamp_date]=7%20days"
    }
  }

  measure: visitors_d_to_fr_ratio {
    label: "Delivery Page to Final Receipt Visitors Ratio %"
    group_label: "Visitors Ratio %"
    type: number
    value_format: "0.00\%"
    sql:  ${visitors_fr}/${visitors_d}*100 ;;
    link: {
      label: "Visitors Ratio % Analysis"
      url: "/looks/252?f[web_traffic_ga.view_timestamp_date]=7%20days"
    }
  }
  measure: sessions {
    label: "# Sessions"
    type: count_distinct
    sql:  ${session_id} ;;
  }

  measure: session_duration_in_seconds {
    label: "Session Duration In Seconds"
    group_label: "Session Duration"
    type: sum_distinct
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS ;;
  }

  measure: avg_session_duration_in_seconds {
    label: "AVG Session Duration In Seconds"
    group_label: "Session Duration"
    type: average
    value_format: "#,##0.00"
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS ;;
  }

  measure: session_duration_in_minutess {
    label: "Session Duration In Minutes"
    group_label: "Session Duration"
    value_format: "#,##0.00"
    type: sum_distinct
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS /60 ;;
  }

  measure: avg_session_duration_in_minutes {
    label: "AVG Session Duration In Minutes"
    group_label: "Session Duration"
    type: average
    value_format: "#,##0.00"
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS /60;;
  }


  measure: distinct_membership_number {
    label: "# Membership Numbers"
    type: count_distinct
    sql:  ${web_traffic_ga_membership_number.membership_number} ;;
  }

}
