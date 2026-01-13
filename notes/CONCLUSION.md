# Conclusion: Why D2 for Agentic Diagrams?

After evaluating several candidates (D2, Mermaid, PlantUML, and direct SVG generation), we have decided to standardize on **D2** for AI-driven diagramming.

## Key Findings

1. **Structural Integrity**: Direct SVG generation is brittle for LLMs because the agent must calculate spatial coordinates and line routing manually. D2 offloads this "heavy lifting" to a robust layout engine, allowing the agent to focus on semantic relationships.
2. **AI-Friendly Syntax**: D2’s nested, declarative structure is inherently familiar to modern LLMs (resembling JSON or structured code). This results in fewer syntax errors and more consistent layouts.
3. **High Aesthetic Value**: D2 addresses the "ugliness" of traditional technical tools. The ability to toggle between professional themes and a "sketch" style allows for multi-modal communication that is both clear for auditors and appealing to humans.
4. **Sketch Mode as a Semantic Signal**: Using the `--sketch` mode provides a visual cue that the diagram represents a conceptual mental model or an evolving plan, rather than a final, immutable architectural specification.

## When to use alternatives

* **PlantUML**: Remains the industry standard for strictly technical, standardized UML (Sequence diagrams, etc.) where precision and compliance are more important than visual appeal.
* **Mermaid**: Useful for maximum portability when no CLI-based rendering pipeline is available, as it can be rendered entirely client-side.

This repo serves as a living benchmark for these workflows.
