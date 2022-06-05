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

# Topic
crumb :topics do
  link t('breadcrumbs.topics'), topics_path
  parent :ops_root
end

crumb :topic do |topic|
  link topic.id, topic_path(topic)
  parent :topics
end

crumb :new_topic do
  link t('breadcrumbs.new_topic'), new_topic_path
  parent :topics
end

crumb :edit_topic do |topic|
  link t('breadcrumbs.edit_topic'), edit_topic_path(topic)
  parent :topic, topic
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

# Exam
crumb :exams do
  link t('breadcrumbs.exam'), exams_path
  parent :ops_root
end

crumb :exam do |exam|
  link exam.id, exam_path(exam)
  parent :exams
end

crumb :new_exam do
  link t('breadcrumbs.new_exam'), new_exam_path
  parent :exams
end
