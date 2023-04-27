view: test {
  derived_table: {
    explore_source: order_items {
      column: id {}
      column: order_id {}
      column: status { field: orders.status }
    }
  }

  filter: stat {
    required_fields: [status]
    default_value: "complete"
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: status {
    description: ""
  }


}
