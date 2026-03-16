# ShareLink

ShareLink represents a shareable link for a document.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `created_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_minus_sign:                                                   | When the link was created.                                           |
| `creator_id`                                                         | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | ID of the user who created this link.                                |
| `document_id`                                                        | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | Document ID this link belongs to.                                    |
| `id`                                                                 | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | Share link ID.                                                       |