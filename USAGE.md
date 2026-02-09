<!-- Start SDK Example Usage [usage] -->
```python
# Synchronous Example
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.api_keys.list_api_keys(organization_id="<id>")

    # Handle response
    print(res)
```

</br>

The same SDK client can also be used to make asynchronous requests by importing asyncio.

```python
# Asynchronous Example
import asyncio
from factify import Factify

async def main():

    async with Factify(
        bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
    ) as f_client:

        res = await f_client.api_keys.list_api_keys_async(organization_id="<id>")

        # Handle response
        print(res)

asyncio.run(main())
```
<!-- End SDK Example Usage [usage] -->