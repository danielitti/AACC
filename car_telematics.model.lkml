connection: "intelematics_redshift"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

 explore: intelematics_devices {}

 explore: intelematics_push_admin_events {}

 explore: intelematics_push_dtcs {}

 explore: intelematics_trips {}

 explore: intelematics_vehicles {}

explore: intelematics_push_events {
  view_name: intelematics_push_events

  join: intelematics_push_event_attributes {
    type: inner
    sql_on: ${intelematics_push_events.rs_id} = ${intelematics_push_event_attributes.rs_pusheventid} ;;
    relationship: one_to_many
    type: left_outer
  }
}
