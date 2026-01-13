# Test Plan: Agentic Diagram Generation

This plan outlines the steps to evaluate D2 and Mermaid.js as candidate description languages for AI-generated diagrams, specifically focusing on the C4 model and aesthetic quality.

## Objectives
1.  **Assess Visual Quality:** Verify if the output is "nice-looking" and technically accurate.
2.  **Evaluate AI Compatibility:** Test how easily an AI agent can generate the syntax.
3.  **Validate Workflow:** Understand the end-to-end process from DSL generation to SVG output.

## Testing Strategy

### 1. D2 (Declarative Diagramming)
*   **Input:** Create a `.d2` file representing a C4 Container diagram.
*   **Process:** Use the `d2` CLI to render the file directly to SVG.
*   **Evaluation:** Check for modern styling, automatic layout efficiency, and C4-specific features.

### 2. Mermaid.js
*   **Input:** Create a `.mmd` file using the `C4Context` syntax.
*   **Process:** Use `mermaid-cli` (`mmdc`) to render the diagram to SVG.
*   **Evaluation:** Check for web-native look, ease of CSS customization, and syntax robustness.

### 3. Workflow Comparison
*   Document the command-line arguments and dependencies for each tool.
*   Compare the "latency" and "complexity" of the transformation steps.
*   Analyze how an AI agent would handle errors or styling overrides.

## Success Criteria
*   The diagrams must be readable and visually appealing without manual layout tweaks.
*   The tool must be entirely open-source and run locally.
*   The transition from text to SVG must be automatable via a simple CLI command.
