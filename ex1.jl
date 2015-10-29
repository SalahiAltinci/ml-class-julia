#read data
data = readdlm("ex1data1.txt", ',');

# set X
X = data[:,1]
X = hcat(ones(length(X)), X)

#set Y
Y = data[:,2]


# count
m = length(Y)

#alpha 
alpha = 0.01

# init theta
theta = zeros(2,1)


function predict(x, theta)	
	return x * theta
end

function gradientDescent(x, y, theta, alpa, m)
	error = predict(x, theta) - y
	der = error' * x
	return theta - ((alpha / m) * der')
end

function train(x, y, theta, alpha, m)
	for i = 1:1500
		theta = gradientDescent(x, y, theta, alpha, m)
	end
	
	return theta
end


theta = train(X, Y, theta, alpha, m)

predict1 = [1 3.5] * theta;
predict2 = [1 7] * theta;

println(theta)
println(predict1*10000)
println(predict2*10000)
