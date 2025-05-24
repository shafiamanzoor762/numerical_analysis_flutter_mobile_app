# import matplotlib.pyplot as plt
# import numpy as np
# import math
# import os
# import uuid


# def bisection_root(function, x0, x1,n):
#     f = lambda x: eval(function)
#     mean = lambda x0, x1: (x0 + x1) / 2 
#     diff = 0
#     data = []

#     for i in range(n):
#         mea = mean(x0, x1)
#         fnt = f(mea)       
        
#         if f(mea) * f(x0) > 0:
#             x0 = mea
#         elif f(mea) * f(x1) > 0:
#             x1 = mea
#         else:
#             break

#         diff = abs(mean(x0, x1) - mea)
#         data.append([i+1, x0, x1, mea, fnt, diff])

#     os.makedirs('images', exist_ok=True)

#     unique_filename = 'bisection_plot_' + str(uuid.uuid4().hex) + '.png'
#     plot_filename = os.path.join('images', unique_filename)

#     # plt.figure()
#     # plt.grid()
#     plt.plot(range(len(data)), [row[5] for row in data])
#     plt.title('Bisection graph for $' + function +'$')
#     plt.savefig(plot_filename)

    
#     response_data = {
#         'bisection_data': data,
#         'plot_image_url': unique_filename
#     }
#     return response_data


import matplotlib.pyplot as plt
import numpy as np
import math
import os
import uuid
import matplotlib

# Use the 'Agg' backend for non-GUI environments
matplotlib.use('Agg')

def bisection_root(function, x0, x1, n):
    f = lambda x: eval(function)
    mean = lambda x0, x1: (x0 + x1) / 2
    diff = 0
    data = []

    for i in range(n):
        mea = mean(x0, x1)
        fnt = f(mea)       

        if f(mea) * f(x0) > 0:
            x0 = mea
        elif f(mea) * f(x1) > 0:
            x1 = mea
        else:
            break

        diff = abs(mean(x0, x1) - mea)
        data.append([i + 1, x0, x1, mea, fnt, diff])

    os.makedirs('images', exist_ok=True)

    unique_filename = 'bisection_plot_' + str(uuid.uuid4().hex) + '.png'
    plot_filename = os.path.join('images', unique_filename)

    plt.figure()
    plt.grid()
    plt.plot(range(len(data)), [row[5] for row in data])
    plt.title('Bisection graph for $' + function + '$')
    plt.savefig(plot_filename)
    plt.close()  # Close the figure to free up memory

    response_data = {
        'bisection_data': data,
        'plot_image_url': unique_filename
    }
    return response_data
