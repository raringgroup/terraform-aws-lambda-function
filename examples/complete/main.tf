module "label" {
  source     = "git::https://github.com/raringgroup/terraform-null-context.git?ref=v0.1.0"
  attributes = [var.function_name]

  context = module.context.self
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "handler.js"
  output_path = "lambda_function.zip"
}

module "lambda" {
  source = "../.."

  filename      = data.archive_file.lambda_zip.output_path
  function_name = module.label.id
  handler       = var.handler
  runtime       = var.runtime

  context = module.context.self
}
