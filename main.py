"""
Master Entry Point for Offline AI Chatbox.
Supports Desktop GUI, Local Browser Web UI, and Terminal CLI modes.
"""

import sys
import argparse

# Ensure safe UTF-8 output on Windows
if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")
    except Exception:
        pass


def main():
    parser = argparse.ArgumentParser(
        description="Offline AI Chatbox - 100% Local Conversational AI Assistant",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python main.py             # Launches Desktop GUI (Tkinter)
  python main.py --gui       # Launches Desktop GUI
  python main.py --web       # Launches Local Web Interface in Browser
  python main.py --cli       # Launches Interactive Terminal Chat
        """
    )
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--gui", action="store_true", help="Launch Desktop Tkinter GUI (Default)")
    group.add_argument("--web", action="store_true", help="Launch Local Browser Web UI (http://127.0.0.1:8080)")
    group.add_argument("--cli", action="store_true", help="Launch Interactive Terminal CLI")

    parser.add_argument("--port", type=int, default=8080, help="Port for web server (default: 8080)")
    parser.add_argument("--host", type=str, default="127.0.0.1", help="Host address for web server (default: 127.0.0.1)")

    args = parser.parse_args()

    if args.web:
        print("[Launcher] Starting Local Web Interface...")
        from web.server import run_web_server
        run_web_server(host=args.host, port=args.port, open_browser=True)

    elif args.cli:
        print("[Launcher] Starting Interactive Terminal CLI...")
        from cli.app_cli import run_cli
        run_cli()

    else:
        # Default to Desktop GUI
        try:
            print("[Launcher] Launching Desktop GUI...")
            from gui.app_gui import launch_gui
            launch_gui()
        except Exception as e:
            print(f"[Launcher] GUI launch encountered an issue: {e}")
            print("[Launcher] Falling back to Terminal CLI...")
            from cli.app_cli import run_cli
            run_cli()


if __name__ == "__main__":
    main()
