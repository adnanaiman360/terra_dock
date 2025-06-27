variable "nginx_image" {
  description = "NGINX image to use"
  default     = "nginx:latest"
}

variable "hello_image" {
  description = "Hello image to use"
  default     = "nginxdemos/hello"
}

variable "nginx_container_name" {
  description = "Container name for NGINX"
  default     = "my-nginx-server"
}

variable "hello_container_name" {
  description = "Container name for hello-app"
  default     = "hello-app"
}

variable "nginx_port" {
  description = "External port for NGINX"
  default     = 8080
}

variable "hello_port" {
  description = "External port for hello-app"
  default     = 8081
}

variable "network_name" {
  description = "Docker network name"
  default     = "my_network"
}

