# DevOps Interview Flashcards

A static flashcard site (38 questions) hosted on S3 + CloudFront, provisioned with Terraform and deployed by GitHub Actions using OIDC (no stored AWS keys).

## Architecture
GitHub push -> Actions (validate, then deploy) -> S3 (private) <- CloudFront (HTTPS) <- you

## Setup
1. Create a GitHub repo (for example `devops-flashcards`) and push this folder to `main`.
2. `cd infra && cp terraform.tfvars.example terraform.tfvars` and set `github_repo`.
3. `terraform init && terraform apply`
4. In GitHub: Settings > Secrets and variables > Actions > **Variables**, add:
   - `AWS_ROLE_ARN` = output `deploy_role_arn`
   - `AWS_REGION` = output `region`
   - `BUCKET_NAME` = output `bucket_name`
   - `DISTRIBUTION_ID` = output `distribution_id`
5. Actions tab > "Validate and deploy" > **Run workflow** (or push any change under `site/`).
6. Open the `site_url` output. CloudFront can take a few minutes to become ready.

## Clean up
`cd infra && terraform destroy`

## Roadmap
- Phase 2: Lambda function URL + DynamoDB for a "question of the day" and submitting new questions.
- Phase 3: remote Terraform state, Terraform plan/apply in CI, CloudWatch dashboard and alarms.
- Phase 4: architecture diagram, write-up and interview story.
