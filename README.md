# ⚡ Offline AI Chatbox (100% Local Intelligence)

A private, high-performance, and feature-rich **Offline AI Chatbox** built in Python. It operates **100% locally on your computer** without sending any telemetry, prompts, or confidential documents across the internet.

---

## 🌟 Key Highlights

- **🔒 Zero Cloud Dependency & 100% Privacy:** All conversations, memory, and computations stay on your machine.
- **⚡ Dual AI Architecture:**
  1. **Built-in Offline Intelligence:** Instant responses using local NLP, pattern matching, safe mathematical evaluation, and a built-in encyclopedia.
  2. **Local LLM Engine:** Seamless connection to **Ollama** (`llama3.2`, `mistral`, `phi3`, `qwen2.5`) and **LM Studio** / **LocalAI** (`http://127.0.0.1:1234/v1`).
- **🎨 Triple User Interface:**
  1. **Modern Desktop GUI (Tkinter):** Dark/Light mode, streaming text bubbles, session history sidebar, quick suggestion pills.
  2. **ChatGPT-style Web UI (Browser):** Pure HTML5/CSS3/JS, zero CDN dependencies, code copy buttons, offline Text-to-Speech (Web Speech API).
  3. **Terminal CLI:** Interactive terminal interface with colored output and slash commands.
- **💾 Local SQLite Database:** Persists sessions, messages, and offline notes into `data/chat_history.db`.
- **📦 Zero Mandatory Dependencies:** Runs entirely on standard Python 3.9+ without needing `pip install`!

---

## 🏗️ Architecture Overview

```
offline_ai_chatbox/
│
├── core/
│   ├── engine.py              # Unified ChatEngine orchestrator
│   ├── nlp_bot.py             # Built-in Offline NLP, safe math & memory
│   ├── local_llm.py           # Local LLM client (Ollama & OpenAI-compatible)
│   ├── storage.py             # SQLite persistence & export manager
│   ├── knowledge_base.json    # Local offline encyclopedia (Python, ML, CS, Math)
│   └── config.py              # Settings loader & JSON configurator
│
├── gui/
│   └── app_gui.py             # Desktop Tkinter GUI with custom theme
│
├── web/
│   ├── server.py              # Lightweight HTTP API server (pure Python)
│   ├── index.html             # ChatGPT-style web interface
│   ├── style.css              # Dark & light glassmorphic stylesheet
│   └── app.js                 # Frontend chat controller & speech synthesis
│
├── cli/
│   └── app_cli.py             # Terminal interface with slash commands
│
├── data/                      # Auto-created directory for chat_history.db & settings
├── run_gui.bat                # 1-Click Windows launcher for Desktop GUI
├── run_web.bat                # 1-Click Windows launcher for Web Browser UI
├── run_cli.bat                # 1-Click Windows launcher for Terminal CLI
├── main.py                    # Master CLI/GUI launcher
├── requirements.txt           # Dependency guide
└── README.md                  # Complete documentation
```

---

## 🚀 Quick Start (Running the Chatbox)

### Option 1: One-Click Windows Launchers
Simply double-click any of the batch files:
- **`run_gui.bat`** -> Opens the Desktop application.
- **`run_web.bat`** -> Starts the local web server and opens `http://127.0.0.1:8080` in your default browser.
- **`run_cli.bat`** -> Starts the interactive terminal chat.

### Option 2: Running via Python Commands

```bash
# Launch Desktop GUI (Default)
python main.py --gui

# Launch Browser Web UI
python main.py --web

# Launch Terminal CLI
python main.py --cli
```

---

## 🧠 Dual-Engine Capabilities

### 1. Built-in Offline Intelligence Engine (Default)
Runs instantly with zero download required. Capabilities include:
- **Knowledge Retrieval:** Answers questions about Python, Machine Learning, Data Structures, Git, and SQLite.
- **Safe Math & Conversion Solver:**
  - `calculate 45 * 12 + 10`
  - `sqrt(144) + 2**8`
  - `convert 100 celsius to fahrenheit`
  - `convert 15 km to miles`
  - `area of circle with radius 7`
- **Session Memory:**
  - *"My name is Nida"* -> Bot remembers your name across sessions.
  - *"What is my name?"* -> Bot recalls your identity.
  - *"Remember that Python 3.14 was released"* -> Stores learned facts in SQLite.
- **Offline Notes Manager:**
  - *"note: Read Chapter 4 on Algorithms"* -> Saves note into local database.
  - *"show notes"* -> Lists saved notes.
- **Code Templates:**
  - Generates working examples for Bubble Sort, Binary Search, File I/O, String Reversal, Decorators, and List Comprehensions.

### 2. Local LLM Engine (Ollama & LM Studio)
To connect with open-weight Large Language Models (LLMs):
1. Install [Ollama](https://ollama.com).
2. Download a lightweight model:
   ```bash
   ollama run llama3.2
   ```
3. In the chatbox UI (GUI or Web), switch the **Active Engine** to **Local LLM (Ollama)**.
4. You now have an open-ended conversational AI running on your hardware with streaming responses!

---

## ⌨️ CLI Slash Commands

When using the Terminal CLI (`python main.py --cli`):
- `/help` - Show all available commands.
- `/engine <builtin|ollama|lmstudio>` - Switch between AI engines.
- `/status` - Check the online/offline status of Ollama and LM Studio.
- `/new <title>` - Start a new chat session.
- `/sessions` - List all saved conversations.
- `/switch <id>` - Switch to a previous session.
- `/notes` - View or add notes (`/notes add Title: Body`).
- `/export <md|txt|json>` - Export conversation to a file.
- `/clear` - Clear terminal screen.
- `/exit` - Exit the chat application.

---

## 🛠️ Customizing the Knowledge Base

You can expand the offline knowledge base at any time by editing [`core/knowledge_base.json`](core/knowledge_base.json):
```json
{
  "id": "my_topic",
  "keywords": ["keyword1", "keyword2"],
  "title": "Topic Title",
  "content": "Detailed explanation with markdown and code snippets..."
}
```
The built-in engine automatically indexes new topics on startup!

---

## 🛡️ License & Privacy Guarantee

This project does not make external network requests to third-party APIs. No tracking, telemetry, or user data is ever transmitted off the device.
