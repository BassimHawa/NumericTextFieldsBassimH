-- Title: Numeric TextField
-- Name: Bassim H
-- Course: ICS2O/3C
-- This program asks a user a math question, and displays incorrect or correct depending on the answer.
-----------------------------------------------------------------------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

------------------------------------------------------------------------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

------------------------------------------------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 20)
	randomNumber2 = math.random(0, 20)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 
end
 
 local function HideCorrect()
 	correctObject.isVisible = false
 	AskQuestion()
 end

local function HideIncorrect()
 	incorrectObject.isVisible = false
 	AskQuestion()
 end


 local function NumericFieldListener( event )
 	
 	--User begins editing "numericField"
 	if ( event.phase == "began" ) then


 	elseif ( event.phase == "submitted" ) then

 		--when the answer is submitted (enter key is pressed) set user input to user's answer
 		userAnswer = tonumber(event.target.text)

 		--if the user's answer and the correct answer are the same:
 		if (userAnswer == correctAnswer) then
 			correctObject.isVisible = true
 			timer.performWithDelay(3000, HideCorrect)
 			event.target.text = ""

 		elseif (userAnswer ~= correctAnswer) then
 			incorrectObject.isVisible = true
 			timer.performWithDelay(3000, HideIncorrect)
 			event.target.text = ""
  		end
 	end
end

------------------------------------------------------------------------------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------------------------------------------------------------------------------

--displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/3, nil, 55)
questionObject:setTextColor(155/255, 42/255, 198/255)

--Create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/1.9, display.contentHeight/2, nil, 60)
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

--Create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/1.9, display.contentHeight/2, nil, 60)
incorrectObject:setTextColor(255/255, 0/255, 0/255)
incorrectObject.isVisible = false

--create a numeric field
numericField = native.newTextField( display.contentWidth/1.9, display.contentHeight/3, 170, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()