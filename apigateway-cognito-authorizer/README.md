## Run Terraform

`terraform init; terraform plan; terraform apply --auto-approve`

## Create Cognito users

Using the outputs run the following commands,

```
 awslocal cognito-idp sign-up \
      --client-id <user_pool_client_id> \
      --username "user@domain.com" \
      --password "Ppassword123!"
```

then,

```
awslocal cognito-idp admin-confirm-sign-up \
      --user-pool-id <user_pool_id> \
      --username "user@domain.com"
```

then,

```
awslocal cognito-idp initiate-auth \
      --auth-flow USER_PASSWORD_AUTH \
      --auth-parameters USERNAME="user@domain.com",PASSWORD="password" \
      --client-id <user_pool_client_id>
```


then,

```
curl -vvv "https://<rest_api_id>.execute-api.localhost.localstack.cloud:4566/local/demo" --header "Authorization: bearer <id-token>"
```
