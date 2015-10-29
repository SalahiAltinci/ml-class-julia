using PyPlot

#=
		Linear regression example (Single input)
		requires PyPlot from Python

		Editor used : Atom 1.0.19
=#

#= Training =#

# Readining data from ex1data1.txt file
data = readdlm("ex1data1.txt", ',')
# Desired output
Y = data[:,2]
# Inputs
X = data[:,1]
X = hcat(ones(length(X)), X) # [ones(length(X)), X] did not worked. I dont know why. (Installed Julia today)
# Count
m = length(Y)
# Learning rate
alpha = 0.01
# Parameters initiated
theta = zeros(2,1)
# Iteration
iter = 1500

# predict
function predict(x, theta)
	return x * theta
end

# Calculating gradient descent algorithm to find optimal thetas
function gradientDescent(x, y, theta, alpa, m)
	error = predict(x, theta) - y
	der = error' * x
	return theta - ((alpha / m) * der')
end

# Train
function train(x, y, theta, alpha, m)
	for i = 1:iter
		theta = gradientDescent(x, y, theta, alpha, m)
	end

	return theta
end

#= Testing =#

# Train to find thetas
theta = train(X, Y, theta, alpha, m)

# Test thetas
predict1 = [1 3.5] * theta;
predict2 = [1 7] * theta;

println(theta)
println(predict1*10000)
println(predict2*10000)

#= Plotting =#

# Draw regression function
PyPlot.plot(X[:, 2], Y, "rx")
PyPlot.draw()
PyPlot.plot(X[:, 2], X * theta, "-")
PyPlot.draw()
PyPlot.show()
