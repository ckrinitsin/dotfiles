from qutebrowser.api import interceptor
config = config
c = c

# apply colors
import everforest.draw
everforest.draw.color(c)

config.set("input.mode_override", "passthrough", "cad.onshape.com")

# Bindings
config.bind('J', ':tab-prev')
config.bind('K', ':tab-next')
config.bind("wd", "set content.javascript.enabled false")
config.bind("we", "set content.javascript.enabled true")

c.content.javascript.clipboard="access-paste"

config.set("downloads.location.suggestion", "both")

c.editor.command = ["alacritty", "-e", "nvim", "{}"]

c.colors.webpage.preferred_color_scheme = 'dark'

config.bind(',m', 'spawn mpv {url}')
config.bind(',M', 'hint links spawn mpv {hint-url}')

# Block ads in yt
def filter_yt(info: interceptor.Request):
    url = info.request_url
    if (url.host() == 'www.youtube.com' and url.path() == '/get_video_info' and '&adformat=' in url.query()):
        info.block()

interceptor.register(filter_yt)

# Load existing settings made via :set
config.load_autoconfig()
