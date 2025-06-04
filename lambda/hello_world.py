# This is the main entry point for the AWS Lambda function.
# AWS will automatically call this function when the Lambda is triggered.
def lambda_handler(event, context):
    
    # Return an HTTP-style response 
    return {
        'statusCode': 200,            # HTTP status code 200 indicating success
        'body': 'Hello from Lambda!'  # The content returned by the Lambda
    }
