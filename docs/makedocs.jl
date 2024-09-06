using Weave, .Domaca02, Plots, QuadGK

Weave.weave("docs/demo.jl", doctype="md2pdf", out_path="build")