### IWAI2020 onlinesysid

Code and experiments for the paper entitled

"Online system identification in a Duffing oscillator by free energy minimisation" ,

which is to be presented at the International Workshop on Active Inference 2020.

#### Content

- `FEM_prederror.ipynb` is a Jupyter notebook containing the method described in the paper. It uses [ForneyLab.jl](https://github.com/biaslab/ForneyLab.jl) and a custom node called "NLARX" provided here (`NLARX-node` folder). If you don't have Jupyter installed, you can read the notebook by opening `FEM_prederror.html` in a browser.

- `PEM_prederror.m` is a baseline method implemented using Matlab's System Identification Toolbox. The trained model is stored in `models/sscanon_model.mat` and can be opened in the Toolbox via `models/sscanon.sid`. Results can be loaded directly via `results/results_sscanon.mat`.

- Data comes from the [Nonlinear Benchmark](http://nonlinearbenchmark.org/), specifically the Silverbox problem.

#### Contact

Problems with running code or feedback on the method can be given in the [issues tracker](https://github.com/biaslab/IWAI2020-onlinesysid/issues).
