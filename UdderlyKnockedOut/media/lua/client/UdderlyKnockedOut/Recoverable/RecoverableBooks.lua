RecoverableBooks = Recoverable:Derive("Books");

function RecoverableBooks:Update(player)
	self.Content = {}
	self.Content.Books = {}
	self.Content.ForgottenBooks = {}
	self.Content.Recipes = {}
	local recipeKeyCheck = {}
	local books = player:getAlreadyReadBook()
	for i=0, books:size()-1 do
		local book = books:get(i)
		--print("UKO: \""..book.."\".")
		local item = ScriptManager.instance:getItem(book)
		if item ~= nil then
			local recipes = item:getTeachedRecipes()
			if recipes ~= nil then
				local recipeCount = recipes:size()
				if UKO.random(SandboxVars.UdderlyKnockedOut.BookLossChance) then
					table.insert(self.Content.ForgottenBooks, book)
					for i=0, recipeCount - 1 do
						local recipe = recipes:get(i)
						recipeKeyCheck[recipe] = false --Do this even if forgetting the book to not add them during the sweep over all recipes later.
					end
				else		
					table.insert(self.Content.Books, book)
					for i=0, recipeCount - 1 do
						local recipe = recipes:get(i)
						recipeKeyCheck[recipe] = true
						table.insert(self.Content.Recipes, recipe)
					end	
				end
			else
				table.insert(self.Content.Books, book)
			end
		else
			print("UKO: Could not instantiate item for book \""..book.."\"!")
		end
	end
	
	--Catch any recipes that are known but not from books.
	local knownRecipes = player:getKnownRecipes()
	for i=0, knownRecipes:size() - 1 do
		local recipe = knownRecipes:get(i)
		local check = recipeKeyCheck[recipe] 
		if check ~= true and check ~= false then
			table.insert(self.Content.Recipes, recipe)
		end
	end
end

function RecoverableBooks:Recover(player)
	local knownRecipes = player:getKnownRecipes()
	local readBooks = player:getAlreadyReadBook()
	
	local bookCount = #self.Content.Books
	local recipeCount = #self.Content.Recipes
	
	print("UKO: Restoring "..bookCount.." read books.")
	for _,book in pairs(self.Content.Books) do
		print("UKO: Restoring read book \""..book.."\".")
		readBooks:add(book)
	end
	
	print("UKO: Restoring "..recipeCount.." recipes.")
	for _,recipe in pairs(self.Content.Recipes) do
		print("UKO: Restoring recipe \""..recipe.."\".")
		knownRecipes:add(recipe)
	end
	
	local forgottenBookCount = #self.Content.ForgottenBooks
	if forgottenBookCount > 0 then
		print("UKO: Forgot "..forgottenBookCount.." books.")
		Respawn.Message = Respawn.Message.." Oh I think I might need to brush up on a few recipes."
	end
end