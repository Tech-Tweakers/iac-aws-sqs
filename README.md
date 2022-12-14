# Terraform AWS SQS Module
Módulo Terraform criado para facilitar a criação de filas SQS nos padrões do Olist. Este código realiza as seguintes configurações:

* Cria uma fila sqs podendo escolher com SSE ou não. [DONE]
* Cria uma DLQ para a fila criada. [DONE]
* Cria a política da fila. [TO-DO]
* Cria um KMS caso não exista para fila com SSE habilitado. [TO-DO]

# Usage 
Para utilizar o módulo é necessário chamá-lo e passar as configurações que deseja, conforme o exemplo:

```hcl-terraform
module "aws-sqs-queue" {
  source = "git::https://gitlab.olist.io/sre/terraform-modules/terraform-aws-sqs.git?ref=v0.1"

  name = "queue-name"
  tags = {
    product = ""
    team    = ""
    owner   = ""
    env     = ""
  }
}
```

## Variáveis Obrigatórias <a name='table'>

As seguintes variáveis são obrigatórias para o funcionamento do módulo:

| Variable | Description
| ---| :---
| **name** | Nome da fila que será criada. |
| **tags** | Tags de segurança definidas por nossa empresa(_owner, env, product, team_). |
| **create_dlq** | Define se cria ou não uma DLQ para a fila criada. |
| **topic_arns** | Lista de ARNs dos tópicos a serem assinados. |

## Variáveis Não Obrigatórias <a name='table'>

As seguintes variáveis não são obrigatórias para o funcionamento do módulo:

| Variable | Description
| ---| :---
| **subscription_filter_policy** | Politica de filtro da assinatura do tópico. |
