# TASK_IDEA

Source: `notes/TASK_IDEA.md`

 I want you to find out what is a good description language for an AI agent to create technical and nice-looking illustrations for users that have a diagram characteristic. 

When an AI agent creates SVG directly, it's often not correct because it has to do all the routing and lines and everything. 

I already experimented with UML, precisely PlantUML, which works pretty good but needs a step in between to render the file to SVG. 

I also experimented with GraphVis, which is also ok, but also needs an intermediary step. 

Plus PlantUML and GraphVis are very technical, which is kind of okay if it's a technical setting, but I would like also to have for technicians better and more nicely looking diagrams. Just that they are more appealing to the eye, and technical and non-technical viewers at the same time. 

I want you to do a web search in general. 

I want you to find out if people already shared positive results with any approach. 
Which can also be a completely different approach from the examples I mentioned above. 

Maybe it's also possible that the agent creates PlantUML configurations files? And maybe there exists another rendering engine? So that the diagrams are a bit more appealing? Or actually way more appealing? 

And we also want to use it for C4 diagrams. 

If there is not a single solution for all of those aspects, I am also fine with different specialized ones. 

I would absolutely prefer and actually want open-source tools only. 

---

## TASK_INITIAL_ANALYSIS

Source: `notes/TASK_INITIAL_ANALYSIS.md`

For an AI agent to generate technical yet visually appealing diagrams that also support C4 models, there are three primary open-source recommendations that move beyond the "basic" look of standard PlantUML or Graphviz.

### 1. D2 (Declarative Diagramming) – **The Best Overall Balance**

D2 is currently the strongest candidate for AI agents. It was designed to fix the "ugly" default look of older tools and handles automatic layout much more gracefully than Mermaid or PlantUML.

* **Aesthetics:** Modern, clean, and professional out of the box. It supports multiple layout engines (D2, Dagre, ELK, TLA+).
* **C4 Support:** It has first-class support for the **C4 model** with specialized shapes (like `c4-person`) and a dedicated C4 theme.
* **AI Friendliness:** The syntax is highly declarative and readable (). Because it uses a nested structure (similar to JSON), LLMs are very proficient at generating it without "breaking" the layout.
* **Rendering:** It is a CLI tool that can output **SVG** or **PNG** directly. No Java-based intermediary is required if you use the Go-based binary.
* **License:** Open Source (MPL 2.0).

### 2. Mermaid.js – **The Standard for Portability**

If your goal is to have the diagram rendered natively in browsers or platforms like GitHub/Notion without a backend step, Mermaid is the way to go.

* **Aesthetics:** Polished and colorful. It uses CSS-based styling, so it feels more like a modern web element than a legacy CAD drawing.
* **C4 Support:** It has a dedicated `C4Context` diagram type that follows the C4 methodology strictly.
* **AI Friendliness:** Highly popular in LLM training data. Agents are very reliable at writing Mermaid syntax.
* **Rendering:** Directly to SVG via JavaScript. You can use the `mermaid-cli` to automate this in a pipeline.
* **License:** Open Source (MIT).

### 3. Excalidraw (JSON to SVG) – **The "Hand-Drawn" Aesthetic**

If you want diagrams that look "nice" because they look like a human sketched them on a whiteboard, use Excalidraw.

* **Aesthetics:** Unique, friendly "hand-drawn" look that is very popular for non-technical presentations and architectural overviews.
* **C4 Support:** Not native, but agents can be prompted to use specific coordinate/box patterns to mimic C4.
* **AI/Agent Approach:** Instead of a text DSL, agents generate a **JSON structure**. There are open-source "MCP Servers" (Model Context Protocol) specifically for Excalidraw that allow an AI to "draw" on a canvas in real-time.
* **Rendering:** Open-source libraries can convert the JSON to SVG instantly.
* **License:** Open Source (MIT).

---

### Comparison Table

| Feature                  | **D2**          | **Mermaid**  | **PlantUML (Themed)** |
| ------------------------ | --------------------- | ------------------ | --------------------------- |
| **Look & Feel**    | Modern / Professional | Web-native / Clean | Classic / Rigid             |
| **C4 Native?**     | Yes                   | Yes                | Yes (via C4-PlantUML)       |
| **AI Reliability** | Very High             | Excellent          | High                        |
| **Primary Format** | `.d2` (Text)        | `.mmd` (Text)    | `.puml` (Text)            |
| **Direct SVG?**    | Yes (CLI)             | Yes (JS/CLI)       | Yes (but requires Java)     |

### Pro-Tip for PlantUML

If you want to stick with PlantUML but hate the look, you can instruct your agent to include **Themes**. Adding a single line like `!theme sketchy-outline` or `!theme materia` completely changes the visual style to something more modern.

**Would you like me to provide a sample D2 or Mermaid code snippet for a C4 Container diagram?**

[Excalidraw tutorial: Get Started with this Powerful Open-Source Diagramming Tool!](https://www.youtube.com/watch?v=RofiLahm1pM)

This video provides a practical overview of how to use Excalidraw for creating diagrams that look hand-drawn and professional.

---

## TASK_PREFACE_CONTEXT

Source: `notes/TASK_PREFACE_CONTEXT.md`

# Preface (Condensed)

## Requirements

- AI should generate **diagram DSL**, not raw SVG (routing/layout is brittle in SVG).
- Diagrams must look **professional and appealing**, not just technical.
- Must support **C4** (at least Context/Container level).
- Prefer **open-source** tooling.
- Accept multiple specialized tools if one doesn’t cover all goals.

## Key findings (early)

- **D2**: best overall balance (modern aesthetics, strong C4 support, CLI renders SVG/PNG).
- **Mermaid**: most portable and common in docs; very reliable for AI syntax; styling via CSS.
- **Excalidraw**: best "hand-drawn" look, but not a DSL; requires JSON-based drawing.

## Practical note

- D2 Docker usage is useful when a native binary isn’t available; themes + sketch mode improve aesthetics.
