{
	name: gameIGameRulesSystem,
	functions: {
		SendChat(chat: String),
		IsPlayerReady(PeerID: String) => (Bool),
		IsGameVictorious() => (Bool),
		IsGameUnsuccessful() => (Bool),
		GetHeistStatus() => (grsHeistStatus),
		ToString() => (String),
		GetClassName() => (CName),
		IsA(className: CName) => (Bool),
		IsExactlyA(className: CName) => (Bool),
	},
	staticFunctions: {
		DetectScriptableCycles(),
	},
	properties: {
	}
}