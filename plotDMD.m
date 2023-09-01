

% Define the figure and subplot layout
numRows = 4;
numCols = 10;
totalPlots = numRows * numCols;

% Create a new figure
figure;

% Loop through and plot 38 plots
for i = 1:min(38, totalPlots)

    y_x = X(i,:);
    y_xDMD = real(Xdmd(i,:));
    % Select the current subplot
    subplot(numRows, numCols, i);
    
    % Replace 'y' with your own data for each subplot
    plot(y_x);
    hold on
    plot(y_xDMD);
    
    % Customize subplot titles (optional)
    title(['Plot ' num2str(i)]);
    
    % Add any other customization you need for each subplot
end

% Adjust the figure size if necessary
set(gcf, 'Position', [100, 100, 1200, 800]); % Example dimensions

% Add a main title for the entire figure (optional)
suptitle('38 Subplots in a 4x10 Grid');

% Save the figure if needed
% saveas(gcf, 'my_figure.png'); % Change the filename and format as needed
