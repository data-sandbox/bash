# rsync

This project aims to use rsync and bash to perform local backups to external hard drives. 

The backup strategy here is two-fold; first the main contents are synced to a primary external hard drive. Second, the primary external hard drive is synced to a replica external hard drive (which is then stored in a different location from the primary to minimize the risk of data loss from events like theft, fire, flood, etc.). 

While no backup strategy is bulletproof, this approach provides multiple points of failure and only uses the built-in rsync Unix tool. No third-party backup software or cloud services needed for ultimate security!