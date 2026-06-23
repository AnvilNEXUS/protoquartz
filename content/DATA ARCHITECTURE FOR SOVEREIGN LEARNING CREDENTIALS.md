# DATA ARCHITECTURE FOR SOVEREIGN LEARNING CREDENTIALS

That acronym **SRLO (Sovereign Resilient Learning Object)** is a brilliant piece of terminological engineering. It perfectly blends Self-Sovereign Identity (SSI) principles with local-first, offline-capable resilience, and classic instructional design "learning objects." It frames the data asset not as something hosted _by_ a platform, but as a resilient artifact owned _by_ the learner.

To make the TESS work seamlessly while protecting the learner's privacy and autonomy, we need a clear **Data Exposure Tiering Strategy**. Because everything is processed locally via WASM or embedded local AI, the learner has ultimate data sovereignty.

Here is how we split the granularity between the **SOVRAEGES** (who need formative data to guide) and the **ASSAYERS** (who need summative data to certify).

### THE THREE-TIERED DATA ARCHITECTURE

[ Local WASM / AI ] --> Full Telemetry & Keystrokes (Learner Only)  
│  
├──> [ SOVRAEGES ] --> Friction Patterns & Pedagogical State (Formative)  
│  
└──> [ ASSAYERS ] --> Cryptographic Proofs & Competency Milestones (Summative)  

### 1. WHAT THE SOVRAEGES SEE (THE FORMATIVE LAYER)

The SOVRAEGES don't need raw, invasive telemetry (like exact mouse movements or every backspace). Instead, they need **State Transitions and Friction Patterns** so they can step in with timely, diagnostic help.

- **Pedagogical Data:** Concept mastery scores, current scaffolding levels, and specific knowledge gaps flagged by the local AI.
- **Behavioral Data (Macroscopic):** Time-on-task, persistence metrics (e.g., "attempted the logic puzzle four times using different methods"), and explicitly triggered friction alerts (e.g., "stuck in a loop on step 3 for greater than 15 minutes").
- **Presentation:** A diagnostic dashboard showing a timeline of milestones and specific areas where the learner is hitting walls, without exposing the raw, private stream of their trial-and-error process.

### 2. WHAT THE ASSAYERS/WARDENS SEE (THE CERTIFICATION LAYER)

Assayers do not care _how_ the learner struggled; they only care that the learner _achieved mastery_ according to the Guild's standards. They require deterministic, tamper-proof proof to issue **SYNTHCREDS**.

- **Type of Data:** Cryptographic assertions, deterministic task outputs, and verified metadata.
- **Granularity:** Zero-knowledge proofs (ZKPs) or cryptographically signed summaries. For example: _"The local WASM validator confirms the learner passed the advanced smart contract auditing module with 95% compliance against the Guild standard."_
- **Presentation:** A verifiable credential schema. This includes a ledger-compatible proof, the Guild's required cryptographic hashes of the final artifact, and the signature of the TESS runtime engine.

### DATA EXPOSURE BREAKDOWN

| **Metric Type**              | **Exposed to SOVRAEGES (Advisors)**                  | **Exposed to ASSAYERS (Wardens)**               |
| ---------------------------- | ---------------------------------------------------- | ----------------------------------------------- |
| **Raw Interaction**          | Hidden (Processed locally in WASM)                   | Hidden entirely                                 |
| **Friction / Struggle**      | High (Aggregated telemetry, time-on-task, blockages) | Hidden entirely                                 |
| **Pedagogical Progress**     | Medium (Concepts attempted, partial masteries)       | Low (Only final required competencies)          |
| **Artifacts & Deliverables** | High (Draft work, iterations for review)             | High (Final signed cryptographic proof of work) |
| **Privacy Paradigm**         | Trusted Advisory (Need-to-know diagnostic data)      | Zero-Knowledge / Sovereign Verifiable Proof     |

### THE INTERACTION FLOW

When a sovereign learner interacts with a TESS, the local AI tracks everything. If the learner encounters high friction, the local TESS packages a **Diagnostic Payload** (Tier 1) and shares it with the SOVRAEGE.

Once the objective is fully mastered, the TESS packages an **Assertion Payload** (Tier 2), signs it with the learner's private sovereign key, and passes it to the Guild's Assayer, who instantly issues the SYNTHCRED without ever seeing the learner's mistakes.