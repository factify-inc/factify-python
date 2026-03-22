# DuplicateDocument

DuplicateDocument represents a document that is a visual duplicate.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `document_id`                                                        | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | Document ID of the duplicate.                                        |
| `last_viewed_at`                                                     | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_minus_sign:                                                   | When the caller last viewed this document.                           |
| `title`                                                              | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | Document title.                                                      |
| `version_id`                                                         | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | Version ID of the duplicate.                                         |
| `version_title`                                                      | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | Version title.                                                       |