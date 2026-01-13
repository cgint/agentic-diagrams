#!/bin/bash

# Agentic Diagrams - Rendering Script
# This script renders all D2 and Mermaid source files in the repository.

set -e

# Check for dependencies
if ! command -v d2 &> /dev/null; then
    echo "Error: d2 CLI is not installed."
    exit 1
fi

if ! command -v mmdc &> /dev/null; then
    echo "Warning: mermaid-cli (mmdc) is not installed. Mermaid diagrams will be skipped."
    SKIP_MERMAID=true
fi

echo "--- Rendering Banking C4 ---"
# D2
d2 runs/banking-c4/banking.d2 runs/banking-c4/banking_d2.svg

# Mermaid
if [ "$SKIP_MERMAID" != true ]; then
    mmdc -i runs/banking-c4/banking.mmd -o runs/banking-c4/banking_mermaid.svg -b transparent
fi

echo "--- Rendering D2 Styles ---"
# Default
d2 runs/d2-styles/stylized_core.d2 runs/d2-styles/stylized_core.svg
# Light
d2 --theme 1 runs/d2-styles/stylized_core.d2 runs/d2-styles/stylized_core_light.svg
# Dark
d2 --theme 200 runs/d2-styles/stylized_core.d2 runs/d2-styles/stylized_core_dark.svg
# Sketch
d2 --sketch runs/d2-styles/stylized_core.d2 runs/d2-styles/stylized_core_sketch.svg

echo "--- Rendering Mermaid CSS Variants ---"
if [ "$SKIP_MERMAID" != true ]; then
    # Use banking.mmd as the source for CSS testing
    mmdc -i runs/banking-c4/banking.mmd -o runs/mermaid-css/stylized_mermaid.svg --cssFile runs/mermaid-css/custom_mermaid.css -b transparent
    mmdc -i runs/banking-c4/banking.mmd -o runs/mermaid-css/light_mermaid.svg --cssFile runs/mermaid-css/custom_mermaid_light.css -b transparent
fi

echo "--- Done! ---"
