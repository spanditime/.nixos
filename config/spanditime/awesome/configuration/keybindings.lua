local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local volumesig = require("signals.volume")
local brightsig = require("signals.brightness")


-- awesome
--
awful.keyboard.append_global_keybindings({
   awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Mod1"   }, "l", function () awful.spawn(locker_cmd) end,
              {description = "lock", group = "awesome"}),
    -- awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    --           {description = "quit awesome", group = "awesome"}),
})

-- client
--
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
})

-- client keybindigs
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey,           }, "f",
			function (c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
			{description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
	})
end)



-- launcher
--
awful.keyboard.append_global_keybindings({
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().w_prompt:run() end,
              {description = "run prompt", group = "launcher"}),
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

	-- Programs
    awful.key({ modkey, "Shift"   }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Shift"   }, "e", function () awful.spawn(fm_cmd) end,
              {description = "open a file explorer", group = "launcher"}),
})

-- layout
--
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

	-- screen
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
  -- screen layout
    -- awful.key({ modkey, "Control" }, "e", function () awful.util.spawn("autorandr external",false) end,
    --           {description = "change screen mode to external", group = "screenlayout"}),
    awful.key({ modkey, "Control" }, "a", function () awful.util.spawn("autorandr clone-largest",false) end,
              {description = "change screen mode to clone-largest", group = "screenlayout"}),
    awful.key({ modkey, "Control" }, "v", function () awful.util.spawn("autorandr horizontal",false) end,
              {description = "change screen mode to vertical", group = "screenlayout"}),
    -- awful.key({ modkey, "Control" }, "h", function () awful.util.spawn("autorandr vertical",false) end,
    --           {description = "change screen mode to horizontal", group = "screenlayout"}),
    -- awful.key({ modkey, "Control", "Shift" }, "a", function () awful.util.spawn("autorandr vertical",false) end,
    --           {description = "change screen mode to code(vertical external)", group = "screenlayout"}),
    -- awful.key({ modkey, "Control" }, "i", function () awful.util.spawn("autorandr single",false) end,
    --           {description = "change screen mode to internal(laptop)", group = "screenlayout"}),
})

-- Media
--
awful.keyboard.append_global_keybindings({
	awful.key({}, "XF86AudioRaiseVolume", function ()
		awful.util.spawn("pamixer -i 4",false)
		volumesig.emit()
	end),
	awful.key({}, "XF86AudioLowerVolume", function ()
		awful.util.spawn("pamixer -d 4", false)
		volumesig.emit()
	end),
	awful.key({}, "XF86AudioMute", function ()
		awful.util.spawn("pamixer -t", false)
		volumesig.emit()
	end),
	awful.key({}, "XF86MonBrightnessUp", function ()
		awful.util.spawn("light -A 5",false)
		brightsig.emit()
	end),
	awful.key({}, "XF86MonBrightnessDown", function ()
		awful.util.spawn("light -U 5", false)
		brightsig.emit()
	end),
	awful.key({}, "XF86AudioPlay", function ()
		awful.util.spawn("playerctl play-pause",false)
	end),
	awful.key({}, "XF86AudioNext", function ()
		awful.util.spawn("playerctl next", false)
	end),
	awful.key({}, "XF86AudioPrev", function ()
		awful.util.spawn("playerctl previous", false)
	end),

	-- Printscreen
	awful.key({}, "Print", function () awful.util.spawn("flameshot screen", false) end),
	awful.key({ "Shift" }, "Print", function () awful.util.spawn("flameshot full", false) end),
	awful.key({ modkey }, "Print", function () awful.util.spawn("flameshot gui", false) end),
})

-- tag
--
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
	awful.key {
		modifiers   = { modkey },
		keygroup    = "numrow",
		description = "only view tag",
		group       = "tag",
		on_press    = function (index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	},
	awful.key {
		modifiers   = { modkey, "Control" },
		keygroup    = "numrow",
		description = "toggle tag",
		group       = "tag",
		on_press    = function (index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	},
	awful.key {
		modifiers = { modkey, "Shift" },
		keygroup    = "numrow",
		description = "move focused client to tag",
		group       = "tag",
		on_press    = function (index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	},
	awful.key {
		modifiers   = { modkey, "Control", "Shift" },
		keygroup    = "numrow",
		description = "toggle focused client on tag",
		group       = "tag",
		on_press    = function (index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	},
})
