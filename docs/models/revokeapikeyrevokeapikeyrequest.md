# RevokeAPIKeyRevokeAPIKeyRequest

RevokeApiKeyRequest identifies an API key to revoke.


## Fields

| Field                                                                                                                                   | Type                                                                                                                                    | Required                                                                                                                                | Description                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `reason`                                                                                                                                | *OptionalNullable[str]*                                                                                                                 | :heavy_minus_sign:                                                                                                                      | Optional reason for revocation (for audit purposes).<br/> The revoking user's identity and timestamp are captured in audit logs separately. |