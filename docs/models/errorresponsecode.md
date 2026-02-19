# ErrorResponseCode

ConnectRPC error code. Maps to HTTP status codes:
- invalid_argument, failed_precondition -> 400
- unauthenticated -> 401
- permission_denied -> 403
- not_found -> 404
- already_exists -> 409
- resource_exhausted -> 429
- deadline_exceeded -> 408
- canceled -> 499
- internal, unknown -> 500 (unknown may appear as 400 for malformed JSON requests)
- unimplemented -> 501
- unavailable -> 503



## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `UNKNOWN`             | unknown               |
| `INVALID_ARGUMENT`    | invalid_argument      |
| `UNAUTHENTICATED`     | unauthenticated       |
| `PERMISSION_DENIED`   | permission_denied     |
| `NOT_FOUND`           | not_found             |
| `ALREADY_EXISTS`      | already_exists        |
| `RESOURCE_EXHAUSTED`  | resource_exhausted    |
| `FAILED_PRECONDITION` | failed_precondition   |
| `INTERNAL`            | internal              |
| `UNAVAILABLE`         | unavailable           |
| `UNIMPLEMENTED`       | unimplemented         |
| `CANCELED`            | canceled              |
| `DEADLINE_EXCEEDED`   | deadline_exceeded     |