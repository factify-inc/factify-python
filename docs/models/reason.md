# Reason

Machine-readable error reason for programmatic handling

## Example Usage

```python
from factify.models import Reason
value: Reason = "missing_required_field"
```


## Values

| Name                       | Value                      |
| -------------------------- | -------------------------- |
| `MISSING_REQUIRED_FIELD`   | missing_required_field     |
| `INVALID_FIELD_VALUE`      | invalid_field_value        |
| `INVALID_ENUM_VALUE`       | invalid_enum_value         |
| `INVALID_CURSOR`           | invalid_cursor             |
| `INVALID_ID_FORMAT`        | invalid_id_format          |
| `MISSING_API_KEY`          | missing_api_key            |
| `INVALID_API_KEY`          | invalid_api_key            |
| `EXPIRED_API_KEY`          | expired_api_key            |
| `INVALID_TOKEN`            | invalid_token              |
| `EXPIRED_TOKEN`            | expired_token              |
| `AUTHENTICATION_REQUIRED`  | authentication_required    |
| `INSUFFICIENT_PERMISSIONS` | insufficient_permissions   |
| `RESOURCE_NOT_FOUND`       | resource_not_found         |
| `RESOURCE_ALREADY_EXISTS`  | resource_already_exists    |
| `RATE_LIMIT_EXCEEDED`      | rate_limit_exceeded        |
| `QUOTA_EXCEEDED`           | quota_exceeded             |
| `PRECONDITION_FAILED`      | precondition_failed        |
| `FEATURE_DISABLED`         | feature_disabled           |
| `INTERNAL_ERROR`           | internal_error             |
| `SERVICE_UNAVAILABLE`      | service_unavailable        |
| `UNIMPLEMENTED`            | unimplemented              |