### IWAI2020 onlinesysid

Code and experiments for the paper entitled

_"Online system identification in a Duffing oscillator by free energy minimisation"_ ,

which is to be presented at the International Workshop on Active Inference 2020.

#### Content

- `FEM_prederror.ipynb` and `FEM_simerror.ipynb` are Jupyter notebooks containing the method described in the paper. The first is a 1-step ahead prediction error experiment and the other a simulation error experiment. It uses [ForneyLab.jl](https://github.com/biaslab/ForneyLab.jl) and a custom node called "NLARX" provided here (`NLARX-node` folder). If you don't have Jupyter installed, you can read the notebook by opening `FEM_prederror.html` or `FEM_simerror.html` in a browser.

- `PEM_prederror.m` and `PEM_simerror.m` are baseline methods implemented using Matlab's System Identification Toolbox. The trained model is stored in `models/narx_sigmoidnet4.mat`. Results can be loaded directly via `results/results_narx_sigmoidnet4_ksteppred.mat` or `results/results_narx_sigmoidnet4_simulation.mat`.

- Data comes from the [Nonlinear Benchmark](http://nonlinearbenchmark.org/), specifically the Silverbox problem.

#### Contact

Problems with running code or feedback on the method can be given in the [issues tracker](https://github.com/biaslab/IWAI2020-onlinesysid/issues).
