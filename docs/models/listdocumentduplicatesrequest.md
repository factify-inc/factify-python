# ListDocumentDuplicatesRequest


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          | Example                                                              |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `document_id`                                                        | *str*                                                                | :heavy_check_mark:                                                   | Document ID to check for duplicates.                                 | doc_01h2xcejqtf2nbrexx3vqjhp41                                       |
| `file_contents_hash`                                                 | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | SHA256 hash of the document's visual content for duplicate matching. |                                                                      |