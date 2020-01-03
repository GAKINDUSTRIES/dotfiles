# Custom plugins that will be installed
dir="$HOME/.oh-my-zsh/custom/plugins"

PLUGINS=(
  "https://github.com/paulirish/git-open.git $dir/git-open"
)

echo ""
echo ""
echo "Installing oh-my-zsh custom plugins..."

if [ -d "$dir" ] && [ ! -d "$dir/git-open" ]; then
  for i in "${PLUGINS[@]}"; do
    git clone $i
  done
fi
