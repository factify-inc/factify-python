# QcrV1alphaPageGeometry

Per-page geometry. Every page gets an entry (indexed by page_number).
 Pages that match defaults can omit dimensions/orientation and inherit.


## Fields

| Field                                                                                      | Type                                                                                       | Required                                                                                   | Description                                                                                |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `dimensions`                                                                               | [Optional[models.QcrV1alphaPhysicalDimensions]](../models/qcrv1alphaphysicaldimensions.md) | :heavy_minus_sign:                                                                         | Physical dimensions in millimeters.                                                        |
| `orientation`                                                                              | [Optional[models.QcrV1alphaOrientation]](../models/qcrv1alphaorientation.md)               | :heavy_minus_sign:                                                                         | N/A                                                                                        |
| `page_number`                                                                              | *Optional[int]*                                                                            | :heavy_minus_sign:                                                                         | 0-indexed                                                                                  |