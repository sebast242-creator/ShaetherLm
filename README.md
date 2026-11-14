ShaetherLM
Your assistant. Your machine. Your files.

Free Windows application · No installation required · Multilingual chat · Local models and cloud APIs

Download ShaetherLm for Windows · V1.1

Getting started · User guides · Versions and downloads · License

ShaetherLM is a desktop AI workspace for Windows: a conversation, a full set of working tools, and a memory that survives the session — all built to run on your own hardware, with local models by default.

Give your assistant a real task: understand a document, improve a project, research a subject, or automate a routine. It can work with files, use tools, and help you pick up where you left off — in a dark interface designed for everyday use, with voice playback and clear controls.

What's new in V1.1
Strata is now a built-in engine choice. In Settings → Connection, choose your Strata folder and click Start Strata. The green indicator blinks while the model loads and stays lit when it is ready. Strata's monitor opens automatically.
Generation speed in the toolbar. With Strata, the Context button displays the engine's average tokens per second.
Easier memory management. Memory is always visible. Open Pending sources to discard selected blocks or clear the queue. Long-term memory extraction uses Strata when selected.
Clearer context recovery. ShaetherLM indicates whether cleaning was triggered by your chosen threshold or by the engine running out of room for a request. Strata's continuity summaries run with reasoning disabled, leaving the generation budget for the summary.
What it does
Talks — Converse in the languages supported by your chosen model. Set your preferred reply language in Settings → Assistant. Chat supports Markdown, code, and math, with optional voice input (Groq STT) and read-aloud responses (Edge TTS) with text following.

Works — 17 integrated tools: PDF/Word/Excel reading, PDF creation, web search and fetching, image analysis, Python execution, targeted code patches, and a terminal with real exit codes. Agent mode chains these into multi-step work with no preset step limit.

Send a clarification while the agent works: it reaches the model at the next available turn. STOP stays within reach. Targeted file searches, paginated reading, and focused patches help the agent work without loading an entire project into the conversation.

Remembers — manual or automatic context cleaning, continuity checkpoints, and optional long-term memory stored locally. Search, review, correct, or pin essential memories in Memory. Memories retain links to their sources. Forgetting excludes a memory from recall. Its source history stays on disk.

At startup, Ask lets you choose independently whether to resume the saved conversation and use long-term memory. Automatic and Never are also available. Continuity helps preserve ongoing work; it does not promise perfect recall.

Expresses — With Mood Pulse, the conversation takes shape and colour. The assistant controls an animated mandala whose forms, colours, and rhythm follow the emotional tone it expresses throughout the exchange. A beautiful, playful visual dimension that complements its words and voice — and gives ShaetherLM a distinctive character.

Feels comfortable — textured metal buttons, illuminated indicators, clickable web and local-file links, and a retractable conversation library. Right-click a response to copy it or start reading aloud from a chosen passage. Listen can remain ready for subsequent responses during agent work, with follow and pause controls. Display lets you show or hide details; only Thoughts is enabled by default among its optional categories.

Try it with a real task
“Read this document and explain its main points. Mark anything uncertain.”

“Find the relevant files in this project, make a focused correction, and verify it.”

“Resume our work from the latest checkpoint. Check the current files first.”

“Remember this preference for future sessions.”

Results depend on your model and configured tools. Review important outputs.

See ShaetherLM in action
▶ First launch — Set up your AI workspace in 50 seconds

Watch the first-launch settings walkthrough, from choosing a model to configuring your workspace.

▶ ShaetherLm in action — Watch the application demo

ShaetherLM workspace with a conversation, voice controls, and the Memory and Display panels

<details> <summary>Mood Pulse in action</summary> <img src="images/mood-pulse-action.png" alt="Mood Pulse during a tool action" width="180"> <img src="images/mood-pulse-calm.png" alt="Mood Pulse in a calm, attentive state" width="180"> <img src="images/mood-pulse-joy.png" alt="Mood Pulse in a playful, joyful state" width="180"> </details>
Quick start
Download ShaetherLm.exe from GitHub Releases and launch it directly. Open Settings → Connection and select your engine or API provider.
Configure your model and choose a Workspace folder. If you selected Strata, click Start Strata and wait for the green indicator to stay lit. Then save your settings.
Start a conversation or attach a document.
Enable Agent for a task involving several steps.
Open Memory to manage checkpoints and long-term memories.
User guides
English user guide (PDF)
Guide utilisateur français (PDF)
Both guides are also available from Settings → Connection in ShaetherLM.

Runs on
Engine	Notes
Ollama	Local models and Ollama Cloud
BeeLlama	Self-contained local server (reference setup: Qwen3.8-27B)
Strata	Local engine with an optional Gyro-S kit
OpenAI / Anthropic / compatible API	Remote model, tools still run on your machine
Choose one in Settings. Local models and API keys are yours to configure; they are not bundled.

Optional local kit for Strata + Gyro-S
From GitHub Releases, look for ShaetherLm_Strata_Kit_v1.1_0.2.13.zip. Extract the kit, run INSTALL.cmd, and choose a folder on a local SSD. The kit downloads and prepares Strata and Gyro-S. When setup finishes, select that folder in Settings → Connection → Strata. Run VERIFY.cmd to check the kit files and profile.

The reference setup uses Windows x64, an NVIDIA RTX 5070 Ti with 16 GB VRAM, and 32 GB RAM. Allow at least 80 GiB of free SSD space for a fresh setup.

Optional local pack: BeeLlama + Qwen3.8-27B
For a local agent, this companion kit is recommended for NVIDIA GPUs with 16 GB VRAM and PCs with 32 GB RAM. Choose a folder, let it download and verify the engine and model, then select that folder in ShaetherLm.

Download the optional BeeLlama + 27B kit (ZIP) · English instructions · Instructions en français · SHA-256 checksum

On Seb's RTX 5070 Ti 16 GB / 32 GB RAM setup, everyday use averages around 30 tokens/s, with context used up to approximately 93,000 tokens. These are his observed results; performance varies with hardware and workload. Start with 64K context, then try 90K after a stable first run.

The small ZIP contains the download assistant, not the model weights. It downloads approximately 14.6 GB; allow 25 GB free disk space and a CUDA 13.3-compatible NVIDIA driver. The pack is optional and separate from ShaetherLm, whose EXE requires no installation.

Requirements
Windows 10/11. No installation is required for ShaetherLM: launch the EXE directly. No separate Python installation is needed to launch the application. External engines, scripts, and tools may require their own setup or runtimes.
Local hardware requirements depend on the model, quantization, and context size.
One configured local engine (Ollama, BeeLlama, or Strata) or a supported API provider.
Optional: a Groq key for image analysis and voice input.
Comfortable defaults, adjustable limits
On first launch, automatic context cleaning and completion sounds are enabled. New Strata profiles start with 100K context, 25K max response tokens, Auto drafting, and XHigh reasoning. The reference profile reserves 300 MiB VRAM and 3 GiB RAM, with a 16 GiB expert cache. Sliders let you choose 4K–256K context and 4K–64K response limits (1K = 1,024 tokens). The response limit applies in both normal chat and Agent mode, including reasoning. Choose values supported by your model and hardware; API providers may impose lower limits.

The Agent security section starts with Workspace autonomous mode. You can choose stricter command approval at any time. Existing saved settings are preserved.

Built-in tools
17 integrated tools, plus one optional n8n tool when enabled and an authorized workflow is available. Some tools require service credentials.

Purpose	Tools
Files	list_files, read_file, write_file, search_in_files
Code and execution	apply_patch, run_command, python_exec
Documents	read_pdf, read_docx, read_excel, create_pdf
Web	web_search, web_fetch
Images	see_image
Calculation and date	calculate, get_datetime
Long-term memory	long_term_memory
Optional automation	n8n_run_workflow
Privacy and execution controls
The interface, the Workspace, the file tools, and local engines stay on your computer. What leaves: conversations with cloud/API models, web searches, image/dictation requests to Groq, TTS synthesis, and n8n workflows when enabled. Memory extraction uses your selected backend: with a remote model, relevant source excerpts are sent to that provider. Saved API keys are protected using your Windows account.

Command approval modes range from Always ask to Workspace autonomous mode. Path checks, execution records, and STOP controls provide application-level safeguards. Executed programs retain your Windows account permissions: the Workspace is not an operating-system sandbox.

Notes
A separate standalone utility handles YouTube/Odysee transcription; it is not part of the core application.
n8n integration is optional and off until enabled.
Music creation with AetherStrudel is an example of an external tool setup, not a bundled feature of ShaetherLM.
Status
Version 1.1 · README updated November 14, 2026.

Support the project
If ShaetherLM is useful to you, you can support its development with a voluntary donation: Donate with Ko-fi.

The same link is available in Settings → Connection.

© Sébast242 · Contact

License
ShaetherLM is proprietary freeware: free for personal and professional use, with private source code. Donations are entirely optional.

You may share the unmodified official EXE free of charge, together with its license and any required third-party notices. Third-party components retain their own licenses and terms.

Read the full conditions of use and redistribution:

English translation
Original French license
Read the full conditions of use and redistribution:

- [English translation](LICENSE_SHAETHERLM_EN.txt)
- [Original French license](LICENSE_SHAETHERLM_FR.txt)
