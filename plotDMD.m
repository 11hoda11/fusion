
features = ["Neck Lateral Bending", "Neck Rotation", "Neck Flex-Ext", "Back Lateral Bending", ...
    "Back Rotation", "Back Flex-Ext", "Shoulder_L Abd-Add", "Shoulder_L Rotation", "Shoulder_L Flex-Ext", ...
    "Shoulder_R Abd-Add", "Shoulder_R Rotation", "Shoulder_R Flex-Ext", "Elbow_L Supi-Pron", "Elbow_L Flex-Ext", ...
    "Elbow_R Supi-Pron", "Elbow_R Flex-Ext", "Wrist_L Flex-Ext", "Wrist_L Deviation", "Wrist_R Flex-Ext", "Wrist_R Deviation", ...
    "Hip_L Abd-Add", "Hip_L Rotation", "Hip_L Flex-Ext", "Hip_R Abd-Add", "Hip_R Rotation", "Hip_R Flex-Ext", ...
    "Knee_L Valg-Var", "Knee_L Rotation", "Knee_L Flex-Ext", "Knee_R Valg-Var", "Knee_R Rotation", "Knee_R Flex-Ext", ...
    "Ankle_L Ever-Inver", "Ankle_L Abd-Add", "Ankle_L Dorsi-Plantar", "Ankle_R Ever-Inver", "Ankle_R Abd-Add", "Ankle_R Dorsi-Plantar"];

% Define the figure and subplot layout
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
% Adjust the figure size if necessary
%set(gcf, 'Position', [100, 100, 1200, 800]); % Example dimensions

% Add a main title for the entire figure (optional)
%suptitle('38 Subplots in a 4x10 Grid');

% Save the figure if needed
% saveas(gcf, 'my_figure.png'); % Change the filename and format as needed
