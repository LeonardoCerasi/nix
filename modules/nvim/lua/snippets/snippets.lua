local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function ()
	return { os.date "%d-%m-%Y" }
end

ls.add_snippets(nil, {
	all = {
		snip({
			trig = "date",
			namr = "date",
			dscr = "Current date in dd-mm-YYYY",
		}, {
			func(date, {}),
		})
	},
	tex = {
		-- environments
		snip({
			trig = "eq",
			namr = "equation",
			dscr = "Equation environment",
		}, {
			text({"\\begin{equation}", "\t"}),
			insert(2, ""),
			text({"","\t\\label{eq:"}),
			insert(1, ""),
			text({"}", "\\end{equation}"})
		}),
		snip({
			trig = "definition",
			namr = "definition",
			dscr = "Definition environment",
		}, {
			text({"\\begin{definition}", "\t"}),
			insert(1, ""),
			text({"", "\\end{definition}"})
		}),
		snip({
			trig = "theorem",
			namr = "theorem",
			dscr = "Theorem environment",
		}, {
			text({"\\begin{theorem}", "\t"}),
			insert(1, ""),
			text({"", "\\end{theorem}"})
		}),
		snip({
			trig = "proposition",
			namr = "proposition",
			dscr = "Proposition environment",
		}, {
			text({"\\begin{proposition}", "\t"}),
			insert(1, ""),
			text({"", "\\end{proposition}"})
		}),
		snip({
			trig = "proof",
			namr = "proof",
			dscr = "Proof environment",
		}, {
			text({"\\begin{proofbox}", "\t\\begin{proof}", "\t\t"}),
			insert(1, ""),
			text({"", "\t\\end{proof}", "\\end{proofboox}"})
		}),
		snip({
			trig = "lemma",
			namr = "lemma",
			dscr = "Lemma environment",
		}, {
			text({"\\begin{lemma}", "\t"}),
			insert(1, ""),
			text({"", "\\end{lemma}"})
		}),
		snip({
			trig = "example",
			namr = "example",
			dscr = "Example environment",
		}, {
			text({"\\begin{example}", "\t"}),
			insert(1, ""),
			text({"", "\\end{example}"})
		}),
		snip({
			trig = "split",
			namr = "split",
			dscr = "Split environment",
		}, {
			text({"\\begin{split}", "\t"}),
			insert(1, ""),
			text({"", "\\end{split}"})
		}),
		snip({
			trig = "enumerate",
			namr = "enumerate",
			dscr = "Enumerate environment",
		}, {
			text({"\\begin{enumerate}", "\t\\item "}),
			insert(1, ""),
			text({"", "\\end{enumerate}"})
		}),
		snip({
			trig = "itemize",
			namr = "itemize",
			dscr = "Itemize environment",
		}, {
			text({"\\begin{itemize}", "\t\\item "}),
			insert(1, ""),
			text({"", "\\end{itemize}"})
		}),
		snip({
			trig = "cases",
			namr = "cases",
			dscr = "Cases environment",
		}, {
			text({"\\begin{cases}", "\t"}),
			insert(1, ""), text{" & "}, insert(2, ""),
			text({" \\\\", "\\end{cases}"})
		}),
		-- constructs
		snip({
			trig = "math",
			namr = "math mode",
			dscr = "Inline math environment",
		}, {
			text("$ "), insert(1, ""), text(" $")
		}),
		snip({
			trig = "tit",
			namr = "italics",
			descr = "Italics text",
		}, {
			text("\\textit{"), insert(1, ""), text("}")
		}),
		snip({
			trig = "mc",
			namr = "mathcal",
			descr = "Mathcal text",
		}, {
			text("\\mathcal{"), insert(1, ""), text("}")
		}),
		snip({
			trig = "frac",
			namr = "fraction",
			descr = "Fraction",
		}, {
			text("\\frac{"), insert(1, ""), text("}{"), insert(2, ""), text("}")
		}),
		snip({
			trig = "sum",
			namr = "sum inline",
			descr = "Inline sum environment",
		}, {
			text("\\sum_{"), insert(1, ""), text("}^{"), insert(2, ""), text("}") }),
		snip({
			trig = "largefrac",
			namr = "large fraction",
			descr = "Large fraction",
		}, {
			text("\\displaystyle\\frac{"), insert(1, ""), text("}{"), insert(2, ""), text("}")
		}),
		snip({
			trig = "largesum",
			namr = "large sum",
			descr = "Large sum",
		}, {
			text("\\displaystyle\\sum_{"), insert(1, ""), text("}^{"), insert(2, ""), text("}")
		}),
		snip({ trig = "()" }, { text("\\left( "), insert(1, ""), text(" \\right)") }),
		snip({ trig = "[]" }, { text("\\left[ "), insert(1, ""), text(" \\right]") }),
		-- symbols
		snip({ trig = "@q", dscr = "θ" }, { text("\\theta") }),
		snip({ trig = "@vq", dscr = "θ" }, { text("\\vartheta") }),
		snip({ trig = "@Q", dscr = "Θ"}, { text("\\Theta") }),
		snip({ trig = "@e", dscr = "ε" }, { text("\\epsilon") }),
		snip({ trig = "@ve", dscr = "ε" }, { text("\\varepsilon") }),
		snip({ trig = "@E", dscr = "Ε" }, { text("\\Epsilon") }),
		snip({ trig = "@r", dscr = "ρ" }, { text("\\rho") }),
		snip({ trig = "@R", dscr = "Ρ" }, { text("\\Rho") }),
		snip({ trig = "@t", dscr = "τ" }, { text("\\tau") }),
		snip({ trig = "@T", dscr = "Τ" }, { text("\\Tau") }),
		snip({ trig = "@u", dscr = "ω" }, { text("\\upsilon") }),
		snip({ trig = "@i", dscr = "Ω" }, { text("\\iota") }),
		snip({ trig = "@o", dscr = "ω" }, { text("\\omega") }),
		snip({ trig = "@O", dscr = "Ω" }, { text("\\Omega") }),
		snip({ trig = "@p", dscr = "π" }, { text("\\pi") }),
		snip({ trig = "@P", dscr = "Π" }, { text("\\Pi") }),
		snip({ trig = "@a", dscr = "α" }, { text("\\alpha") }),
		snip({ trig = "@A", dscr = "Α" }, { text("\\Alpha") }),
		snip({ trig = "@s", dscr = "σ" }, { text("\\sigma") }),
		snip({ trig = "@S", dscr = "Σ" }, { text("\\Sigma") }),
		snip({ trig = "@d", dscr = "δ" }, { text("\\delta") }),
		snip({ trig = "@D", dscr = "Δ" }, { text("\\Delta") }),
		snip({ trig = "@f", dscr = "φ" }, { text("\\phi") }),
		snip({ trig = "@vf", dscr = "φ" }, { text("\\varphi") }),
		snip({ trig = "@F", dscr = "Φ" }, { text("\\Phi") }),
		snip({ trig = "@g", dscr = "γ" }, { text("\\gamma") }),
		snip({ trig = "@G", dscr = "Γ" }, { text("\\Gamma") }),
		snip({ trig = "@h", dscr = "η" }, { text("\\eta") }),
		snip({ trig = "@H", dscr = "Η" }, { text("\\Eta") }),
		snip({ trig = "@l", dscr = "λ" }, { text("\\lambda") }),
		snip({ trig = "@L", dscr = "Λ" }, { text("\\Lambda") }),
		snip({ trig = "@z", dscr = "ζ" }, { text("\\zeta") }),
		snip({ trig = "@Z", dscr = "Ζ" }, { text("\\Zeta") }),
		snip({ trig = "@x", dscr = "ξ" }, { text("\\xi") }),
		snip({ trig = "@X", dscr = "Ξ" }, { text("\\Xi") }),
		snip({ trig = "@c", dscr = "χ" }, { text("\\chi") }),
		snip({ trig = "@C", dscr = "Χ" }, { text("\\Chi") }),
		snip({ trig = "@b", dscr = "β" }, { text("\\beta") }),
		snip({ trig = "@B", dscr = "Β" }, { text("\\Beta") }),
		snip({ trig = "@n", dscr = "ν" }, { text("\\nu") }),
		snip({ trig = "@N", dscr = "Ν" }, { text("\\Nu") }),
		snip({ trig = "@m", dscr = "μ" }, { text("\\mu") }),
		snip({ trig = "@M", dscr = "Μ" }, { text("\\Mu") }),
		snip({ trig = ".." }, { text("\\dots") }),
		snip({ trig = "q" }, { text("\\quad") }),
		snip({ trig = "qq" }, { text("\\qquad") }),
		snip({ trig = "wdg" }, { text("\\wedge") }),
		snip({ trig = "pa" }, { text("\\pa") }),
		snip({ trig = "na" }, { text("\\na") }),
		snip({ trig = "box" }, { text("\\Box") }),
	}
})
