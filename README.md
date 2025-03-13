# LLM Evaluation Playground

## Introduction
The purpose of this repository is to provide a playground for evaluating different prompt versions and language models (LLMs) using the `promptfoo` tool. This setup allows users to easily start experimenting with various configurations and models.

## Tests Directory Structure
The `tests` directory contains various test configurations and scripts. Users can modify prompts, define models, and change configurations for each test. This structure is designed to be flexible, allowing for easy customization and experimentation.

## Setup
To set up the environment, run the following commands:
- `make build`
- `make setup`

## Configure LLM Provider
To configure your LLM provider, follow these steps:
1. Create a `.env` file from the `.env.example` template.
2. Fill in the corresponding API Key based on your chosen provider.

## Define the Model
Specify the model to be used from your provider in the `tests/language_translation/language_translation_evaluation.yaml` file.

## Run
To execute the tests, use the following commands:
- `make run`
- Within the container, execute: `npm run eval:language_translation`

## Check Results
After running the tests, you can check the results by navigating to `http://localhost:15500/eval` in your web browser.
