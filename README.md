# ADD New AWS Account

Set a new module deployment in new AWS account
  
# Create New sq 

Refactor sg in new module 

# Update AWS Network Load Balancer and Target Group with instances and HTTP health checks


# Using Parallel Step Functions workflow with API Gateway ingress, and egress configurations:

 1- Define the API Gateway, ingress, and egress resources in Terraform.
 2- Create a Step Functions state machine with parallel states to invoke the API Gateway, ingress, and egress resources in parallel.
 3- Specify the transitions and input/output data for each state in the Step Functions state machine.
 4-  Deploy the resources using Terraform.
 
 In this example, we will create a Step Functions state machine that runs three tasks in parallel: invoking an API Gateway, configuring ingress, and configuring 
 egress.

 The Step Functions state machine will invoke all three resources in parallel. The input to the Step Functions state machine and the outputs of the individual tasks 
 can be defined in the state machine definition.

 With using Step Function, you might need to customize the resources and definitions based on your specific use case and requirements. Additionally, you need to 
 ensure that you have the 
 correct provider configurations and credentials set up for the ingress and egress providers.
