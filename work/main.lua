function love.load()
	x = 30
	y = 50
	w = 10
	h = 20
end

function love.draw()
	love.graphics.rectangle("line", x, y, w, h)
end

function love.keypressed(key)
	--If space is pressed then..
	if key == "space" then
		--x and y become a random number between 100 and 500
		x = math.random(100, 500)
		y = math.random(100, 500)
		w = math.random(100, 500)
		h = math.random(100, 500)
	end
end