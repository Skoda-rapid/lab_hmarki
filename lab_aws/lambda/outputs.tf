output "get_all_authors_arn" {
  value = aws_lambda_function.get_all_authors.arn
}

output "get_all_courses_arn" {
  value = aws_lambda_function.get_all_courses.arn
}

output "get_course_arn" {
  value = aws_lambda_function.get_course.arn
}

output "save_course_arn" {
  value = aws_lambda_function.save_course.arn
}

output "update_course_arn" {
  value = aws_lambda_function.update_course.arn
}

output "delete_course_arn" {
  value = aws_lambda_function.delete_course.arn
}

output "get_all_authors_arn_invoke" {
  value = aws_lambda_function.get_all_authors.invoke_arn
}

output "get_all_courses_arn_invoke" {
  value = aws_lambda_function.get_all_courses.invoke_arn
}

output "get_course_arn_invoke" {
  value = aws_lambda_function.get_course.invoke_arn
}

output "save_course_arn_invoke" {
  value = aws_lambda_function.save_course.invoke_arn
}

output "update_course_arn_invoke" {
  value = aws_lambda_function.update_course.invoke_arn
}

output "delete_course_arn_invoke" {
  value = aws_lambda_function.delete_course.invoke_arn
}
