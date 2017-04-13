- dashboard: car_genie_kpis
  title: Car Genie Kpis
  layout: tile
  tile_size: 100

  filters:

  - name: dashboard_date
    title: 'Date'
    type: date_filter
    default_value: 2017/04/01 to 2017/04/05


  elements:

  - name: web_traffic_kpi_visit1
    width: 2
    height: 2
    title: Product Page Visits
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.visits_pp]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_visit2
    width: 2
    height: 2
    title: Product Page Visits
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.visits_ryi]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_visit_ratio
    width: 2
    height: 2
    title: Product Page Visits
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.visits_ratio]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: orders_kpi_total
    width: 2
    height: 2
    title: Orders
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    measures: [orders.gross_amount]
    listen:
      dashboard_date: orders.order_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: add_a_unique_name_1492099746
    width: 3
    height: 5
    title: Untitled Visualization
    type: looker_map
    model: connected_car_localhost
    explore: orders_details
    dimensions: [customers.map_area]
    measures: [orders.orders_count, orders.gross_amount]
    sorts: [orders.orders_count desc]
    limit: '500'
    column_limit: '50'
    query_timezone: Europe/London
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    map_latitude: 55
    map_longitude: -3
    map_zoom: 5
