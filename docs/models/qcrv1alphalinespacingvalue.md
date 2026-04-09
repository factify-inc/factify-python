# QcrV1alphaLineSpacingValue

Line spacing as mode + optional explicit value.
 Using a message instead of a bare enum avoids a future wire break when
 exact/at-least modes are added (they need a companion float value).


## Fields

| Field                                                                        | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `mode`                                                                       | [Optional[models.QcrV1alphaLineSpacing]](../models/qcrv1alphalinespacing.md) | :heavy_minus_sign:                                                           | N/A                                                                          |
| `value_mm`                                                                   | *Optional[float]*                                                            | :heavy_minus_sign:                                                           | meaningful only for EXACT / AT_LEAST (future)                                |