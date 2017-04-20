Red/System [
	Title:   "Red/System SteamClient API binding"
	Author:  "Oldes"
	File: 	 %Steam-client.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

IClient: GetISteamClient

#import [
	"Steam_api.dll" stdcall [
		SteamAPI_ISteamClient_CreateSteamPipe: "SteamAPI_ISteamClient_CreateSteamPipe" [
			instancePtr [ISteamClient!]        ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamClient_BReleaseSteamPipe: "SteamAPI_ISteamClient_BReleaseSteamPipe" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			return: [logic!]
		]
		SteamAPI_ISteamClient_ConnectToGlobalUser: "SteamAPI_ISteamClient_ConnectToGlobalUser" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			return: [integer!]
		]
		SteamAPI_ISteamClient_CreateLocalUser: "SteamAPI_ISteamClient_CreateLocalUser" [
			instancePtr  [ISteamClient!]       ;intptr_t
			phSteamPipe  [int-ptr!]            ;HSteamPipe *
			eAccountType [EAccountType!]       ;EAccountType
			return: [integer!]
		]
		SteamAPI_ISteamClient_ReleaseUser: "SteamAPI_ISteamClient_ReleaseUser" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			hUser       [integer!]             ;HSteamUser
		]
		SteamAPI_ISteamClient_SetLocalIPBinding: "SteamAPI_ISteamClient_SetLocalIPBinding" [
			instancePtr [ISteamClient!]        ;intptr_t
			unIP        [integer!]             ;uint32
			usPort      [uint16!]              ;uint16
		]
		SteamAPI_ISteamClient_GetIPCCallCount: "SteamAPI_ISteamClient_GetIPCCallCount" [
			instancePtr [ISteamClient!]        ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamClient_SetWarningMessageHook: "SteamAPI_ISteamClient_SetWarningMessageHook" [
			instancePtr [ISteamClient!]        ;intptr_t
			pFunction   [function! [a [integer!] b [c-string!]]];SteamAPIWarningMessageHook_t
		]
		SteamAPI_ISteamClient_BShutdownIfAllPipesClosed: "SteamAPI_ISteamClient_BShutdownIfAllPipesClosed" [
			instancePtr [ISteamClient!]        ;intptr_t
			return: [logic!]
		]
	]
]

