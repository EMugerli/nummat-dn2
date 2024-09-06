#' Elian Mugerli, 6.9.2024
#' # Gauss-Legendrove kvadrature
#' 
#' 
#' ## Opis problema
#' Funkcija `gauss_legendre_2` izračuna približek integrala funkcije `f` na intervalu `[a, b]` z uporabo
#' kvadrature na dveh točkah.
using .Domaca02, QuadGK

#' Približen izračun integrala funkcije f(x) = sin(x) / x na intervalu [0, 5]
f(x) = sin(x) / x
a, b = 0.0, 5.0
n = 122

#' ## Rezultat
rezultat = composite_gauss_legendre(f, a, b, n)
println("Približen izračun integrala: ", rezultat)

#' Pravi rezultat integrala izračunan s pomočjo izvorne knjižnice/modula QuadGK
pravi_rezultat, _ = quadgk(f, a, b)

#' Rezultate po korakih predstavimo z grafom
using Plots

#' ## Grafični prikaz
#' Za prikaz grafa napak v odvisnosti of števila intervalov definiramo prazen vektor za napake.
#' Sprememba korakov je eksponentna in uporablja potence števila 2^k.
#' Na vsakem koraku smo izračunali približek integrala in ga primerjali z pravim rezultatom, ki je bil izračunan s pomočjo izvornih knjižnic.
#' Napake smo shranili v vektor `errors` in približke v vektor `priblizki`.
#' 
#'
errors = Float64[]
priblizki = Float64[]
steps = 2 .^(0:7)


for n in steps
  trenutni_priblizek = composite_gauss_legendre(f, a, b, n)
    push!(errors, abs(trenutni_priblizek - pravi_rezultat))
    push!(priblizki, trenutni_priblizek)
    println("Približek za ", n, " intervalov: ", priblizki[end])
end

#' Izris grafa napak v odvisnosti od števila intervalov
p = plot(steps, errors, yscale=:log10, label="Napaka", 
  xlabel="Število intervalov", ylabel="Napaka", 
  title="Napaka približka integrala funkcije sin(x) / x na intervalu [0, 5]",
  seriestype=:scatter, legend=:topright, grid=true, markercolor=:red
)
savefig(p, "errors.png")

#' Na grafu je razvidno, da se napaka zmanjšuje polinomsko in konvergira k 0, ko se število intervalov povečuje.
#' Naloga predpostavlja oceno za izračun približka integrala funkcije `f(x) = sin(x) / x` na intervalu `[0, 5]` na 10 decimalk natančno. To mejo lahko iz grafa vidimo, da dosežemo v okolici 120-130 intervalov.
#' To še dodatno potrjuje naš predhodni izračun z uporabo funkcije `composite_gauss_legendre(f, a, b, n)`, kjer smo uporabili 122 intervalov.