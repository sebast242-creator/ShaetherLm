# ShaetherLM 1.1

**A larger local model, easier continuity, and a new face for your assistant.**

V1.1 brings native **Strata** integration for the **Gyro-S quantization of
Qwen3.8-Flash-Next 125B MoE (Qwen4-exp)**, improved memory and resume controls,
and a brushed-metal interface with **Mood Pulse and its new HAL visual mode**.

ShaetherLM is a free Windows desktop workspace with multilingual chat, voice,
memory, and Agent mode with **17 built-in tools**. Run a local model through
Ollama, BeeLlama, or Strata, or connect to Ollama Cloud, OpenAI, Anthropic,
or a compatible API.

## What’s new in 1.1

### Native Strata integration

- **Start your local model from Settings.** In **Settings → Connection**,
  select **Strata**, choose its folder, and click **Start Strata**. The green
  indicator blinks during loading and stays lit when the model is ready.
  The Strata monitor opens automatically.
- **See generation speed at a glance.** The **Context** button shows average
  Strata generation speed in tokens per second.
- **Updated defaults for new profiles.** **115K context**, **25K response
  budget including reasoning**, **Auto drafting**, and **Max reasoning**.
  Existing saved settings are preserved; values remain adjustable in Settings.
- **Clearer context recovery.** Cleanup accounts for context capacity, the
  reserved response budget, and a safety margin. ShaetherLM indicates whether
  cleanup followed your chosen threshold or a request exceeding the available
  context. Strata prepares continuity summaries with reasoning disabled.

### Easier memory and session continuity

- **Choose where to resume.** Open a saved session or manual checkpoint from
  its associated Workspace, or start a fresh conversation.
- **Memory stays within reach.** The **Memory** control remains visible
  beside the conversation controls. Search, edit, pin, and forget long-term
  memories directly.
- **Manage pending sources.** In **Memory → Long-term memory → Pending sources**,
  discard selected blocks or clear the queue, even when the engine is stopped.
  Memory extraction uses Strata when it is the selected backend.

### Brushed metal, glass, and HAL

- **A refreshed visual identity.** Brushed-metal controls, illuminated
  indicators, and a glass porthole frame the conversation and Mood Pulse.
- **A new HAL-inspired core.** Keep the original animated mandala or add a
  luminous yellow centre with a soft red glow. Its movement responds to the
  existing mood and activity signals.
- **A click to switch.** Enable **Mood Pulse** and click inside the glass
  while the assistant is idle. Click again to return to the original look.
  Switching is unavailable during generation, tool use, context cleanup,
  image analysis, or memory work.
- **Two alternating voice clips.** Entering HAL alternates between *“I feel
  much better now”* and *“I want to help you.”* Returning to the original mode
  is silent. The visual choice lasts for the current app session.
- **Completion alerts your way.** Enable the completion sound, the “Ready”
  voice, both, or neither.

<p align="center">
  <img src="https://raw.githubusercontent.com/sebast242-creator/ShaetherLm/main/images/moodpulse%20mode%20HAL.png" alt="Mood Pulse HAL visual mode inside the brushed-metal glass porthole" width="280">
</p>

HAL is a visual variation of Mood Pulse: it changes the presentation, not the
model, its instructions, or its personality.

## Getting started

Download `ShaetherLm.exe` from **Assets** below and launch it on Windows 10 or 11.
Open **Settings → Connection**, select your engine or API provider, and choose
a **Workspace** folder. The portable application runs directly from the EXE;
local engines and models have their own setup.

## Optional local AI kits

### Strata + Gyro-S 125B

Download `ShaetherLm_Strata_Kit_v1.1_0.2.13.zip` from **Assets**, extract it,
and run **INSTALL.cmd**. Choose a folder on a local SSD, then select that
folder in ShaetherLM and click **Start Strata**.

The reference setup uses an **RTX 5070 Ti with 16 GB VRAM**, **32 GB RAM**,
and at least **80 GiB of free SSD space**. Strata combines GPU memory, system
RAM, and SSD-backed expert loading; the entire model does not fit in VRAM.
The quantized model download is approximately **59 GB**.

The small ZIP is a download assistant. It fetches the engine and model
separately. English and French instructions are included, and **VERIFY.cmd**
checks the kit files and profile. Use the accompanying `.sha256` file to
verify the ZIP download.

### BeeLlama + Qwen3.8-27B

The alternative kit targets NVIDIA GPUs with **16 GB VRAM** and PCs with
**32 GB RAM**. Allow **25 GB of free disk space** and start with **64K context**.

[Download the BeeLlama kit](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm_BeeLlama_Kit_v1.0_0.4.9.zip) · [SHA-256 checksum](https://github.com/sebast242-creator/ShaetherLm/releases/download/v1.0.0/ShaetherLm_BeeLlama_Kit_v1.0_0.4.9.zip.sha256)

## User guides

The existing guides are available from Settings and cover the general workflow.
The V1.1 additions, including HAL controls, are described above.

[English guide](https://github.com/sebast242-creator/ShaetherLm/blob/main/ShaetherLm_V1_Guide_EN.pdf) · [Guide français](https://github.com/sebast242-creator/ShaetherLm/blob/main/ShaetherLm_V1_Guide_FR.pdf) · [Full README](https://github.com/sebast242-creator/ShaetherLm#readme)

## Distribution

ShaetherLM is **proprietary freeware**, free for personal and professional use.
The unmodified official EXE may be redistributed free of charge under the
accompanying license. Third-party components retain their own licenses.

[English license](https://github.com/sebast242-creator/ShaetherLm/blob/main/LICENSE_SHAETHERLM_EN.txt) · [Licence française](https://github.com/sebast242-creator/ShaetherLm/blob/main/LICENSE_SHAETHERLM_FR.txt)

*Release notes updated November 21, 2026.*
