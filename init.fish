function init --on-event init_nodenv
	status --is-interactive; and source (nodenv init - | psub)
end
