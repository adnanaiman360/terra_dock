output "nginx_url" {
  value = "http://localhost:${var.nginx_port}"
  description = "Public URL to access the NGINX container"
}

output "hello_app_url" {
  value = "http://localhost:${var.hello_port}"
  description = "Public URL to access the Hello App container"
}
