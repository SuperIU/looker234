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
    value_format_name: percent_2
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
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
   # sql:${TABLE}.CAST(${TABLE}."returned_at" AS TIMESTAMP_NTZ)  ;;
  }
  dimension: audio_dimension {
    sql: ${TABLE}.phone ;;
    html: <audio controls preload="metadata" controlsList="novolume" style="width:250px;"><source src="https://pagalfree.com/musics/128-Kesariya%20-%20Brahmastra%20128%20Kbps.mp3" type="audio/mp3"/></audio> ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: video {
    type: string
    sql: 'https://www.w3schools.com/html/mov_bbb.mp4' ;;
    html: <video width="290" height="130" controls preload="none"> <controls> <source src="{{ value }}" type="video/mp4"> </video> ;;
  }

  measure: static {
    type: number
    sql: 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
