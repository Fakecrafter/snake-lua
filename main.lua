require 'snake'



state = 0
rows = 20
columns = 20
counter = 0

input_dx = 0
input_dy = 1

-- change speed of snake (less is faster)
counterSpeed = 5
durchmesser = 30


function love.load()
    love.window.setMode(600, 600)
    love.graphics.setBackgroundColor(0, 0, 0, 1)
    foodNew()
end


function love.update(dt)

    -- check if state is 0 and if yes then check if Space is pressed if yes again, then change the state to 1
    if state == 0 then
        if love.keyboard.isDown("space") then
            state = 1
        end
    else
        check_keys()


        -- only Update every 5 frame for snake effect
        if counter == counterSpeed then
            counter = 0


            -- check if snake touches food
            if snake_head.x == food.x and snake_head.y == food.y then

                -- insert new element to tail so the snake gets longer
                table.insert(snake_tail, {x = snake_head.x, y = snake_head.y})

                -- update snake position
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
            -- iterate through snake and check if x and y are the same as head
            for _, value in pairs(snake_tail) do
                if snake_head.x == value.x and snake_head.y == value.y then
                    reset()
                    state = 1
                end
            end


            -- check if snake touches wall
            if snake_head.x < 0 or snake_head.x > 600 - 30 then
                -- game is over and we want to reset and go to start screen
                reset()
                state = 0
            end
            if snake_head.y < 0 or snake_head.y > 600 - 30 then
                reset()
                state = 0
            end

        else
            -- increase counter
            counter = counter + 1
        end
    end
end



function love.draw()
    if state == 0 then
        love.graphics.setColor(0.224, 1, 0.078, 1)
        love.graphics.print("press SPACE", 250, 300)


    else

        draw()
    end
end




