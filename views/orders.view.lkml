view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  parameter: Month_selector{
    type: string
    allowed_value: {
      label: "January"
      value: "January"
    }
    allowed_value: {
      label: "February"
      value: "2"
    }
    allowed_value: {
      label: "March"
      value: "3"
    }
    allowed_value: {
      label: "April"
      value: "4"
    }
    allowed_value: {
      label: "May"
      value: "5"
    }
    allowed_value: {
      label: "June"
      value: "6"
    }
    allowed_value: {
      label: "July"
      value: "7"
    }
    allowed_value: {
      label: "August"
      value: "8"
    }
    allowed_value: {
      label: "September"
      value: "9"
    }
    allowed_value: {
      label: "October"
      value: "10"
    }
    allowed_value: {
      label: "November"
      value: "11"
    }
    allowed_value: {
      label: "December"
      value: "12"
    }
    allowed_value: {
      label: "Current Month"
      value: "Current Month"
    }
  }

  parameter: last_7_days {
    allowed_value: {
      label: "7"
      value: "7"
    }
    allowed_value: {
      label: "30"
      value: "30"
    }
    allowed_value: {
      label: "90"
      value: "90"
    }
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    html: <center><font size = "5">{{value}}</font></center> ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
  }
  measure: first_order_date {
    type:date
    sql: MIN(${TABLE}.created_at) ;;
  }

  }
