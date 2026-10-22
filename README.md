# Zen-Cal — integração com Waybar e Hyprland

Configuração pessoal para Arch Linux, mantida como submódulo de `joaobertholino/dotfiles` em `.config/zen-cal`.

## Aparência e comportamento

- Janela flutuante de **320 × 240 pixels**, centralizada abaixo do relógio.
- Fundo preto, cantos retos e borda fina, herdados do tema do Hyprland e Alacritty.
- Paleta de texto em branco e cinza; o dia atual usa fundo cinza.
- Executa diretamente no Alacritty, sem iniciar a sessão tmux do terminal.

## Controles

- Clique esquerdo no relógio: abre ou fecha o calendário.
- Clique direito: alterna o formato do relógio (configurado na Waybar).
- `h` / `l` ou setas esquerda / direita: mês anterior / seguinte.
- `k` / `j` ou setas cima / baixo: ano anterior / seguinte.
- `r` / Enter: volta para hoje.
- `q` / Esc: fecha o calendário.

## Arquivos

| Arquivo | Função |
| --- | --- |
| `zen-cal.conf` | Cores lidas pelo calendário |
| `toggle.sh` | Abre ou fecha a janela dedicada do Alacritty |
| `hyprland.lua` | Regra de tamanho e posição para a configuração Lua do Hyprland |

## Instalação

Dependências: Hyprland com configuração Lua, Waybar, Alacritty, Bash, `pgrep` e `notify-send` (para informar a ausência do executável).

Instale o executável oficial em `~/.local/bin/zen-cal` e dê permissão de execução. Posicione este repositório em `~/.config/zen-cal`.

No módulo `clock` da Waybar, defina `on-click` como o caminho absoluto de `~/.config/zen-cal/toggle.sh`. Para alternar o formato com o botão direito, use `"format-alt-click": 3`.

Na configuração Lua do Hyprland, carregue a regra:

```lua
dofile(os.getenv("HOME") .. "/.config/zen-cal/hyprland.lua")
```

Recarregue o Hyprland e a Waybar após alterar essas integrações.

## Executável oficial

Fonte: https://github.com/beaterblank/zen-cal

Versão instalada: **v1.0.2**. O executável fica fora deste repositório.

SHA-256 verificado: `563ea80aaaa72eeac443e199bf3766dc657c34cce4b971fe0555a66a83b3e672`.

## Atualizações

Publique primeiro as alterações neste repositório e depois atualize a referência do submódulo no `dotfiles`.
