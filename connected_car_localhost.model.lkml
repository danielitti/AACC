connection: "localhost"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: app_download {}

explore: app_ratings {}

explore: provisioning {}

explore: stock {}

# this was a test of GA data loaded on Oracle; deprecated now
# explore: web_traffic {}

explore: orders_details {
  view_name: orders

  join: customers {
    type: inner
    sql_on: ${orders.membership_number} = ${customers.membership_number} ;;
    relationship: one_to_one
  }
}

# used together
# explore: customers {}
# explore: orders {}

explore: calls {}
