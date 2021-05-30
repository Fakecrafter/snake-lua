food = {
    x = 0,
    y = 0
    }


snake_head = {
    x = 0,
    y = 0,
    dx = 1,
    dy = 0
}
snake_tail = {
}


function foodNew()
    food.x = love.math.random(0, rows-1) * durchmesser
    food.y = love.math.random(0, columns-1) * durchmesser

    -- check if food is in snake. If yes then calls itself (recursion)
        if snake_head.x == food.x and snake_head.y == food.y then
            foodNew()
        end



    for key, coordinate in pairs(snake_tail) do
        if coordinate.x == food.x and coordinate.y == food.y then
            foodNew()
        end
    end
end


function reset()
    snake_head.x = 0
    snake_head.y = 0
    snake_head.dx = 1
    snake_head.dy = 0
    foodNew()
    snake_tail = {

    }
end

function draw()
    love.graphics.setColor(0.933, 0.224, 0, 1)
    love.graphics.rectangle("fill", food.x, food.y, 25, 25 )



    -- set drawing color for snake to (57, 255, 20)
    love.graphics.setColor(0.224, 1, 0.078, 1)
    -- draw snake
    love.graphics.rectangle("fill", snake_head.x, snake_head.y, 25, 25 )



    -- iterate through tail of snake
    for key,value in pairs(snake_tail) do
        love.graphics.rectangle("fill", value.x, value.y, 25, 25)
    end
end





function check_keys()
    if love.keyboard.isDown("up") then
        -- check that the snake cant go backwards
        if not(snake_head.dy == 1) then
            snake_head.dx = 0
            snake_head.dy = -1
        end
    elseif love.keyboard.isDown("down") then
        -- check that the snake cant go backwards
        if not(snake_head.dy == -1) then
            snake_head.dx = 0
            snake_head.dy = 1
        end
    elseif love.keyboard.isDown("left") then
        -- check that the snake cant go backwards
        if not(snake_head.dx == 1) then
            snake_head.dx = -1
            snake_head.dy = 0
        end
    elseif love.keyboard.isDown("right") then
        -- check that the snake cant go backwards
        if not(snake_head.dx == -1) then
            snake_head.dx = 1
            snake_head.dy = 0
        end
    end
end


function snake_update()

    -- add dx and dy to x and y of snake
    snake_head.x = snake_head.x + snake_head.dx * durchmesser
    snake_head.y = snake_head.y + snake_head.dy * durchmesser

end

