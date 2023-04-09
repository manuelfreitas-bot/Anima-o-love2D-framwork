local larguraTela = love.graphics.getWidth()
local altura = love.graphics.getHeight()
local anim = require('anim8')

local imagem, animation
local posX = larguraTela/2
local posY = altura/2
local direcaox = true


-- criando o frame de animação com o tamanho de frames dividido


function love.load()


    --adicionando background 
    background = love.graphics.newImage("imagem/fundo.jpg")

    --adicionando persoangem
    imagem = love.graphics.newImage("imagem/bird.png")
    local g = anim.newGrid(126, 102, imagem:getWidth(), imagem:getHeight() )
    animation = anim.newAnimation(g('1-6', 1, '1-6',2), 0.05)

end

--criando as animações de andar para a direita e para a esquerda
function love.update(dt)
   
    if love.keyboard.isDown('left') then
        posX = posX - 100 * dt
        direcaox = false
        animation:update(dt)
    end
    if love.keyboard.isDown('right') then
        posX = posX + 100 * dt
        direcaox = true
        animation:update(dt)
    end
    if love.keyboard.isDown('up') then
        posY= posY + 100 * dt
        direcaox = true
        animation:update(dt)
    end
  
end

 -- criando a sprite do background dividindo em varios pequenos quadrados
function love.draw()
    for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end 

--adicionando animação do personagem caso ele caminhe
    love.graphics.setBackgroundColor(255, 255,255)
    if direcaox  then
        animation:draw(imagem, posX, 300,0 , 1, 1, 63, 0)
    elseif not direcaox then
        animation:draw(imagem, posX, 300,0 , -1, 1, 51, 0)
    
end

    --adicionando uma fonte de estilização
    
    fonte = love.graphics.newFont( "fontes/soopafre.ttf", 30 )
    love.graphics.setFont(fonte);
    

	-- desenhar o texto 
	love.graphics.print("Clique nas setas -> ou <-", 200, 50);
end



