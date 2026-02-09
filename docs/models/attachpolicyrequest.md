# AttachPolicyRequest

AttachPolicyRequest specifies a policy to attach to a document.


## Fields

| Field                                                     | Type                                                      | Required                                                  | Description                                               |
| --------------------------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------- |
| `document_id`                                             | *Optional[str]*                                           | :heavy_minus_sign:                                        | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}     |
| `policy_id`                                               | *str*                                                     | :heavy_check_mark:                                        | Policy ID to attach.<br/> Pattern: pol_[0-9a-hjkmnp-tv-z]{26} |