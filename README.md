# 💤 LazyVim Configuration

A highly customized LazyVim setup with extensive language support, AI integration, and modern development tools.

## ✨ Features

### 🤖 AI & Coding

- **Supermaven** - AI-powered code completion
- **LuaSnip** - Snippet engine
- **Mini Comment/Surround** - Quick commenting and surrounding
- **Yanky** - Enhanced yank/paste functionality
- **Refactoring** - Code refactoring tools

### 🔧 Development Tools

- **Compiler.nvim** - Code compilation and running with task management
- **Debug Adapter Protocol** - Integrated debugging
- **Telescope** - Fuzzy finder and picker
- **Aerial** - Code outline/symbols
- **Inc-rename** - Incremental renaming
- **Dial** - Enhanced increment/decrement

### 🎨 UI & Experience

- **Custom GitHub Dark Dimmed** theme with extensive language-specific highlighting
- **Indent Blankline** - Visual indentation guides
- **Treesitter Context** - Context-aware code display
- **Noice** - Modern UI for commands and notifications
- **Which-key** - Keybinding helper
- **Snacks.nvim** - Modern UI components and utilities

### 🌐 Language Support

#### Web Development

- **TypeScript/JavaScript** - Full TS/JS support with Volar/VTSLS
- **Vue** - Vue.js framework
- **Svelte** - Svelte framework
- **Astro** - Astro framework
- **Tailwind CSS** - Utility-first CSS
- **HTML/CSS/JSON/YAML** - Web standards

#### Backend & Systems

- **Python** - Python development with venv-selector
- **Go** - Go language support
- **Rust** - Rust programming with rustaceanvim
- **Java** - Java development with nvim-java and Spring Boot support
- **C/C++** - C/C++ with Clangd
- **C#/.NET** - .NET development with Omnisharp
- **Kotlin** - Kotlin language
- **Ruby** - Ruby development
- **PHP** - PHP development with Laravel framework support
- **Zig** - Zig language

#### Data & DevOps

- **SQL** - Database queries with vim-dadbod suite
- **Docker** - Container support
- **Git** - Version control with Diffview integration
- **Prisma** - Database ORM
- **CMake** - Build system
- **Toml** - Configuration files

#### Documentation & Markup

- **Markdown** - Documentation with preview
- **Typst** - Modern typesetting

### 🛠️ Tooling

- **Prettier** - Code formatting
- **ESLint** - JavaScript linting
- **Neoconf** - Project configuration
- **Project.nvim** - Project management with custom patterns
- **Rest** - HTTP client with kulala.nvim
- **Dot** - Graphviz support
- **Neotest** - Testing framework with multi-language adapters

### 🚀 Unique Features

- **Real-time Collaboration** - Nomad for pair programming
- **Database Integration** - vim-dadbod for database management
- **Framework Support** - Laravel, Spring Boot, Flutter-tools
- **Competitive Programming** - cphelper.nvim
- **Performance Optimizations** - Custom Neovim options for better responsiveness

## 🚀 Installation

### Prerequisites

In windows, you can use [scoop](https://scoop.sh/) to install them.

- **Docker:**
  - [lazydocker](https://github.com/jesseduffield/lazydocker)

- **Git:**
  - [lazygit](https://github.com/jesseduffield/lazygit)

- **Telescope:**
  - [fd](https://github.com/sharkdp/fd)
  - [bat](https://github.com/sharkdp/bat)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [make](https://www.gnu.org/software/make/)
  - [mingw-nuwen](https://nuwen.net/mingw.html)

- **Nerd Font (For Icons):**
  - [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
  - [Other Fonts](https://www.nerdfonts.com/font-downloads)

### Quick Install (Recommended)

#### Linux/macOS

```bash
bash <(curl -s https://raw.githubusercontent.com/Alexis12119/LazyVim-starter/main/installer/install.sh)
```

#### Windows (PowerShell)

```powershell
Invoke-WebRequest https://raw.githubusercontent.com/Alexis12119/LazyVim-starter/main/installer/install.ps1 -UseBasicParsing | Invoke-Expression
```

### Manual Install

1. Backup your current Neovim configuration:

   ```bash
   # Linux/macOS
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup

   # Windows
   mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
   mv $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.backup
   ```

2. Clone this configuration:

   ```bash
   # Linux/macOS
   git clone https://github.com/Alexis12119/LazyVim-starter.git ~/.config/nvim

   # Windows
   git clone https://github.com/Alexis12119/LazyVim-starter.git $env:LOCALAPPDATA\nvim
   ```

3. Start Neovim and let Lazy install the plugins:

   ```bash
   nvim
   ```

### Installer Features

- **Interactive prompts** to confirm overwrites
- **Plugin cleanup** option for fresh installs
- **Cross-platform support** (Linux, macOS, Windows)

## ⚙️ Configuration

### Theme

- **Theme**: Custom GitHub Dark Dimmed with extensive language-specific highlighting
- **Telescope Style**: Borderless
- **Custom Highlights**: Detailed syntax highlighting for Python, Java, JavaScript/TypeScript, Go, Rust, PHP, Dart, C#, and more

### Key Customizations

- **Performance Optimizations**: Faster completion (100ms updatetime), optimized UI settings
- **Custom LSP Settings**: Tailored configurations for each language
- **AI Integration**: Supermaven for intelligent code completion
- **Project Management**: Custom patterns for project detection
- **Database Tools**: Integrated vim-dadbod suite for database management

### Disabled Features

The following plugins are intentionally disabled to avoid conflicts:

- **nvim-tree** - File explorer (disabled)
- **oil.nvim** - Buffer explorer (disabled)
- **opencode** - AI assistant (disabled, Supermaven used instead)

## 📁 Structure

```
~/.config/nvim/
├── lua/
│   ├── config/          # Core configuration (options, keymaps, autocmds)
│   │   ├── statusline/  # Custom statusline configuration
│   │   └── tabufline/   # Tabline configuration
│   ├── plugins/         # Plugin configurations
│   │   ├── ai/          # AI-related plugins
│   │   ├── coding/      # Language-specific tools
│   │   ├── collaboration/ # Real-time collaboration
│   │   ├── colorscheme/ # Theme configuration
│   │   ├── editor/      # Core editor plugins
│   │   ├── lsp/         # LSP configurations and settings
│   │   ├── ui/          # User interface plugins
│   │   └── util/        # Utility plugins
│   └── themes/          # Custom themes (GitHub Dark Dimmed)
├── README.md
├── init.lua            # Entry point
├── lazyvim.json        # LazyVim extras configuration
├── lazy-lock.json      # Plugin lockfile
├── .luarc.json         # Lua language server config
└── .neoconf.json       # Neoconf settings
```

## 🔧 What's Different from LazyVim

### Custom Additions

- **Compiler.nvim** - Code compilation and task management
- **Nomad** - Real-time collaboration for pair programming
- **Database Tools** - vim-dadbod suite for database management
- **Framework Support** - Laravel, Spring Boot, Flutter-tools
- **Competitive Programming** - cphelper.nvim
- **Custom Theme** - Extensive GitHub Dark Dimmed customization

### Enhanced Features

- **Project Management** - Custom project detection patterns
- **Python Development** - venv-selector integration
- **Testing** - Multi-language neotest adapters
- **Performance** - Optimized Neovim options for better responsiveness

### Disabled Features

- nvim-tree and oil.nvim (file explorers)
- opencode plugins (using Supermaven instead)

## 🛠️ Customization Guide

### Adding New Plugins

1. Create a new file in `lua/plugins/` directory
2. Follow the LazySpec format used in existing plugin files
3. Use the import system in `lua/plugins/init.lua`

### Modifying Theme

- Edit `lua/themes/github_dark_dimmed.lua` for theme colors
- Modify `lua/highlights.lua` for additional syntax highlighting
- Language-specific highlights are defined in the theme file

### Project Configuration

- Project detection patterns are in `lua/plugins/util/project.lua`
- Add new patterns to the `patterns` array for your project types

### LSP Customization

- Language-specific LSP settings are in `lua/plugins/lsp/settings/`
- Create new files for additional language servers

## 🔍 Troubleshooting

### Common Issues

- **Plugin not loading**: Check if plugin is enabled in configuration
- **LSP not starting**: Verify language server is installed and configured
- **Theme issues**: Ensure terminal supports true colors (24-bit)
- **Performance**: Check for heavy plugins or large files

### Getting Help

- Check LazyVim documentation for base functionality
- Review plugin-specific documentation in their repositories
- Open an issue on this repository for configuration-specific problems

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

1. Fork repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- [LazyVim](https://github.com/LazyVim/LazyVim) - The base distribution
- [NvChad](https://github.com/NvChad/NvChad) - UI components and inspiration
- All the plugin authors and contributors

## 🔗 Links

- **Repository**: [https://github.com/Alexis12119/LazyVim-starter](https://github.com/Alexis12119/LazyVim-starter)
- **LazyVim Docs**: [https://lazyvim.github.io/](https://lazyvim.github.io/)
- **Neovim**: [https://neovim.io/](https://neovim.io/)
