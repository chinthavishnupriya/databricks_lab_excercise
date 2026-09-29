# Lab 3 — PySpark Schema Evolution
from pyspark.sql.types import *

df_new = spark.createDataFrame([
    (
        103,
        "Charlie Brown",
        "charlie@example.com",
        "2024-03-10",
        "Active",
        "Tier-1"
    )
], [
    "customer_id",
    "name",
    "email",
    "signup_date",
    "status",
    "membership_tier"
])

df_new.write.format("delta")     .mode("append")     .option("mergeSchema", "true")     .saveAsTable("lab_db.customers")

spark.sql("DESCRIBE lab_db.customers").show()
