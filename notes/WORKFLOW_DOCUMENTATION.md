# Diagram Workflow: From Configuration to SVG

This document describes the workflow an AI agent follows to generate diagrams using D2 and Mermaid.js.

## 1. D2 Workflow (Recommended)

D2 provides a highly declarative and nested syntax that is very resilient to AI generation errors.

### Step 1: Configuration Generation
The agent generates a `.d2` file. The focus is on entity relationships and semantic grouping.

**Example Input (`banking.d2`):**
```plaintext
direction: right
Customer: {
  shape: person
  description: "A customer of the bank."
}
"Banking System": {
  WebApp: {
    shape: rectangle
  }
}
Customer -> "Banking System".WebApp: "Visits website"
```

### Step 2: Rendering and Styling
The agent executes the D2 CLI. One of D2's strengths is the ability to apply "hand-drawn" or professional themes without changing the diagram source.

**Command (Polished/Sketchy):**
```bash
d2 --sketch --theme 200 input.d2 output.svg
```

### Step 3: Result
The resulting `banking_d2.svg` is a standalone, modern-looking vector graphic. The "sketch" mode is particularly useful for indicating that a diagram represents an evolving concept rather than a final, rigid specification.

---

## 2. Mermaid.js Workflow

Mermaid is widely supported and uses a syntax that most LLMs are already very familiar with.

### Step 1: Configuration Generation
The agent generates a `.mmd` file using specialized diagram types (like `C4Context`).

### Step 2: Rendering and Theming
The agent uses `mermaid-cli` (`mmdc`). While Mermaid has built-in themes, high-end aesthetics usually require a custom CSS file to be passed during rendering.

**Command:**
```bash
mmdc -i banking.mmd -o banking_mermaid.svg --cssFile custom_theme.css
```

---

## The Live Multi-Modal Loop

In an agentic workflow, these diagrams are not just static artifacts for a wiki; they are part of a live communication loop:

1.  **Agent Proposes:** Agent generates a diagram to visualize its plan or its understanding of a codebase.
2.  **Human Audits:** The human user views the SVG in a multi-modal interface and can immediately spot logical errors or missing components.
3.  **Human Corrects:** User provides feedback ("The Database should be outside the API boundary").
4.  **Agent Refines:** Agent updates the DSL code and re-renders, providing an instant visual confirmation of the fix.

## Agent Requirements & Responsibility

To implement this effectively, an AI agent must:
1.  **Synthesize Syntax:** Be trained on or provided with the DSL documentation for the chosen tool.
2.  **Handle Quoting:** Correctly escape labels and descriptions that contain special characters or spaces.
3.  **Manage CLI Tools:** Have access to the relevant binaries (D2 or Node/Puppeteer) in its execution environment.
4.  **Validate Output:** Check the CLI return codes and logs to ensure the diagram compiled successfully.
