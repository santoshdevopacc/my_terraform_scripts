variable "iname" {
  description = "name of server"
  type        = string
  default     = "server1"
}

variable "ami-id" {
  description = "ami-id of the server"
  type        = string
  default     = "ami-0eeab0e1473986ffd"
}

variable "icount" {
  description = " no of servers "
  type        = number
  default     = 1
}
