- dashboard: heatmapbug
  title: HeatMapBug
  layout: newspaper
  elements:
  - title: Tile1
    name: Tile1
    model: project1
    explore: order_items
    type: looker_map
    fields: [users.zip, users.count]
    sorts: [users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 37.80945337576871
    map_longitude: -121.89794557169081
    map_zoom: 9
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: testestestest
    name: Opacity 8
    model: project1
    explore: order_items
    type: looker_map
    fields: [users.zip, users.count]
    sorts: [users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 37.80945337576871
    map_longitude: -121.89794557169081
    map_zoom: 9
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    row: 0
    col: 8
    width: 8
    height: 6
