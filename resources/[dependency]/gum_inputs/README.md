<b>Natives infromation from Framework</b> : http://gum-framework.eu/natives/
</br></br></br></br>



# Gum_Framework Notification</br></br>

<img src="https://cdn.discordapp.com/attachments/944656734134370344/992025963791650816/img.png"></img></br></br>
</br>
<h2>How use standart input :</h2>
<code>

	TriggerEvent("guminputs:getInput", "TEST", "TESTED", function(cb)
		local input = cb
		if input ~= 'close' then
			print(input)
		end
	end)

</code>
</br></br></br>
<h2>How use standart answer :</h2>
<code>

  	TriggerEvent("guminputs:getAnswer", "Are you OK", "Yes", "No", function(cb)
		local input = cb
		if input == true then
			print("YES")
			print("ALL IS OK")
			print("WORK GOOD")
			return true
		else
			print("STOP")
			print("DONT GO MORE")
			return false
		end
	end)
</code>


<!-- <b>Natives infromation from Framework</b> : http://gum-framework.eu/natives/
</br></br></br></br>



# Gum_Framework Input</br></br>
<img src="https://cdn.discordapp.com/attachments/944656734134370344/992025963791650816/img.png">
</br></br></br></br></br>

<h2>How use standart input :</h2>
<code>
&emsp;&emsp;TriggerEvent("guminputs:getInput", "TEST", "TESTED", function(cb)</br>
&emsp;&emsp;&emsp;&emsp;local input = cb</br>
&emsp;&emsp;&emsp;&emsp;if input ~= 'close' then</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;print(input)</br>
&emsp;&emsp;&emsp;&emsp;end</br>
&emsp;&emsp;end)</br>
</code>
</br></br></br></br></br>
<h2>How use standart answer :</h2>
<code>

&emsp;&emsp;TriggerEvent("guminputs:getAnswer", "Are you OK", "Yes", "No", function(cb)</br>
&emsp;&emsp;&emsp;&emsp;local input = cb</br>
&emsp;&emsp;&emsp;&emsp;if input == true then</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;print("YES")</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;print("ALL IS OK")</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;print("WORK GOOD")</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;return true</br>
&emsp;&emsp;&emsp;&emsp;else</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;print("STOP")</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;print("DONT GO MORE")</br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;return false</br>
&emsp;&emsp;&emsp;&emsp;end</br>
&emsp;&emsp;end)</br>
</code>

<code>

test

</code>
 -->
