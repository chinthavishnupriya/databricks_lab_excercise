# Lab 10 Job Definition Reference

The Practice Guide provides the following conceptual multi-task Job structure:

```json
{
  "name": "End-To-End Medallion Lakehouse Job",
  "tasks": [
    {
      "task_key": "Ingest_AutoLoader",
      "notebook_task": {
        "notebook_path": "/Repos/lab/01_ingest"
      }
    },
    {
      "task_key": "Run_DLT_Pipeline",
      "depends_on": [
        {
          "task_key": "Ingest_AutoLoader"
        }
      ],
      "pipeline_task": {
        "pipeline_id": "dlt-pipeline-guid-1234"
      }
    }
  ]
}
```

The actual Databricks UI configuration used in this lab is documented in the screenshots.
