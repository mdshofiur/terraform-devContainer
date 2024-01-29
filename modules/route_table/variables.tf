# variable "public_route_table_tags" {
#   type = object({
#     name   = string
#     vpc_id = string
#   })
#   description = "Map of public route table tags"
# }

# variable "public_route" {
#   type = object({
#     route_table_id = string
#     cidr_block     = string
#     gateway_id     = string
#   })
#   description = "Map of public route"
# }

# variable "public_route" {
#   type = map(object({
#     route_table_ids = list(string)
#     cidr_block      = string
#     gateway_id      = string
#   }))
# }


# variable "public_route_table_association" {
#   type = object({
#     subnet_id      = string
#     route_table_id = string
#   })
#   description = "Map of route table association"
# }
