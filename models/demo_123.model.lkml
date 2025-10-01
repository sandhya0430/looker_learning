connection: "connection_demo_321"
include: "/views/*.view.lkml"
include:"/views/user_pdt.view.lkml"
include: "/views/user_dynamic.view.lkml"

datagroup: user_datagroup {

  sql_trigger: SELECT MAX(id) FROM `elastic-pocs.Super_Store_Sales.Users_details` ;;
  max_cache_age: "24 hours"
}

explore: user_pdt {
  join: user_details {
    type: left_outer
    sql: ${user_details.id}=${user_pdt.id} ;;
    relationship: one_to_many
  }

}
