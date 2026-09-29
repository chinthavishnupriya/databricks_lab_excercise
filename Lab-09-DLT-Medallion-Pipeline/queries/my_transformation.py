import dlt
from pyspark.sql.functions import col, to_timestamp

@dlt.table(
    comment="Raw Bronze ingestion from Lab 6 order landing data"
)
def dlt_bronze_orders():
    return (
        spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "json")
        .load("/Volumes/workspace/lab_db/lab6_landing/orders/")
    )

@dlt.table(
    comment="Cleansed Silver orders table"
)
@dlt.expect_or_drop(
    "valid_amount",
    "amount_num > 0"
)
@dlt.expect_or_drop(
    "valid_customer",
    "customer_id IS NOT NULL"
)
def dlt_silver_orders():
    return (
        dlt.read_stream("dlt_bronze_orders")
        .withColumn("amount_num", col("amount").cast("double"))
        .withColumn(
            "order_ts",
            to_timestamp(col("order_timestamp"))
        )
        .dropDuplicates(["order_id"])
    )

@dlt.view(
    comment="Gold aggregations for customer business reporting"
)
def dlt_gold_daily_sales():
    return (
        dlt.read("dlt_silver_orders")
        .groupBy("customer_id")
        .sum("amount_num")
        .withColumnRenamed("sum(amount_num)", "total_spent")
    )
