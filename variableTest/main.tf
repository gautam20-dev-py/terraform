variable "name"{
    type = string
    default = "Ankit"
    description = "this is a test variable"
}

variable "multiline"{
    type = string
    description = "multiline string"
    default = <<EOF
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

variable "mapexample"{
    type = "map"
    default = {"name"="ankit"
               "ami"="ami1"
    }
}

output "mapvaluename"{
    value = "${var.mapexample["name"]}"
}

output "mapvalueami"{
    value = "${var.mapexample["ami"]}"
}