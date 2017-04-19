# System-wide .cshrc file for csh(1).

if ($?prompt) then
	set promptchars = "%#"
	if ($?tcsh) then
		set prompt = "[%m:%c3] %n%# "
		alias cd 'pushd \!* >/dev/null;'
	else
		set prompt = "[%m:%c3] `id -nu`%# "
	endif
endif
