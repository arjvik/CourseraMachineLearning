function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    %       ALGORITHM        REAL
    % TP=       1             1
    tp = sum(yval(pval<epsilon));
    % FP=       1             0
    fp = sum(1-yval(pval<epsilon));
    % FN=       0             1
    fn = sum(yval(pval>=epsilon));
    % percentage of suspected anomalies that
    % turn out to be actual anomalies
    prec = tp / (tp + fp);
    % percentage of anomalies actually detected
    rec  = tp / (tp + fn);

    % F1 score is cost function
    F1 = 2 * prec * rec / (prec + rec);










    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
