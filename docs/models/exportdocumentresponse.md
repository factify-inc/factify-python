# ExportDocumentResponse

ExportDocumentResponse contains the download URL.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `expires_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_check_mark:                                                   | Timestamp when the download URL expires.                             |
| `headers`                                                            | Dict[str, *str*]                                                     | :heavy_minus_sign:                                                   | HTTP headers to include when fetching the URL.                       |
| `url`                                                                | *str*                                                                | :heavy_check_mark:                                                   | Presigned URL to download the document PDF.                          |