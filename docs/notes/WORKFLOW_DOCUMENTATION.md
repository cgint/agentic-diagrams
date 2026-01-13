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

### Step 2: Rendering to SVG
The agent executes the D2 CLI. This is a single, fast binary operation with no external dependencies (like Java or a browser).

**Command:**
```bash
d2 banking.d2 banking_d2.svg
```

### Step 3: Result
The resulting `banking_d2.svg` is a standalone, modern-looking vector graphic ready for documentation or web display.

---

## 2. Mermaid.js Workflow

Mermaid is widely supported and uses a syntax that most LLMs are already very familiar with.

### Step 1: Configuration Generation
The agent generates a `.mmd` file using specialized diagram types (like `C4Context`).

**Example Input (`banking.mmd`):**
```plaintext
C4Context
    Person(customer, "Customer")
    System(banking, "Banking System")
    Rel(customer, banking, "Uses")
```

### Step 2: Rendering to SVG
The agent uses `mermaid-cli` (`mmdc`). This requires a Node.js environment and a headless browser (Puppeteer).

**Command:**
```bash
mmdc -i banking.mmd -o banking_mermaid.svg
```

### Step 3: Result
The resulting `banking_mermaid.svg` is a polished, CSS-stylable graphic.

---

## Agent Requirements & Responsibility

To implement this effectively, an AI agent must:
1.  **Synthesize Syntax:** Be trained on or provided with the DSL documentation for the chosen tool.
2.  **Handle Quoting:** Correctly escape labels and descriptions that contain special characters or spaces.
3.  **Manage CLI Tools:** Have access to the relevant binaries (D2 or Node/Puppeteer) in its execution environment.
4.  **Validate Output:** Check the CLI return codes and logs to ensure the diagram compiled successfully.
