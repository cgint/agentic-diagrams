![Analysis](runs/d2-styles/stylized_core_sketch.svg)

This repository tests how well AI agents can express ideas as **diagrams**, not just text. The goal is to compare diagram DSLs (primarily **D2** and **Mermaid**) for:

- AI friendliness (syntax reliability)
- Visual appeal ("nice-looking" by default)
- Fit for C4-style architecture diagrams
- Practical rendering workflows

The experiments here are based on the initial research captured in `notes/DESCRIPTION_OF_TASK.md` and are structured as reproducible "runs" with inputs, configs, and outputs.

## Why even bother

Diagrams are high-bandwidth communication tools that bridge the gap between abstract code and mental models.

- **Documentation Generation**: Automated diagrams turn "walls of text" into scannable architecture maps that stay in sync with the codebase more easily than hand-drawn assets.
- **Live Human-AI Collaboration**: In a multi-modal communication interface, diagrams allow agents to "show" their understanding of complex problems. This enables humans to visually audit the AI's reasoning, catch misalignments early, and collaborate on a shared spatial canvas rather than just trading text blocks.

## Why this exists

Direct SVG generation is brittle for LLMs. Instead, we let the AI produce a **diagram description language** and then render it via a toolchain. This repo documents which tools hold up best and what the outputs look like.

## Runs (start here)

- `runs/banking-c4/README.md` — C4-style banking example in D2 vs Mermaid
- `runs/mermaid-css/README.md` — Mermaid CSS theming (dark + light)
- `runs/d2-styles/README.md` — D2 styling variants (light/dark/sketch)
- `direct-svg-reference/README.md` — reference SVGs used as the aesthetic target

## Quick comparison

- **D2**: strongest out-of-the-box aesthetics, great for C4, native CLI rendering
- **Mermaid**: best portability and AI training coverage, CSS-based theming

## Rendering notes

Examples used across runs:

```bash
# D2 (nice-looking, sketchy)
d2 --theme 200 --sketch input.d2 output.svg

# D2 (ELK layout)
d2 -l elk input.d2 output.svg

# Mermaid (with custom CSS)
mmdc -i input.mmd -o output.svg --cssFile custom_mermaid.css
```

## Repository map

- `runs/` — each test run with inputs, configs, outputs, and notes
- `notes/` — research context and planning notes
- `direct-svg-reference/` — benchmark SVGs

## License

[MIT License](LICENSE)
