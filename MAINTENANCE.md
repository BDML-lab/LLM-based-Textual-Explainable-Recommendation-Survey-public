# Maintenance Guide

`data/papers.yml` is the source of truth. Do not edit `README.md` by hand; regenerate it from the YAML file.

## Add or Update a Paper

Each paper entry needs:

```yaml
- citation_key: "example2026paper"
  title: "Example Paper Title"
  year: 2026
  link: "https://arxiv.org/abs/..."
  primary_line: "Predict-then-Explain"
  display_group: "general"
  scope_subtype: "LLM / LLM-enhanced recommender + LLM explainer"
  taxonomy:
    - "Methodology / Optimization Strategies / Consistency Alignment / Human Alignment"
  description: "One or two sentences describing the contribution as used in the survey."
```

Use `display_group: "general"` for ordinary papers. Use `display_group: "agentic_explainer"` only for papers that should appear under the `Agentic Explainer` subsection inside `Predict-then-Explain`.

## Regenerate and Check

```bash
ruby scripts/render_readme.rb
ruby scripts/validate.rb
git diff --check -- README.md data/papers.yml scripts/render_readme.rb scripts/validate.rb MAINTENANCE.md
```

The displayed paper numbers (`P01`, `R01`, `A01`, `E01`) are generated automatically and may change when papers are inserted. Links remain stable because README anchors use `citation_key` values.
