connection: "connection_demo_321"

include: "/views/*.view.lkml"                # include all views in the views/ folder in

datagroup: user_datagroup {

  sql_trigger: SELECT MAX(id) FROM `elastic-pocs.Super_Store_Sales.order_details` ;;
  max_cache_age: "24 hours"
}
