crumb :ops_root do
  link 'HOME', root_path
end

# Operator
crumb :operators do
  link t('ops.breadcrumbs.operators'), operators_path
  parent :ops_root
end

crumb :operator do |operator|
  link operator.username, operator_path(operator)
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

# Topic
crumb :topics do
  link t('breadcrumbs.topics'), topics_path
  parent :ops_root
end

# Question
crumb :questions do
  link t('breadcrumbs.questions'), questions_path
  parent :ops_root
end

crumb :question do |question|
  link truncate_actiontext(question.content), question_path(question)
  parent :questions
end

crumb :new_question do
  link t('breadcrumbs.new_question'), new_question_path
  parent :questions
end

# Exam
crumb :exams do
  link t('breadcrumbs.exam'), exams_path
  parent :ops_root
end

# User
crumb :users do
  link t('ops.breadcrumbs.users'), users_path
  parent :ops_root
end

crumb :user do |user|
  link user.username, user_path(user)
  parent :users
end
