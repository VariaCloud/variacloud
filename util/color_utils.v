module util

pub enum ColorName {
	black
	red
	green
	yellow
	blue
	magenta
	cyan
	white

	bg_black
	bg_red
	bg_green
	bg_yellow
	bg_blue
	bg_magenta
	bg_cyan
	bg_white

	reset
}

pub const colors = {
	ColorName.black:   "\e[30m"
	ColorName.red:     "\e[31m"
	ColorName.green:   "\e[32m"
	ColorName.yellow:  "\e[33m"
	ColorName.blue:    "\e[34m"
	ColorName.magenta: "\e[35m"
	ColorName.cyan:    "\e[36m"
	ColorName.white:   "\e[37m"

	ColorName.bg_black:   "\e[40m"
	ColorName.bg_red:     "\e[41m"
	ColorName.bg_green:   "\e[42m"
	ColorName.bg_yellow:  "\e[43m"
	ColorName.bg_blue:    "\e[44m"
	ColorName.bg_magenta: "\e[45m"
	ColorName.bg_cyan:    "\e[46m"
	ColorName.bg_white:   "\e[47m"

	ColorName.reset:   "\e[0m"
}
