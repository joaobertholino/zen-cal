-- Calendário do relógio da Waybar, centralizado abaixo da barra.
hl.window_rule({
    name = "zen-cal",
    match = { class = "^TUI[.]zencal$" },
    float = true,
    size = "320 240",
    move = "((monitor_w-window_w)/2) 28",
    rounding = 0,
    border_size = 1,
})
