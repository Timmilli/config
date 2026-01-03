return {
	s(
		{ trig = "#ifndef", snippetType = "snippet", desc = "Classic ifndef", wordTrig = true },
		fmta(
			[[
				#ifndef <>
				#define <>

				#endif // <>
        ]],
			{ i(1), rep(1), rep(1) }
		)
	),
}
