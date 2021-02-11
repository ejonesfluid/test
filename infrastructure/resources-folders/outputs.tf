output "root" {
  value = { for name, id in module.root.ids :
    name => replace(id, "folders/", "")
  }
}

output "devops" {
  value = { for name, id in module.devops.ids :
    name => replace(id, "folders/", "")
  }
}

output "devops_applications" {
  value = { for name, id in module.devops_applications.ids :
    name => replace(id, "folders/", "")
  }
}

output "devops_networking" {
  value = { for name, id in module.devops_networking.ids :
    name => replace(id, "folders/", "")
  }
}
