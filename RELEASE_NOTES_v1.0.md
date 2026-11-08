# ShaetherLM 1.0 — release notes

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

## Downloads

- [ShaetherLm.exe — Windows, no installation required](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm.exe)
- [Optional BeeLlama + Qwen3.8-27B kit](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm_BeeLlama_Kit_v1.0_0.4.9.zip) · [SHA-256 checksum](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm_BeeLlama_Kit_v1.0_0.4.9.zip.sha256)
- Kit instructions: [English](ShaetherLm_BeeLlama_Kit/README_EN.md) · [Français](ShaetherLm_BeeLlama_Kit/README_FR.md)
- User guides: [English](ShaetherLm_V1_Guide_EN.pdf) · [Français](ShaetherLm_V1_Guide_FR.pdf)

The optional kit targets NVIDIA GPUs with 16 GB VRAM and PCs with 32 GB RAM. It downloads the engine and model separately; ShaetherLm itself does not include model weights.

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
