# Sources and pinned versions

This download assistant is an independent ShaetherLm companion, not an official BeeLlama or Qwen product. It does not bundle upstream binaries or weights. Their own terms remain applicable.

| Component | Source |
|---|---|
| BeeLlama v0.4.9 Windows CUDA 13.3 engine and runtime | https://github.com/Anbeeld/beellama.cpp/releases/tag/v0.4.9 |
| BeeLlama source and license notices | https://github.com/Anbeeld/beellama.cpp/tree/v0.4.9 |
| Qwen3.8-27B smaller hybrid quantization | https://huggingface.co/jrell/Qwen3.8-27B-i1-IQ4_XS-GGUF-Smaller/tree/bcb1edfb517aa9ae2443bf22961862a3b7a4a5a6 |
| Quantization model card / upstream model references | https://huggingface.co/jrell/Qwen3.8-27B-i1-IQ4_XS-GGUF-Smaller/blob/bcb1edfb517aa9ae2443bf22961862a3b7a4a5a6/README.md |
| Sharp v22.4.0 archived template | https://huggingface.co/peculiar-ragdoll/Qwen-Sharp-Chat-Templates/tree/6a78b888557f8c9987f51bca98d02d8f69682044/archive/v22.4.0-sharp |
| NVIDIA drivers | https://www.nvidia.com/Download/index.aspx |

`sources.json` contains the exact download URLs and SHA-256 hashes. Engine/runtime hashes are from the official GitHub release asset metadata; the GGUF hash is from Hugging Face LFS metadata. The template hash was computed from the pinned upstream file, whose normalized text matches the reference installation (Windows line endings differ).

Do not replace a URL without checking and updating its hash. No update is performed automatically. A future release should be tested with ShaetherLm before changing these references.

ShaetherLm: https://github.com/sebast242-creator/ShaetherLm

Contact: shaetherlm@gmail.com — Support: https://ko-fi.com/shaetherlm
