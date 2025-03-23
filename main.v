module main

import os
import commands
import util

fn init_directory() {
	os.mkdir('templates') or {}
	println('${util.colors[util.ColorName.yellow]}Template Directory Created!')
	os.mkdir('groups') or {}
	println('${util.colors[util.ColorName.yellow]}Groups Directory Created!')
}

fn main() {
	mut app_running := true
	mut cmd_map := map[string]fn ([]string){}

	cmd_map[commands.get_name()] = commands.create_command

	logo := os.read_file("ascii_art.txt") or { panic("Fehler beim Laden!") }
	println('${util.colors[util.ColorName.cyan]}${logo}')

	init_directory()

	for app_running {
		print('${util.colors[util.ColorName.cyan]}variacloud:')
		cmd_line := os.get_line()
		args := cmd_line.split(' ')
		for key, fun in cmd_map {
			if args[0] == key {
				fun(args)
			}
		}
	}
}
