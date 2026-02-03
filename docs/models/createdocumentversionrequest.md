# CreateDocumentVersionRequest


## Fields

| Field                                                                   | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `document_id_param`                                                     | *str*                                                                   | :heavy_check_mark:                                                      | Document ID to create version for.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26} |
| `body`                                                                  | [models.CreateVersionRequest](../models/createversionrequest.md)        | :heavy_check_mark:                                                      | N/A                                                                     |