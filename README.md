# MP_ECS_PROJECT_DEV

## Description

- DEV 환경 ECS 서비스를 구성하는 모듈

## Example

```
module "mp_ecs_project_dev" {
  source            = "git::https://github.com/MicroprotectCorp/mp-ecs-project-dev.git"
  application_name  = "jobis-example"
  need_loadbalancer = false
}
```
