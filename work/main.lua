--function love.draw()
    --love.graphics.print("Hello World", 40, 30)
	--love.graphics.circle("fill", 10, 10, 100, 25)
	--love.graphics.rectangle("line", 1, 1, 318, 238)
	--end
	
	function love.load()
		x = 100
	end

	function love.update()
		print(dt)
		x = x + 5
	end

	function love.draw()
		love.graphics.rectangle("line", x, 50, 200, 150)
	end