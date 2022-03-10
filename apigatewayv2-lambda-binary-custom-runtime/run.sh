#!/usr/bin/env sh

terraform init; terraform plan; terraform apply --auto-approve

awslocal lambda invoke --function-name bash-runtime --payload '{"text":"Hello"}' response.txt


api_id=$(aws --endpoint-url=http://localhost:4566 apigatewayv2 get-apis | jq -r .Items[0].ApiId)
curl -X POST -H 'content-type: image/jpeg' --data-binary @./nyan-cat.jpg http://$api_id.execute-api.localhost.localstack.cloud:4566/example/test/foo --output -
