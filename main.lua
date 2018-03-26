-- Title: Numeric TextField
-- Name: Bassim H
-- Course: ICS2O/3C
-- This program asks a user a math question, and displays incorrect or correct depending on the answer.
-----------------------------------------------------------------------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 0/255, 0/255, 0/255)

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
local randomNumber3
local randomNumber4
local userAnswer
local correctAnswer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTiomer
local lives = 3
local heart1
local heart2
local points = 0
local pointsObject
local randomOperator
------------------------------------------------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------
local function UpdateTime()
	
	--decrement the number of seconds	
	secondsLeft = secondsLeft - 1

	--display the number of senconds left in the clock object


end


local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 20)
	randomNumber2 = math.random(0, 20)
	randomNumber3 = math.random(0, 10)
	randomNumber4 = math.random(0, 10)
	randomOperator = math.random(1, 3)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 
	
	elseif (randomOperator == 2) then
		correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = " 
		if (correctAnswer <0) then
			correctAnswer = randomNumber2 - randomNumber1
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = " 
		end

	
	elseif (randomOperator == 3) then
		correctAnswer = randomNumber3 * randomNumber4
	
		--create question in text object
		questionObject.text = randomNumber3 .. " X " .. randomNumber4 .. " = " 
	end
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
 			timer.performWithDelay(2200, HideCorrect)
 			event.target.text = ""
 			points = points + 1
 			pointsObject.text = points 

 		elseif (userAnswer ~= correctAnswer) then
 			incorrectObject.isVisible = true
 			timer.performWithDelay(2200, HideIncorrect)
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
correctObject = display.newText( "Correct!", display.contentWidth/1.9, display.contentHeight/2, Georgia, 60)
correctObject:setTextColor(0/255, 0/255, 255/255)
correctObject.isVisible = false

--Create the points text object and make it invisible
pointsObject = display.newText(points, display.contentWidth/1.9, display.contentHeight*2/3, Georgia, 70)
pointsObject:setTextColor(0/255, 255/255, 0/255)
pointsObject.isVisible = true


--Create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/1.9, display.contentHeight/2, Georgia, 60)
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