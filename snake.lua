food = {
    -- position of food
    x = 0,
    y = 0
    }


snake_head = {
    -- position of snake_head
    x = 0,
    y = 0,
    dx = 0, -- 1Dvector for x and y
    dy = 1
}
snake_tail = {
    -- empty in the beginning because the snake is only the head
}


function foodNew()
    -- pick random number for x and y
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
    -- reset all the values
    snake_head.x = 300
    snake_head.y = 300
    snake_head.dx = 0
    snake_head.dy = 1
    foodNew()
    snake_tail = {

    }
end

function draw()
    -- set the color to red
    love.graphics.setColor(0.933, 0.224, 0, 1)
    -- draw food at x, y, width and height
    love.graphics.rectangle("fill", food.x, food.y, 25, 25 )



    -- set drawing color for snake to (57, 255, 20)
    love.graphics.setColor(0.224, 1, 0.078, 1)
    -- draw snake_head
    love.graphics.rectangle("fill", snake_head.x, snake_head.y, 25, 25 )



    -- iterate through tail of snake
    for key,value in pairs(snake_tail) do
        -- draw each element
        love.graphics.rectangle("fill", value.x, value.y, 25, 25)
    end
end





function check_keys()
    if love.keyboard.isDown("up") then
        -- check that the snake cant go backwards
        if not(snake_head.dy == 1) then
            input_dx = 0
            input_dy = -1
        end
    elseif love.keyboard.isDown("down") then
        -- check that the snake cant go backwards
        if not(snake_head.dy == -1) then
            input_dx = 0
            input_dy = 1
        end
    elseif love.keyboard.isDown("left") then
        -- check that the snake cant go backwards
        if not(snake_head.dx == 1) then
            input_dx = -1
            input_dy = 0
        end
    elseif love.keyboard.isDown("right") then
        -- check that the snake cant go backwards
        if not(snake_head.dx == -1) then
            input_dx = 1
            input_dy = 0
        end
    elseif love.keyboard.isDown("w") then
        -- check that the snake cant go backwards
        if not(snake_head.dy == 1) then
            input_dx = 0
            input_dy = -1
        end
    elseif love.keyboard.isDown("s") then
        -- check that the snake cant go backwards
        if not(snake_head.dy == -1) then
            input_dx = 0
            input_dy = 1
        end
    elseif love.keyboard.isDown("a") then
        -- check that the snake cant go backwards
        if not(snake_head.dx == 1) then
            input_dx = -1
            input_dy = 0
        end
    elseif love.keyboard.isDown("d") then
        -- check that the snake cant go backwards
        if not(snake_head.dx == -1) then
            input_dx = 1
            input_dy = 0
        end
    end
    snake_head.dx = input_dx
    snake_head.dy = input_dy
end


function snake_update()

    -- add dx and dy to x and y of snake so it moves
    snake_head.x = snake_head.x + snake_head.dx * durchmesser
    snake_head.y = snake_head.y + snake_head.dy * durchmesser

end

