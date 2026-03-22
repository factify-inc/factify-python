# Value

`Value` represents a dynamically typed value which can be either
 null, a number, a string, a boolean, a recursive struct value, or a
 list of values. A producer of value is expected to set one of these
 variants. Absence of any variant indicates an error.

 The JSON representation for `Value` is JSON value.


## Supported Types

### `float`

```python
value: float = /* values here */
```

### `str`

```python
value: str = /* values here */
```

### `bool`

```python
value: bool = /* values here */
```

### `List[Any]`

```python
value: List[Any] = /* values here */
```

### `Dict[str, Any]`

```python
value: Dict[str, Any] = /* values here */
```

