# view: order_items {
#   sql_table_name: demo_db.order_items ;;
#   drill_fields: [id]
#
#   parameter: date_parameter {
#     type: date
#   }
#
#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: test_dimension {
#     sql:
#     {% if date_parameter._parameter.value == null %}
#            CASE
#             WHEN ${test_date_date_date} <= CURR_DATE() THEN ${TABLE}.sale_price
#             ELSE NULL
#             END
#     {% else %}
#           CASE
#             WHEN ${test_date_date_date} <= {% parameter order_items.date_parameter %} THEN ${TABLE}.sale_price
#             ELSE NULL
#             END
#     {% endif %}
#             ;;
#   }
#
#   dimension: inventory_item_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.inventory_item_id ;;
#   }
#
#   dimension: order_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.order_id ;;
#   }
#
#   dimension: inventory_item_id_string {
#     type: string
#     # hidden: yes
#     sql: ${TABLE}.inventory_item_id ;;
#   }
#
#   dimension: order_id_string {
#     type: string
#     # hidden: yes
#     sql: ${TABLE}.order_id ;;
#   }
#
#
#   dimension: test_concat {
#     type: string
#     sql: CONCAT(${inventory_item_id_string},${order_id_string}) ;;
#   }
#
#   dimension_group: returned {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.returned_at ;;
#   }
#
#   dimension_group: test_date_date {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     datatype: date
#     sql: ${TABLE}.returned_at ;;
#   }
#
#   dimension: Returned_boolean {
#     case: {
#       when: {
#         sql: ${TABLE}.returned_at IS NULL ;;
#         label: "No"
#       }
#       else: "Yes"
#     }
#   }
#
#   dimension: sale_price {
#     type: number
#     sql: ${TABLE}.sale_price ;;
#     value_format_name: usd
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [id, inventory_items.id, orders.id]
#     link: {
#       label: "Drill to detials filtered on:"
#       url: "{{ link }}&f[products.category]='Suits'"
#     }
#   }
#   measure: total_price {
#     type: sum
#     sql: ${TABLE}.sale_price ;;
#     value_format_name: usd
#   }
#   measure: average_price {
#     type: average
#     sql: ${TABLE}.sale_price ;;
#     value_format_name: usd
#   }
#   measure: median_price {
#     type: median
#     sql: ${TABLE}.sale_price ;;
#   }
#   measure: most_recent_returned_date {
#     type: date
#     sql: MAX(${returned_date}) ;;
#   }
# }
#
# explore: order_items_2 {
#   from: order_items
# }
