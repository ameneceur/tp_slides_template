// ============================================================
// gh-minimal-slides — example deck
// Mirrors the JSX reference at /tmp/gh-slides-zip/readme-slides.html
// slide-by-slide, so the compiled PDF is a quick visual diff target.
//
//   typst compile example.typ
// ============================================================

#import "@preview/touying:0.7.3": *
// #import "@preview/gh-minimal-slides:0.1.0" as gh
#import "./lib.typ" as gh
#show: gh.register.with(
  theme:   "light",   // try "dark"
  accent:  "telecom",    // try "purple", "green", "pink", "orange", "mono"
  density: "comfy",   // try "compact",
  // title : []
)

// ------------------------------------------------------------
// 01 — Cover
// ------------------------------------------------------------
#gh.cover-slide(
  kicker: "# README.md",
  title: [
    A minimal\
    readme-style\
    slide gallery.
  ],
  badges: (
    "v1.0.0",
    ("MIT license", "accent"),
    ("build: passing", "success"),
    "docs",
  ),
  footer-left: "@author · 2026",
  // footer-right: "↓ scroll  ·  → next",
)

// ------------------------------------------------------------
// 02 — Section divider
// ------------------------------------------------------------
#gh.section-slide(
  number: "01",
  kicker: "Chapter",
  title: [Getting started],
)

// ------------------------------------------------------------
// 03 — Content slide
// ------------------------------------------------------------
#gh.content-slide(title: [Unordered list])[
- Render with normal Typst list markup.
- Nested items use indentation.
  - No custom item tuple syntax needed.
  - No extra slide helper needed.
- Mix freely with prose, like `npm install`.
- Links inherit the accent color — #gh.gh-link[see reference →]
]

// ------------------------------------------------------------
// 04 — Numbered list
// ------------------------------------------------------------
#gh.content-slide(title: [Numbered list])[
+ Clone the repository.
+ Install dependencies.
+ Configure the environment.
+ Run the dev server.
]

// ------------------------------------------------------------
// 05 — Blockquote
// ------------------------------------------------------------
#gh.quote-slide(
  title: [Blockquote],
  body: [
    Simplicity is prerequisite for reliability. A program that is not
    obviously correct will be full of bugs hiding where complexity lives.
  ],
  attribution: [— paraphrased, source.md:L12],
)

// ------------------------------------------------------------
// 06 — Terminal/code block
// ------------------------------------------------------------
#gh.content-slide(title: [Code block])[
```javascript
import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: { port: 3000 }
})
```
]

// ------------------------------------------------------------
// 07 — Table
// ------------------------------------------------------------
#gh.table-slide(
  title: [Endpoints],
  headers: ("Method", "Path", "Status", "Description"),
  rows: (
    ("GET",    "/api/users",     "200", "Returns user list"),
    ("POST",   "/api/users",     "201", "Creates new user"),
    ("PATCH",  "/api/users/:id", "200", "Updates existing user"),
    ("DELETE", "/api/users/:id", "204", "Removes a user"),
  ),
)

// ------------------------------------------------------------
// 08 — Two-column comparison
// ------------------------------------------------------------
#gh.two-col-slide(
  title: [Before & after],
  left:  ("Before", "danger",  "12m 04s",
          [Sequential builds took upwards of 12 minutes on every push.
           Developers context-switched out of flow.]),
  right: ("After",  "success", "1m 47s",
          [Parallelised pipeline with shared caches. Builds land before
           the PR description is written.]),
)

// ------------------------------------------------------------
// 09 — Image / figure
// ------------------------------------------------------------
#gh.image-slide(
  title: [Figure 1 — system overview],
  placeholder-text: "[ architecture diagram — 1680 × 520 ]",
  caption: [Figure 1. Dataflow through the ingest → transform → serve pipeline. Source: #gh.gh-link[docs/architecture.md]],
)

// ------------------------------------------------------------
// 10 — Stats grid
// ------------------------------------------------------------
#gh.stats-slide(
  title: [Q1 metrics],
  stats: (
    ("1.4M",   "weekly downloads", "12%"),
    ("4,208",  "github stars",     "340"),
    ("97",     "contributors",     "6"),
    ("98.2%",  "test coverage",    "0.4"),
  ),
)

// ------------------------------------------------------------
// 11 — Task list
// ------------------------------------------------------------
#gh.task-slide(
  title: [Task list — v1 milestone],
  tasks: (
    (true,  [Draft initial API spec],            "closed · 12 days ago"),
    (true,  [Wire up authentication middleware], "closed · 8 days ago"),
    (true,  [Add pagination to list endpoints],  "closed · 3 days ago"),
    (false, [Rate-limiting for public routes],   "open · 2 reviewers"),
    (false, [Migrate to streaming responses],    "open · blocked"),
    (false, [Publish v1.0 to registry],          "open · milestone"),
  ),
)

// ------------------------------------------------------------
// 12 — Alerts
// ------------------------------------------------------------
#gh.alert-slide(
  title: [Alert callouts],
  alerts: (
    ("NOTE",    "accent",  [Highlights information that users should take into account, even when skimming.]),
    ("TIP",     "success", [Optional guidance that helps a user get more out of a feature.]),
    ("WARNING", "warning", [Urgent info that needs immediate user attention to avoid problems.]),
    ("CAUTION", "danger",  [Advises about risks or negative outcomes of certain actions.]),
  ),
)

// ------------------------------------------------------------
// 13 — Bibliography
// ------------------------------------------------------------
#gh.bibliography-slide(
  title: [References],
  refs: (
    (
      key: "1",
      author: [Shannon, C. E.],
      year: "1948",
      title: [A Mathematical Theory of Communication],
      venue: [Bell System Technical Journal, 27(3), 379–423],
    ),
    (
      key: "2",
      author: [Goodfellow, I., Bengio, Y., and Courville, A.],
      year: "2016",
      title: [Deep Learning],
      venue: [MIT Press],
      url: [https://www.deeplearningbook.org],
    ),
    (
      key: "3",
      author: [Vaswani, A. et al.],
      year: "2017",
      title: [Attention Is All You Need],
      venue: [NeurIPS 2017],
    ),
  ),
)

// ------------------------------------------------------------
// 14 — Box system
// ------------------------------------------------------------
#gh.content-slide(title: [Box system])[\
  #gh.theorem-box(title: [Theorem 1 — Central Limit Theorem])[
    Let $X_1, X_2, dots$ be i.i.d. random variables with mean $mu$ and
    variance $sigma^2$. Then
    $ sqrt(n) (overline(X)_n - mu) arrow.r.double cal(N)(0, sigma^2) $
  ]

  #gh.result-box(title: [Result — Convergence rate])[
    The Berry–Esseen bound gives
    $sup_x |F_n (x) - Phi(x)| <= C dot rho \/ sigma^3 sqrt(n)$
    where $C < 0.4748$.
  ]
]

#gh.content-slide(title: [More boxes])[\
  #gh.remark-box(title: [Remark])[
    The constant $C$ in the Berry–Esseen theorem has been progressively
    tightened since 1941. The best known upper bound is due to
    Shevtsova (2011).
  ]

  #gh.warning-box(title: [Warning — Assumptions])[
    The CLT requires finite variance. For heavy-tailed distributions
    (e.g. Cauchy), the theorem does not hold and alternative limit
    theorems involving stable distributions must be used.
  ]
]

// ------------------------------------------------------------
// 15 — Closing
// ------------------------------------------------------------

#gh.closing-slide(
  kicker: "## Thanks",
  title: [Questions?],
  links: ("docs/", "issues/", "contact.md"),
)
