# GetRecordResponse

GetRecordResponse contains the processed content and layout for a version.
 The content oneof is populated based on source_format:
   - document formats (pdf, docx, markdown): document field
   - spreadsheet formats (xlsx, csv):        spreadsheet field


## Supported Types

### `models.GetRecordResponseDocument`

```python
value: models.GetRecordResponseDocument = /* values here */
```

### `models.Spreadsheet`

```python
value: models.Spreadsheet = /* values here */
```

