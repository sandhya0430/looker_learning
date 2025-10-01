view: user_dynamic {
  sql_table_name: `elastic-pocs.Super_Store_Sales.Users` ;;

  # Parameter dropdown
  parameter: metric_choice {
    label: "Choose Metric"
    type: string
    default_value: "user_name"
    allowed_value: { label: "Total User" value: "user_name" }
    allowed_value: { label: "Email" value: "email" }
    allowed_value: { label: "User Id" value: "id" }
  }

  # Base measures
  measure: total_user {
    type: count
    sql: ${TABLE}.UserName ;;
    label: "Total User"
  }

  measure: total_email {
    type: count
    sql: ${TABLE}.Email ;;
    label: "Total Email"
  }

  measure: total_id {
    type: count
    sql: ${TABLE}.Id ;;
    label: "Total Id"
  }

  # Dynamic measure based on parameter
  measure: dynamic_metric {
    type: number
    sql:
      CASE
        WHEN {% parameter metric_choice %} = 'user_name' THEN ${total_user}
        WHEN {% parameter metric_choice %} = 'email' THEN ${total_email}
        WHEN {% parameter metric_choice %} = 'id' THEN ${total_id}
        ELSE NULL
      END ;;
    label: "Dynamic Metric"
  }
}
