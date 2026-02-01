# D2 layout variants (TL;DR)

Same `.d2` source, multiple SVGs rendered with different **layout engines** and flags, so you can quickly compare what’s most readable.

**Filename ↔ params mapping**

```
<name>[_<layout>][_s][_t_<theme>].svg
```

- `<layout>` → `d2 -l <engine>` (e.g. `dagre`, `elk`)
- `_s` → `-s` (sketch / hand-drawn look)
- `_t_105` → `-t 105` (theme id)

Example:

```bash
d2 -l elk acp_selector_architecture.d2 acp_selector_architecture_elk_s_105.svg -s -t 105
```

**Gist (why you’d care)**

- Switching **layout engine** often reduces edge crossings and improves spacing/alignment without touching the `.d2`.
- `-s` makes diagrams feel more “human”/approachable (nice for docs/slides).
- `-t <id>` lets you match a visual style guide consistently.

---

## Input

- `acp_selector_architecture.d2`

## Outputs

- Dagre layout: `acp_selector_architecture_dagre.svg`
- Dagre + sketch (`-s`): `acp_selector_architecture_dagre_s.svg`
- Dagre + sketch + theme 105 (`-s -t 105`): `acp_selector_architecture_dagre_s_105.svg`
- ELK layout: `acp_selector_architecture_elk.svg`
- ELK + sketch (`-s`): `acp_selector_architecture_elk_s.svg`
- ELK + sketch + theme 105 (`-s -t 105`): `acp_selector_architecture_elk_s_105.svg`

## Visuals (comparison table)

<!-- Markdown tables don't reliably stretch to full width; HTML does. -->
<table style="width: 100%; table-layout: fixed;">
  <colgroup>
    <col style="width: 18%" />
    <col style="width: 27.333%" />
    <col style="width: 27.333%" />
    <col style="width: 27.333%" />
  </colgroup>
  <thead>
    <tr>
      <th align="left">Layout / style</th>
      <th align="left">Default</th>
      <th align="left">Sketch (<code>-s</code>)</th>
      <th align="left">Sketch + theme 105 (<code>-s -t 105</code>)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>Dagre</code> (<code>-l dagre</code>)</td>
      <td><img src="acp_selector_architecture_dagre.svg" style="width: 100%; height: auto;" /></td>
      <td><img src="acp_selector_architecture_dagre_s.svg" style="width: 100%; height: auto;" /></td>
      <td><img src="acp_selector_architecture_dagre_s_105.svg" style="width: 100%; height: auto;" /></td>
    </tr>
    <tr>
      <td><code>ELK</code> (<code>-l elk</code>)</td>
      <td><img src="acp_selector_architecture_elk.svg" style="width: 100%; height: auto;" /></td>
      <td><img src="acp_selector_architecture_elk_s.svg" style="width: 100%; height: auto;" /></td>
      <td><img src="acp_selector_architecture_elk_s_105.svg" style="width: 100%; height: auto;" /></td>
    </tr>
  </tbody>
</table>
