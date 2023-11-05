import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt


def predict_series(X, y):
    X = np.array(X).reshape((-1, 1))
    y = np.array(y).astype(float)
    y[np.isnan(y)] = 0
    maxx = np.max(X)
    minx = np.min(X)
    Xnorm = (X - minx) / maxx
    reg = LinearRegression().fit(Xnorm, y)
    # print(reg.score(Xnorm, y))
    # print(reg.coef_)
    # print(reg.intercept_)
    X_pred = np.array([X[-1] + 60, X[-1] + 120, X[-1] + 180]).reshape((-1, 1))
    X_norm_pred = (X_pred - minx) / maxx
    preds = reg.predict(X_norm_pred)
    # plt.figure()
    # plt.plot([X[-1], X[-1] + 60, X[-1] + 120, X[-1] + 180], [y[-1], *preds], 'b--', X, y, 'b')
    # plt.show()
    return X_pred.tolist(), preds.tolist()
