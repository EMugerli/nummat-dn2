module Domaca02

export composite_gauss_legendre, gauss_legendre_2
"""
    Funkcija za Gauss-Legendre kvadraturo na dveh točkah. 
"""
function gauss_legendre_2(f, a, b)
    # Vozli in uteži
    x0 = -1 / sqrt(3)
    x1 = 1 / sqrt(3)
    w0 = 1
    w1 = 1

    # Transformacija intervala na [a, b]
    t_x0 = (b - a) / 2 * x0 + (a + b) / 2
    t_x1 = (b - a) / 2 * x1 + (a + b) / 2

    # Izračun kvadrature
    return (b - a) / 2 * (w0 * f(t_x0) + w1 * f(t_x1))
end

"""
    Pravilo za več intervalov, ki uporablja kvadraturo na dveh točkah
"""
function composite_gauss_legendre(f, a, b, n)
    # Razdelimo interval na n podintervalov
    h = (b - a) / n
    integral = 0.0

    for i in 0:(n-1)
        ai = a + i * h
        bi = ai + h
        integral += gauss_legendre_2(f, ai, bi)
    end

    return integral
end

end # module Domaca02
