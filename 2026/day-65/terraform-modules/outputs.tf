output "web_server_ip" {
    value = module.web-server.public_ip
}

output "api-server_ip" {
    value = module.api-server.public_ip
}