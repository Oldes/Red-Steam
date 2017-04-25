Red/System [
	Title:   "Red/System Steam API binding"
	Author:  "Oldes"
	File: 	 %Steam.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#include %Steam.reds

unless SteamAPI_Init [
	print-line "Steam init failed!"
	quit 1
]
print-line ["Steam running: " SteamAPI_IsSteamRunning]

#include %Steam-Client.reds
#include %Steam-User.reds
#include %Steam-Friends.reds
;#include %Steam-Utils.reds
;#include %Steam-Matchmaking.reds
;#include %Steam-MatchmakingServers.reds
;#include %Steam-RemoteStorage.reds
;#include %Steam-UserStats.reds
;#include %Steam-Apps.reds
;#include %Steam-Networking.reds
;#include %Steam-Screenshots.reds
;#include %Steam-Music.reds
;#include %Steam-MusicRemote.reds
;#include %Steam-HTTP.reds
;#include %Steam-UnifiedMessages.reds
;#include %Steam-Controller.reds
;#include %Steam-UGC.reds
;#include %Steam-AppList.reds
;#include %Steam-HTMLSurface.reds
;#include %Steam-Inventory.reds
;#include %Steam-Video.reds
;#include %Steam-GameServer.reds
;#include %Steam-GameServerStats.reds

print-line ["Steam: " logged? " " id " " behindNAT? " " level]

list-friends: func[
	type [integer!]
	/local
		num [integer!]
		id  [uint64! value]
		name [c-string!]
][
	num: SteamAPI_ISteamFriends_GetFriendCount IFriends type
	print-line ["Friends count: " num]
	id: declare uint64!
	while [num > 0][
		num: num - 1
		id: SteamAPI_ISteamFriends_GetFriendByIndex IFriends num type
		name: SteamAPI_ISteamFriends_GetFriendPersonaName IFriends id 
		print-line [as int-ptr! id/hi " " as int-ptr! id/lo " " name]
	]
]

list-friends EFriendFlagAll





SteamAPI_Shutdown

