connection: "thelook"

# include all the views
include: "/views/**/*.view"

datagroup: balcazartest_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: balcazartest_default_datagroup

explore: flights {}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  access_filter: {
    field: users.created_date
    user_attribute: karan_test
  }
  access_filter: {
    field: users.first_name
    user_attribute: karan_test
  }
}


explore: users {
  #access_filter: {
  #field: users.first_name
   # user_attribute: karan_test
  #}
}
