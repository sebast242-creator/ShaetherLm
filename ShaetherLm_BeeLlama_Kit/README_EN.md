# Your local model with ShaetherLm and BeeLlama

This kit prepares the BeeLlama engine and the Qwen3.8-27B model used with ShaetherLm. Choose a folder, let the kit download and verify the files, then select that folder in the application.

**NVIDIA 16 GB profile — Windows 10/11 x64.** Pinned BeeLlama 0.4.9, CUDA 13.3, 13.54 GB IQ4_XS / IQ3_S hybrid GGUF and Sharp v22.4.0 chat template. No silent upgrades.

## Recommended optional pack — 16 GB VRAM + 32 GB RAM

This companion pack prepares **BeeLlama + Qwen3.8-27B** for a local agent in ShaetherLm, without commands to copy and paste. It is optional: you can use Ollama or an API provider instead.

**Seb's everyday experience:** on an **RTX 5070 Ti 16 GB with 32 GB RAM**, around **30 tokens/s on average**, with context used up to approximately **93,000 tokens**. These figures describe his experience on that setup, not a model limit or a guaranteed speed for every 16 GB GPU. Start with 64K, then try 90K (92,160 tokens) after a stable first run.

## Requirements

- NVIDIA GPU with 16 GB VRAM; actual compatibility and available memory depend on the GPU, driver and other running applications. This CUDA kit is not for AMD/Intel GPUs.
- A recent NVIDIA driver supporting CUDA 13.3. The CUDA runtime libraries are included in the downloads; no CUDA Toolkit installation is needed. The kit does not install drivers.
- **32 GB system RAM recommended** for headroom; system RAM does not replace VRAM.
- **25 GB free local disk space**, preferably on an SSD; approximately 14.6 GB of downloads.
- Windows curl and PowerShell, supplied with current Windows 10/11. No Python or administrator privileges needed.

## Install

1. Extract the whole kit ZIP, then double-click **INSTALL.cmd**.
2. Enter an empty local destination folder, or press Enter for the suggested location under your Windows profile. Avoid cloud-synced or network folders.
3. Review the detected GPU and enter **Y** to download.
4. Optionally enter the path to an existing copy of the **exact** GGUF named in `sources.json`; it will be checked and copied. Otherwise press Enter to download it.
5. Wait for verification to complete. Hashing a 13.5 GB file takes some time.

If interrupted, rerun INSTALL with the same folder. Complete files are checked and partial downloads can resume. A corrupt `.part` file must be removed before retrying; the error identifies it. Existing installations not created by this kit are refused. Downloads and extracted archives remain under `.downloads` for recovery.

The launcher permits its PowerShell script for this process only; no permanent Windows execution-policy change is made. Managed devices may have organization restrictions that must be respected.

## Connect

In ShaetherLm **Settings > Connection**, select **BeeLlama**. In the **BeeLlama** tab, select the installation root as **BeeLlama folder** (the folder containing `beellama`, `models` and `chat_template.jinja`). Start with **64K context (65,536 tokens)** and **MTP OFF**. Click **Save & Apply**.

The app starts the server on **127.0.0.1:11435**. Do not launch a second server manually. Ollama normally uses another port, but its loaded models may still consume GPU memory. Send a short message, then ask for the current date to check a tool call.

The generated `CONNECT_TO_SHAETHERLM.txt` records your exact folder. No ShaetherLm settings, conversations or memories are modified by this kit.

## Choose your context

- **64K:** recommended starting point, not a fit guarantee on every 16 GB GPU.
- **90K (92,160 tokens):** try after stable loading and use at 64K.
- **32K:** fallback if memory is insufficient.

Close other GPU-heavy applications before testing. Larger context needs more memory; it is not a speed setting. **Max response tokens** is separate and limits each response including reasoning.

ShaetherLm handles Flash Attention, KVarN5 K / KVarN4 V caches and a 1,024-token precision tail automatically. No launch command needs to be copied.

## Troubleshooting

- Driver not detected: install/repair the official NVIDIA driver.
- CUDA or DLL error: check CUDA 13.3 driver compatibility. Do not download random DLLs.
- Out of GPU memory: close other GPU workloads and reduce context to 32K.
- Download failure: check access to GitHub and Hugging Face. No access token is requested.
- Destination not empty: choose a fresh folder; an unrelated installation will not be overwritten.

**VERIFY.cmd** checks model/template hashes and runs the engine's version command. It does not load model weights or benchmark GPU performance. Complete the real model-load test inside ShaetherLm.

## Sources and licenses

The kit ZIP contains no engine binaries, model weights or personal data. Files are downloaded from official upstream repositories and verified using SHA-256. Upstream component licenses remain applicable; see **SOURCES.md**. The accompanying kit is provided under the included ShaetherLm Freeware license.

Kit 1.0 — references checked November 7, 2026. Engine/model/template match the reference-machine profile; each user's hardware still needs validation.
