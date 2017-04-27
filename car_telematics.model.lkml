connection: "intelematics_redshift"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# explore: intelematics_devices {}

# explore: intelematics_push_admin_events {}

# explore: intelematics_push_dtcs {}

# explore: intelematics_push_event_attributes {}

# explore: intelematics_push_events {}

explore: intelematics_trips {}

explore: intelematics_vehicles {}
