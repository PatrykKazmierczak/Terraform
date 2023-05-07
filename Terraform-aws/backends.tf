terraform {
  cloud {
    organization = "pkaz-devops"

    workspaces {
      name = "terraform-devops"
    }
  }
}