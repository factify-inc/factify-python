# QcrV1alphaBoundingBox

Normalized bounding box relative to the page (0.0–1.0).
 Origin is top-left: (0,0) is the top-left corner of the page,
 x increases rightward, y increases downward.
 Extraction pipelines must flip the y-axis for bottom-left origin formats (PDF).
 To get absolute coordinates, multiply by the page's PhysicalDimensions.


## Fields

| Field              | Type               | Required           | Description        |
| ------------------ | ------------------ | ------------------ | ------------------ |
| `height`           | *Optional[float]*  | :heavy_minus_sign: | N/A                |
| `width`            | *Optional[float]*  | :heavy_minus_sign: | N/A                |
| `x`                | *Optional[float]*  | :heavy_minus_sign: | N/A                |
| `y`                | *Optional[float]*  | :heavy_minus_sign: | N/A                |