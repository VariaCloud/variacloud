module group

import toml
import os
import util

pub fn read_config(path string) GroupConfig {
	toml_string := os.read_file(path) or {
		println('${util.colors[util.ColorName.yellow]}Reading Error: $err')
		return GroupConfig{
			name: ''
			min_ram: 0
			max_ram: 0
			dynamic: false
			template: ''
		}
	}

	config := toml.decode[GroupConfig](toml_string) or {
		println('${util.colors[util.ColorName.yellow]}Toml Conversion: $err')
		return GroupConfig{
			name: ''
			min_ram: 0
			max_ram: 0
			dynamic: false
			template: ''
		}
	}

	return config
}

pub fn create_config(path string, config GroupConfig) {
	toml_string := toml.encode(config)

	os.write_file(path, toml_string) or {
		println('${util.colors[util.ColorName.yellow]}Save Error: $err')
	}

	println('${util.colors[util.ColorName.magenta]}Group Config Saved on Path: $path')
}

pub struct GroupConfig {
	pub:
	name string
	min_ram int
	max_ram int
	dynamic bool
	template string
}
