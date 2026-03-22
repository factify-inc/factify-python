# ProcessDocumentResponse

ProcessDocumentResponse contains the processing result.


## Fields

| Field                                                                   | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `document_id`                                                           | *Optional[str]*                                                         | :heavy_minus_sign:                                                      | Document ID being processed.                                            |
| `status`                                                                | [Optional[models.ProcessingOutcome]](../models/processingoutcome.md)    | :heavy_minus_sign:                                                      | ProcessingOutcome describes the result of a processing trigger request. |
| `version_id`                                                            | *Optional[str]*                                                         | :heavy_minus_sign:                                                      | Version ID being processed.                                             |