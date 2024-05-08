module "labels" {
  source = "cloudposse/label/null"
  name   = var.name
}

resource "aws_iam_role" "get_all_authors_lambda_role" {
  name               = "get-all-authors"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "get_all_authors_lambda_policy" {
  name = "get-all-authors-lambda-policy"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:Scan",
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_authors_arn
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "get_all_authors_lambda_policy_attachment" {
  policy_arn = aws_iam_policy.get_all_authors_lambda_policy.arn
  role       = aws_iam_role.get_all_authors_lambda_role.name
}

resource "aws_iam_role" "get_all_courses_lambda_role" {
  name               = "get-all-courses"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "get_all_courses_lambda_policy" {
  name = "get-all-courses-lambda-policy-3"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:Scan",
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_courses_arn
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "get_all_courses_lambda_policy_attachment" {
  policy_arn = aws_iam_policy.get_all_courses_lambda_policy.arn
  role       = aws_iam_role.get_all_courses_lambda_role.name
}

resource "aws_iam_role" "get_course_lambda_role" {
  name               = "get-course"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "get_course_lambda_policy" {
  name = "get-course-lambda-policy-3"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:GetItem",
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_courses_arn
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "get_course_lambda_policy_attachment" {
  policy_arn = aws_iam_policy.get_course_lambda_policy.arn
  role       = aws_iam_role.get_course_lambda_role.name
}

resource "aws_iam_role" "save_course_lambda_role" {
  name               = "save-course"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "save_course_lambda_policy" {
  name = "save-course-lambda-policy-3"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_courses_arn
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "save_course_lambda_policy_attachment" {
  policy_arn = aws_iam_policy.save_course_lambda_policy.arn
  role       = aws_iam_role.save_course_lambda_role.name
}

resource "aws_iam_role" "update_course_lambda_role" {
  name = "update-course"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "update_course_lambda_policy" {
  name = "update-course-lambda-policy-3"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:putItem",
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_courses_arn
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "update_course_lambda_policy_attachment" {
  policy_arn = aws_iam_policy.update_course_lambda_policy.arn
  role       = aws_iam_role.update_course_lambda_role.name
}

resource "aws_iam_role" "delete_course_lambda_role" {
  name               = "delete-course"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "delete_course_lambda_policy" {
  name = "delete-course-lambda-policy-3"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:DeleteItem",
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_courses_arn
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "delete_course_lambda_policy_attachment" {
  policy_arn = aws_iam_policy.delete_course_lambda_policy.arn
  role       = aws_iam_role.delete_course_lambda_role.name
}
