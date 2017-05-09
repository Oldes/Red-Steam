Red/System [
	Title:   "Red/System Steam API binding - basic functions"
	Author:  "Oldes"
	File: 	 %Steam.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#include %SteamAPI/Steam-API.reds

binary-ref!:  alias struct! [value [byte-ptr!]]

isReady: false

init: func[
	return: [logic!]
][
	if isReady [return true]
	isReady: SteamAPI_Init
	unless isReady [return false]
	ISteamClient:   GetISteamClient
	ISteamFriends:  GetISteamFriends
	ISteamUser:     GetISteamUser
	ISteamRemoteStorage: GetISteamRemoteStorage
	ISteamMusic:     GetISteamMusic
	ISteamUserStats: GetISteamUserStats
	ISteamController: GetISteamController

	SteamAPI_ISteamUserStats_RequestCurrentStats ISteamUserStats
	true
]

list-friends: func[
	type [integer!]
	/local
		num [integer!]
		id  [uint64! value]
		name [c-string!]
][
	num: SteamAPI_ISteamFriends_GetFriendCount ISteamFriends type
	print-line ["Friends count: " num]
	id: declare uint64!
	while [num > 0][
		num: num - 1
		id:   SteamAPI_ISteamFriends_GetFriendByIndex     ISteamFriends num type
		name: SteamAPI_ISteamFriends_GetFriendPersonaName ISteamFriends id 
		print-line [as int-ptr! id/hi " " as int-ptr! id/lo " " name]
	]
]

file-write: func[file [c-string!] data [byte-ptr!] length [integer!] return: [logic!]][
	as logic! SteamAPI_ISteamRemoteStorage_FileWrite ISteamRemoteStorage file data length
]
file-read: func[
	file [c-string!]
	data [binary-ref!]
	return: [integer!]
	/local
		size   [integer!]
		buffer [byte-ptr!]
		bytes  [integer!]
][
	size: SteamAPI_ISteamRemoteStorage_GetFileSize ISteamRemoteStorage file
	bytes: -1
	if size > 0 [
		buffer: allocate size
		bytes: SteamAPI_ISteamRemoteStorage_FileRead ISteamRemoteStorage file buffer size
		data/value: buffer
	]
	bytes
]
file-exists?: func[
	file [c-string!]
	return: [logic!]
][
	as logic! SteamAPI_ISteamRemoteStorage_FileExists ISteamRemoteStorage file
]
file-count: func[return: [integer!]][
	SteamAPI_ISteamRemoteStorage_GetFileCount ISteamRemoteStorage
]
list-files: func[
	/local
		num [integer!]
		bytes [integer!] 
		name [c-string!]
][
	num: SteamAPI_ISteamRemoteStorage_GetFileCount ISteamRemoteStorage
	bytes: 0
	while [num > 0] [
		num: num - 1
		name: SteamAPI_ISteamRemoteStorage_GetFileNameAndSize ISteamRemoteStorage num :bytes
		print-line [num #"^-" name #"^-" bytes]
		
	]
]
list-achievements: func[
	/local
		num [integer!]
		name [c-string!]
		bAchieved [logic-ref!]
][
	num: SteamAPI_ISteamUserStats_GetNumAchievements ISteamUserStats
	bAchieved: declare logic-ref!
	while [num > 0] [
		num: num - 1
		name: SteamAPI_ISteamUserStats_GetAchievementName ISteamUserStats num
		SteamAPI_ISteamUserStats_GetAchievement ISteamUserStats name bAchieved
		print-line [num #"^-" name #"^-" bAchieved/value]
	]
]

ConnectedControllers: as int-ptr! allocate (16 * STEAM_CONTROLLER_MAX_COUNT)
ConnectedControllersCount: 0

get-controllers: func[
	/local
		num [integer!]
		handles [int-ptr!]
		handle [uint64-ref!]

][
	ConnectedControllersCount: SteamAPI_ISteamController_GetConnectedControllers ISteamController ConnectedControllers
	num:     ConnectedControllersCount
	handles: ConnectedControllers
	print-line ["GetConnectedControllers: " num]
	if all [num >=  0 num <= STEAM_CONTROLLER_MAX_COUNT][
		while [num > 0] [
			num: num - 1
			handle: as uint64-ref! handles
			print-line [(ConnectedControllersCount - num) #"^-" as int-ptr! handle/hi #"-" as int-ptr! handle/lo ]
			handles: handles + 2
		]
	]
]


info: func[
	/local
		total     [uint64!]
		available [uint64!]
		res       [steam-logic!]
][
	if any [isReady init] [
		print-line ["Steam running: " SteamAPI_IsSteamRunning]
		print-line ["User_BLoggedOn: " as logic! SteamAPI_ISteamUser_BLoggedOn ISteamUser ]
		print-line ["User_GetPlayerSteamLevel: " SteamAPI_ISteamUser_GetPlayerSteamLevel ISteamUser]
		print-line ["Friends_GetPersonaName: " SteamAPI_ISteamFriends_GetPersonaName ISteamFriends]
		print-line ["Friends_GetPersonaState: " SteamAPI_ISteamFriends_GetPersonaState ISteamFriends]

		print-line ""
		list-friends EFriendFlagAll

		print-line ""
		print-line ["RemoteStorage_IsCloudEnabledForAccount: " as logic! SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount ISteamRemoteStorage]

		total: declare uint64! 0
		available: declare uint64! 0

		res: SteamAPI_ISteamRemoteStorage_GetQuota ISteamRemoteStorage total available
		if as logic! res [
			print-line ["RemoteStorage_GetQuota total: " total/lo " available: " available/lo]
		]

		print-line ["Files on SteamCloud:"]
		list-files

		print-line ""
		print-line ["Music_BIsEnabled: " as logic! SteamAPI_ISteamMusic_BIsEnabled ISteamMusic]
		print-line ["Music_BIsPlaying: " as logic! SteamAPI_ISteamMusic_BIsPlaying ISteamMusic]

		print-line ""
		print-line ["UserStats_SetAchievement (ACH_TRAVEL_FAR_SINGLE): " as logic! SteamAPI_ISteamUserStats_SetAchievement ISteamUserStats "ACH_TRAVEL_FAR_SINGLE"]
		print-line "Game achievements:"
		list-achievements

		print-line ""
		print-line ["Controller_Init: " as logic! SteamAPI_ISteamController_Init ISteamController]
		SteamAPI_ISteamController_RunFrame ISteamController

		get-controllers
	]
]
