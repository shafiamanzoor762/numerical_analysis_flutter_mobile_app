from sympy import Symbol, diff, parse_expr
import matplotlib.pyplot as plt
import os
import uuid

def newton_root(function, x0, x1, n):
    f = lambda x: eval(function)

    xn = (x0 + x1) / 2  
    dif = 0
    data = []
    x = Symbol('x')
    
    f_expr = parse_expr(function)

    for i in range(n):
        fx = f(xn)
        der = diff(f_expr, x).subs(x, xn)

        prev = xn
        xn = xn - (fx / der)

        dif = abs(xn - prev)
        data.append([i + 1, float(xn), float(dif)])  # Convert xn and dif to float before appending

    os.makedirs('images', exist_ok=True)

    unique_filename = 'newton_plot_' + str(uuid.uuid4().hex) + '.png'
    plot_filename = os.path.join('images', unique_filename)

    plt.figure()
    plt.grid()
    plt.plot(range(len(data)), [row[2] for row in data])
    plt.title('Newton graph for $' + function +'$')
    plt.savefig(plot_filename)

    response_data = {
        'newton_data': data,
        'plot_image_url': unique_filename
    }

    return response_data
