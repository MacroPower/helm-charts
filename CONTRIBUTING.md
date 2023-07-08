# Contributing

Some helpful commands:

```sh
# Ensure dependencies are pulled and up to date.
helm dep build

# Run the unit tests.
helm unittest -f 'tests/**/*.yaml' .

# Test templating the chart.
helm template .
```
