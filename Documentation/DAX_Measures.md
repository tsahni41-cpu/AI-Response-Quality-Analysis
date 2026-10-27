# DAX Measures

```DAX
Total Responses = COUNTROWS('AI Responses')
Average Accuracy = AVERAGE('AI Responses'[Accuracy Score])
Average Helpfulness = AVERAGE('AI Responses'[Helpfulness Score])
Average Relevance = AVERAGE('AI Responses'[Relevance Score])
Average Human Rating = AVERAGE('AI Responses'[Human Rating])

Hallucination Count =
CALCULATE(
    COUNTROWS('AI Responses'),
    'AI Responses'[Hallucination] = "Yes"
)

Hallucination Rate =
DIVIDE([Hallucination Count], [Total Responses])

QA Pass Count =
CALCULATE(
    COUNTROWS('AI Responses'),
    'AI Responses'[Passed QA] = "Yes"
)

QA Pass Rate =
DIVIDE([QA Pass Count], [Total Responses])

Average Cost = AVERAGE('AI Responses'[Cost per Response])
Average Response Time = AVERAGE('AI Responses'[Response Time (Seconds)])
Average Tokens = AVERAGE('AI Responses'[Tokens Used])

Total Errors =
CALCULATE(
    COUNTROWS('AI Responses'),
    'AI Responses'[Error Type] <> "None"
)
```
