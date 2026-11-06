# ShaetherLM 1.0 — release notes draft

**Preparation only — this document does not publish a release.**

## A local AI workspace for everyday work

ShaetherLM brings conversation, practical tools, voice, and memory together
in a Windows desktop application. The official EXE runs without installing
ShaetherLM or a separate Python runtime for the interface.

Configure your local engine or API provider, choose a Workspace, and give
your assistant a task.

## Highlights

- Local inference through Ollama or BeeLlama, plus Ollama Cloud, OpenAI,
  Anthropic, and compatible APIs.
- Agent mode with 17 integrated tools and an optional n8n workflow tool.
- Clarifications sent while the agent works, delivered at the next available turn.
- File search, paginated reading, targeted patches, and command results.
- Optional local long-term memory with source references, review, and essential memories.
- Continuity checkpoints and manual or automatic context cleaning.
- Voice input, read-aloud responses, follow/pause controls, and reading from a selected passage.
- A dark interface with metallic controls, a retractable conversation library,
  and optional Mood Pulse.

## Settings and comfort

- Context and response sliders for local engines and API profiles.
- The selected response budget applies in both normal chat and Agent mode.
- First-launch defaults: 90K context, automatic context cleaning and completion
  sounds enabled, Workspace autonomous command approval.
- Ko-fi support link and access to the official GitHub release page in Settings.

## Before you start

- Windows 10/11.
- Configure a model engine or an API provider separately; models and API keys
  are not included.
- Local hardware requirements depend on the model and context size.
- Online services may require accounts and may charge for usage.
- External scripts and utilities may require their own runtimes.

## Distribution

ShaetherLM is proprietary freeware: free for personal and professional use,
with optional donations. The unmodified official EXE may be redistributed
free of charge under the accompanying license. Source code remains private.
Third-party components retain their own licenses.

Licenses: [English translation](LICENSE_SHAETHERLM_EN.txt) · [French original](LICENSE_SHAETHERLM_FR.txt).

---

## Publisher checklist — remove this section from the final release description

- Choose the version tag `v1.0.0` and the release title `ShaetherLM 1.0`.
- Select and test the final EXE intended for distribution.
- Include the license and required third-party notices with the downloadable package.
- Add the new screenshot collection; review visible personal information.
- Add the demonstration video.
- Add the updated FR/EN guides.
- Check the README links and remove its release-preparation notice only when download is available.
- Verify the application's Check for updates link after the repository becomes public.
- Finish the existing GitHub draft Release, upload the intended files, and verify downloads.
- Review repository contents and history before making the repository public.
- Prepare the Hugging Face static Space with links to the official GitHub download.
