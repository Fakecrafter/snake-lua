require 'snake'


state = 0
rows = 20
columns = 20
counter = 0
durchmesser = 30


function love.load()
    love.window.setMode(600, 600)
    love.graphics.setBackgroundColor(0, 0, 0, 1)
    foodNew()
end


function love.update(dt)
if state == 0 then
    if love.keyboard.isDown("space") then
        state = 1
    end
end
    check_keys()


    -- only Update every 5 frame for snake effect
    if counter == 5 then
        counter = 0


        -- check if snake touches food
        if snake_head.x == food.x and snake_head.y == food.y then
            table.insert(snake_tail, {x = snake_head.x, y = snake_head.y})
            snake_update()
            -- spawn food at new location
            foodNew()
        else
            -- normal
            table.insert(snake_tail, {x = snake_head.x, y = snake_head.y})
            table.remove(snake_tail, 1)
            snake_update()

        end

        -- check if snake touches itself
        for _, value in pairs(snake_tail) do
            if snake_head.x == value.x and snake_head.y == value.y then
                reset()
                state = 1
            end
        end


        -- check if snake touches wall
        if snake_head.x < 0 or snake_head.x > 600 - 30 then
            reset()
            state = 0
        end
        if snake_head.y < 0 or snake_head.y > 600 - 30 then
            reset()
            state = 0
        end

    else
        counter = counter + 1
    end

end



function love.draw()
    if state == 0 then
        love.graphics.print("press SPACE to start", 200, 400)


    else
        draw()
    end
end




