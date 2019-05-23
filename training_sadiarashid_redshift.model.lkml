connection: "training-sadiarashid-redshift"

# include all the views
include: "*.view"

datagroup: training_sadiarashid_redshift_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: training_sadiarashid_redshift_default_datagroup

explore: acc_transaction {
  join: account {
    type: left_outer
    sql_on: ${acc_transaction.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }
}

explore: account {
  join: branch {
    type: left_outer
    sql_on: ${account.open_branch_id} = ${branch.branch_id} ;;
    relationship: many_to_one
  }
}

explore: branch {}

explore: business {}

explore: customer {}

explore: department {}

explore: employee {}

explore: individual {}

explore: officer {}

explore: product {
  join: product_type {
    type: inner
    sql_on: ${product.product_type_cd} = ${product_type.product_type_cd} ;;
    relationship: many_to_one
  }
  join: account {
    type: inner
    sql_on: ${product.product_cd} = ${account.product_cd} ;;
    relationship: many_to_one
  }
  join: acc_transaction {
    type: inner
    sql_on: ${account.account_id} = ${acc_transaction.account_id} ;;
    relationship: one_to_many
  }
}

explore: product_type {}
