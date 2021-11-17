# Probabilistic-Graphical-Model-for-Bayesian-Inference
To illustrate Kalman filter and RTS smoother, we consider a simulation experiment. Assume that we have the univariate measurement model
Yt=xt+v v~N(0, 0.1) Xt=0.7xt-1+u u~N(0, 0.5)
where in this case, we have A=0.7, H=1, Q=0.5 and R=0.1 for all t. Given the initial condition x0~N(0, 1), we simulate xt and yt for t=1, 2, ... 500. Kalman filter state estimates xt|y1:t are shown together with the true value x and observed data y. With backward estimation, RTS smoother state estimates xt|y1:T are shown along with the result of Kalman filter estimation and the true value x.
