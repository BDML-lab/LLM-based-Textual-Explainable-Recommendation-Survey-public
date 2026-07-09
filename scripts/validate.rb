#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require_relative 'render_readme'

module PaperListValidation
  VALID_LINES = PaperListReadme::LINE_ORDER.freeze
  VALID_GROUPS = PaperListReadme::VALID_DISPLAY_GROUPS.freeze
  REQUIRED_FIELDS = %w[citation_key title year link primary_line display_group scope_subtype taxonomy description].freeze

  class << self
    def run
      papers = PaperListReadme.load_papers
      errors = []
      validate_papers(papers, errors)
      validate_readme(papers, errors)

      if errors.empty?
        annotated = PaperListReadme.annotated_papers(papers)
        counts = annotated.group_by { |paper| paper['_display_id'][0] }.transform_values(&:length)
        puts "Validation passed: papers=#{papers.length} P=#{counts.fetch('P', 0)} R=#{counts.fetch('R', 0)} A=#{counts.fetch('A', 0)} E=#{counts.fetch('E', 0)}"
      else
        warn errors.map { |error| "- #{error}" }.join("\n")
        exit 1
      end
    end

    private

    def validate_papers(papers, errors)
      unless papers.is_a?(Array)
        errors << 'data/papers.yml must contain a top-level array.'
        return
      end

      keys = papers.map { |paper| paper['citation_key'] }
      counts = Hash.new(0)
      keys.compact.each { |key| counts[key] += 1 }
      duplicate_keys = counts.select { |_key, count| count > 1 }.keys
      errors << "Duplicate citation_key values: #{duplicate_keys.join(', ')}" unless duplicate_keys.empty?

      papers.each_with_index do |paper, index|
        label = paper['citation_key'] || "entry #{index + 1}"
        errors << "#{label}: remove generated id field from data/papers.yml" if paper.key?('id')
        REQUIRED_FIELDS.each do |field|
          errors << "#{label}: missing #{field}" unless paper.key?(field)
        end
        errors << "#{label}: invalid primary_line #{paper['primary_line'].inspect}" unless VALID_LINES.include?(paper['primary_line'])
        errors << "#{label}: invalid display_group #{paper['display_group'].inspect}" unless VALID_GROUPS.include?(paper['display_group'])
        if paper['display_group'] == 'agentic_explainer' && paper['primary_line'] != 'Predict-then-Explain'
          errors << "#{label}: agentic_explainer display_group is only valid under Predict-then-Explain"
        end
        unless paper['taxonomy'].is_a?(Array)
          errors << "#{label}: taxonomy must be an array, use [] when empty"
        end
      end

      %w[gao2023chat ramos2024transparent].each do |key|
        paper = papers.find { |entry| entry['citation_key'] == key }
        if paper.nil?
          errors << "#{key}: expected retained background/scope paper is missing"
        elsif !Array(paper['taxonomy']).empty?
          errors << "#{key}: should remain in paper list with taxonomy: []"
        end
      end

      annotated = PaperListReadme.annotated_papers(papers)
      validate_display_sequences(annotated, errors)
    end

    def validate_display_sequences(papers, errors)
      PaperListReadme::PREFIXES.each_value do |prefix|
        ids = papers.map { |paper| paper['_display_id'] }.select { |id| id.start_with?(prefix) }
        expected = (1..ids.length).map { |number| format('%s%02d', prefix, number) }
        errors << "#{prefix} IDs are not continuous" unless ids == expected
      end

      predict = papers.select { |paper| paper['primary_line'] == 'Predict-then-Explain' }
      first_agentic = predict.index { |paper| paper['display_group'] == 'agentic_explainer' }
      if first_agentic
        later_general = predict[(first_agentic + 1)..].to_a.find { |paper| paper['display_group'] != 'agentic_explainer' }
        errors << "Predict-then-Explain general paper appears after Agentic Explainer: #{later_general['citation_key']}" if later_general
      end
    end

    def validate_readme(papers, errors)
      expected = PaperListReadme.render(papers)
      actual = File.read(PaperListReadme.readme_path)
      errors << 'README.md is stale; run ruby scripts/render_readme.rb' unless actual == expected

      anchors = actual.scan(/<a id="([^"]+)"><\/a>/).flatten
      links = actual.scan(/\]\(#([^)]+)\)/).flatten
      missing = links.uniq - anchors
      errors << "README links point to missing anchors: #{missing.join(', ')}" unless missing.empty?

      if actual.include?('#### Other Predict-then-Explain Methods')
        errors << 'README should not contain Other Predict-then-Explain Methods heading'
      end
    end
  end
end

PaperListValidation.run if __FILE__ == $PROGRAM_NAME
