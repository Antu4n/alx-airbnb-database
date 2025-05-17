### Performance
- Query execution time was identical between the two tables. `160 ms` and `163ms` for the booking table and booking partitions table respectively.<br>
- Logical reads, CPU time, and scan count were equal, suggesting no immediate benefit from partitioning at this data size.<br>
The dataset is small with only a few dozen rows so the SQL Server processes both tables quickly and efficiently, regardless of partitioning.