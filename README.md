# LLM-based Textual Explainable Recommendation Survey

This repository is a companion paper list for our survey **Textual Explainable Recommendation in the Era of Large Language Models: A Survey**. The survey reviews methods that use large language models to generate or support textual explanations in recommender systems. To organize this literature, it proposes a lifecycle-oriented, method-centric taxonomy with three methodology dimensions: input representation, generation process, and optimization strategies. It also summarizes evaluation resources and evaluation methods for assessing explanation quality. This repository follows that structure for navigation and records each paper with a title link, publication year, short description, and stable anchor.

## Taxonomy

### Methodology

#### Input Representation

- Heterogeneous Information
  - Metadata and Reviews: [P01](#sun2025retrieval), [P02](#park2025madrec), [P03](#gao2024dre), [P07](#yang2024fine), [P15](#rahdari2024logic)
  - Dialogue Evidence: [P29](#qiu2025graph), [P33](#yang2024unleashing), [P41](#park2023user)
  - Knowledge-Graph Evidence: [P04](#wang2026beyond), [P49](#mehta2026matrag), [A19](#qiu2025reasoning)
  - Multimodal Evidence: [P05](#pan2026mmp), [P06](#ma2025explainrec), [R25](#wang2026mllmrec)
  - Recommender-Side Evidence: [P08](#shi2025llm), [P09](#sani2025fire), [P26](#liu2025coherency), [P37](#manderlier2025latent)
- Collaborative Signals
  - Collaborative Embeddings: [P10](#ma2024xrec), [P11](#zhang2026sequence), [P12](#feng2026behavior), [P21](#tang2024gavamoe), [P27](#liu2025arts)
  - Path and Graph Evidence: [P05](#pan2026mmp), [P13](#li2025g), [R09](#zhao2025reason)
  - Collaborative Memory: [P51](#chen2026memrec), [A13](#wang2023drdt), [A14](#yu2024peprec)

#### Generation Process

- Static Reasoning
  - User Preference Reasoning: [P23](#liu2025hierarchical), [P31](#yang2024chain), [P44](#ebrat2025end), [R12](#wu2025starec), [R20](#team2026onereason), [A02](#sun2024large), [A03](#yue2025cot4rec), [A04](#liu2025improving), [A11](#zheng2024harnessing), [A12](#ye2025harnessing), [A13](#wang2023drdt), [A15](#long2024got4rec), [A16](#zhao2024lane), [A17](#kim2026offline), [A18](#lee2025sprint), [A20](#liu2025bridge)
  - Preference-Item Matching Reasoning: [P15](#rahdari2024logic), [P16](#qin2024beyond), [P42](#chen2025m), [R01](#fang2025reason4rec), [R02](#kim2025driven), [R05](#wang2026msr), [R06](#feng2025r1)
- Dynamic Interaction
  - Interaction with Tools, Environments, and Other Agents: [P45](#wang2024recmind), [P46](#wang2024macrec), [P47](#ma2025agenticrag), [P48](#yi2025recgptv2), [P49](#mehta2026matrag), [P50](#zhang2025enhancing), [P52](#raj2026harpo), [P53](#zu2026think), [P55](#chen2026top)
  - Interaction with Users and Feedback Sources: [P54](#cai2025agentic), [R23](#xiang2026user), [A07](#cai2026mgfrec)

#### Optimization Strategies

- Label Synthesis & Distillation
  - Rationale Label Construction: [P14](#zhang2025oracle), [P22](#luo2024unlocking), [P30](#li2024explainable), [P34](#kim2024pearl), [P35](#zhang2025hdrec), [P36](#wang2024rdrec), [P39](#petruzzelli2024instructing)
  - Rationale Label Filtering: [P23](#liu2025hierarchical), [P25](#yi2025recgpt), [R01](#fang2025reason4rec), [R03](#tsai2024leveraging), [R04](#park2025towards), [R16](#liang2026generative), [R24](#li2026stllm), [R25](#wang2026mllmrec)
  - On-Policy Distillation: [R20](#team2026onereason)
- Curriculum Learning & Weighting
  - Curriculum Learning: [P26](#liu2025coherency), [P28](#pan2026curr), [R22](#huang2026rerec)
  - Sample Weighting: [P13](#li2025g), [R10](#parkmore), [R11](#yun2026arrow)
- Consistency Alignment
  - Content and Quality Alignment: [P07](#yang2024fine), [P40](#tiwari2025shielded)
  - Explanation-Recommender Consistency: [P06](#ma2025explainrec), [P17](#lei2024recexplainer), [P18](#yang2026large), [P28](#pan2026curr), [P32](#zhao2024aligning)
  - Human Alignment: [P19](#tang2025explainable), [P48](#yi2025recgptv2)
- Recommendation-Driven Rewards
  - Offline Utility Preference Alignment: [P38](#wang2025llm), [A06](#wang2025lettingo)
  - Closed-Loop Utility Optimization: [P20](#wang2025can), [R07](#kong2026think), [R08](#xie2025recllm), [A05](#gao2025langptune), [A07](#cai2026mgfrec), [A08](#lin2025rec), [A09](#huang2025mr), [A10](#xia2026trackrec)
  - Reward Shaping and Credit Assignment: [R13](#you2026r), [R14](#he2026reasoning), [R15](#zheng2026reasoning), [R16](#liang2026generative), [R17](#hong2025generative), [R18](#liu2025onerec), [R21](#zheng2026sapo), [R22](#huang2026rerec), [R26](#park2026think)

### Evaluation

- Datasets and Evaluation References
  - Dataset Resources and Settings: standard review/rating corpora are common base datasets; evidence-augmented resources ([P04](#wang2026beyond), [P06](#ma2025explainrec)); conversational settings ([P34](#kim2024pearl)); cross-domain/zero-shot settings ([P06](#ma2025explainrec), [P47](#ma2025agenticrag), [P39](#petruzzelli2024instructing), [R24](#li2026stllm)); evaluation-native resources ([R19](#zhou2025openonerec), [E01](#li2025alert), [E02](#mehta2026helm), [E03](#kabongo2026factual)).
  - Evaluation References and Comparison Targets: raw reviews as common baseline targets; structured/factual references ([P09](#sani2025fire), [P32](#zhao2024aligning), [E03](#kabongo2026factual), [E06](#shimizu2025disentangling)); synthetic rationales ([R03](#tsai2024leveraging), [R05](#wang2026msr)); non-textual bases ([P17](#lei2024recexplainer)).
- Evaluation Methods
  - Automated Objective Metrics
    - Text Quality and Semantic Similarity:
      - lexical/semantic matching: BLEU, ROUGE, METEOR, BERTScore, BLEURT, BARTScore, GPTScore
      - diversity/stability: Distinct-n, entropy, USR, GPTstd, BARTstd
      - robustness: [E04](#zhang2026robustexplain)
    - Grounding and Faithfulness:
      - coverage: FMR, FCR, DIV, and feature/aspect alignment checks ([P03](#gao2024dre), [P09](#sani2025fire), [P32](#zhao2024aligning))
      - factuality: entailment- or statement-level consistency checks ([P17](#lei2024recexplainer), [P26](#liu2025coherency), [P49](#mehta2026matrag), [E03](#kabongo2026factual))
    - Downstream Utility and Online Metrics: utility-oriented evaluation ([P11](#zhang2026sequence), [P20](#wang2025can), [R26](#park2026think)).
  - Subjective and Cognitive Evaluation
    - Human Evaluation: [P02](#park2025madrec), [P16](#qin2024beyond), [P22](#luo2024unlocking), [P26](#liu2025coherency), [P37](#manderlier2025latent), [P52](#raj2026harpo), [A16](#zhao2024lane), [E02](#mehta2026helm)
    - LLM-as-a-Judge: [P16](#qin2024beyond), [P25](#yi2025recgpt), [P48](#yi2025recgptv2), [R24](#li2026stllm), [E01](#li2025alert), [E05](#zhao2025adapting)

## Papers

The paper list uses prefixes to indicate reading categories. The first three prefixes are based on the form and role of explanation-related text in the recommendation workflow: `P` = Predict-then-Explain, `R` = Reason-then-Recommend, and `A` = Auxiliary Preference Reasoning. The `E` prefix is used for papers mainly included as evaluation resources or evaluation protocols.

More specifically, the first three categories follow the survey's scope definition for LLM-based textual explanations. Within this scope, the first two are primary pipelines:

**Predict-then-Explain.** A recommendation model first outputs a predicted result, and an LLM subsequently generates explanations justifying that prediction.

**Reason-then-Recommend.** The LLM first generates step-by-step reasoning traces that infer user preferences and match them against item attributes, then derives the final recommendation from this reasoning process. When these explanation-oriented reasoning traces directly support recommendation results, they can be treated as textual rationales.

In addition, the survey includes **Auxiliary Preference Reasoning** as a supplementary category. These methods infer readable user preferences, profiles, personas, or intents without explicitly deriving item-preference matching. Their outputs may not by themselves fully explain a specific recommendation, but they can make user preferences more transparent.

### Predict-then-Explain

<a id="sun2025retrieval"></a>
**P01.** [Retrieval-Augmented Recommendation Explanation Generation with Hierarchical Aggregation](https://arxiv.org/abs/2507.09188) (2025)

REXHA builds explanation prompts from LightGCN collaborative embeddings, hierarchically aggregated user/item profiles, and retrieved interaction-relevant reviews. The hierarchical aggregation condenses noisy reviews into compact long-term summaries, while retrieval adds target-specific evidence.

<a id="park2025madrec"></a>
**P02.** [MADREC: A Multi-Aspect Driven LLM Agent for Explainable and Adaptive Recommendation](https://arxiv.org/abs/2510.13371) (2025)

MADREC dynamically extracts aspect terms and aspect-level summaries from reviews to build structured user and item evidence for explanation generation. It evaluates generated explanations through human comparison of persuasiveness.

<a id="gao2024dre"></a>
**P03.** [DRE: Generating Recommendation Explanations by Aligning Large Language Models at Data-Level](https://arxiv.org/abs/2404.06311) (2024)

DRE summarizes target-item features and distills target-aware preference aspects from long historical reviews, then prompts the LLM to generate explanations that connect the recommended item with user-attended features.

<a id="wang2026beyond"></a>
**P04.** [Beyond Factual Correctness: Mitigating Preference-Inconsistent Explanations in Explainable Recommendation](https://arxiv.org/abs/2603.03080) (2026)

PURE identifies preference inconsistency as a failure mode where explanations cite factually correct but user-misaligned attributes. It retrieves and prunes KG paths with both factual correctness and preference alignment in mind, then injects the selected paths into the LLM through soft and hard prompts; its P-EHR metric evaluates preference-inconsistent explanations.

<a id="pan2026mmp"></a>
**P05.** [MMP-Refer: Multimodal Path Retrieval-Augmented LLMs for Explainable Recommendation](https://arxiv.org/abs/2604.03666) (2026)

MMP-Refer retrieves explicit interaction paths from a multimodal user-item graph and combines them with visual-textual user/item representations for LLM-based recommendation explanation generation.

<a id="ma2025explainrec"></a>
**P06.** [ExplainRec: Towards Explainable Multi-Modal Zero-Shot Recommendation with Preference Attribution and Visual-Tuning](https://arxiv.org/abs/2511.14770) (2025)

ExplainRec adds visual and textual evidence for multimodal zero-shot explainable recommendation and uses consistency objectives to align prediction and explanation.

<a id="yang2024fine"></a>
**P07.** [Fine-Tuning Large Language Model Based Explainable Recommendation with Explainable Quality Reward](https://ojs.aaai.org/index.php/AAAI/article/view/28777) (2024)

LLM2ER-EQR builds personalized prompts with candidate concepts extracted from reviews and concept graphs, then fine-tunes the explainer with a concept-consistency reward and a high-quality alignment reward.

<a id="shi2025llm"></a>
**P08.** [LLM-Powered Explanations: Unraveling Recommendations through Subgraph Reasoning](https://arxiv.org/abs/2406.15859) (2025)

LLM-SRR uses an LLM to extract review-derived triples that enrich sparse user-item knowledge graphs, then applies attentive subgraph reasoning to produce recommendations and key decision paths. The selected paths are verbalized by the LLM as natural-language explanations.

<a id="sani2025fire"></a>
**P09.** [FIRE: Faithful Interpretable Recommendation Explanations](https://arxiv.org/abs/2508.05225) (2025)

FIRE uses an LLM to extract user needs and item features from reviews, clusters them into structured feature groups, and trains an XGBoost sentiment predictor whose SHAP-attributed top features guide LLM-based explanation generation. It evaluates faithfulness through user-item alignment, need-feature connection, rating-sentiment consistency, structure checks, and diversity rather than relying on review-overlap alone.

<a id="ma2024xrec"></a>
**P10.** [XRec: Large Language Models for Explainable Recommendation](https://aclanthology.org/2024.findings-emnlp.22/) (2024)

XRec maps LightGCN-derived user and item embeddings into the LLM semantic space through a lightweight MoE adapter, enabling collaborative signals to guide explanation generation. It trains the explainer with GPT-rewritten review labels.

<a id="zhang2026sequence"></a>
**P11.** [Sequence-Aware Large Language Models for Explainable Recommendation](https://arxiv.org/abs/2603.24136) (2026)

SELLER exposes collaborative and temporal behavior patterns to the LLM through sequence-aware adapters. It also reports downstream recommendation metrics as evidence of explanation-related utility.

<a id="feng2026behavior"></a>
**P12.** [Behavior Tokens Speak Louder: Disentangled Explainable Recommendation with Behavior Vocabulary](https://arxiv.org/pdf/2512.15614) (2026)

BEAT quantizes LightGCN-based user-item interaction representations into discrete behavior tokens and aligns them with review-derived semantic signals. These behavior tokens are then projected into the LLM input space for explanation generation.

<a id="li2025g"></a>
**P13.** [G-Refer: Graph Retrieval-Augmented Large Language Model for Explainable Recommendation](https://dl.acm.org/doi/10.1145/3696410.3714727) (2025)

G-Refer retrieves path-level and node-level CF evidence, translates the graph evidence into natural-language prompts for the LLM, and prunes easy samples so training focuses on cases that require graph-based explanation.

<a id="zhang2025oracle"></a>
**P14.** [The Oracle and The Prism: A Decoupled and Efficient Framework for Generative Recommendation Explanation](https://arxiv.org/abs/2511.16543) (2025)

Prism uses a large teacher LLM to generate faithfulness-constrained explanation labels, then distills these labels into a lightweight user-aware explainer.

<a id="rahdari2024logic"></a>
**P15.** [Logic-Scaffolding: Personalized Aspect-Instructed Recommendation Explanation Generation Using LLMs](https://dlnext.acm.org/doi/epdf/10.1145/3616855.3635689) (2024)

Logic-Scaffolding retrieves relevant historical items, uses few-shot prompting to extract fine-grained aspects from movie metadata, and guides the LLM through staged reasoning that matches shared aspects between historical and recommended items before generating explanations.

<a id="qin2024beyond"></a>
**P16.** [Beyond Persuasion: Towards Conversational Recommender System with Credible Explanations](https://aclanthology.org/2024.findings-emnlp.247.pdf) (2024)

PC-CRS guides conversational explanations with credibility-aware persuasive strategies and refines them through critic/refiner self-reflection to reduce factual errors. It evaluates persuasiveness and credibility through human judgments and GPT-4-based judge validation.

<a id="lei2024recexplainer"></a>
**P17.** [RecExplainer: Aligning Large Language Models for Explaining Recommendation Models](https://dl.acm.org/doi/10.1145/3637528.3671802) (2024)

RecExplainer aligns an LLM with a target recommender such as SASRec through behavior-level tasks and latent user/item embedding alignment. It uses the aligned LLM to generate recommendation explanations and evaluates them with fidelity checks and GPT-4/human ratings.

<a id="yang2026large"></a>
**P18.** [Large Language Model Can Interpret Latent Space of Sequential Recommender](https://dl.acm.org/doi/pdf/10.1145/3786201) (2026)

RecInterpreter maps sequential recommender hidden states into the LLM token space. It extends explanation-recommender consistency toward interpreting latent behavioral representations.

<a id="tang2025explainable"></a>
**P19.** [Explainable Recommendation with Simulated Human Feedback](https://arxiv.org/pdf/2504.14147) (2025)

HF4Rec replaces static text fitting with simulated human feedback, optimizing generated explanations for human-facing qualities such as informativeness and persuasiveness.

<a id="wang2025can"></a>
**P20.** [Can Explanations Improve Recommendations? A Joint Optimization with LLM Reasoning](https://arxiv.org/pdf/2502.16759) (2025)

RecPIE treats explanation usefulness as a predictive question: generated positive and negative explanations are fed back into a predictor and its accuracy becomes a reward signal. It also reports downstream prediction metrics.

<a id="tang2024gavamoe"></a>
**P21.** [GaVaMoE: Gaussian-Variational Gated Mixture of Experts for Explainable Recommendation](https://arxiv.org/abs/2410.11841) (2024)

GaVaMoE uses a VAE-GMM module to map sparse user-item interactions into group-level latent preference distributions, then routes explanation generation through a multi-gating MoE architecture for cluster-aware personalization.

<a id="luo2024unlocking"></a>
**P22.** [Unlocking the Potential of Large Language Models for Explainable Recommendations](https://arxiv.org/pdf/2312.15661) (2024)

LLMXRec replaces noisy review targets with cleaner instruction-tuning explanations and discriminator labels verified by humans and GPT-4. It also evaluates generated explanations through human ratings of reasonability, attractiveness, and redundancy.

<a id="liu2025hierarchical"></a>
**P23.** [Hierarchical Interaction Summarization and Contrastive Prompting for Explainable Recommendations](https://arxiv.org/pdf/2507.06044) (2025)

PGHIS-CPEG constructs structured textual profiles through hierarchical interaction summarization and uses contrastive prompting to filter useful rationale supervision.

<a id="gao2023chat"></a>
**P24.** [Chat-Rec: Towards Interactive and Explainable LLMs-Augmented Recommender System](https://arxiv.org/abs/2303.14524) (2023)

CHAT-REC uses an LLM as an interactive interface on top of a traditional recommender. It builds prompts from user profiles, histories, dialogue context, and retrieved candidates so the LLM can rerank items and generate explanatory responses without fine-tuning.

<a id="yi2025recgpt"></a>
**P25.** [RecGPT Technical Report](https://arxiv.org/abs/2507.22879) (2025)

RecGPT builds an industrial LLM recommendation pipeline where personalized interest-item explanations are generated offline and served through lookup. Its self-generated samples are filtered by human-LLM cooperative judges over relevance, factuality, clarity, and safety, and a Qwen-based judge is trained for recommendation explanation assessment.

<a id="liu2025coherency"></a>
**P26.** [Coherency Improved Explainable Recommendation via Large Language Model](https://ojs.aaai.org/index.php/AAAI/article/view/33329) (2025)

CIER predicts a soft rating distribution and converts it into a rating-aware word embedding for explanation generation. It further uses rating smoothing and curriculum learning, and evaluates coherence with both human annotation and automatic rating-explanation consistency checks.

<a id="liu2025arts"></a>
**P27.** [ARTS: A General and Efficient Multi-Task Self-Prompt Framework for Explainable Sequential Recommendation](https://dl.acm.org/doi/epdf/10.1145/3717833) (2025)

ARTS compresses long interaction histories into personalized semantic prompts and combines them with short recent sequences for efficient explainable sequential recommendation. It uses multi-task alternating optimization to share these sequence-aware prompts between recommendation and explanation generation.

<a id="pan2026curr"></a>
**P28.** [Curr-RLCER: Curriculum Reinforcement Learning for Coherence Explainable Recommendation](https://arxiv.org/pdf/2604.05341) (2026)

Curr-RLCER trains explainable recommendation through a curriculum from preference judgment to rating selection and explanation generation. Its GRPO stage rewards concise, semantically accurate explanations whose inferred sentiment remains coherent with the target rating.

<a id="qiu2025graph"></a>
**P29.** [Graph Retrieval-Augmented LLM for Conversational Recommendation Systems](https://arxiv.org/abs/2503.06430) (2025)

G-CRS builds a conversation-entity interaction graph and retrieves both candidate items and similar dialogue cases with personalized PageRank. The retrieved graph and dialogue evidence is used as in-context support for LLM-based conversational recommendation.

<a id="li2024explainable"></a>
**P30.** [Explainable and Coherent Complement Recommendation Based on Large Language Models](https://dl.acm.org/doi/pdf/10.1145/3627673.3680028) (2024)

ECCR constructs coherent-complement supervision from item compatibility and shared semantic attributes, then uses LLM few-shot prompting to synthesize concise explanation labels for complement recommendation.

<a id="yang2024chain"></a>
**P31.** [Chain-of-Thought Prompting Empowered Generative User Modeling for Personalized Recommendation](https://dl.acm.org/doi/abs/10.1007/s00521-024-10364-2) (2024)

GUMRec organizes user modeling through stepwise prompting to construct textual user preference states.

<a id="zhao2024aligning"></a>
**P32.** [Aligning Explanations for Recommendation with Rating and Feature via Maximizing Mutual Information](https://dl.acm.org/doi/abs/10.1145/3627673.3679663) (2024)

MMI fine-tunes explanation generators by maximizing mutual information between generated explanations and predicted ratings or item features. Its reward design improves rating/feature alignment while regularizing the generator to preserve fluent and diverse text.

<a id="yang2024unleashing"></a>
**P33.** [Unleashing the Retrieval Potential of Large Language Models in Conversational Recommender Systems](https://dl.acm.org/doi/epdf/10.1145/3640457.3688146) (2024)

ReFICR instruction-tunes a single LLM to perform both retrieval and generation for conversational recommendation. It uses LLM-derived embeddings to retrieve candidate items and similar historical dialogues, then conditions ranking, dialogue management, and response generation on this dialogue-matched evidence.

<a id="kim2024pearl"></a>
**P34.** [PEARL: A Review-Driven Persona-Knowledge Grounded Conversational Recommendation Dataset](https://aclanthology.org/2024.findings-acl.65/) (2024)

PEARL uses LLM-based user and recommender simulators to synthesize multi-turn conversational recommendation data grounded in review-derived personas and item knowledge. It filters generated dialogues for preference contradictions, producing cleaner persona-grounded supervision and a conversational dataset setting for explanation assessment.

<a id="zhang2025hdrec"></a>
**P35.** [HDRec: Hierarchical Distillation for Enhanced LLM-Based Recommendation Systems](https://ieeexplore.ieee.org/document/10890603) (2025)

HDRec uses Llama-3 to hierarchically distill raw reviews into structured preference, attribute, personality, audience, and summary signals, providing cleaner supervision for recommendation and explanation learning.

<a id="wang2024rdrec"></a>
**P36.** [RDRec: Rationale Distillation for LLM-Based Recommendation](https://aclanthology.org/2024.acl-short.6/) (2024)

RDRec distills raw reviews into concise rationale labels about user preferences and item attributes, which provide cleaner supervision for a compact T5-based recommender in recommendation and explanation-related generation.

<a id="manderlier2025latent"></a>
**P37.** [From Latent Factors to Language: A User Study on LLM-Generated Explanations for an Inherently Interpretable Recommender System](https://arxiv.org/abs/2509.18980) (2025)

This work uses an LLM to verbalize latent user types and user-specific mixture weights from an inherently interpretable matrix-based recommender. Its user study compares model-based, history-based, and combined explanations on transparency, effectiveness, persuasion, trust, and satisfaction.

<a id="wang2025llm"></a>
**P38.** [LLM as Explainable Re-Ranker for Recommendation System](https://arxiv.org/abs/2512.03439) (2025)

This work trains an LLM to rerank candidate items and generate ranking rationales using GPT-generated positive and negative examples. It combines SFT with DPO/RPO-style preference optimization and uses bootstrapped inference to reduce position bias.

<a id="petruzzelli2024instructing"></a>
**P39.** [Instructing and Prompting Large Language Models for Explainable Cross-Domain Recommendations](https://dl.acm.org/doi/10.1145/3640457.3688137) (2024)

CDR-LLM formulates cross-domain recommendation as an instruction-following task that ranks target-domain candidates from source-domain user preferences and generates natural-language explanations. It evaluates zero-shot, one-shot, and instruction-tuned source-to-target transfer settings.

<a id="tiwari2025shielded"></a>
**P40.** [Shielded RecRL: Explanation Generation for Recommender Systems without Ranking Degradation](https://arxiv.org/abs/2601.03608) (2025)

Shielded RecRL freezes the ranking tower and optimizes a LoRA-based LLM explanation tower with PPO, using length, content-relevance, coherence, and KL rewards to improve explanations without degrading recommendation performance.

<a id="park2023user"></a>
**P41.** [A User Preference and Intent Extraction Framework for Explainable Conversational Recommender Systems](https://dl.acm.org/doi/10.1145/3596454.3597178) (2023)

The User Preference and Intent Extraction framework detects feature entities and estimates entity-level sentiment preferences from dialogue, while a context-aware graph extracts intent keywords beyond explicit entity mentions. These cues condition conversational recommendation and explanation generation.

<a id="chen2025m"></a>
**P42.** [M-LLM3REC: A Motivation-Aware User-Item Interaction Framework for Enhancing Recommendation](https://dl.acm.org/doi/10.1145/3746252.3761214) (2025)

M-LLM3REC aligns LLM-inferred user motivations with item semantic traits for cold-start recommendation, using self-regularized reason checking to produce more traceable and motivation-consistent explanations.

<a id="yu2026thinkrec"></a>
**P43.** [ThinkRec: Thinking-Based Recommendation via LLM](https://dl.acm.org/doi/pdf/10.1145/3774904.3792070) (2026)

ThinkRec synthesizes reasoning traces with a teacher reasoning model to jointly train recommendation prediction and reason generation. It also injects collaborative ID embeddings through a projector and uses instance-wise LoRA expert fusion for user-specific reasoning.

<a id="ebrat2025end"></a>
**P44.** [End-to-End Personalization: Unifying Recommender Systems with Large Language Models](https://arxiv.org/abs/2508.01514) (2025)

This work combines LLM-generated user/item profiles with a GAT recommender, then uses LLM reranking to generate natural-language justifications grounded in matched profile attributes, themes, and styles.

#### Agentic Explainer

<a id="wang2024recmind"></a>
**P45.** [RecMind: Large Language Model Powered Agent for Recommendation](https://aclanthology.org/2024.findings-naacl.271/) (2024)

RecMind uses Self-Inspiring planning, memory, and external tools to preserve explored reasoning states and external evidence, enabling training-free recommendation, explanation generation, and review summarization.

<a id="wang2024macrec"></a>
**P46.** [MACRec: A Multi-Agent Collaboration Framework for Recommendation](https://dl.acm.org/doi/10.1145/3626772.3657669) (2024)

MACRec coordinates specialized LLM agents for task decomposition, evidence gathering, external search, and reflection, enabling collaborative recommendation and explanation generation without task-specific training.

<a id="ma2025agenticrag"></a>
**P47.** [AgenticRAG: Tool-Augmented Foundation Models for Zero-Shot Explainable Recommender Systems](https://arxiv.org/abs/2510.02668) (2025)

AgenticRAG builds a zero-shot explainable recommender by combining RAG-enhanced knowledge retrieval, external tool invocation, and structured CoT reasoning. It lets user and item agents exchange preferences, constraints, features, justifications, and confidence signals, then uses consensus scoring to support ranking while generating step-by-step explanations based on retrieved context and tool results.

<a id="yi2025recgptv2"></a>
**P48.** [RecGPT-V2 Technical Report](https://arxiv.org/abs/2512.14503) (2025)

RecGPT-V2 uses a planner-expert-arbiter pipeline for agentic intent reasoning and meta-prompting to produce context-aware guidance for explanation generation. It further aligns explanation quality through Agent-as-a-Judge evaluation and reward-model distillation.

<a id="mehta2026matrag"></a>
**P49.** [MATRAG: Multi-Agent Transparent Retrieval-Augmented Generation for Explainable Recommendations](https://arxiv.org/abs/2604.20848) (2026)

MATRAG combines KG-augmented RAG with specialized agents for transparent recommendation and explanation generation. An orchestrator coordinates user modeling, item analysis, reasoning, and explanation agents to retrieve and rerank KG subgraphs, pair recommendation reasoning with structured evidence, and convert reasoning chains into natural-language explanations. It also reports an entailment-style grounding check that tests whether explanation claims are supported by retrieved KG evidence.

<a id="zhang2025enhancing"></a>
**P50.** [Recommendation Explanations through User-Centric Refinement](https://aclanthology.org/2025.findings-emnlp.434/) (2025)

RefineX treats recommendation explanations as revisable outputs rather than one-shot generations. It uses a training-free planner-refiner-reflector workflow to iteratively refine initial explanations from base recommenders, where the planner selects user-centric aspects, the refiner rewrites the explanation, and strategic/content reflectors provide feedback on factuality, personalization, and sentiment coherence.

<a id="chen2026memrec"></a>
**P51.** [MemRec: Collaborative Memory-Augmented Agentic Recommender System](https://arxiv.org/abs/2601.08816) (2026)

MemRec builds collaborative memory by curating graph neighbors and synthesizing high-level preference facets with confidence and supporting evidence. This memory is then used by a recommendation LLM to rank candidates and generate rationales that incorporate community-level behavioral signals beyond isolated user histories.

<a id="raj2026harpo"></a>
**P52.** [HARPO: Hierarchical Agentic Reasoning for User-Aligned Conversational Recommendation](https://arxiv.org/abs/2604.10048) (2026)

HARPO treats conversational recommendation as a user-aligned decision process, using virtual tool operations and tree-structured reasoning to explore candidate reasoning paths before generating responses. It explicitly turns selected reasoning traces into recommendation explanations and reports user-facing evaluation of recommendation quality, explanation quality, and satisfaction.

<a id="zu2026think"></a>
**P53.** [Think Then Recommend: An LLM-Powered Multi-Agent Framework for Personalized Conversational Recommendation](https://dl.acm.org/doi/10.1145/3774904.3793050) (2026)

TTR builds an e-commerce conversational recommender around structured intent modeling. It first extracts basic user intents from dialogue, enriches them with historical behavior or popularity-aware inference, and then uses a preference-aligned LLM ranker to match completed intents with product attributes while generating intent-grounded recommendation explanations.

<a id="cai2025agentic"></a>
**P54.** [Agentic Feedback Loop Modeling Improves Recommendation and User Simulation](https://dl.acm.org/doi/10.1145/3726302.3729893) (2025)

AFL models recommendation as an agentic feedback loop between a recommendation agent and a user agent. The recommendation agent proposes an item with a rationale, while the user agent evaluates it and stores acceptance, rejection, or critique feedback in memory, allowing later recommendation attempts to revise both item choices and recommendation rationales.

<a id="chen2026top"></a>
**P55.** [When Top-Ranked Recommendations Fail: Modeling Multi-Granular Negative Feedback for Explainable and Controllable Recommendation](https://arxiv.org/abs/2511.18700) (2026)

Agentic ENF explains why top-ranked video recommendations fail by modeling user-side negative feedback through profile, video, and reasoning agents. It combines user preference profiling, multimodal video analysis, and stepwise RL rewards to predict negative feedback types and generate explanations for why a user may dislike or skip a recommended video.

### Reason-then-Recommend

<a id="fang2025reason4rec"></a>
**R01.** [Reason4Rec: Large Language Models for Recommendation with Deliberative User Preference Alignment](https://arxiv.org/abs/2502.02061) (2025)

Reason4Rec first distills aspect-level preferences and generates preference-item matching rationales before predicting ratings. Its reward-model filtering step uses target-review signals to select rationale supervision that better aligns reasoning with users’ real preferences.

<a id="kim2025driven"></a>
**R02.** [Review-driven Personalized Preference Reasoning with Large Language Models for Recommendation](https://dl.acm.org/doi/10.1145/3726302.3730055) (2025)

EXP3RT distills review-derived preferences into user and item profiles, then trains a smaller LLM to generate profile-based reasoning before rating prediction or reranking. Its teacher LLM creates rating-conditioned rationale supervision, helping the student produce more personalized and explainable predictions.

<a id="tsai2024leveraging"></a>
**R03.** [Leveraging LLM Reasoning Enhances Personalized Recommender Systems](https://aclanthology.org/2024.findings-acl.780/) (2024)

Rec-SAVER automatically builds rating-conditioned rationale references for evaluating generated rationales. It generates multiple explanations with access to the ground-truth rating, then self-verifies them by checking whether each explanation helps recover the original rating.

<a id="park2025towards"></a>
**R04.** [Towards Trustworthy LLM-Based Recommendation via Rationale Integration](https://arxiv.org/abs/2601.02364) (2025)

LLM-Rec constructs rationale-enriched user-history/item training triples and filters incoherent rationale candidates before using them as supervision for instruction tuning.

<a id="wang2026msr"></a>
**R05.** [MSR-Rec: Multi-Step Reasoning-Enhanced LLM for Sequential Recommendation](https://ojs.aaai.org/index.php/AAAI/article/view/38620) (2026)

MSR-Rec uses DeepSeek-R1 to synthesize structured multi-step reasoning paths for sequential recommendation, then fine-tunes Llama3 to generate reasoning tokens before the recommended item. At inference time, bidirectional user-side and item-side reasoning are adaptively fused for recommendation and rationale generation.

<a id="feng2025r1"></a>
**R06.** [R1-Ranker: Teaching LLM Rankers to Reason](https://arxiv.org/abs/2506.21638) (2025)

R1-Ranker uses reinforcement learning to teach LLM rankers explicit candidate-quality reasoning, with an iterative design that repeatedly excludes the least suitable candidate and makes the ranking process more inspectable.

<a id="kong2026think"></a>
**R07.** [Think before Recommendation: Autonomous Reasoning-enhanced Recommender](https://proceedings.neurips.cc/paper_files/paper/2025/file/cea5bc68b890bffb10f18aaaab2becb1-Paper-Conference.pdf) (2026)

RecOne initializes recommendation reasoning with teacher-generated SFT samples, then uses GRPO-based RL with rating and format rewards to optimize structured analysis, matching, and rating outputs.

<a id="xie2025recllm"></a>
**R08.** [RecLLM-R1: A Two-Stage Training Paradigm with Reinforcement Learning and Chain-of-Thought V1](https://arxiv.org/abs/2506.19235) (2025)

RecLLM-R1 combines CoT-oriented SFT with GRPO-based reinforcement learning, using ranking rewards and format constraints to refine reasoning-guided candidate ranking.

<a id="zhao2025reason"></a>
**R09.** [Reason-to-Recommend: Using Interaction-of-Thought Reasoning to Enhance LLM Recommendation](https://arxiv.org/abs/2506.05069) (2025)

R2Rec transforms collaborative user-item interaction chains into stepwise Interaction-of-Thought traces, giving the LLM structured reasoning supervision for candidate ranking.

<a id="parkmore"></a>
**R10.** [More Than What Was Chosen: LLM-Based Explainable Recommendation Beyond Noisy User Preferences](https://openreview.net/forum?id=WYfDoB44xy) (2026)

C-APO uses LLM-scored rationales to compare revealed preferences with coherent preferences, then downweights behavior signals that conflict with more logically consistent preference reasoning.

<a id="yun2026arrow"></a>
**R11.** [ARROW: Adaptive Reasoning for LLM-Based Recommendation with Explainability](https://dl.acm.org/doi/epdf/10.1145/3773966.3779396) (2026)

ARROW uses genre prediction as an explicit reasoning subtask and dynamically increases its training weight when prediction uncertainty is high, guiding the LLM to learn more informative preference reasoning for recommendation.

<a id="wu2025starec"></a>
**R12.** [STARec: An Efficient Agent Framework for Recommender Systems via Autonomous Deliberate Reasoning](https://dl.acm.org/doi/10.1145/3746252.3760995) (2025)

STARec uses a dual-process agent that quickly ranks candidates with explanations from textual user memory, then uses slower self-reflection over simulated feedback to update the user preference memory for later recommendations.

<a id="you2026r"></a>
**R13.** [R2ec: Towards Large Recommender Models with Reasoning](https://arxiv.org/pdf/2505.16994) (2026)

R2ec unifies reasoning-token generation and embedding-based item prediction, while RecPO combines discrete ranking rewards with continuous target-item similarity to provide denser utility signals for sampled reasoning paths.

<a id="he2026reasoning"></a>
**R14.** [Reasoning over Semantic IDs Enhances Generative Recommendation](https://arxiv.org/abs/2603.23183) (2026)

SIDReasoner aligns semantic IDs with natural language and uses reinforced optimization with SID-prefix matching rewards, guiding LLMs to reason over item identifiers during generative recommendation.

<a id="zheng2026reasoning"></a>
**R15.** [Reasoning to Rank: An End-to-End Solution for Exploiting Large Language Models for Recommendation](https://arxiv.org/abs/2602.12530) (2026)

R2Rank reduces position bias through pointwise candidate reasoning and scoring, then uses a Plackett-Luce surrogate to align generated reasoning and relevance scores with listwise ranking utility.

<a id="liang2026generative"></a>
**R16.** [Generative Reasoning Re-ranker](https://arxiv.org/abs/2602.07774) (2026)

GR2 aligns LLMs with semantic IDs and uses rejection sampling to keep successful reasoning traces for reranking supervision, then applies ranking-improvement rewards to make explanations serve candidate reordering.

<a id="hong2025generative"></a>
**R17.** [Generative Reasoning Recommendation via LLMs](https://arxiv.org/abs/2510.20815) (2025)

GREAM aligns LLMs with hierarchical semantic item indices, activates structured recommendation reasoning through curriculum training, and uses prefix-match rewards over generated item indices to provide partial credit before exact target matching.

<a id="liu2025onerec"></a>
**R18.** [OneRec-Think: In-Text Reasoning for Generative Recommendation](https://arxiv.org/abs/2510.11639) (2025)

OneRec-Think aligns itemic tokens with natural language, activates in-text reasoning from pruned-to-noisy user histories, and uses rollout-beam rewards to give positive feedback when the target item appears in the beam-generated candidate set.

<a id="zhou2025openonerec"></a>
**R19.** [OpenOneRec Technical Report](https://arxiv.org/abs/2512.24762) (2025)

OpenOneRec introduces RecIF-Bench, a broad instruction-following benchmark that includes recommendation-explanation generation evaluated with LLM-as-Judge.

<a id="team2026onereason"></a>
**R20.** [OneReason Technical Report](https://arxiv.org/abs/2606.06260) (2026)

OneReason abstracts long user histories into persona-level preference priors, expands evidence-supported interest hypotheses, and compares them to infer the next interest direction. Its multi-teacher on-policy distillation further unifies domain-specialized reasoning trajectories into a general recommendation model.

<a id="zheng2026sapo"></a>
**R21.** [SAPO: Step-Aligned Policy Optimization for Reasoning-Based Generative Recommendation](https://arxiv.org/abs/2605.17648) (2026)

SAPO treats each thinking block and semantic-ID token as a step-level optimization unit, giving credit to correct intermediate SID matches during reasoning-based generative recommendation.

<a id="huang2026rerec"></a>
**R22.** [ReRec: Reasoning-Augmented LLM-Based Recommendation Assistant via Reinforcement Fine-Tuning](https://arxiv.org/abs/2604.07851) (2026)

ReRec uses curriculum-guided reinforcement fine-tuning with query-attribute and collaborative-graph rewards, while downweighting reasoning segments associated with incorrect recommendations.

<a id="xiang2026user"></a>
**R23.** [User Simulator-Guided Multi-Turn Preference Optimization for Reasoning LLM-Based Conversational Recommendation](https://arxiv.org/abs/2604.03671) (2026)

SMTPO uses simulated multi-turn user feedback with GRPO-based preference optimization, combining preference-alignment rewards and a semantic-collaborative retriever to refine recommendation reasoning and candidate selection.

<a id="li2026stllm"></a>
**R24.** [STLLM-Rec: Enhancing Explainable Recommendation via Self-Training LLMs](https://dl.acm.org/doi/10.1007/s11280-025-01397-1) (2026)

STLLM-Rec uses tree search to generate multiple reasoning paths and a value model to select promising rationales for self-training. It also evaluates explanation quality under zero-shot settings with multidimensional GPT-4o judging.

<a id="wang2026mllmrec"></a>
**R25.** [MLLMRec-R1: Incentivizing Reasoning Capability in Large Language Models for Multimodal Sequential Recommendation](https://arxiv.org/abs/2603.06243) (2026)

MLLMRec-R1 textualizes multimodal item signals into captions, refines pseudo-CoT reasoning with stronger text reasoning models, and filters samples by modality and prediction consistency to reduce visual-token cost and shortcut learning in multimodal sequential recommendation.

<a id="park2026think"></a>
**R26.** [Think Wise, Collaborate Effectively: A Rationale-Aware LLM-Based Recommender with Reinforcement Learning](https://ojs.aaai.org/index.php/AAAI/article/view/38590) (2026)

TWiCE-Rec builds self-annotated rationale triples for rationale-aware instruction tuning, then uses a frozen collaborative filtering model during GRPO to give partial credit to predictions supported by collaborative signals. It also reports GPT-4o rationale-quality scoring and online CTR/latency evaluation.

### Auxiliary Preference Reasoning

<a id="ramos2024transparent"></a>
**A01.** [Transparent and scrutable recommendations using natural language user profiles](https://aclanthology.org/2024.acl-long.753.pdf) (2024)

UPR builds natural-language user profiles by extracting and ranking review-derived preference features, then prompting an LLM to summarize them into editable first-person profiles. These profiles replace opaque user embeddings with transparent, scrutable preference representations that users can inspect and revise directly.

<a id="sun2024large"></a>
**A02.** [Large Language Models for Intent-Driven Session Recommendations](https://dl.acm.org/doi/epdf/10.1145/3626772.3657688) (2024)

LLM4ISR uses frozen LLM prompting to infer variable numbers of session-level intents from item combinations, making short-term user intent explicit in natural language. It further optimizes prompts through reflection on failed cases and UCB-based prompt selection.

<a id="yue2025cot4rec"></a>
**A03.** [CoT4Rec: Revealing User Preferences through Chain of Thought for Recommender Systems](https://ojs.aaai.org/index.php/AAAI/article/view/33434) (2025)

CoT4Rec uses sliding-window behavior clustering and LLM-generated demonstrations to train a preference analyzer that converts interaction histories into readable textual user preferences.

<a id="liu2025improving"></a>
**A04.** [Improving LLM-Powered Recommendations with Personalized Information](https://dl.acm.org/doi/epdf/10.1145/3726302.3730211) (2025)

CoT-Rec maintains long-term user preferences from batched interaction histories and generates user-specific item perceptions through objective descriptions, simulated reviews, and subjective impression extraction.

<a id="gao2025langptune"></a>
**A05.** [LangPTune: Optimizing Language-based User Profiles for Recommendation](https://dl.acm.org/doi/epdf/10.1145/3746252.3761369) (2025)

LangPTune uses a profile encoder to sample multiple natural-language user profiles, evaluates them through a recommender decoder, and constructs preference pairs from their downstream utility to iteratively optimize profile generation.

<a id="wang2025lettingo"></a>
**A06.** [LettinGo: Explore User Profile Generation for Recommendation System](https://dl.acm.org/doi/epdf/10.1145/3711896.3737024) (2025)

LettinGo samples diverse language-based user profiles, uses downstream recommendation outcomes to construct positive-negative profile pairs, and applies DPO-style optimization so the profile generator can adapt profile formats without fixed templates.

<a id="cai2026mgfrec"></a>
**A07.** [MGFRec: Towards Reinforced Reasoning Recommendation with Multiple Groundings and Feedback](https://arxiv.org/pdf/2510.22888) (2026)

MGFRec models recommendation as an iterative think-ground-feedback loop, where a recommendation agent reasons about user interests, grounds generated item-title queries by matching them to real items, and revises later queries using simulated user-agent feedback.

<a id="lin2025rec"></a>
**A08.** [Rec-R1: Bridging Generative Large Language Models and User-Centric Recommendation Systems via Reinforcement Learning](https://arxiv.org/abs/2503.24289) (2025)

Rec-R1 treats LLM-generated recommendation texts, such as rewritten queries or user preference summaries, as optimizable policies and updates them with downstream recommendation rewards

<a id="huang2025mr"></a>
**A09.** [MR.Rec: Synergizing Memory and Reasoning for Personalized Recommendation Assistant with LLMs](https://arxiv.org/abs/2510.14629) (2025)

MR.Rec organizes user history into hierarchical memory, retrieves relevant preference patterns through reasoning, and generates an ideal item profile while optimizing memory utilization with reinforcement learning.

<a id="xia2026trackrec"></a>
**A10.** [TrackRec: Iterative Alternating Feedback with Chain-of-Thought via Preference Alignment for Recommendation](https://arxiv.org/pdf/2508.15388) (2026)

TrackRec samples multiple RecCoT user-preference analyses, uses a validator to score their downstream utility, and applies Softmax-DPO plus alternating validator tuning to improve preference generation.

<a id="zheng2024harnessing"></a>
**A11.** [Harnessing Large Language Models for Text-Rich Sequential Recommendation](https://dl.acm.org/doi/epdf/10.1145/3589334.3645358) (2024)

LLM-TRSR uses hierarchical or recurrent LLM summarization to turn long text-rich interaction histories into compact textual user preference summaries.

<a id="ye2025harnessing"></a>
**A12.** [Harnessing Multimodal Large Language Models for Multimodal Sequential Recommendation](https://ojs.aaai.org/index.php/AAAI/article/view/33426) (2025)

MLLM-MSR summarizes multimodal item histories into text and uses recurrent LLM-based preference inference to produce evolving textual user preference summaries.

<a id="wang2023drdt"></a>
**A13.** [DRDT: Dynamic Reflection with Divergent Thinking for LLM-Based Sequential Recommendation](https://arxiv.org/abs/2312.11336) (2023)

DRDT uses collaborative in-context demonstrations, divergent thinking, and dynamic reflection to analyze user histories from multiple preference dimensions. It revisits earlier interactions with historical feedback, allowing the LLM to refine its understanding of user interests before reranking candidates.

<a id="yu2024peprec"></a>
**A14.** [PepRec: Progressive Enhancement of Prompting for Recommendation](https://aclanthology.org/2024.emnlp-main.995.pdf) (2024)

PepRec progressively enhances a target user’s prompt by sampling similar users from behavior-based clusters and merging LLM-generated summaries of their positive and negative preferences, making collaborative signals available as compact textual preference evidence.

<a id="long2024got4rec"></a>
**A15.** [GOT4Rec: Graph of Thoughts for Sequential Recommendation](https://arxiv.org/abs/2411.14922) (2024)

GOT4Rec uses graph-of-thought prompting to analyze user histories from short-term, long-term, and collaborative preference perspectives, then aggregates these reasoning branches through voting for zero-shot sequential recommendation.

<a id="zhao2024lane"></a>
**A16.** [LANE: Logic Alignment of Non-tuning Large Language Models and Online Recommendation Systems for Explainable Reason Generation](https://arxiv.org/abs/2407.02833) (2024)

LANE aligns a black-box recommender’s latent user vector with multiple LLM-generated preference vectors, translating the recommender representation into weighted natural-language preferences. These preference weights are then reused in CoT-style explanation prompting to produce more logic-aware recommendation reasons.

<a id="kim2026offline"></a>
**A17.** [Offline Reasoning for Efficient Recommendation: LLM-Empowered Persona-Profiled Item Indexing](https://arxiv.org/abs/2602.21756) (2026)

Persona4Rec shifts LLM reasoning offline by generating multiple interpretable personas for each item from metadata and reviews, then aligning user profiles with the most relevant item personas to train a lightweight encoder for online recommendation.

<a id="lee2025sprint"></a>
**A18.** [SPRINT: Scalable and Predictive Intent Refinement for LLM-Enhanced Session-Based Recommendation](https://arxiv.org/abs/2508.00570) (2025)

SPRINT uses hard-session selection, a global intent pool, and a predict-and-correct loop to extract reliable session intents, then distills them into a lightweight predictor for scalable online recommendation.

<a id="qiu2025reasoning"></a>
**A19.** [Reasoning Over User Preferences: Knowledge Graph-Augmented LLMs for Explainable Conversational Recommendation](https://arxiv.org/abs/2411.14459) (2025)

COMPASS augments conversational user profiling with knowledge-graph entities by aligning graph embeddings to the LLM semantic space, enabling structured preference summaries that combine reasoning, long-term preferences, and current interests.

<a id="liu2025bridge"></a>
**A20.** [Bridge the Domains: Large Language Models Enhanced Cross-Domain Sequential Recommendation](https://dl.acm.org/doi/epdf/10.1145/3726302.3729911) (2025)

LLM4CDSR uses unified LLM-based item embeddings to connect items across domains and hierarchical LLM profiling to summarize mixed-domain histories into textual cross-domain user preferences.

### Evaluation

<a id="li2025alert"></a>
**E01.** [ALERT: An LLM-Powered Benchmark for Automatic Evaluation of Recommendation Explanations](https://aclanthology.org/2025.naacl-long.137/) (2025)

ALERT introduces a real e-commerce benchmark for reference-free evaluation of recommendation explanations, built from user-item interactions and purchase histories across diverse product categories. It designs criterion-specific LLM judges for reasoning, clarity, engagement, and neutrality, then validates their decisions against trained expert judgments.

<a id="mehta2026helm"></a>
**E02.** [HELM: A Human-Centered Evaluation Framework for LLM-Powered Recommender Systems](https://arxiv.org/abs/2601.19197) (2026)

HELM proposes a human-centered evaluation framework for LLM-powered recommender systems, combining expert ratings across intent alignment, explanation quality, interaction naturalness, trust/transparency, and fairness/diversity with automated checks for faithfulness, consistency, popularity bias, coverage, and diversity.

<a id="kabongo2026factual"></a>
**E03.** [On the Factual Consistency of Text-based Explainable Recommendation Models](https://arxiv.org/pdf/2512.24366) (2026)

This benchmark augments Amazon review datasets with extracted atomic preference statements and reconstructed ground-truth explanations for factuality-aware evaluation of recommendation explanations. It introduces statement-level metrics such as St2Exp, StEnt, and StCoh to measure whether generated explanations are supported by review evidence.

<a id="zhang2026robustexplain"></a>
**E04.** [RobustExplain: Evaluating Robustness of LLM-Based Explanation Agents for Recommendation](https://arxiv.org/pdf/2601.19120) (2026)

RobustExplain evaluates the robustness of LLM-based recommendation explanation agents under controlled user-history perturbations, using paired original and perturbed histories for the same recommendation. It measures explanation stability through semantic similarity, keyword stability, structural consistency, and length stability.

<a id="zhao2025adapting"></a>
**E05.** [Adapting LLMs for Personalized Evaluation of Explanations for Recommendations: A Meta-Learning Approach](https://dl.acm.org/doi/epdf/10.1145/3746252.3761020) (2025)

This work adapts LLMs for personalized evaluation of recommendation explanations by treating each user’s explanation-rating behavior as a meta-learning task. It combines MAML with PEFT for few-shot user adaptation and further uses task-similarity-aware grouping to better capture shared evaluation preferences across similar users.

<a id="shimizu2025disentangling"></a>
**E06.** [Disentangling Likes and Dislikes in Personalized Generative Explainable Recommendation](https://arxiv.org/abs/2410.13248) (2025)

This work builds sentiment-aware evaluation resources by summarizing post-purchase reviews and extracting positive and negative opinion features. It introduces sentiment-matching and positive/negative content-similarity metrics to assess whether generated explanations correctly reflect what users like and dislike.

## Citation

Citation information will be added when the survey manuscript is publicly available.

## Contact
