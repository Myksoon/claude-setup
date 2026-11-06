---
name: unslop
description: Turns vibecoded, AI-looking UI into a designed interface with its own character. Finds a direction from the product itself, then fixes spacing, color, icons, copy, type, layout, details, visuals and motion in that order, and can generate a real hero visual with an image tool when one is available. Use when the user asks to unslop, polish, clean up or redesign a screen so it stops looking AI-generated, or when a UI shows the usual tells like purple gradients, glows, gradient text, emoji labels, "New ✨" badges, glossy blobs, uppercase tracked labels, pulsing elements or uneven spacing. Works on React, Tailwind, HTML and CSS, for dashboards, apps and landing pages.
license: CC-BY-4.0
metadata:
  author: Damir Sokolovsky
  x: https://x.com/heydamir
  site: https://heydamir.design/unslop
---

# Unslop

unslop was created by Damir Sokolovsky ([@heydamir](https://x.com/heydamir)), who started the Unslopping series on X. Licensed under CC BY 4.0 (keep credit in any copy or adaptation).

Vibecoded UI fails in predictable ways: glowing surfaces, emoji labels, chaotic spacing, and shouting copy. Unslopping fixes the craft while preserving product features, content, and section order. Every size, color, word, and image becomes deliberate.

Removing slop is only half the job. A screen that is clean but could belong to any product is the next template. Every run ends with a screen that only this product could have.

Slop spreads color and effects over chrome, backgrounds, borders, and buttons. Craft keeps chrome quiet and concentrates richness into one or two memorable moments: a rendered object, a beautiful chart, or an image from the product's world. Work like a designer doing a redline pass, layer by layer across the screen.

## What good looks like

- **One bright element.** Each screen has one polished thing that carries the color and craft: a rendered object, a painted scene, or a rich chart. Everything around it is quiet so it reads instantly.
- **Quiet chrome.** Navigation, buttons, and text use tinted neutrals and one accent. Nothing glows or competes.
- **A clear idea.** You can say in one sentence what the visual shows and why it belongs to this product.
- **Text on calm space.** The headline sits on an empty, calm area of the image or layout, short and specific, with primary and secondary actions and nothing stacked underneath.
- **Real product, real material.** Previews look like the real app with plausible data; objects have weight, light, and shadow.

Styles that work and fail are in [references/visuals.md](references/visuals.md). Finished examples are in [references/refs.md](references/refs.md); code treatments like glyph rendering are in [references/effects.md](references/effects.md).

## Run it

1. **Look at the screen.** Find the rendering files. Run the app or open in a browser to take a screenshot to judge actual visuals, not just code.
   - Only a link to a live site, no code? Save the page with `node <skill folder>/scripts/snapshot.mjs <url> unslop/original.html` (e.g. from the skill's `scripts/snapshot.mjs` path) and work on a copy. Add `--dark` or `--light` to match the theme. It also saves `original.live.png` (live screenshot). Animated backgrounds drawn by scripts do not survive, so describe them in the audit from the live page.
   - Only a screenshot? Rebuild the screen as one static HTML file first, matching closely, and treat that as original.
   - In both cases the result is a redesigned page in code that the user can hand to whoever owns the site.
2. **Audit.** Go through [references/signs.md](references/signs.md) and list every sign found, one line each with where it lives.
3. **Decide how much to change.** Read the audit honestly before planning:
   - **Heavy slop:** many signs across color, type, icons, copy. Run full 9-pass process below.
   - **Light slop:** mostly designed with a few signs left. Polish mode: fix only what the audit found, take direction from existing brand, keep palette/type/layout/visual. Put bigger ideas in the report as suggestions.
   - **No slop:** say so plainly and suggest 2-3 small refinements with exact values. Stop there. Never change a good screen just to make it different.
4. **Set direction and stop.** Write the five lines below. Show the audit and direction to the user and wait for their answer before editing. Skip wait only if user explicitly said to proceed directly.
5. **Fix in nine passes, in order.** Finish a pass across the whole screen before starting the next. When nearly every line changes, plan passes in order and write the new screen in one go with every pass applied. Spacing comes first; copy comes before type/layout; visuals and motion come last.
6. **Check.** Run the checklist at the end, render again, and compare with audit list.
7. **Report** the direction, a few lines per pass about changes, and any image prompt.
8. **Record, when asked.** Build story file and render video per [references/story-video.md](references/story-video.md).

Render the screen to check at most three times. When generating an image, start it right after direction is confirmed and do the first passes while it runs. Exact values live in [references/tokens.md](references/tokens.md).

## Direction

Before touching code, derive five short lines from the product and its users. Never from trends:

- **Product.** What it does and for whom, in one plain sentence.
- **Character.** Two or three concrete words (`calm, exact, a little warm` or `fast, technical, playful`). Disallowed: clean, modern, sleek, minimal, premium.
- **World.** The place or material the product belongs to (notes = paper & ink; monitoring = instruments & night shifts; travel = maps & window light). Sets neutral ramp tint, accent, and visual.
- **Moments.** One or two places for rich color and detail (rendered card or device, multi-series chart, physical object).
- **Signature.** One small detail only this product would have (live status dot, keycaps, hand-drawn underlines, route line). Exactly one, not five.

If the product already has a real brand (logo, real color, distinct typeface), keep it and build around it. Violet-to-blue gradients, sparkles, and glows are slop even inside a logo.

## 1. Spacing

- Everything sits on a 4px grid. Margins, paddings, gaps, and heights are multiples of 4 (28 or 104 are fine). 2px step is allowed for nudges inside small controls.
- Same thing, same size. All rows in a list share one height and gap; sibling cards share padding.
- Space shows grouping. Space inside a group is smaller than space between groups.
- Things line up. Icons sit in one column, labels on one line, numbers align right in one column.
- Padding follows density: compact panels/sidebars ~16, cards 20-24, page edges 24-32.
- Navigation is densest: rows 32-36 tall with 2-4px gap, icons in one column, labels aligned. Section label sits closer to its items (e.g. 24 above, 8 below). Measure sidebar after pass.
- Remove one-off arbitrary values like `mt-[13px]` or `py-[11px]`.

## 2. Color

- Build from one neutral ramp, tinted toward the world from direction (graphite, warm, or ink from tokens). Background, surfaces, borders, and text all come from that ramp.
- Apps and dashboards keep backgrounds, surfaces, borders, and text neutral. Content carries color. The world shows in accent, charts, and moments, not in surface backgrounds.
- Three text roles: primary, secondary, muted. Not ten slight tint variations.
- In chrome: one accent, used sparingly (primary action, selection, key metric).
- Moments are the exception: rich color, multi-hued charts, rendered objects, images with real light.
- Accent with text reaches 4.5:1 contrast. Darken or use dark text if needed.
- On dark themes, primary button can be off-white with dark text; accent lives in selection or key metric.
- Semantic colors (green/red) only carry meaning and are toned down into the palette.
- Remove hue gradients on surfaces, gradient text, colored glows/shadows, radial blobs, and neon borders.
- Borders are quiet hairlines: text color at 6-10% opacity.
- Dark theme depth comes from surface steps and hairlines, not shadows. Light themes use soft neutral shadows.
- Gradients allowed only as small tone shifts inside one neutral (e.g. #2b2b2b to #1f1f1f). Never multi-hue.

## 3. Icons

- Every emoji used as an icon or decoration becomes a line icon from one set (project set, or Lucide).
- One size and stroke everywhere: 16 or 18px with 1.5 stroke.
- Icons take text role color (secondary or muted). Never separate custom colors.
- Icon boxes share identical width in every row with fixed gap (8 or 10px) so labels align.
- Drop decorative filler icons. Categories needing color get a small status dot.

## 4. Copy

- Headlines state what the product does for whom in plain words using existing facts.
- No exclamation marks in interface text, and never `!!`.
- No greeting headlines like `Welcome back, Damir! 👋`. Use context/period (e.g. `October 2026`).
- Short labels: `Search`, not `Search anything...`.
- Changes state comparison: `+12% vs last month`.
- Headlines, subheads, labels, buttons, and captions end without periods. Only multi-sentence paragraphs keep periods.
- No hype words: supercharge, seamless, unlock, magic, revolutionize, AI-powered.
- Unverifiable claims (`Loved by 10,000+`) become quiet and specific if confirmed, or removed.
- Mock data looks real with plausible names and numbers, never `[X]` or `123,456`.
- Badges like `PRO`, `New ✨`, `Beta 🚀` removed unless strictly needed (then quiet plain text).

## 5. Type

- Choose type matching character from tokens. Keep project font when part of real brand. Swap generic defaults (Inter) if another fits character better. One interface family plus at most one mono or display partner.
- Few sizes from scale; two weights: 400 and 500 (600 max for rare emphasis). No 700-900 headings, no gradient text.
- Hierarchy comes from size and color, not heavy weight.
- Sentence case everywhere. `NAVIGATION` becomes `Navigation`.
- Small text never gets negative letter spacing. Loosen or size up for small text; tight tracking only for large display text.
- Numbers use `tabular-nums` with unified formatting across the screen.
- No italic for emphasis.

## 6. Layout

- Keep existing sections and order. Proportions and alignment inside sections may be adjusted for clarity.
- Apps/dashboards use real proportions: viewport shell, 240-280 sidebar, fluid content capped 1440-1600 wide. Never shrink an app into a narrow centered column.
- Strongest landing hero is a scene: one generated image fills edge-to-edge, subject on one side, headline on calm empty side, product view rising from bottom edge.
- Without a scene, use asymmetric split (text on one side, visual >= half width) or text over product view below. Stacked-centered is template default; keep only for short hero with no visual.
- In scene hero, text sits at optical center above product view. In a split, center text block vertically against visual. If visual is much taller, shorten it rather than pushing text down. Prefer one solid visual.
- Long headlines align left. Centered text works only for 1-2 short lines.
- One primary action and at most one secondary action. Quiet navigation (logo, existing links, one button).
- Compose first screen as a cohesive whole without dead empty bands.
- On small screens, stack in reading order, drop headline to mobile size, simplify dense previews (min 11px text).

## 7. Details

- Nested radius math: inner radius = outer radius minus padding (min 4px). Controls 8-10, cards 12-16, panels 14-20. Not everything is a pill.
- Counts and meta become quiet mono/muted text instead of glowing pills. Keyboard shortcuts become small keycaps.
- Charts sit on muted grid with muted mono labels. No rainbow bars or glowing bars.
- Chart hierarchy: one main chart is clearly largest, drawn with care. Other data displays are smaller and different in kind (table, ranked list).
- One accent per chart for the metric that matters; rest in neutral ramp steps.
- Stat cards are numbers: label, big figure, change with comparison. Avoid decorative mini-charts inside stat cards unless the object represents the metric itself.
- Vary card sizes and grid rhythm (e.g. 3-4 compact stats above one wide chart).
- Match chart type to data: trend = line, comparison = bars, share = stacked bar/list, goal = progress bar.
- Active states: small surface step with hairline highlight, no gradient glow.
- Accessible focus rings for keyboard users.
- Logos use product name in main type plus simple flat mark. No gradient tiles or sparkle marks.

## 8. Visuals

- Decorative filler goes: remove glossy blobs, orbs, nebulas, floating cubes, glowing grids, and robot clip art.
- Dashboards and apps rarely need generated images: craft comes from beautiful charts, typography, real avatars/photos, and coded physical objects (e.g. realistic payment cards).
- For landing heroes with image tools (Antigravity's `image-generator` subagent, MCP image servers like fal, Replicate, OpenAI images, Figma), generate a wide world scene with calm space for copy.
- Below the scene or without an image tool, build a product preview in code with plausible data proving the headline.
- Product views carry a moment: rendered object, rich chart, or physical item from the world.
- If no image tool is active, build coded equivalents and leave clean placeholder slots with exact dimensions and prompts in the report.
- See [references/visuals.md](references/visuals.md) for prompt recipes, styles, and placement. See [references/refs.md](references/refs.md) for examples.

## 9. Motion

- Remove unmotivated loops: `animate-pulse`, `animate-ping`, heading shimmer, breathing glows, floating parallax.
- Remove `transition-all`, bouncy springs, and heavy hover card scaling.
- Keep meaningful motion: hover surface tint, tiny press scale-down, menu fade-rise, number counter tweens.
- Explicit transitions: `transition-colors` or `transition-[transform,opacity]`. Never animate width, height, top, or left.
- One easing curve, unified durations. At most one short fade-and-rise entrance on initial load.

## Story video

A short video where the screen unslops itself step by step with red redlines. Optional presentation piece.

See [references/story-video.md](references/story-video.md) for complete instructions on building `unslop-story/story.html` and rendering with `node <skill folder>/scripts/story.mjs`.

## Do not

- Do not rename the product, even with "AI" in name. Keep real logos. When logo itself is slop (sparkle tile), redraw flat.
- Do not change what the product is or does. Retain features, content, and section order.
- Do not replace removed decoration with new trends (glass, grain, neon, bento).
- Do not invent fake features, metrics, or claims.
- Do not apply identical generic looks to every product. Let the direction choose palette, type, and visual.

## Checklist

- [ ] The direction is written and every pass follows it
- [ ] Every spacing value is on the 4px scale and equal things have equal sizes
- [ ] Icons, labels and numbers each sit in one aligned column
- [ ] One tinted neutral ramp, three text roles, one accent with enough contrast
- [ ] No hue gradients, gradient text, glows, colored shadows or color blobs
- [ ] No emoji left in the interface
- [ ] One icon set at one size and stroke
- [ ] Type chosen for the character, weights 400 to 600, no uppercase tracked labels, no italic, no negative tracking on small text
- [ ] No exclamation marks, no trailing periods on short strings, no greeting headline, no unverified claims
- [ ] Numbers in one format with tabular figures
- [ ] Nested radii add up
- [ ] A hero has a real visual or a product preview with at least one moment, never filler and never a labeled placeholder
- [ ] The first screen is composed as a whole with no dead empty band
- [ ] No looping or bouncy motion, one easing curve, no animated layout properties
- [ ] Template check: If you swapped the product name, would the screen still fit? If yes, push the direction harder
