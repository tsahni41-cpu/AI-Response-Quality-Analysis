# Key Findings & Recommendations

## Findings
- 750 simulated AI responses were analysed.
- Overall average accuracy: 73.9.
- Overall QA pass rate: 51.73%.
- Overall hallucination rate: 12.27%.
- Average human rating: 3.03/5.
- Model B shows the strongest overall quality and QA performance.
- Model C shows the weakest overall quality and highest hallucination rate.
- Hard prompts perform worse than Medium and Easy prompts.
- Hallucination is the largest observed failure category.
- Model B is more expensive and slower, showing a quality-versus-cost trade-off.
- Model C is cheaper and faster but produces weaker quality results.

## Recommendations
- Use Model B for higher-risk, quality-sensitive tasks.
- Use cheaper/faster models selectively for lower-risk, high-volume workflows.
- Apply additional QA checks to hard prompts and categories with elevated hallucination rates.
- Track hallucination rate alongside overall accuracy as a core risk metric.
- Consider model routing so harder prompts are sent to stronger models and simpler prompts to cheaper models.
- Review error-type patterns regularly to improve prompts, instructions and QA processes.
