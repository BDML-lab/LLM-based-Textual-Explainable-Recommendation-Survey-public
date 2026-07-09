#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

module PaperListReadme
  LINE_ORDER = [
    'Predict-then-Explain',
    'Reason-then-Recommend',
    'Auxiliary Preference Reasoning',
    'Evaluation'
  ].freeze

  PREFIXES = {
    'Predict-then-Explain' => 'P',
    'Reason-then-Recommend' => 'R',
    'Auxiliary Preference Reasoning' => 'A',
    'Evaluation' => 'E'
  }.freeze

  VALID_DISPLAY_GROUPS = %w[general agentic_explainer].freeze

  class << self
    def repo_root
      File.expand_path('..', __dir__)
    end

    def papers_path
      File.join(repo_root, 'data/papers.yml')
    end

    def readme_path
      File.join(repo_root, 'README.md')
    end

    def load_papers
      YAML.load_file(papers_path)
    end

    def ordered_papers(papers)
      LINE_ORDER.flat_map do |line|
        line_papers = papers.select { |paper| paper['primary_line'] == line }
        if line == 'Predict-then-Explain'
          line_papers.select { |paper| paper['display_group'] != 'agentic_explainer' } +
            line_papers.select { |paper| paper['display_group'] == 'agentic_explainer' }
        else
          line_papers
        end
      end
    end

    def annotated_papers(papers)
      counts = Hash.new(0)
      ordered_papers(papers).map do |paper|
        prefix = PREFIXES.fetch(paper.fetch('primary_line'))
        counts[prefix] += 1
        paper.merge('_display_id' => format('%s%02d', prefix, counts[prefix]))
      end
    end

    def render(papers)
      annotated = annotated_papers(papers)
      by_path = Hash.new { |hash, key| hash[key] = [] }
      annotated.each do |paper|
        Array(paper['taxonomy']).each do |path|
          by_path[path] << paper
        end
      end

      lines = []
      lines << '# LLM-based Textual Explainable Recommendation Survey'
      lines << ''
      lines << 'This repository is a companion paper list for our survey **Textual Explainable Recommendation in the Era of Large Language Models: A Survey**. The survey reviews methods that use large language models to generate or support textual explanations in recommender systems. To organize this literature, it proposes a lifecycle-oriented, method-centric taxonomy with three methodology dimensions: input representation, generation process, and optimization strategies. It also summarizes evaluation resources and evaluation methods for assessing explanation quality. This repository follows that structure for navigation and records each paper with a title link, publication year, short description, and stable anchor.'
      lines << ''
      lines << '## Taxonomy'
      lines << ''
      render_methodology(lines, by_path)
      render_evaluation(lines, by_path, annotated)
      render_papers(lines, annotated)
      lines << '## Citation'
      lines << ''
      lines << 'Citation information will be added when the survey manuscript is publicly available.'
      lines << ''
      lines << '## Contact'
      lines.join("\n") + "\n"
    end

    def write_readme
      File.write(readme_path, render(load_papers))
    end

    private

    def render_methodology(lines, by_path)
      lines << '### Methodology'
      lines << ''
      lines << '#### Input Representation'
      lines << ''
      lines << '- Heterogeneous Information'
      taxonomy_rows(lines, by_path, [
        ['Metadata and Reviews', 'Methodology / Input Representation / Heterogeneous Information / Metadata and Reviews'],
        ['Dialogue Evidence', 'Methodology / Input Representation / Heterogeneous Information / Dialogue Evidence'],
        ['Knowledge-Graph Evidence', 'Methodology / Input Representation / Heterogeneous Information / Knowledge-Graph Evidence'],
        ['Multimodal Evidence', 'Methodology / Input Representation / Heterogeneous Information / Multimodal Evidence'],
        ['Recommender-Side Evidence', 'Methodology / Input Representation / Heterogeneous Information / Recommender-Side Evidence']
      ])
      lines << '- Collaborative Signals'
      taxonomy_rows(lines, by_path, [
        ['Collaborative Embeddings', 'Methodology / Input Representation / Collaborative Signals / Collaborative Embeddings'],
        ['Path and Graph Evidence', 'Methodology / Input Representation / Collaborative Signals / Path and Graph Evidence'],
        ['Collaborative Memory', 'Methodology / Input Representation / Collaborative Signals / Collaborative Memory']
      ])
      lines << ''
      lines << '#### Generation Process'
      lines << ''
      lines << '- Static Reasoning'
      taxonomy_rows(lines, by_path, [
        ['User Preference Reasoning', 'Methodology / Generation Process / Static Reasoning / User Preference Reasoning'],
        ['Preference-Item Matching Reasoning', 'Methodology / Generation Process / Static Reasoning / Preference-Item Matching Reasoning']
      ])
      lines << '- Dynamic Interaction'
      taxonomy_rows(lines, by_path, [
        ['Interaction with Tools, Environments, and Other Agents', 'Methodology / Generation Process / Dynamic Interaction / Interaction with Tools, Environments, and Other Agents'],
        ['Interaction with Users and Feedback Sources', 'Methodology / Generation Process / Dynamic Interaction / Interaction with Users and Feedback Sources']
      ])
      lines << ''
      lines << '#### Optimization Strategies'
      lines << ''
      lines << '- Label Synthesis & Distillation'
      taxonomy_rows(lines, by_path, [
        ['Rationale Label Construction', 'Methodology / Optimization Strategies / Label Synthesis & Distillation / Rationale Label Construction'],
        ['Rationale Label Filtering', 'Methodology / Optimization Strategies / Label Synthesis & Distillation / Rationale Label Filtering'],
        ['On-Policy Distillation', 'Methodology / Optimization Strategies / Label Synthesis & Distillation / On-Policy Distillation']
      ])
      lines << '- Curriculum Learning & Weighting'
      taxonomy_rows(lines, by_path, [
        ['Curriculum Learning', 'Methodology / Optimization Strategies / Curriculum Learning & Weighting / Curriculum Learning'],
        ['Sample Weighting', 'Methodology / Optimization Strategies / Curriculum Learning & Weighting / Sample Weighting']
      ])
      lines << '- Consistency Alignment'
      taxonomy_rows(lines, by_path, [
        ['Content and Quality Alignment', 'Methodology / Optimization Strategies / Consistency Alignment / Content and Quality Alignment'],
        ['Explanation-Recommender Consistency', 'Methodology / Optimization Strategies / Consistency Alignment / Explanation-Recommender Consistency'],
        ['Human Alignment', 'Methodology / Optimization Strategies / Consistency Alignment / Human Alignment']
      ])
      lines << '- Recommendation-Driven Rewards'
      taxonomy_rows(lines, by_path, [
        ['Offline Utility Preference Alignment', 'Methodology / Optimization Strategies / Recommendation-Driven Rewards / Offline Utility Preference Alignment'],
        ['Closed-Loop Utility Optimization', 'Methodology / Optimization Strategies / Recommendation-Driven Rewards / Closed-Loop Utility Optimization'],
        ['Reward Shaping and Credit Assignment', 'Methodology / Optimization Strategies / Recommendation-Driven Rewards / Reward Shaping and Credit Assignment']
      ])
      lines << ''
    end

    def render_evaluation(lines, by_path, papers)
      lines << '### Evaluation'
      lines << ''
      lines << '- Datasets and Evaluation References'
      lines << "  - Dataset Resources and Settings: standard review/rating corpora are common base datasets; evidence-augmented resources (#{links_by_keys(papers, %w[wang2026beyond ma2025explainrec])}); conversational settings (#{links_by_keys(papers, %w[kim2024pearl])}); cross-domain/zero-shot settings (#{links_by_keys(papers, %w[ma2025explainrec ma2025agenticrag petruzzelli2024instructing li2026stllm])}); evaluation-native resources (#{links_by_keys(papers, %w[zhou2025openonerec li2025alert mehta2026helm kabongo2026factual])})."
      lines << "  - Evaluation References and Comparison Targets: raw reviews as common baseline targets; structured/factual references (#{links_by_keys(papers, %w[sani2025fire zhao2024aligning kabongo2026factual shimizu2025disentangling])}); synthetic rationales (#{links_by_keys(papers, %w[tsai2024leveraging wang2026msr])}); non-textual bases (#{links_by_keys(papers, %w[lei2024recexplainer])})."
      lines << '- Evaluation Methods'
      lines << '  - Automated Objective Metrics'
      lines << '    - Text Quality and Semantic Similarity:'
      lines << '      - lexical/semantic matching: BLEU, ROUGE, METEOR, BERTScore, BLEURT, BARTScore, GPTScore'
      lines << '      - diversity/stability: Distinct-n, entropy, USR, GPTstd, BARTstd'
      lines << "      - robustness: #{links_by_keys(papers, %w[zhang2026robustexplain])}"
      lines << '    - Grounding and Faithfulness:'
      lines << "      - coverage: FMR, FCR, DIV, and feature/aspect alignment checks (#{links_by_keys(papers, %w[gao2024dre sani2025fire zhao2024aligning])})"
      lines << "      - factuality: entailment- or statement-level consistency checks (#{links_by_keys(papers, %w[lei2024recexplainer liu2025coherency mehta2026matrag kabongo2026factual])})"
      lines << "    - Downstream Utility and Online Metrics: utility-oriented evaluation (#{links_by_keys(papers, %w[zhang2026sequence wang2025can park2026think])})."
      lines << '  - Subjective and Cognitive Evaluation'
      taxonomy_rows(lines, by_path, [
        ['Human Evaluation', 'Evaluation / Evaluation Methods / Subjective and Cognitive Evaluation / Human Evaluation'],
        ['LLM-as-a-Judge', 'Evaluation / Evaluation Methods / Subjective and Cognitive Evaluation / LLM-as-a-Judge']
      ], indent: '    ')
      lines << ''
    end

    def render_papers(lines, papers)
      lines << '## Papers'
      lines << ''
      lines << 'The paper list uses prefixes to indicate reading categories. The first three prefixes are based on the form and role of explanation-related text in the recommendation workflow: `P` = Predict-then-Explain, `R` = Reason-then-Recommend, and `A` = Auxiliary Preference Reasoning. The `E` prefix is used for papers mainly included as evaluation resources or evaluation protocols.'
      lines << ''
      lines << "More specifically, the first three categories follow the survey's scope definition for LLM-based textual explanations. Within this scope, the first two are primary pipelines:"
      lines << ''
      lines << '**Predict-then-Explain.** A recommendation model first outputs a predicted result, and an LLM subsequently generates explanations justifying that prediction.'
      lines << ''
      lines << '**Reason-then-Recommend.** The LLM first generates step-by-step reasoning traces that infer user preferences and match them against item attributes, then derives the final recommendation from this reasoning process. When these explanation-oriented reasoning traces directly support recommendation results, they can be treated as textual rationales.'
      lines << ''
      lines << 'In addition, the survey includes **Auxiliary Preference Reasoning** as a supplementary category. These methods infer readable user preferences, profiles, personas, or intents without explicitly deriving item-preference matching. Their outputs may not by themselves fully explain a specific recommendation, but they can make user preferences more transparent.'
      lines << ''

      LINE_ORDER.each do |line_name|
        lines << "### #{line_name}"
        lines << ''
        agentic_heading_inserted = false
        papers.select { |paper| paper['primary_line'] == line_name }.each do |paper|
          if line_name == 'Predict-then-Explain' && paper['display_group'] == 'agentic_explainer' && !agentic_heading_inserted
            lines << '#### Agentic Explainer'
            lines << ''
            agentic_heading_inserted = true
          end
          lines << %(<a id="#{anchor_for(paper)}"></a>)
          lines << "**#{paper['_display_id']}.** [#{paper['title']}](#{paper['link']}) (#{paper['year']})"
          lines << ''
          lines << paper['description'].to_s
          lines << ''
        end
      end
    end

    def taxonomy_rows(lines, by_path, rows, indent: '  ')
      rows.each do |label, path|
        lines << "#{indent}- #{label}: #{links_for(by_path[path])}"
      end
    end


    def links_by_path(by_path, path)
      links_for(by_path[path])
    end

    def links_by_keys(papers, keys)
      lookup = papers.to_h { |paper| [paper['citation_key'], paper] }
      links_for(keys.map { |key| lookup[key] }.compact)
    end

    def links_for(papers)
      papers.map { |paper| "[#{paper['_display_id']}](##{anchor_for(paper)})" }.join(', ')
    end

    def anchor_for(paper)
      paper.fetch('citation_key')
    end
  end
end

PaperListReadme.write_readme if __FILE__ == $PROGRAM_NAME
