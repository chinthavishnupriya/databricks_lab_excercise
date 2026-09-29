# Lab 8 Results

## Gold Daily Revenue

| Metric | Result |
|---|---:|
| Gold rows | 142 |
| Customers | 21 |
| Overall revenue | 368023 |

## SCD Type 2

| Metric | Result |
|---|---:|
| Total dimension records | 14 |
| Unique customers | 13 |
| Current records | 13 |
| Historical records | 1 |

### Customer 102 History

| Email | is_current |
|---|---|
| bob_new@example.com | false |
| bob_updated@example.com | true |

The old Bob record has an end date of 2026-09-29 and the new version has a NULL end date.

## Conclusion
Lab 8 successfully produced the Gold daily revenue aggregation and demonstrated SCD Type 2 historical tracking for an updated customer.
