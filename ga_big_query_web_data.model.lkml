connection: "ga_big_query_web_data"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

#explore: web_traffic_ga {}

#explore: web_traffic_ga_membership_number {}

explore: web_traffic_ga {
  view_name: web_traffic_ga

  join: web_traffic_ga_membership_number {
    type: inner
    sql_on: ${web_traffic_ga.cookie_id} = ${web_traffic_ga_membership_number.cookie_id} ;;
    relationship: many_to_one # Could be excluded since many_to_one is the default
    type: left_outer
  }
}
