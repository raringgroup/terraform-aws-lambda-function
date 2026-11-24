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


variable "function_name" {
  description = "Unique name for the Lambda Function."
  type        = string
}

variable "handler" {
  description = "The function entrypoint in your code."
  default     = ""
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
  default     = ""
  type        = string
}
