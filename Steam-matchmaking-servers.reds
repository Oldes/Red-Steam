Red/System [
	Title:   "Red/System SteamMatchmakingServers API binding"
	Author:  "Oldes"
	File: 	 %Steam-matchmaking-servers.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

IMatchmakingServers: GetISteamMatchmakingServers

#import [
	"Steam_api.dll" stdcall [
		SteamAPI_ISteamMatchmakingServers_RequestInternetServerList: {SteamAPI_ISteamMatchmakingServers_RequestInternetServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestLANServerList: {SteamAPI_ISteamMatchmakingServers_RequestLANServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList: {SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList: {SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList: {SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList: {SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_ReleaseRequest: "SteamAPI_ISteamMatchmakingServers_ReleaseRequest" [
			instancePtr        [ISteamMatchmakingServers!];intptr_t
			hServerListRequest [byte-ptr!]     ;HServerListRequest
		]
		SteamAPI_ISteamMatchmakingServers_CancelQuery: "SteamAPI_ISteamMatchmakingServers_CancelQuery" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
		]
		SteamAPI_ISteamMatchmakingServers_RefreshQuery: "SteamAPI_ISteamMatchmakingServers_RefreshQuery" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
		]
		SteamAPI_ISteamMatchmakingServers_IsRefreshing: "SteamAPI_ISteamMatchmakingServers_IsRefreshing" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			return: [logic!]
		]
		SteamAPI_ISteamMatchmakingServers_GetServerCount: "SteamAPI_ISteamMatchmakingServers_GetServerCount" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_RefreshServer: "SteamAPI_ISteamMatchmakingServers_RefreshServer" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			iServer     [integer!]             ;int
		]
		SteamAPI_ISteamMatchmakingServers_PingServer: "SteamAPI_ISteamMatchmakingServers_PingServer" [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			unIP                [integer!]     ;uint32
			usPort              [uint16!]      ;uint16
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingPingResponse *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_PlayerDetails: "SteamAPI_ISteamMatchmakingServers_PlayerDetails" [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			unIP                [integer!]     ;uint32
			usPort              [uint16!]      ;uint16
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingPlayersResponse *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_ServerRules: "SteamAPI_ISteamMatchmakingServers_ServerRules" [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			unIP                [integer!]     ;uint32
			usPort              [uint16!]      ;uint16
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingRulesResponse *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_CancelServerQuery: {SteamAPI_ISteamMatchmakingServers_CancelServerQuery} [
			instancePtr  [ISteamMatchmakingServers!];intptr_t
			hServerQuery [integer!]            ;HServerQuery
		]
	]
]

