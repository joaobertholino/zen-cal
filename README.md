# Zen-Cal — calendário da Waybar no Hyprland

Integração pessoal do calendário para o desktop Gentoo, mantida como submódulo de [dotfiles](https://github.com/joaobertholino/dotfiles) em `~/.config/zen-cal`. Conferida em **25/10/2026**.

O repositório contém tema, script e regra de janela. O executável do calendário é instalado separadamente.

## Aparência e comportamento

- Janela flutuante de **320 × 240 pixels**, centralizada horizontalmente, a 28 px do topo.
- Classe `TUI.zencal`, título `Calendário`, cantos retos e borda de 1 px.
- Fundo preto e texto branco/cinza; o dia atual usa fundo cinza `#737373`.
- Alacritty dedicado, com preenchimento de 8 × 6 e dimensões iniciais de 38 colunas × 14 linhas, ajustadas pela regra do compositor.
- O calendário executa diretamente no Alacritty, sem iniciar a sessão tmux usada pelo terminal principal.

## Arquivos

| Arquivo | Função |
| --- | --- |
| `zen-cal.conf` | Paleta usada pelo calendário |
| `toggle.sh` | Fecha processos `zen-cal` do usuário ou abre o calendário |
| `hyprland.lua` | Regra Lua de classe, tamanho e posicionamento |

## Controles

- Clique esquerdo no relógio da Waybar: abrir ou fechar.
- `h` / `l` ou setas esquerda / direita: mês anterior / seguinte.
- `k` / `j` ou setas cima / baixo: ano anterior / seguinte.
- `r` / Enter: voltar para hoje.
- `q` / Esc: fechar.

O botão direito da Waybar seleciona o formato alternativo do relógio (`format-alt-click: 3`). Na configuração principal atual, `format` e `format-alt` são iguais; por isso essa alternância não muda o texto exibido.

O script fecha todos os processos com nome exato `zen-cal` pertencentes ao usuário. Isso também afeta uma instância do calendário aberta manualmente.

## Instalação

Dependências: Hyprland com API Lua `hl`, Waybar, Alacritty, Bash, `pgrep`/`kill` e `notify-send` para informar quando o executável está ausente.

No repositório principal:

```sh
git submodule update --init --recursive .config/zen-cal
```

Para instalação independente, faça backup do destino existente e clone em uma pasta vazia:

```sh
git clone git@github.com:joaobertholino/zen-cal.git "$HOME/.config/zen-cal"
```

Instale o binário em `~/.local/bin/zen-cal` e confirme a permissão de execução:

```sh
test -x "$HOME/.local/bin/zen-cal"
"$HOME/.config/zen-cal/toggle.sh"
```

O teste do script abre o calendário ou fecha uma instância já aberta.

### Integração da Waybar

No módulo `clock`, ajuste o caminho para sua home:

```json
{
  "on-click": "/home/joaob/.config/zen-cal/toggle.sh",
  "format-alt-click": 3
}
```

Esse trecho deve ser incorporado ao módulo existente, preservando suas demais opções. O script usa `alacritty` pelo `PATH`; na sessão desta máquina ele está em `/opt/hyprland/bin`.

### Integração do Hyprland

O arquivo `.config/hypr/modules/rules.lua` do repositório principal carrega:

```lua
dofile(os.getenv("HOME") .. "/.config/zen-cal/hyprland.lua")
```

A regra usa a API Lua `hl.window_rule`. Para outra versão/sintaxe do Hyprland, adapte a regra antes de usá-la. Recarregue o compositor com `hyprctl reload` e recarregue a Waybar após alterar o módulo do relógio. Um clique posterior aplica mudanças feitas em `toggle.sh` e no tema.

## Binário instalado

Origem: [beaterblank/zen-cal](https://github.com/beaterblank/zen-cal).
Versão registrada da instalação: **v1.0.2**.
Caminho: `~/.local/bin/zen-cal`, fora deste repositório.

SHA-256 do binário local, conferido em 25/10/2026:

```text
563ea80aaaa72eeac443e199bf3766dc657c34cce4b971fe0555a66a83b3e672
```

Uma atualização legítima do binário pode alterar esse hash; atualize este registro depois de conferir a nova origem.

## Manutenção e Git

A cópia local utiliza a branch `main` e o remoto `personal`. O script `~/.local/bin/auto-push.sh` do projeto principal publica este submódulo antes de atualizar a referência no pai, a cada hora pelo systemd do usuário.

Para manutenção manual, publique primeiro o commit deste repositório e depois atualize seu gitlink em `dotfiles`. A configuração não instala nem atualiza o executável do calendário. Para recuperação, restaure uma versão conhecida dos três arquivos e recarregue as integrações afetadas.
