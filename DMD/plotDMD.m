%% DMD with rank
rank = 11;
dt = 1;

[U, S, V] = svd(X1, 'econ');
r = min(rank, size(U, 2));
U_r = U(:, 1:r); % truncate to rank -r
S_r = S(1:r, 1:r);
V_r = V(:, 1:r);
Atilde = U_r' * X2 * V_r / S_r; % low-rank dynamics
[W_r, D] = eig(Atilde);
Phi_r = X2 * V_r / S_r * W_r; % DMD modes
lambda_r = diag(D); % discrete-time eigenvalues
omega_r = log(lambda_r) / dt; % continuous-time eigenvalues


%% Plotting Dominant modes

% Compute DMD mode amplitudes b
x1 = X1(:, 1);
b_r = Phi_r \ x1;
display_name = cell(1, r);
%plotting  dominant modes

% Create a new figure
figure;
hold on; % Start holding the plots

for m = 1:r
    display_name{m} = ['Mode ' num2str(m)];
    plot(1:38,real(Phi_r(:, m)), 'DisplayName', display_name{m},'LineWidth', 1.5);
end

hold off; % Stop holding the plots


%plot(1:38,Phi_r,'DisplayName',display_name);
title('Real part of dominant modes');
xlabel('Features');
ylabel('Phi');
grid on;
legend('show','Location','bestoutside');

figure;
hold on; % Start holding the plots

for m = 1:r
    display_name{m} = ['Mode ' num2str(m)];
    plot(1:38,imag(Phi_r(:, m)), 'DisplayName', display_name{m},'LineWidth', 1.5);
end

hold off; % Stop holding the plots


%plot(1:38,Phi_r,'DisplayName',display_name);
title('Imaginary part of dominant modes');
xlabel('Features');
ylabel('Phi');
grid on;
legend('show','Location','bestoutside');


% Define the figure and subplot layout
numRows = 3;
numCols = 4;
Best_mode = 11;
% Create a new figure
figure;

% Loop through and plot all plots
for i = 1:Best_mode

    y = abs(Phi_r(:,i));

    % Select the current subplot
    subplot(numRows, numCols, i);
    
    % Replace 'y' with your own data for each subplot
    plot(1:38,y,'DisplayName','Phi magnitude','LineWidth', 1.5);   
    % Customize subplot titles (optional)
    title(['Mode ' num2str(i)]);
    
    % Add any other customization you need for each subplot
end
legend('show');
% Adjust the figure size if necessary
%set(gcf, 'Position', [100, 100, 1200, 800]); % Example dimensions

% Add a main title for the entire figure (optional)
%suptitle('38 Subplots in a 4x10 Grid');

% Save the figure if needed
% saveas(gcf, 'my_figure.png'); % Change the filename and format as needed

%% Plotting reconstructesd data
features = ["Neck Lateral Bending", "Neck Rotation", "Neck Flex-Ext", "Back Lateral Bending", ...
    "Back Rotation", "Back Flex-Ext", "Shoulder_L Abd-Add", "Shoulder_L Rotation", "Shoulder_L Flex-Ext", ...
    "Shoulder_R Abd-Add", "Shoulder_R Rotation", "Shoulder_R Flex-Ext", "Elbow_L Supi-Pron", "Elbow_L Flex-Ext", ...
    "Elbow_R Supi-Pron", "Elbow_R Flex-Ext", "Wrist_L Flex-Ext", "Wrist_L Deviation", "Wrist_R Flex-Ext", "Wrist_R Deviation", ...
    "Hip_L Abd-Add", "Hip_L Rotation", "Hip_L Flex-Ext", "Hip_R Abd-Add", "Hip_R Rotation", "Hip_R Flex-Ext", ...
    "Knee_L Valg-Var", "Knee_L Rotation", "Knee_L Flex-Ext", "Knee_R Valg-Var", "Knee_R Rotation", "Knee_R Flex-Ext", ...
    "Ankle_L Ever-Inver", "Ankle_L Abd-Add", "Ankle_L Dorsi-Plantar", "Ankle_R Ever-Inver", "Ankle_R Abd-Add", "Ankle_R Dorsi-Plantar"];

numRows = 5;
numCols = 8;
totalPlots = numRows * numCols;
Best_mode = 11;
% Create a new figure
figure;

% Loop through and plot 38 plots
for i = 1:min(38, totalPlots)

    y_x = X1(i,:);
    y_xDMD5 = real(Xdmd_modes{5}(i,:));
    y_xDMD10 = real(Xdmd_modes{10}(i,:));
    y_xDMD15 = real(Xdmd_modes{15}(i,:));
    y_xDMD20 = real(Xdmd_modes{20}(i,:));
    y_xDMD38 = real(Xdmd_modes{38}(i,:));
    y_xDMD_Best = real(Xdmd_modes{Best_mode}(i,:));
    % Select the current subplot
    subplot(numRows, numCols, i);
    
    % Replace 'y' with your own data for each subplot
    plot(y_x);
    hold on
%     plot(y_xDMD5,'DisplayName','DMD5');
%     plot(y_xDMD10,'DisplayName','DMD10');
%     plot(y_xDMD15,'DisplayName','DMD15');
%     plot(y_xDMD20,'DisplayName','DMD20');
%     plot(y_xDMD38,'DisplayName','DMD38');
    plot(y_xDMD_Best,'DisplayName',['DMD ' num2str(Best_mode) ' (Best)']);
%     
    % Customize subplot titles (optional)
    title(features(i));
    
    % Add any other customization you need for each subplot
end
legend('show');