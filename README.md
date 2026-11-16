<!-- README.md -->

# ChatGPT Max Bot

Бот для общения с ChatGPT прямо в мессенджере MAX.

![Banner](docs/banner2.jpg)

![Latest Release](https://img.shields.io/github/v/release/TupiNUMBooR/chatgpt-max-bot)
![Release Date](https://img.shields.io/github/release-date/TupiNUMBooR/chatgpt-max-bot)
![Build](https://img.shields.io/github/actions/workflow/status/TupiNUMBooR/chatgpt-max-bot/release.yml?label=build&logo=githubactions)  
![Top Lang](https://img.shields.io/github/languages/top/TupiNUMBooR/chatgpt-max-bot?logo=gnubash)
![Docker Image Size](https://img.shields.io/docker/image-size/tupinumboor/chatgpt-max-bot/latest?label=image%20size&logo=docker)

**Links:** [GitHub](https://github.com/TupiNUMBooR/chatgpt-max-bot) | [GHCR](https://github.com/TupiNUMBooR/chatgpt-max-bot/pkgs/container/chatgpt-max-bot) | [Docker Hub](https://hub.docker.com/r/tupinumboor/chatgpt-max-bot)

## Настройка

Создай `.env` в корне репозитория и укажи:

- `OPENAI_API_KEY` — [ключ OpenAI](https://platform.openai.com/api-keys).
- `DOCKERHUB_USERNAME` — имя пользователя Docker Hub для публикации образов и обновления README.
- `DOCKERHUB_TOKEN` — Docker Hub [Personal Access Token](https://app.docker.com/settings/personal-access-tokens) с правами `Repo Read, Write, Delete`.

Для настройки CI/CD авторизуйся в GitHub командой `gh auth login`, затем запусти `tools/set-repo-env.sh`.
