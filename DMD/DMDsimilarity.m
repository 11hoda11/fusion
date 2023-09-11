

MSE_metrics = zeros(1, total_modes);
correlation_coefficients = zeros(1, total_modes);

for i = 1:total_modes

    % Calculate similarity metric (MSE in this case)
    % Calculate the MSE between X and reconstructed Xdmd_modes{i}
    mse = mean((X1 - Xdmd_modes{i}).^2, 'all');
    MSE(i) = mse;

    % Calculate correlation coefficient
    correlation = corr(X1(:), Xdmd_modes{i}(:)); % Calculate correlation between flattened arrays
    correlation_coefficients(i) = correlation;
end

% Create a plot to visualize the similarity metrics
figure;
plot(1:total_modes, MSE, 'o-', 'LineWidth', 1.5);
title('MSE vs. Rank');
xlabel('Rank');
ylabel('Mean Squared Error (MSE)');
grid on;

% Optionally, add labels to important points (e.g., the best rank)
hold on;
best_rank = 11; % Replace with the actual best rank
plot(best_rank, MSE(best_rank), 'ro', 'MarkerSize', 10, 'DisplayName', 'Best Rank');
legend('show');

% Create a plot to visualize the correlation coefficients
figure;
plot(1:total_modes, correlation_coefficients, 'o-', 'LineWidth', 1.5);
title('Correlation Coefficients vs. Rank');
xlabel('Rank');
ylabel('Correlation Coefficient');
grid on;

% Optionally, add labels to important points (e.g., the best rank)
hold on;
best_rank = 11; % Replace with the actual best rank
plot(best_rank, correlation_coefficients(best_rank), 'ro', 'MarkerSize', 10, 'DisplayName', 'Best Rank');
legend('show');
