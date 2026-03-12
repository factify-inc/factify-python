# InspectAccessResponse

InspectAccessResponse contains the caller's permissions.


## Fields

| Field                                                                                    | Type                                                                                     | Required                                                                                 | Description                                                                              |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `document_id`                                                                            | *Optional[str]*                                                                          | :heavy_minus_sign:                                                                       | Document ID.                                                                             |
| `permission_set`                                                                         | [Optional[models.DocumentPermissionSet]](../models/documentpermissionset.md)             | :heavy_minus_sign:                                                                       | DocumentPermissionSet contains the permissions the authenticated user has on a document. |