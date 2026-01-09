
#--------------IAM ROLE -----------------------

role_name = "lambda_execution_role"
role_policy_version = "2012-10-17"
iam_policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

#---------------lambda function -------------------------

lambda_func_name = "my_lambda_function"
lambda_handler = "lambda_function.lambda_handler"
lambda_runtime = "python3.12"
