# LLM Evaluation Playground

Welcome to the LLM Evaluation Playground! This repository provides a straightforward way to experiment with different prompts and language models (LLMs) using the [`promptfoo`](https://github.com/promptfoo/promptfoo) tool.

## Overview

- **Purpose**: Quickly evaluate and compare prompts across various LLMs.  
- **Required Tools**:  
  - **Docker**
  - **Makefile**

## Quick Start

Follow these steps to get up and running:
1. **Clone** this repository.
2. **Build & Setup** the playground.

```bash
git clone https://github.com/mgonzalezbaile/llm-evaluation-playground
cd llm-evaluation-playground
make build
make setup
```

---

## 1. Repository Structure

```
├── Dockerfile
├── Makefile
├── .env.example
├── tests
│   └── language_translation
│       ├── prompts
│       │   └── dynamic.md
│       └── language_translation_evaluation.yaml
└── README.md
```

- **`tests/`**: Contains the tests suite with prompts, model selection, evaluation rules, etc.  
- **`tests/language_translation/`**: Example test setup for language translation tasks. You can create new folders for other tasks.  
- **`language_translation_evaluation.yaml`**: Config file for specifying providers, prompts, and test assertions.  

---

## 2. Configure Your LLM Provider

1. **Create a `.env` file** from the provided `.env.example`:  
   ```bash
   cp .env.example .env
   ```
2. **Edit `.env`** to include your provider’s API keys and any other relevant credentials.

_The `.env` file has placeholders for multiple providers (OpenAI, Anthropic, Google Vertex AI, Azure, AWS Bedrock, Mistral AI, Cohere, etc.). Keep only the ones you plan to use._

---

## 4. Run the Playground

Exeute:
```bash
make run
```
- **What happens**:
  1. A container launches in detached mode, mapping port `15500` on your machine to `15500` inside the container.
  2. The script then attaches you to the running container so you can interact with it via a shell.

- **Inside the container**:
  - You’ll see a command prompt (e.g., `/app #`), which means that you are ready to start using the playground.
  - Notice that your local folder (`$PWD`) is mounted inside the container at `/app`, so any changes you make will be directly reflected within the container.

---

## 5. Define the Model

To change or specify a different LLM model:

1. Open `tests/language_translation/language_translation_evaluation.yaml`.
2. In the `providers` section, comment or uncomment the desired model (e.g., `openai:gpt-4`, `openai:gpt-3.5-turbo`, `anthropic:claude-3-opus-20240229`, etc.).
3. Adjust any parameters (e.g., `temperature`, `top_p`, etc.) in the `defaultTest` section as needed.

---

## 7. Run Evaluation

Once you have entered your provider's API Key and defined the model you want to use, you can run the evaluation executing:

```bash
npm run eval:language_translation
```

If everything goes as expected, you should see an output like:
```
/app # npm run eval:language_translation

> llm-evaluation-tool@1.0.0 eval:language_translation
> promptfoo eval --config tests/language_translation/language_translation_evaluation.yaml --output results/language_translation_results.json


========================================================================================================================================================
⚠️ The current version of promptfoo 0.105.1 is lower than the latest available version 0.106.3.

Please run npx promptfoo@latest or npm install -g promptfoo@latest to update.
========================================================================================================================================================

Running 2 concurrent evaluations with up to 4 threads...
[████████████████████████████████████████] 100% | ETA: 0s | 1/1 | deepseek/deepseek-chat:free "## Role {{" source_lan
[████████████████████████████████████████] 100% | ETA: 0s | 1/1 | deepseek/deepseek-chat:free "## Role {{" source_lan
```

---

## 8. View Results

Open your browser to:

```
http://localhost:15500/eval
```

Here you can see:
- **Evaluation Scores** based on the rubrics defined in the YAML file.
- **Prompt Outputs** from each LLM provider you tested.

---

## Tips & Troubleshooting

- **Container Already Running**: If `make run` says the port is in use, an older container might still be running. Stop it with `docker stop <container_id>` or use `docker ps` + `docker rm -f <container_id>` to remove it.
- **Persisting Data**: The repository is mounted inside the container, so any changes you make locally are immediately reflected inside the container.
- **Editing from Host**: You can continue to edit files in your favorite editor on your host machine. The container automatically sees those changes.
- **Credentials**: Ensure your `.env` has valid credentials. If calls fail due to invalid API keys, check your `.env` or your provider’s usage limits.

---

## Contributing

Contributions and suggestions are always welcome! Feel free to open issues or pull requests with improvements, new tests, or additional providers.

---

## License

This project is licensed under the [MIT License](LICENSE).

Happy prompt engineering!
```
