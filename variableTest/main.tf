variable "name"{
    type = string
    default = "Ankit"
    description = "this is a test variable"
}

variable "multiline"{
    type = string
    default = "Ankit"
    description = <<EOF
    this is a test variable
    this is a test string
    EOF
}

output "outputString" {
    value = "${var.name}"
}

output "outputmultiline" {
    value = "${var.multiline}"
}