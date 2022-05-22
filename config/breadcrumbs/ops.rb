crumb :ops_root do
  link 'HOME', root_path
end

# Operator
crumb :operators do
  link t('ops.breadcrumbs.operators'), operators_path
  parent :ops_root
end

crumb :operator do |operator|
  link operator.id, operator_path(operator)
  parent :operators
end

crumb :new_operator do
  link t('ops.breadcrumbs.new_operator'), new_operator_path
  parent :operators
end

crumb :edit_operator do |operator|
  link t('ops.breadcrumbs.edit_operator'), edit_operator_path(operator)
  parent :operator, operator
end
