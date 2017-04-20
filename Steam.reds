Red/System [
	Title:   "Red/System Steam API binding"
	Author:  "Oldes"
	File: 	 %Steam.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#define ISteamClient!             int-ptr!
#define ISteamUser!               int-ptr!
#define ISteamFriends!            int-ptr!
#define ISteamUtils!              int-ptr!
#define ISteamMatchmaking!        int-ptr!
#define ISteamUserStats!          int-ptr!
#define ISteamApps!               int-ptr!
#define ISteamNetworking!         int-ptr!
#define ISteamMatchmakingServers! int-ptr!
#define ISteamRemoteStorage!      int-ptr!
#define ISteamScreenshots!        int-ptr!
#define ISteamHTTP!               int-ptr!
#define ISteamUnifiedMessages!    int-ptr!
#define ISteamController!         int-ptr!
#define ISteamUGC!                int-ptr!
#define ISteamAppList!            int-ptr!
#define ISteamMusic!              int-ptr!
#define ISteamMusicRemote!        int-ptr!
#define ISteamHTMLSurface!        int-ptr!
#define ISteamInventory!          int-ptr!
#define ISteamVideo!              int-ptr!

int64!:  alias struct! [lo [integer!] hi [integer!]] ;@@ must be changed once we will get real integer64! type
#define uint64! int64!
uint64-ref!: alias struct! [value [uint64!]]
int64-ref!:  alias struct! [value [int64!]]
logic-ref!:  alias struct! [value [logic!]]
string-ref!:  alias struct! [value [c-string!]]

#define uint16! integer! ;@@ must be changed once we will get real integer16! type

CGameID!: alias struct! [
	m_ulGameID [uint64! value]
	m_gameID   [struct! [
		m_nAppID [integer!]
		m_nType  [integer!]
		m_nModID [integer!]
	]]
]

#define CSteamID! uint64!
#define CSteamID-ref! uint64-ref!

FriendGameInfo!: alias struct! [
	m_gameID       [CGameID!]
	m_unGameIP     [integer!]
	;m_usGamePort "uint16"},
	;m_usQueryPort "uint16"},
	ports          [integer!]
	m_steamIDLobby [CSteamID!]
]

LeaderboardEntry!: alias struct! [
	m_steamIDUser [CSteamID!]
	m_nGlobalRank [integer!]
	m_nScore      [integer!]
	m_cDetails    [integer!]
	m_hUGC        [uint64!]
]

#include %Steam-enums.reds

#import [
	"Steam_api.dll" cdecl [
		SteamAPI_Shutdown: "SteamAPI_Shutdown" []
		SteamAPI_IsSteamRunning: "SteamAPI_IsSteamRunning" [
			return: [logic!]
		]
		SteamAPI_InitSafe: "SteamAPI_InitSafe" [
			return: [logic!]
		]
		SteamAPI_Init: "SteamAPI_Init" [
			return: [logic!]
		]
		;Steam API interface getters:
		GetISteamClient:             "SteamClient"          [return: [ISteamClient!]]
		GetISteamUser:               "SteamUser"            [return: [ISteamUser!]]
		GetISteamFriends:            "SteamFriends"         [return: [ISteamFriends!]]
		GetISteamUtils:              "SteamUtils"           [return: [ISteamUtils!]]
		GetISteamMatchmaking:        "SteamMatchmaking"     [return: [ISteamMatchmaking!]]
		GetISteamUserStats:          "SteamUserStats"       [return: [ISteamUserStats!]]
		GetISteamApps:               "SteamApps"            [return: [ISteamApps!]]
		GetISteamNetworking:         "SteamNetworking"      [return: [ISteamNetworking!]]
		GetISteamMatchmakingServers: "SteamMatchmakingServers" [return: [ISteamMatchmakingServers!]]
		GetISteamRemoteStorage:      "SteamRemoteStorage"   [return: [ISteamRemoteStorage!]]
		GetISteamScreenshots:        "SteamScreenshots"     [return: [ISteamScreenshots!]]
		GetISteamHTTP:               "SteamHTTP"            [return: [ISteamHTTP!]]
		GetISteamUnifiedMessages:    "SteamUnifiedMessages" [return: [ISteamUnifiedMessages!]]
		GetISteamController:         "SteamController"      [return: [ISteamController!]]
		GetISteamUGC:                "SteamUGC"             [return: [ISteamUGC!]]
		GetISteamAppList:            "SteamAppList"         [return: [ISteamAppList!]]
		GetISteamMusic:              "SteamMusic"           [return: [ISteamMusic!]]
		GetISteamMusicRemote:        "SteamMusicRemote"     [return: [ISteamMusicRemote!]]
		GetISteamHTMLSurface:        "SteamHTMLSurface"     [return: [ISteamHTMLSurface!]]
		GetISteamInventory:          "SteamInventory"       [return: [ISteamInventory!]]
		GetISteamVideo:              "SteamVideo"           [return: [ISteamVideo!]]
	]
]

unless SteamAPI_Init [
	"Steam init failed!"
	quit 1
]
print-line ["Steam running: " SteamAPI_IsSteamRunning]


#include %Steam-client.reds
#include %Steam-user.reds
#include %Steam-friends.reds
#include %Steam-utils.reds
#include %Steam-matchmaking.reds
#include %Steam-matchmaking-servers.reds
#include %Steam-remote-storage.reds
#include %Steam-user-stats.reds
#include %Steam-apps.reds
#include %Steam-networking.reds
#include %Steam-screenshots.reds
#include %Steam-music.reds
#include %Steam-music-remote.reds
#include %Steam-http.reds


SteamAPI_Shutdown

