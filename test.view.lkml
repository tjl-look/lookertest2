view: test {
  derived_table: {
    sql: SELECT
    users.id  AS `users.id`,
    COUNT(DISTINCT orders.id ) AS `orders.count`
    FROM demo_db.order_items  AS order_items
    LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
    LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
    GROUP BY `user.id` ;;
  }
  dimension: user_buckets {
    type: tier
    tiers: [1,2,3,4,5,10,20]
    sql: ${TABLE}.orders.count ;;
  }
  measure: count {
    type: count
  }

}
