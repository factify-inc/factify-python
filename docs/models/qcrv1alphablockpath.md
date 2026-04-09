# QcrV1alphaBlockPath

BlockPath addresses an element within the record's typed containment
 hierarchy. Each segment steps into a specific typed child collection.

 Examples:
   [block(2)]                                → blocks[2]
   [block(2), block(0)]                      → blocks[2].section.blocks[0]
   [block(4), row(1), cell(0)]               → blocks[4].table.rows[1].cells[0]
   [block(3), item(2)]                       → blocks[3].list.items[2]
   [block(3), item(2), item(0)]              → nested sub-list item

 The path is unambiguous because each segment type implies which child
 collection to descend into (blocks for sections, rows for tables, etc.).


## Fields

| Field                                                                    | Type                                                                     | Required                                                                 | Description                                                              |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `segments`                                                               | List[[models.QcrV1alphaPathSegment](../models/qcrv1alphapathsegment.md)] | :heavy_minus_sign:                                                       | N/A                                                                      |