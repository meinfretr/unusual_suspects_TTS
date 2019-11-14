buttonGUID = 'dc04ca'
suspectsDeckGUID = '67c240'
guiltyPartyGUID = 'c8c061'
questionsGUID = 'c0338d'



function onload()
    button_parameters = {
        click_function = 'buttonClicked',
        function_owner = self,
        label = 'Setup',
        position = {0,0.1,0},
        rotation = {0,0,0},
        width = 1800,
        height = 1800,
        font_size = 500
    }
    setupButton = getObjectFromGUID(buttonGUID)
    suspects = getObjectFromGUID(suspectsDeckGUID)
    guiltyParty = getObjectFromGUID(guiltyPartyGUID)
    questions = getObjectFromGUID(questionsGUID)

    setupButton.createButton(button_parameters)
end

function buttonClicked()
    local parameters = {
        identifier = "BE CHILL :)",
        function_name = 'gameSetup',
        function_owner = Global,
        delay = 0.9
    }
    Timer.create(parameters)
end

function gameSetup()
    suspects.reset()
    guiltyParty.reset()
    questions.reset()

    suspects.shuffle()
    guiltyParty.shuffle()
    questions.shuffle()

    x, z, h, v = -4, -8, 3, 4

    for i=1,4 do
        for j=1,3 do
            deal = {
                position = {x+h*(j-1),2,z+v*(i-1)},
                flip = true,
                callback = 'lock',
                callback_owner = self
            }
            suspects.takeObject(deal)
        end
    end
end

function lock(a)
    a.lock()
end
