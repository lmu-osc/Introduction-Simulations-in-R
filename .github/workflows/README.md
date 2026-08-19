# Workflows (GitHub Actions)

This document explains the GitHub Actions workflows in `.github/workflows/` in beginner-to-intermediate friendly language: what each workflow does, how it is triggered, and what is essential to keep working.

## Quick summary

- Location: `.github/workflows/`
- How to run: workflows run automatically on `push` to `main`, on a schedule, or manually via the **Actions** tab → "Run workflow" (if `workflow_dispatch` is enabled).

---

## Individual workflows

### citation-check.yml — Validate `CITATION.cff`

- Purpose: Validate the project's `CITATION.cff` so metadata (authors, ORCID, affiliations) is well-formed and machine-readable.
- Triggers: `push` to `main` when `CITATION.cff` changes, and manual runs (`workflow_dispatch`).
- What it does: checks out the repo and runs `dieghernan/cff-validator@v3`.
- Essentials to keep: the `Checkout` step and the validator step. No extra secrets are required.
- Tips: safe to update the validator action version; don't remove checkout.

### filename-check.yml — Enforce filename rules

- Purpose: Ensure file and path names meet limits (length, depth, allowed extensions) to prevent publishing problems.
- Triggers: `push` to `main`, `pull_request`, and manual runs.
- What it does: uses `NeuroShepherd/check-filenames-action@v1` with inputs such as `max-path-length`, `max-depth`, and allowed `file-types`. It may respect a `.filenameignore` file when present.
- Essentials to keep: the check-filenames action and its configuration inputs.
- Tips: adjust `max-path-length`/`max-depth` or add `.filenameignore` entries if legitimate files are flagged.

### publish.yaml — Render and publish the Quarto site

- Purpose: Build the Quarto site and publish the rendered site to the `gh-pages` branch.
- Triggers: `push` to `main`, weekly schedule (cron), and manual runs.
- What it does (high-level): checks out code, installs Quarto, installs system and R dependencies as needed, renders the site, and publishes to `gh-pages` using `quarto-actions/publish@v2`.
- Essentials to keep:
	- `quarto-dev/quarto-actions/setup@v2` (Quarto install)
	- the render and publish step (`quarto-actions/publish@v2`)
	- repository permission for `contents: write` to allow publishing
- Notes:
	- If you use R, the workflow detects `renv.lock` and restores packages; include `renv.lock` for reproducible builds.
	- The workflow installs system libraries via `apt` (image handling, PDF, and some R packages require these). Remove packages only if you understand the consequences.
- Common edits: change schedule timing or branch triggers. Removing the publish step disables automatic deployment.

### style.yaml — Format R/QMD code using `styler`

- Purpose: Automatically format R and Quarto/R Markdown code using `styler::style_dir()` and optionally commit formatted code.
- Triggers: currently manual (`workflow_dispatch`) — push triggers are commented out.
- What it does: installs R and `styler`, runs `styler::style_dir()`, and if files were reformatted the workflow commits and pushes changes using `GITHUB_TOKEN`.
- Essentials to keep: the style run and cache steps; the commit step is optional depending on whether you want automatic changes.
- Tips: to avoid unexpected commits, run manually or restrict to PR checks instead of auto-committing.

---

## Quick guidance — what to change vs what to leave alone

- Safe to change:
	- Schedules and branch triggers
	- Input limits for checks (e.g., filename length, allowed file types)
	- Action versions (bump to newer versions)
- Be careful editing:
	- The `publish` workflow's render/publish steps — removing them will stop site builds and deployment.
	- System dependency installation (`apt` lines) used by rendering and some R packages.
	- The auto-commit logic in `style.yaml` if you don't want automatic pushes. That is this workflow only runs on `workflow_dispatch` meaning it currently can only be manually triggered in Actions.

## How to run workflows manually

- In GitHub: Open the repository → **Actions** tab → choose a workflow → click **Run workflow** (if available).
- Locally: To test Quarto rendering locally, use `quarto preview` or `quarto render` in your project directory.

## Where to look for failures

- Open the **Actions** tab in GitHub, select the workflow run, and inspect step logs to see errors and stack traces.

---


