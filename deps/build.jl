include(joinpath(@__DIR__, "../src/AtomShell/install.jl"))

function get_installed_version()
    _path = is_apple() ? joinpath(folder(), "version") : joinpath(folder(), "atom", "version")
    strip(readstring(_path), 'v')
end

if isinstalled() && !(version == get_installed_version())
    Blink.AtomShell.install()
end
