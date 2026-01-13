# D2 Styling Variants

This run explores how D2 styling and theme options affect aesthetics for the same diagram source.

## Input

- `docs/runs/d2-styles/stylized_core.d2`

## Outputs

- Default: `docs/runs/d2-styles/stylized_core.svg`
- Default (PNG): `docs/runs/d2-styles/stylized_core.png`
- Light variant: `docs/runs/d2-styles/stylized_core_light.svg`
- Light variant (PNG): `docs/runs/d2-styles/stylized_core_light.png`
- Dark variant: `docs/runs/d2-styles/stylized_core_dark.svg`
- Sketch variant: `docs/runs/d2-styles/stylized_core_sketch.svg`
- Sketch variant (PNG): `docs/runs/d2-styles/stylized_core_sketch.png`
- Sketch (Docker): `docs/runs/d2-styles/stylized_core_sketch_docker.svg`
- Sketch (Docker PNG): `docs/runs/d2-styles/stylized_core_sketch_docker.png`

## Visuals

### Default
![Default](stylized_core.svg)

### Light
![Light](stylized_core_light.svg)

### Dark
![Dark](stylized_core_dark.svg)

### Sketch
![Sketch](stylized_core_sketch.svg)

### Sketch (Docker)
![Sketch Docker](stylized_core_sketch_docker.svg)

## Rendering (example)

```bash
# Default render

d2 stylized_core.d2 stylized_core.svg

# Sketch render

d2 --sketch stylized_core.d2 stylized_core_sketch.svg

# Dark theme (example)

d2 --theme 200 stylized_core.d2 stylized_core_dark.svg
```

## Notes

- The dark variant is the closest to the "hand-crafted" aesthetic captured in the reference SVGs.
- The sketch variant introduces hand-drawn jitter to improve visual appeal.
