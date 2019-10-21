view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: Returned_boolean {
    case: {
      when: {
        sql: ${TABLE}.returned_at IS NULL ;;
        label: "No"
      }
      else: "Yes"
    }
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
  measure: total_price {
    type: sum
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }
  measure: average_price {
    type: average
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }
  measure: median_price {
    type: median
    sql: ${TABLE}.sale_price ;;
  }
  measure: most_recent_returned_date {
    type: date
    sql: MAX(${returned_date}) ;;
  }
}
