import numpy as np
import matplotlib.pyplot as plt
import os
import uuid


def jacobi_sol(a,b, x0,n):
    A=strToMatrix(a)
    B=strToMatrix(b)
    x0=strToMatrix(x0)
    L = np.tril(A, -1)  # Lower triangular matrix
    U = np.triu(A, 1)    # Upper triangular matrix
    D = np.diagflat(np.diag(A))
    D_inv = np.linalg.inv(D)
    R = A - D
    data = []
    x = []
    for i in range(n):
        data.append([i+1, x0.ravel().tolist()])
        x.append(x0.ravel().tolist())  # Append the flattened array as a list to x
        x0 = np.dot(D_inv, (B - (np.dot(R, x0))))
    x = np.array(x)  # Convert list of lists to NumPy array

    # plt.figure()
    plt.grid()
    
    num_variables = x.shape[1]
    for i in range(num_variables):
        plt.plot(x[:, i], label=f'x{i+1}')

    os.makedirs('images', exist_ok=True)
    unique_filename = 'jacobi_plot_' + str(uuid.uuid4().hex) + '.png'
    plot_filename = os.path.join('images', unique_filename)
    
    plt.title('Jacobi graph')
    plt.legend()
    plt.savefig(plot_filename)

    response_data = {
        'jacobi_data': data,
        'plot_image_url': unique_filename
    }
    return response_data

# CONVERT STRING TO MATRIX
def strToMatrix(s):
    row_strings = s.split('],[')
    row_strings[0] = row_strings[0].replace('[', '')
    row_strings[-1] = row_strings[-1].replace(']', '')
    data_list = [list(map(int, row.split(','))) for row in row_strings]
    return np.array(data_list)