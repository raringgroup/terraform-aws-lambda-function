## ----------------------------------------------------------------------------
## Copyright 2026 Raring Group LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## ----------------------------------------------------------------------------

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
