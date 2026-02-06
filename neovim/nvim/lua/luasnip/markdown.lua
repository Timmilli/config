return {
	s({ trig = "&uarr", snippetType = "autosnippet", dscr = "An up arrow" }, t("↑")),
	s({ trig = "&darr", snippetType = "autosnippet", dscr = "A down arrow" }, t("↓")),
	s({ trig = "&larr", snippetType = "autosnippet", dscr = "A left arrow" }, t("←")),
	s({ trig = "&rarr", snippetType = "autosnippet", dscr = "A right arrow" }, t("→")),
	s({ trig = "img", snippetType = "autosnippet", dscr = "Makes a image environment" }, {
		t({ "<div style='display: flex; justify-content: center; gap: 3rem;'>", "    <img alt='" }),
		i(1, "Alt text"),
		t({ "'", "         src='" }),
		i(2, "Image path"),
		t({ "' />", "</div>" }),
	}),
}
