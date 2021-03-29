-- cezar v1

langEN = true
shouldDECRYPT = false
howManyLetters = 1

fullEN = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}

function getArgs()
	if #arg == 0 then
		print("usage: lua cezar.lua ARGUMENTS WORD")
		return 5;
	end
	i = 1;
	while i <= #arg do
		if arg[i] == "-d" then
			shouldDECRYPT = true
		elseif arg[i] == "-h" then
			print(
			[[usage: lua cezar.lua args word
			arguments:
			-h       help; shows this
			-d       decrypt; usage: lua cezar.lua -d decryptedword
			-n <int> change how much is the word shifted (max 11); e.g. lua cezar.lua -n 3
			]])
			os.exit()
		elseif arg[i] == "-n" then
			if arg[i+1] == nil then
				print("value for -n can't be nil")
				os.exit()
			end
			if tonumber(arg[i+1]) < 12 and tonumber(arg[i+1]) > 0 then
				howManyLetters = tonumber(arg[i+1])
				i = i + 1
			else
				print("bad syntax for -n or number is more than 11 or less than 1")
				os.exit()
			end
		else
			return arg[i]
		end

		i = i + 1
	end

	return 1
end


cword = getArgs()

if cword == 5 then
	os.exit()
elseif cword == 1 then
	print("word not given")
	os.exit()
end

cword_ARR = {}

i = 1

while i < string.len(cword) + 1 do
	cword_ARR[i] = string.sub(cword, i, i)
	i = i + 1
end

i = 1

if shouldDECRYPT == false then
	while i < #cword_ARR + 1 do
		j = 0
		isFound = false
		
		while isFound == false do
			if cword_ARR[i] == fullEN[j] then
				if j-howManyLetters < 1 then
					j = j + 26
				end
				cword_ARR[i] = fullEN[j-howManyLetters]
				isFound = true
				io.write(cword_ARR[i])
			elseif	j > 100 then
				isFound = true
				io.write(cword_ARR[i])
			else
				j = j + 1
			end
		end
		i = i + 1
	end
	print("")
else
	while i < #cword_ARR + 1 do
		j = 0
		isFound = false

		while isFound == false do
			if cword_ARR[i] == fullEN[j] then
				if j-howManyLetters < 1 then
					j = j + 26
				end
				cword_ARR[i] = fullEN[j+howManyLetters]
				isFound = true
				io.write(cword_ARR[i])
			elseif j > 100 then
				isFound = true
				io.write(cword_ARR[i])
			else
				j = j + 1
			end
		end
		i = i + 1
	end
	print("")
end

