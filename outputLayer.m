classdef outputLayer < nnet.layer.RegressionLayer
               
    methods
        function layer = outputLayer(name)
            % Create an [5x1] regression layer with RMSE

            % Set layer name
            if nargin == 1
                layer.Name = name;
            end

            % Set layer description
            layer.Description = 'Output regression layer with [5x1] output';
        end
        
        function loss = forwardLoss(layer, Y, T)
            % Returns the RMSE loss between the predictions Y and the
            % training targets T
            
            a1 = sqrt(mean((T(1,1) - Y(1,1)).^2));
            a2 = sqrt(mean((T(1,2) - Y(1,2)).^2));
            a3 = sqrt(mean((T(1,3) - Y(1,3)).^2));
            a4 = sqrt(mean((T(1,4) - Y(1,4)).^2));
            a5 = (tan(T(1,5)) - tan(Y(1,5))).^2;
            
            loss = a1+a2+a3+a4+a5;
            
        end
        
        function dLdY = backwardLoss(layer, Y, T)
            % Returns the derivatives of the MAE loss with respect to the predictions Y

            N = size(Y,4);
            
            a1 = sqrt(mean((T(1,1) - Y(1,1)).^2));
            a2 = sqrt(mean((T(1,2) - Y(1,2)).^2));
            a3 = sqrt(mean((T(1,3) - Y(1,3)).^2));
            a4 = sqrt(mean((T(1,4) - Y(1,4)).^2));
            a5 = (tan(T(1,5)) - tan(Y(1,5))).^2;
            
            loss = [a1 a2 a3 a4 a5];
            
            dLdY = sign(Y-T)/N;
        end
    end
end