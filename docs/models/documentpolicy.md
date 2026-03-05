# DocumentPolicy

DocumentPolicy represents a policy attached to a document.


## Fields

| Field                                                                        | Type                                                                         | Required                                                                     | Description                                                                  | Example                                                                      |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `attached_at`                                                                | [date](https://docs.python.org/3/library/datetime.html#date-objects)         | :heavy_check_mark:                                                           | Timestamp when policy was attached.                                          |                                                                              |
| `document_id`                                                                | *str*                                                                        | :heavy_check_mark:                                                           | Document ID this policy is attached to.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26} | doc_01h2xcejqtf2nbrexx3vqjhp41                                               |
| `policy`                                                                     | [models.Policy](../models/policy.md)                                         | :heavy_check_mark:                                                           | Policy represents a governance policy.                                       |                                                                              |