output "role_get_all_authors_arn" {
  value = aws_iam_role.get_all_authors_lambda_role.arn
}

output "role_get_all_courses_arn" {
  value = aws_iam_role.get_all_courses_lambda_role.arn
}

output "role_get_course_arn" {
  value = aws_iam_role.get_course_lambda_role.arn
}

output "role_save_course_arn" {
  value = aws_iam_role.save_course_lambda_role.arn
}

output "role_update_course_arn" {
  value = aws_iam_role.update_course_lambda_role.arn
}

output "role_delete_course_arn" {
  value = aws_iam_role.delete_course_lambda_role.arn
}

