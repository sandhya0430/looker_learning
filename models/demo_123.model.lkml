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
explore: user_dynamic {
  label: "user_dynamic"
}
explore: lookml_sorting {
  join: user_details {
    type: left_outer
        #for dimension and measure we should use sql
        #for joining two tables we should use sql_on

      sql_on: ${user_details.id} = ${lookml_sorting.id} ;;


    relationship: one_to_many
  }

}
explore: access_grants {

}
