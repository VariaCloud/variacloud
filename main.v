module main

import os

const colors = {
	"black":   "\e[30m"
	"red":     "\e[31m"
	"green":   "\e[32m"
	"yellow":  "\e[33m"
	"blue":    "\e[34m"
	"magenta": "\e[35m"
	"cyan":    "\e[36m"
	"white":   "\e[37m"

	"bg_black":   "\e[40m"
	"bg_red":     "\e[41m"
	"bg_green":   "\e[42m"
	"bg_yellow":  "\e[43m"
	"bg_blue":    "\e[44m"
	"bg_magenta": "\e[45m"
	"bg_cyan":    "\e[46m"
	"bg_white":   "\e[47m"

	"reset":   "\e[0m"
}

fn test_comment(args []string) {
	match args[1] {
		'group' {
			println('Create Group! name: ' + args[2])
		}
		'template' {
			println('Create Template! name: ' + args[2])
		}
		else {
			println('use create <group/template> <name>')
		}
	}
}

fn main() {
	mut app_running := true
	mut cmd_map := map[string]fn ([]string){}

	cmd_map['create'] = test_comment

	logo := os.read_file("ascii_art.txt") or { panic("Fehler beim Laden!") }
	println('${colors['cyan']}${logo}')

	for app_running {
		print('${colors['cyan']}variacloud:')
		cmd_line := os.get_line()
		args := cmd_line.split(' ')
		for key, fun in cmd_map {
			if args[0] == key {
				fun(args)
			}
		}
	}
}
