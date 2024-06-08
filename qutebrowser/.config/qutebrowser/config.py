from qutebrowser.api import interceptor
config = config
c = c

# apply colors
import everforest.draw
everforest.draw.color(c)

config.set("colors.webpage.darkmode.enabled", True)

# Bindings
config.bind('J', ':tab-prev')
config.bind('K', ':tab-next')
config.bind('wq', 'session-save ;; close')
config.bind('aj', 'spawn --userscript qute-pass')
config.bind('ak', 'spawn --userscript qute-pass --password-only')

c.content.javascript.clipboard="access-paste"

config.set("downloads.location.suggestion", "both")

c.editor.command = ["alacritty", "-e", "nvim", "{}"]

c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = 'always'

c.aliases['qr'] = 'spawn --userscript qr'

# Block ads in yt
def filter_yt(info: interceptor.Request):
    url = info.request_url
    if (url.host() == 'www.youtube.com' and url.path() == '/get_video_info' and '&adformat=' in url.query()):
        info.block()

interceptor.register(filter_yt)

# Load existing settings made via :set
config.load_autoconfig()
