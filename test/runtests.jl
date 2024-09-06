using .Domaca02
using Test, QuadGK

"""
  V testu preverimo pravilnost sestavljenega kvadraturnega pravila Gauss-Legendre.
  Primerjamo ga z rezultatom funkcije quadgk iz paketa QuadGK.
"""
@testset "Gauss-Legendre kvadratura" begin
  f(x) = sin(x) / x
  a, b = 0.0, 5.0
  n = 122

  rezultat = composite_gauss_legendre(f, a, b, n)
  pravi_rezultat, _ = quadgk(f, a, b)

  @test rezultat ≈ pravi_rezultat atol=1e-10
end