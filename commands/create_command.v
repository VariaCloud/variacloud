module commands

import util
import os
import group

pub fn get_name() string {
	return 'create'
}

pub fn create_command(args []string) {
	if args.len >= 3 {
		match args[1] {
			'group' {
				println(util.colors[util.ColorName.green] + 'Create Group! name: ' + args[2])
				config := group.GroupConfig{
					name: args[2]
					min_ram: args[3].int()
					max_ram: args[4].int()
					dynamic: args[5].bool()
					template: args[6]
				}
				group.create_config('groups/' + args[2] + '.toml', config)
			}
			'template' {
				println(util.colors[util.ColorName.green] + 'Create Template! name: ' + args[2])
				os.mkdir('templates/${args[2]}') or {}
				println('${util.colors[util.ColorName.green]}Template ${args[2]} Created!')
			}
			else {
				println(util.colors[util.ColorName.red] + 'use create <group/template> <name>')
			}
		}
	} else {
		println(util.colors[util.ColorName.red] + 'use create <group/template> <name>')
	}
}
