RecoverableKills = Recoverable:Derive("Kills");

function RecoverableKills:Update(player)
	self.Content = player:getZombieKills()
end

function RecoverableKills:Recover(player)
	player:setZombieKills(self.Content)
end