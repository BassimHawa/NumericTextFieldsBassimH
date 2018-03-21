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

 local function NumericFieldListener( event )
 	
 	--User begins editing "numericField"
 	if ( event.phase == "began" ) then

 		--clear text field
 		event.target.text = ""

 	elseif ( event.phase == "submitted" ) then

 		--when the answer is submitted (enter key is pressed) set user input to user's answer
 		userAnswer = tonumber(event.target.text)

 		--if the user's answer and the correct answer are the same:
 		if (userAnswer == correctAnswer) then
 			correctObject.isVisible = true
 			timer.performWithDelay(2000, HideCorrect)
 		end
 	end
end

------------------------------------------------------------------------------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------------------------------------------------------------------------------

--displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(155/255, 42/255, 198/255)

--Create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

--create a numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()