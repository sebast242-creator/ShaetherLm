ShaetherLM 1.1 adds **Strata** as a local inference engine and makes memory easier to manage during long sessions.

ShaetherLM is a free Windows desktop workspace with multilingual chat, voice, memory, and Agent mode with 17 built-in tools. Use a local model through Ollama, BeeLlama, or Strata, or connect to Ollama Cloud, OpenAI, Anthropic, or a compatible API.

## What’s new in 1.1

- **Start Strata from Settings.** In **Settings → Connection**, select Strata, choose its folder, and click **Start Strata**. The green indicator blinks while the model loads and stays lit when it is ready. The Strata monitor opens automatically.
- **See Strata’s speed at a glance.** The **Context** button shows average generation speed in tokens per second.
- **New Strata defaults.** New profiles use a **100K context window**, a **25K response limit**, **Auto drafting**, and **XHigh reasoning**. You can adjust them in Settings.
- **Memory is always visible.** Open **Memory → Long-term memory → Pending sources** to discard selected blocks or clear the queue, even while the engine is stopped. Long-term memory extraction uses Strata when it is selected.
- **Clearer context recovery.** ShaetherLM indicates whether cleanup was triggered by your chosen threshold or by a request exceeding the engine’s available context. Strata generates continuity summaries with reasoning disabled to leave more room for the summary.

## Getting started

Download `ShaetherLm.exe` from **Assets** below and launch it on Windows 10 or 11. Open **Settings → Connection**, select your engine or API provider, and choose a Workspace folder. The desktop app runs directly from the EXE. Local engines and models have their own setup.

## Optional local AI kits

- **Strata + Gyro‑S.** Download `ShaetherLm_Strata_Kit_v1.1_0.2.13.zip` from **Assets**, extract it, and run `INSTALL.cmd`. Choose a folder on a local SSD, then select that folder in ShaetherLM. The reference setup uses an **RTX 5070 Ti with 16 GB VRAM**, **32 GB RAM**, and at least **80 GiB** of free SSD space.
- **BeeLlama + Qwen3.8‑27B.** The existing kit targets NVIDIA GPUs with **16 GB VRAM** and PCs with **32 GB RAM**. Allow **25 GB** of free disk space. [Download the BeeLlama kit](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm_BeeLlama_Kit_v1.0_0.4.9.zip) · [SHA‑256 checksum](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm_BeeLlama_Kit_v1.0_0.4.9.zip.sha256)

Both kits download their engine and model separately.

## User guides

The existing guides are available from **Settings → Connection**. [English guide](https://github.com/sebast242-creator/ShaetherLm/blob/main/ShaetherLm_V1_Guide_EN.pdf) · [Guide français](https://github.com/sebast242-creator/ShaetherLm/blob/main/ShaetherLm_V1_Guide_FR.pdf)

## Distribution

ShaetherLM is free for personal and professional use. The unmodified official EXE may be redistributed free of charge under the accompanying license. Third-party components retain their own licenses. [English license](https://github.com/sebast242-creator/ShaetherLm/blob/main/LICENSE_SHAETHERLM_EN.txt) · [Licence française](https://github.com/sebast242-creator/ShaetherLm/blob/main/LICENSE_SHAETHERLM_FR.txt)