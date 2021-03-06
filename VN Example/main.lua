local states = require('states')

function love.load()
	GameStates = GameStatesClass:new()
	GameStates:Push(Reader)
	GameStates:Push(Menu)
end

function love.update(dt)
	GameStates.states[GameStates.current]:Update(dt)
end

function love.mousepressed(x, y, button)
	GameStates.states[GameStates.current]:Click(x, y, button)
end

function love.keypressed(key, isrepeat) -- Clean restart, clears all assets
	if key == 'r' then
		love.audio.stop()
		GameStates:Pop()
		package.loaded.states = nil
		states = require('states')
		GameStates = GameStatesClass:new()
		GameStates:Push(Reader)
		GameStates:Push(Menu)
	else
		GameStates.states[GameStates.current]:KeyPress(key, isrepeat) -- pass through if not reset
	end
end
	
function love.draw()
	GameStates.states[GameStates.current]:Draw()
end
