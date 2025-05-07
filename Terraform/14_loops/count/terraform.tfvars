rg_name = "CountRG"
rg_location = "eastus"
vnet_name = "CountVNET01"
address_space = [ "10.10.0.0/16" ]
subnet_name = [ "subnet1", "subnet2", "subnet3", "subnet4" ] #4
                #   0          1          2          3
#To access individual values from a list/array we use following expression
# subnet_name[0] = "subnet1" 10.10.0.0/24
# subnet_name[1] = "subnet2" 10.10.1.0/24
# subnet_name[2] = "subnet3" 10.10.2.0/24
# subnet_name[3] = "subnet4" 10.10.3.0/24