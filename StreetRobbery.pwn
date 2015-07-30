// !! CREATED BY JAKWOB !!

#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <foreach>
#include <Message3>

#define MIN_ROBBERY_AMOUNT 100
#define MAX_ROBBERY_AMOUNT 100000

public OnFilterScriptInit()
{
	print("\t-------------------");
	print("\t  Street Robbery");
	print("\t--------v1.0-------");
	print("\t Created By Jakwob");
	print("\t-------------------");
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SetPlayerWantedLevel(playerid, 0);
	return 1;
}

CMD:sr(playerid, params[])
{
	new ID, amount, success = random(4), Float:x, Float:y, Float:z;
	if(sscanf(params, "ud", ID, amount)) return SendServerMessage(playerid, MSG_STYLE_USAGE, "/rob [playerid] [amount]");
	if(ID == playerid) return SendServerMessage(playerid, MSG_STYLE_ERROR, "You can not rob yourself!");
	if(GetPlayerWeapon(playerid) == 4)
	{
		if(!IsPlayerConnected(ID)) return SendServerMessage(playerid, MSG_STYLE_ERROR, "That player is not connected.");
		if(amount < MIN_ROBBERY_AMOUNT) return SendServerMessage(playerid, MSG_STYLE_ERROR, "You can not rob a player for less than $100");
		if(amount > MAX_ROBBERY_AMOUNT) return SendServerMessage(playerid, MSG_STYLE_ERROR, "You can not rob a player for more than $100,000");
		if(GetPlayerMoney(ID) < amount) return SendServerMessage(playerid, MSG_STYLE_ERROR, "The target does not have that amount of money, try a lower amount");
		GetPlayerPos(ID, x, y, z);
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z)) return SendServerMessage(playerid, MSG_STYLE_ERROR, "You are too far away from that player.");
		switch(success)
    	{
    	    case 0, 1, 2:
    	    {
    	    	new str[128];
    	    	format(str, sizeof str, "%s has tryed to rob you but failed. Kill him or spare his life", GetPName(playerid));
    	    	SendServerMessage(ID, MSG_STYLE_INFO, str);
    	    	SetPlayerWantedLevel(playerid, 3);
    	    	format(str, sizeof str, "You have failed to rob %s, and have been awarded 3 wanted stars", GetPName(ID));
    	    	SendServerMessage(playerid, MSG_STYLE_INFO, str);
    	        return 0;
    	    }
    	    case 3:
    	    {
    	    	new str[128];
    	    	GivePlayerMoney(playerid, amount);
				GivePlayerMoney(ID, - amount);
    	    	format(str, sizeof str, "%s has robbed $%d off you! Kill him or spare his life.", amount,  GetPName(playerid));
    	    	SendServerMessage(ID, MSG_STYLE_INFO, str);
    	    	SetPlayerWantedLevel(playerid, 1);
    	    	format(str, sizeof str, "You have robbed $%d from %s", amount,  GetPName(ID));
    	    	SendServerMessage(playerid, MSG_STYLE_INFO, str);
    	        return 1;
    	    }
		}
	}
	else
	{
		SendServerMessage(playerid, MSG_STYLE_ERROR, "You need to have a knife equiped to perform a robbery.");
	}
	return 1;
}

CMD:srhelp(playerid, params[])
{
	new str[1000];
	format(str, sizeof str, "* {FFFFFF}Use 'H' key to rob another player when close enough\n\
	* {FFFFFF}You need to have a knife equiped to be able to rob a target\n\
	* {FFFFFF}You can rob a target for the minium $100 and the maximum $100.000\n\
	* {FFFFFF}Use /sr or /streetrobbery to perform a sreet robbery\n\
	* {FFFFFF}You have a 25% chance of success\n\
	* {FFFFFF}You will receive 1 wanted star for a successful robbery and 3 wanted stars for a failed robbery.\n\n\
	\t\t\tCreated By Jakwob");
	ShowPlayerDialog(playerid, 9378, DIALOG_STYLE_MSGBOX, "Street Robbery Help", str, "Okay", "");
	return 1;
}


stock GetPName(playerid)
{
    new
        pName[MAX_PLAYER_NAME];

    GetPlayerName(playerid, pName, MAX_PLAYER_NAME);
    return pName;
}

// !! CREATED BY JAKWOB !!
