import numpy as np
def func_positive(x, c = 1.0):
    return c * np.log(x)

def inverse_func_positive(x, c = 1.0):
    return np.exp(c * x)
# when being used, we can transform f(x) to g(y), where y = c* log(|x|), g(m) = f(exp(m/c))

def func_all(x):
    return np.sign(x) * np.log(np.abs(x)+1)

def inverse_func_all(x):
    if x >= 0:
        return np.exp(x) - 1
    else:
        return - (np.exp(-x) - 1)
    
