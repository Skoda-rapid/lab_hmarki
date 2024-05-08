module "dynamo_db_authors" {
  source  = "./dynamodb"
  name    = "authors-3"
}

module "dynamo_db_courses" {
  source  = "./dynamodb"
  name    = "courses-3"
}

module "lambda" {
  source  = "./lambda"
  name    = "lambdasss"

  get_all_authors_arn = module.iam.role_get_all_authors_arn
  get_all_courses_arn = module.iam.role_get_all_courses_arn
  get_course_arn = module.iam.role_get_course_arn
  save_course_arn = module.iam.role_save_course_arn
  update_course_arn = module.iam.role_update_course_arn
  delete_course_arn = module.iam.role_delete_course_arn
}

module "iam" {
  source                = "./iam"
  name                  = "iamss"
  dynamodb_authors_arn = module.dynamo_db_authors.dynamodb_arn
  dynamodb_courses_arn = module.dynamo_db_courses.dynamodb_arn
}

module "api" {
  source = "./api_gateway"
  name   = "api"

  get_all_authors_arn = module.lambda.get_all_authors_arn
  get_all_authors_arn_invoke = module.lambda.get_all_authors_arn_invoke
  get_all_courses_arn = module.lambda.get_all_courses_arn
  get_all_courses_arn_invoke = module.lambda.get_all_courses_arn_invoke
  get_course_arn = module.lambda.get_course_arn
  get_course_arn_invoke = module.lambda.get_course_arn_invoke
  save_course_arn = module.lambda.save_course_arn
  save_course_arn_invoke = module.lambda.save_course_arn_invoke
  update_course_arn = module.lambda.update_course_arn
  update_course_arn_invoke = module.lambda.update_course_arn_invoke
  delete_course_arn = module.lambda.delete_course_arn
  delete_course_arn_invoke = module.lambda.delete_course_arn_invoke
}

