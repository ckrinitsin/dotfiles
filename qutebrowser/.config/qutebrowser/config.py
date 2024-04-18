import dracula.draw

config = config
c = c

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

config.set("colors.webpage.darkmode.enabled", True)

# Bindings
config.bind('J', ':tab-prev')
config.bind('K', ':tab-next')
config.bind('wq', 'session-save ;; close')
config.bind('aj', 'spawn --userscript qute-pass')
config.bind('ak', 'spawn --userscript qute-pass --password-only')

c.content.javascript.clipboard="access-paste"

config.set("downloads.location.suggestion", "both")

c.editor.command = ["kitty", "-e", "nvim", "{}"]

c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = 'always'

# Load existing settings made via :set
config.load_autoconfig()
