# Lab 7 Results

| Metric | Result |
|---|---:|
| Bronze rows | 530 |
| Bronze distinct order IDs | 518 |
| Duplicate events | 12 |
| Invalid records | 5 |
| Silver rows | 513 |
| Silver distinct order IDs | 513 |
| NULL customer IDs | 0 |
| Invalid amounts | 0 |
| Minimum order ID | 1001 |
| Maximum order ID | 3012 |

## Conclusion
The Bronze-to-Silver streaming pipeline successfully applied the 10-minute watermark, removed 12 duplicate events, filtered 5 invalid records, and produced 513 clean Silver records.
