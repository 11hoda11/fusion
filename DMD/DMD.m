
% function [Phi,omega ,lambda ,b,Xdmd ] = DMD(X1,X2,r,dt)
% Computes the Dynamic Mode Decomposition of X1, X2
%
% INPUTS:
% X1 = X, data matrix
% X2 = X’, shifted data matrix
% Columns of X1 and X2 are state snapshots
% r = target rank of SVD
% dt = time step advancing X1 to X2 (X to X’)
%
% OUTPUTS:
% Phi , the DMD modes
% omega , the continuous -time DMD eigenvalues
% lambda , the discrete -time DMD eigenvalues
% b, a vector of magnitudes of modes Phi
% Xdmd , the data matrix reconstructed by Phi, omega , b

%file_path = 'C:\Users\hodan\Google Drive\UBC\Codes\fusion\DMD\Trial_Joint_Angles.csv'; % Replace with your actual file path
file_path = 'C:\Users\sibas\Google Drive Streaming\My Drive\UBC\Codes\fusion\DMD\Trial_Joint_Angles.csv'
data_table = readtable(file_path);
header = string(data_table.Properties.VariableNames);
numeric_data = table2array(data_table);


%% Inputs
X = numeric_data(4133:4259, 3:end)';
X1 = X(:, 1:end-1);
X2 = X(:, 2:end);
total_modes = 38;  % Total number of modes
dt = 1;

Xdmd_modes = cell(1, total_modes);
similarity_metrics = zeros(1, total_modes);
correlation_coefficients = zeros(1, total_modes);

for i = 1:total_modes
    %% DMD
    [U, S, V] = svd(X1, 'econ');
    r = min(i, size(U, 2));
    U_r = U(:, 1:i); % truncate to rank -r
    S_r = S(1:i, 1:i);
    V_r = V(:, 1:i);
    Atilde = U_r' * X2 * V_r / S_r; % low-rank dynamics
    [W_r, D] = eig(Atilde);
    Phi = X2 * V_r / S_r * W_r; % DMD modes
    lambda = diag(D); % discrete-time eigenvalues
    omega = log(lambda) / dt; % continuous-time eigenvalues

    %% Compute DMD mode amplitudes b
    x1 = X1(:, 1);
    b = Phi \ x1;

    %% DMD reconstruction
    mm1 = size(X1, 2); % mm1 = m - 1
    time_dynamics = zeros(r, mm1);

    t = (0:mm1 - 1) * dt; % time vector
    for iter = 1:mm1
        time_dynamics(:, iter) = (b .* exp(omega * t(iter)));
    end

    % Store the Xdmd mode
    Xdmd_modes{i} = Phi * time_dynamics;

   
end

