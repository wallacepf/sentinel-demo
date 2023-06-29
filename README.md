curl \
  --header "Authorization: Bearer lCGguO27P4U0Vg.atlasv1.r4ARXgB1otjuoW49sYLev8Vq0gflgGZ0VtByTYhEEIxFkIckAAug8ZRvCh5FmunCjOY" \
  --header "Content-Type: application/vnd.api+json" \
  --request GET \
  https://app.terraform.io/api/v2/account/details


vault write aws/roles/demo \
    credential_type=iam_user \
    ttl=10m \
    policy_document=-<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF

{
  "policies": ["tfc-policy"],
  "bound_audiences": ["vault.workload.identity"],
  "bound_claims_type": "glob",
  "bound_claims": {
    "sub":
"organization:my-demo-account:project:demo-29072023:workspace:*:run_phase:*"
  },
  "user_claim": "terraform_full_workspace",
  "role_type": "jwt",
  "token_ttl": "20m"
}

vault policy write tfc -<<EOF
# Allow tokens to query themselves
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Allow tokens to renew themselves
path "auth/token/renew-self" {
    capabilities = ["update"]
}

# Allow tokens to revoke themselves
path "auth/token/revoke-self" {
    capabilities = ["update"]
}

# Configure the actual secrets the token should have access to
path "secret/*" {
  capabilities = ["read"]
}

path "aws/creds/demo" {
    capabilities = ["read"]
}
EOF
