## Monitoring Results
- Observed query bottlenecks: High scan time for Booking table
- Solutions implemented:
  - Added index on start_date
  - Refactored queries to limit rows returned

## Results
- Query time reduced from 250ms to 75ms

