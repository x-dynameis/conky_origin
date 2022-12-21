-- Conky, a system monitor https://github.com/brndnmtthws/conky
--
-- This configuration file is Lua code. You can write code in here, and it will
-- execute when Conky loads. You can use it to generate your own advanced
-- configurations.
--
-- Try this (remove the `--`):
--
--   print("Loading Conky config")
--
-- For more on Lua, see:
-- https://www.lua.org/pil/contents.html

conky.config = {
--    alignment = 'top_left',
    alignment = 'top_right',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'white',
    default_outline_color = 'white',
    default_shade_color = 'white',
    double_buffer = true,
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    extra_newline = false,
    font = 'DejaVu Sans Mono:size=12',
    --gap_x = 60,
    gap_x = -460,
    gap_y = 0,
    minimum_height = 5,
    minimum_width = 5,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_ncurses = false,
    out_to_stderr = false,
    out_to_x = true,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'desktop',
    own_window_argb_visual=true,
    own_window_argb_value=130,
    show_graph_range = false,
    show_graph_scale = false,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    use_xft = true,
lua_load = './conky-draw/conky_draw.lua', 
lua_draw_hook_pre = 'main',
--lua_load = '~/.conky/seamod/seamod_rings.lua', 
--lua_draw_hook_pre = 'main',
    color0 = 'white',
--    color1 = 'green',
    color1 = 'fcb100',
    color2 = '00a82d',
}

conky.text = [[
${color grey}Info:$color ${scroll 32 Conky $conky_version - $sysname $nodename $kernel $machine}
$hr
Battery Temp:${font DejaVu Sans Mono:size=12}${acpitemp}°C${font}
${color grey}Uptime:$color $uptime
${color grey}Frequency (in MHz):$color $freq
${color grey}Frequency (in GHz):$color $freq_g
${color2}RAM Usage: $mem/$memmax - $memperc% ${membar 4}
#${color grey}RAM Usage:$color $mem/$memmax - $memperc% ${membar 4}
${color grey}Swap Usage:$color $swap/$swapmax - $swapperc% ${swapbar 4}
#${color grey}CPU Usage:$color $cpu% ${cpubar 4}
#${color grey}CPU0 Usage:$color ${cpu cpu0}% ${cpubar 4 cpu0}
#${color grey}CPU1      :$color ${cpu cpu1}% ${cpubar 4 cpu1}
#${color grey}CPU2      :$color ${cpu cpu2}% ${cpubar 4 cpu2}
#${color grey}CPU3      :$color ${cpu cpu3}% ${cpubar 4 cpu3}
#${color grey}CPU4      :$color ${cpu cpu4}% ${cpubar 4 cpu4}
#${color grey}CPU5      :$color ${cpu cpu5}% ${cpubar 4 cpu5}








#$hr
#${color grey}Processes:$color $processes  ${color grey}Running:$color $running_processes
$hr
#Battery Temp:${font DejaVu Sans Mono:size=12}${acpitemp}°C${font}
#${font size22}${time}
${font NTR DejaVu Sans Mono:size=15}${time %Y/%m/%d}   ${font NTR DejaVu Sans Mono:size=22}${time %k:%M}${font NTR DejaVu Sans Mono:size=18}${time :%S}${font}
$hr
#${color grey}File systems:
${color2}File systems:${color grey}
 /    $color${fs_used /}/${fs_size /} ${fs_bar 6 /}
 /home $color${fs_used /home}/${fs_size /home} ${fs_bar 6 /home}
$hr
${color2}Networking:
#${color2}Public${color0}${alignr}${execi 3600 wget -q -O /dev/stdout http://checkip.dyndns.org/ | cut -d : -f 2- | cut -d \< -f -1}
${color2}Public:${color0}${alignr}${texeci 3600 curl ifconfig.me}
${color2}Local: ${color0}${nodename}${alignr}${addr enp5s0}
#Up:$color ${upspeed enp5s0} ${color grey} - Down:$color ${downspeed enp5s0}
${color grey}Up:${upspeed enp5s0}
$color ${upspeedgraph enp5s0} 
Down:${downspeed enp5s0}
$color ${downspeedgraph enp5s0}
$hr
${execpi 60 python3 ./script.py conky}
$hr
${color grey}Processes:$color $processes  ${color grey}Running:$color $running_processes
${color grey}Name              PID     CPU%   MEM%
${color lightgrey} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
${color lightgrey} ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
${color lightgrey} ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
${color lightgrey} ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
${color lightgrey} ${top name 5} ${top pid 5} ${top cpu 5} ${top mem 5}
${color lightgrey} ${top name 6} ${top pid 6} ${top cpu 6} ${top mem 6}
${image ./img/girl13.1.png -p 230,224 -s 136x102}
${image ./img/girl3.1.png -p 310,200 -s 73x102}
]]

