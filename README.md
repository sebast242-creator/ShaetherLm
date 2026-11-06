# ShaetherLM

**Your assistant. Your machine. Your files.**

**Free Windows application · No installation required · Local models and cloud APIs**

> **Release preparation:** version 1.0 is being prepared for public distribution.
> The EXE is not available in a published Release yet.

[Getting started](#quick-start) · [Versions and downloads](https://github.com/sebast242-creator/ShaetherLm/releases) · [License](#license)

ShaetherLM is a desktop AI workspace for Windows: a conversation, a full set of
working tools, and a memory that survives the session — all built to run on your
own hardware, with local models by default.

Give your assistant a real task: understand a document, improve a project,
research a subject, or automate a routine. It can work with files, use tools,
and help you pick up where you left off — in a dark interface designed for
everyday use, with voice playback and clear controls.

## What it does

**Talks** — Markdown, code, math. Optional voice input (Groq STT) and
read-aloud responses (Edge TTS) with text following.

**Works** — 17 integrated tools: PDF/Word/Excel reading, PDF creation, web search
and fetching, image analysis, Python execution, targeted code patches, and a
terminal with real exit codes. Agent mode chains these into multi-step work
with no preset step limit.

Send a clarification while the agent works: it reaches the model at the next
available turn. **STOP** stays within reach. Targeted file searches, paginated
reading, and focused patches help the agent work without loading an entire
project into the conversation.

**Remembers** — manual or automatic context cleaning, continuity checkpoints,
and optional **long-term memory** stored locally. Search, review, correct, or
pin essential memories in **Memory**. Memories retain links to their sources.
Forgetting excludes a memory from recall; its source history stays on disk.

At startup, **Ask** lets you choose independently whether to resume the saved
conversation and use long-term memory. **Automatic** and **Never** are also
available. Continuity helps preserve ongoing work; it does not promise perfect recall.

**Shows** — Mood Pulse: an animated mandala whose shape, colour and rhythm
the model steers alongside the conversation. Optional, decorative, and honest
about what it is: a model-generated visual expression, not a measurement of
feelings or consciousness.

**Feels comfortable** — textured metal buttons, illuminated indicators,
clickable web and local-file links, and a retractable conversation library.
Right-click a response to copy it or start reading aloud from a chosen passage.
Listen can remain ready for subsequent responses during agent work, with
follow and pause controls. **Display** lets you show or hide details; only
**Thoughts** is enabled by default among its optional categories.

## Try it with a real task

> “Read this document and explain its main points. Mark anything uncertain.”

> “Find the relevant files in this project, make a focused correction, and verify it.”

> “Resume our work from the latest checkpoint. Check the current files first.”

> “Remember this preference for future sessions.”

Results depend on your model and configured tools. Review important outputs.

## See ShaetherLM in action

New screenshots and a demonstration video are coming soon.

## Quick start

1. Once the public release is available, download and launch the official EXE — no application installation required. Open **Settings → Connection** and select your engine or API provider.
2. Configure your model, choose a **Workspace** folder, and save.
3. Start a conversation or attach a document.
4. Enable **Agent** for a task involving several steps.
5. Open **Memory** to manage checkpoints and long-term memories.

Updated English and French guides are being prepared for version 1.0.
They will focus on practical examples, with technical details at the end.

## Runs on

| Engine | Notes |
| --- | --- |
| **Ollama** | Local models and Ollama Cloud |
| **BeeLlama** | Self-contained local server (reference setup: Qwen3.8-27B) |
| **OpenAI / Anthropic / compatible API** | Remote model, tools still run on your machine |

Choose one in Settings. Local models and API keys are yours to configure;
they are not bundled.

## Requirements

- Windows 10/11. **No installation is required for ShaetherLM**: launch the EXE directly.
  No separate Python installation is needed to launch the application. External
  engines, scripts, and tools may require their own setup or runtimes.
- Local hardware requirements depend on the model, quantization, and context size.
- One working engine (Ollama or BeeLlama) or an API key.
- Optional: a Groq key for image analysis and voice input.

## Built-in tools

**17 integrated tools**, plus one optional n8n tool when enabled and an
authorized workflow is available. Some tools require service credentials.

| Purpose | Tools |
| --- | --- |
| Files | `list_files`, `read_file`, `write_file`, `search_in_files` |
| Code and execution | `apply_patch`, `run_command`, `python_exec` |
| Documents | `read_pdf`, `read_docx`, `read_excel`, `create_pdf` |
| Web | `web_search`, `web_fetch` |
| Images | `see_image` |
| Calculation and date | `calculate`, `get_datetime` |
| Long-term memory | `long_term_memory` |
| Optional automation | `n8n_run_workflow` |

## Privacy and execution controls

The interface, the Workspace, the file tools, and local engines stay on your
computer. What leaves: conversations with cloud/API models, web searches,
image/dictation requests to Groq, TTS synthesis, and n8n workflows when enabled.
Memory extraction uses your selected backend: with a remote model, relevant
source excerpts are sent to that provider. Saved API keys are protected using
your Windows account.

Command approval modes range from **Always ask** to **Workspace autonomous mode**.
Path checks, execution records, and STOP controls provide application-level
safeguards. Executed programs retain your Windows account permissions:
the Workspace is **not an operating-system sandbox**.

## Notes

- A separate standalone utility handles YouTube/Odysee transcription; it is
  not part of the core application.
- **n8n** integration is optional and off until enabled.
- Music creation with **AetherStrudel** is an example of an external tool setup,
  not a bundled feature of ShaetherLM.

## Status

**Version 1.0** · README updated November 6, 2026.

## Support the project

If ShaetherLM is useful to you, you can support its development with a
voluntary donation: **[Donate with PayPal](https://www.paypal.com/qrcodes/p2pqrc/J65DSN5ZLF7XL)**.

The same link is available in **Settings → Connection**.

---

© Sébast242 · [Contact](mailto:shaetherlm@gmail.com)

## License

ShaetherLM is **proprietary freeware**: free for personal and professional use,
with private source code. Donations are entirely optional.

You may share the unmodified official EXE free of charge, together with its
license and any required third-party notices. Third-party components retain
their own licenses and terms.

Read the full conditions of use and redistribution:

- [English translation](LICENSE_SHAETHERLM_EN.txt)
- [Original French license](LICENSE_SHAETHERLM_FR.txt)
