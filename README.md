# 💠 Prism.Tools (Docker version)

**Developer Utilities, Refined**

A collection of privacy-focused, client-side developer tools. No tracking, no ads, no server-side processing. Everything runs in your browser.

[![Live Demo](https://img.shields.io/badge/demo-live-brightgreen)](https://blgardner.github.io/prism.tools/)
[![License](https://img.shields.io/badge/License-Custom-blue.svg)](LICENSE.md)
[![Donate](https://img.shields.io/badge/donate-PayPal-blue.svg)](https://www.paypal.com/paypalme/BLGApps)

## ✨ Features

- **Client-Side** - All processing happens in your browser
- **Privacy First** - No data collection, no tracking, no analytics
- **Always Free** - Free to use, online and local
- **40+ Tools** - Constantly growing collection
- **Modern UI** - Clean, dark-themed interface
- **Keyboard Shortcuts** - Press `/` to search tools
- **Recent Tools** - Quick access to your last used tools
- **Mobile Friendly** - Responsive design for all devices

## 🛠️ Tool Categories

### 📋 Formatters & Parsers
- Code Formatter - Format & beautify code
- JSON Formatter - Format & validate JSON
- SQL Formatter - Format SQL queries
- YAML ↔ JSON Converter - Convert between YAML and JSON
- CURL to Fetch - Convert CURL commands to JavaScript
- JSON to TypeScript - Generate TypeScript interfaces from JSON data
- SVG to JSX - Convert SVG markup to React-compatible JSX
- URL Parser & Breakdown - Break down URLs into their components
	
### 🔒 Security & Dev
- JWT Decoder - Decode JWT tokens
- Password Generator - Generate secure passwords
- Hash Generator - MD5, SHA-256, SHA-512
- UUID Generator - Generate UUIDs v1/v4
- Subnet Calculator - IP & network calculations
- HTTP Status Codes- Complete HTTP 1xx–5xx reference with practical API guidance
- Bash Script Generator - Generate clean, safe shell script boilerplate instantly
- Git Command Helper - Find the exact Git commands you need
	
### 🎨 Visual & CSS
- SVG Editor - Create & edit SVG graphics
- CSS Gradient Generator - Create CSS gradients
- CSS Shadow Generator - Create box shadows
- Clip-path Maker - Create polygon clip-paths
- Glassmorphism Generator - Frosted glass effects
- Favicon Generator - Create favicons from text/images/emoji
- Color Converter - HEX, RGB, HSL converter
- Image Tools - Resize, convert images
- Animation Timing Visualizer - Compare animation timing functions side-by-side
- CSS Grid Layout Generator - Visual grid builder with instant CSS output
	
### ✨ Generators & Content
- Lorem Ipsum - Generate placeholder text
- Random Data - Generate test data
- QR Code Generator - Generate QR codes
- ASCII Art Generator - Convert images/text to ASCII
- Slug Generator - Generate URL-safe slugs
- Meta Tag Generator - Generate SEO & Open Graph tags
- Robots.txt Generator - Generate robots.txt files

### 🔄 Encoders & Transformers
- Base64 - Encode/decode Base64
- URL Encoder - Encode/decode URLs
- HTML Encoder - Encode/decode HTML entities
- Case Converter - Convert text case
- String Escaper - Escape strings for multiple languages
- Minifier - Minify CSS/JS/HTML
- Timestamp Converter - Unix timestamp converter
- List Sorter - Sort & filter lists
- Unit Converter - Convert between units
- Regex Tester - Test regex patterns
- Diff Checker - Compare text differences
- Markdown Preview - Live markdown preview
- Cron Builder - Build cron expressions

## 🚀 Quick Start

### Option 1: Use Online
Use the developer repository: [https://github.com/DmitryTokyo/prism.tools.docker](https://github.com/DmitryTokyo/prism.tools.docker)

### Option 2: Run Locally (No Docker)
```bash
# Clone the repository
git clone https://github.com/DmitryTokyo/prism.tools.docker.git

# Navigate to directory
cd prism.tools.docker

# Open in browser (no build step required!)
open index.html
# or
python -m http.server 8000
```

### Option 3: Run with Docker
```bash
# Clone the repository
git clone https://github.com/DmitryTokyo/prism.tools.docker.git

# Navigate to directory
cd prism.tools.docker

# Start with interactive port prompt
./run-docker.sh
```

The script:
- detects an already running `prism-tools` container and its current host port
- if found, asks whether to keep the current port (`Yes` by default)
- if no running container is found (or you choose `No`), asks which host port to use
- uses `880` as the default port
- validates the port and checks whether it is already occupied
- starts the app at `http://localhost:<your-port>`

Alternative manual commands:
```bash
# Start on a specific port (example: 8099)
HOST_PORT=8099 docker compose up --build -d

# View status and logs
docker compose ps
docker compose logs -f

# Stop
docker compose down
```

## 📁 Project Structure
```
prism.tools/
├── index.html              # Main landing page
├── Dockerfile              # Container image for static hosting (nginx)
├── docker-compose.yml      # Local Docker orchestration
├── run-docker.sh           # Interactive Docker start script
├── tools/                  # Individual tool pages
│   ├── json-formatter.html
│   ├── base64.html
│   ├── jwt-decoder.html
│   └── ... (+ more)
├── README.md
└── LICENSE.md
```

## 🎯 Design Principles

1. **Privacy First** - No external dependencies that track users
2. **Fast & Lightweight** - No frameworks, minimal JavaScript
3. **Accessible** - Works without JavaScript where possible
4. **Self-Contained** - Each tool is a single HTML file
5. **No Build Step** - Pure HTML/CSS/JS, deploy anywhere
6. **Consistent UX** - Unified dark theme across all tools

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report Issues** - Found a bug? Open an issue
2. **Suggest Features** - Ideas for new tools or improvements

## 💖 Support

If you find Prism.Tools useful, consider supporting development:

- This repository is a fork of [BLGardner/prism.tools](https://github.com/BLGardner/prism.tools).
- ⭐ [Star the repository](https://github.com/DmitryTokyo/prism.tools.docker)
- 🐛 [Report bugs and suggest features](https://github.com/DmitryTokyo/prism.tools.docker/issues)
- 🍴 [Fork and contribute](https://github.com/DmitryTokyo/prism.tools.docker/fork)

## 📜 License

License - see [LICENSE](LICENSE.md) file for details

## 🙏 Acknowledgments

Built with:
- Pure HTML, CSS, and JavaScript
- No frameworks or build tools
- CDN resources from [cdnjs.cloudflare.com](https://cdnjs.cloudflare.com)
- Icons from Unicode emoji

Special thanks to all contributors and supporters! 💜

---

Made with 💜 for developers

*Privacy-focused • Ad-free*
