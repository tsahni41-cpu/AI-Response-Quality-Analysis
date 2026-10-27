USE ai_response_analysis;

SELECT COUNT(*) AS total_responses FROM ai_responses;

SELECT
    COUNT(*) AS total_responses,
    ROUND(AVG(accuracy_score), 2) AS avg_accuracy,
    ROUND(AVG(helpfulness_score), 2) AS avg_helpfulness,
    ROUND(AVG(relevance_score), 2) AS avg_relevance,
    ROUND(AVG(human_rating), 2) AS avg_human_rating,
    ROUND(AVG(response_time_seconds), 2) AS avg_response_time,
    ROUND(AVG(cost_per_response), 4) AS avg_cost
FROM ai_responses;

SELECT
    model,
    ROUND(AVG(accuracy_score), 2) AS avg_accuracy,
    ROUND(AVG(helpfulness_score), 2) AS avg_helpfulness,
    ROUND(AVG(relevance_score), 2) AS avg_relevance,
    ROUND(AVG(human_rating), 2) AS avg_human_rating
FROM ai_responses
GROUP BY model
ORDER BY avg_accuracy DESC;

SELECT
    model,
    COUNT(*) AS total_responses,
    SUM(CASE WHEN hallucination = 'Yes' THEN 1 ELSE 0 END) AS hallucinations,
    ROUND(SUM(CASE WHEN hallucination = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS hallucination_rate
FROM ai_responses
GROUP BY model
ORDER BY hallucination_rate ASC;

SELECT
    model,
    COUNT(*) AS total_responses,
    SUM(CASE WHEN passed_qa = 'Yes' THEN 1 ELSE 0 END) AS qa_passed,
    ROUND(SUM(CASE WHEN passed_qa = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS qa_pass_rate
FROM ai_responses
GROUP BY model
ORDER BY qa_pass_rate DESC;

SELECT
    difficulty,
    ROUND(AVG(accuracy_score), 2) AS avg_accuracy,
    ROUND(AVG(helpfulness_score), 2) AS avg_helpfulness,
    ROUND(AVG(relevance_score), 2) AS avg_relevance,
    ROUND(AVG(human_rating), 2) AS avg_human_rating
FROM ai_responses
GROUP BY difficulty
ORDER BY avg_accuracy DESC;

SELECT
    category,
    ROUND(AVG(accuracy_score), 2) AS avg_accuracy,
    ROUND(AVG(helpfulness_score), 2) AS avg_helpfulness,
    ROUND(AVG(relevance_score), 2) AS avg_relevance,
    ROUND(AVG(human_rating), 2) AS avg_human_rating
FROM ai_responses
GROUP BY category
ORDER BY avg_accuracy DESC;

SELECT
    category,
    COUNT(*) AS total_responses,
    SUM(CASE WHEN hallucination = 'Yes' THEN 1 ELSE 0 END) AS hallucinations,
    ROUND(SUM(CASE WHEN hallucination = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS hallucination_rate
FROM ai_responses
GROUP BY category
ORDER BY hallucination_rate DESC;

SELECT error_type, COUNT(*) AS occurrences
FROM ai_responses
GROUP BY error_type
ORDER BY occurrences DESC;

SELECT
    model,
    error_type,
    COUNT(*) AS occurrences
FROM ai_responses
WHERE error_type <> 'None'
GROUP BY model, error_type
ORDER BY model, occurrences DESC;

SELECT
    model,
    ROUND(AVG(cost_per_response), 4) AS avg_cost,
    ROUND(AVG(response_time_seconds), 2) AS avg_response_time,
    ROUND(AVG(tokens_used), 0) AS avg_tokens,
    ROUND(AVG(accuracy_score), 2) AS avg_accuracy
FROM ai_responses
GROUP BY model
ORDER BY avg_cost ASC;

SELECT
    model,
    ROUND(AVG(accuracy_score), 2) AS hard_prompt_accuracy,
    ROUND(AVG(helpfulness_score), 2) AS hard_prompt_helpfulness,
    ROUND(AVG(relevance_score), 2) AS hard_prompt_relevance,
    ROUND(AVG(human_rating), 2) AS hard_prompt_rating
FROM ai_responses
WHERE difficulty = 'Hard'
GROUP BY model
ORDER BY hard_prompt_accuracy DESC;

SELECT
    model,
    ROUND(AVG(accuracy_score), 2) AS avg_accuracy,
    ROUND(AVG(cost_per_response), 4) AS avg_cost,
    ROUND(AVG(accuracy_score) / AVG(cost_per_response), 2) AS accuracy_per_cost_unit
FROM ai_responses
GROUP BY model
ORDER BY accuracy_per_cost_unit DESC;
