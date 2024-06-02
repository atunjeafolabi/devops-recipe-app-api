##############################################
# Create ECR repos for storing Docker images #
##############################################

resource "aws_ecr_repository" "app" {
  name                 = "recipe-app-api-app"
  image_tag_mutability = "MUTABLE"
  # On running "terraform destroy",
  # force_delete deletes the ECR repository.
  # TODO: May need to be re-considered (true) in production
  force_delete = true

  image_scanning_configuration {
    # TODO: NOTE: Update to true for real deployments.
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "proxy" {
  name                 = "recipe-app-api-proxy"
  image_tag_mutability = "MUTABLE"
  # TODO: May need to be re-considered (true) in production
  force_delete = true

  image_scanning_configuration {
    # NOTE: Update to true for real deployments.
    scan_on_push = false
  }
}