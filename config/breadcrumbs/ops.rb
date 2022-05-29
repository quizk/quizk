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
  link t('breadcrumbs.new_operator'), new_operator_path
  parent :operators
end

crumb :edit_operator do |operator|
  link t('breadcrumbs.edit_operator'), edit_operator_path(operator)
  parent :operator, operator
end

# University
crumb :universities do
  link t('breadcrumbs.universities'), universities_path
  parent :ops_root
end

crumb :university do |university|
  link university.id, university_path(university)
  parent :universities
end

crumb :new_university do
  link t('breadcrumbs.new_university'), new_university_path
  parent :universities
end

crumb :edit_university do |university|
  link t('breadcrumbs.edit_university'), edit_university_path(university)
  parent :university, university
end

# Category
crumb :categories do
  link t('breadcrumbs.categories'), categories_path
  parent :ops_root
end

crumb :category do |category|
  link category.id, category_path(category)
  parent :categories
end

crumb :new_category do
  link t('breadcrumbs.new_category'), new_category_path
  parent :categories
end

crumb :edit_category do |category|
  link t('breadcrumbs.edit_category'), edit_category_path(category)
  parent :category, category
end

# Question
crumb :questions do
  link t('breadcrumbs.questions'), questions_path
  parent :ops_root
end

crumb :question do |question|
  link question.id, question_path(question)
  parent :questions
end

crumb :new_question do
  link t('breadcrumbs.new_question'), new_question_path
  parent :questions
end

crumb :edit_question do |question|
  link t('breadcrumbs.edit_question'), edit_question_path(question)
  parent :question, question
end
