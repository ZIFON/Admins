#include <sourcemod>


public Plugin myinfo =
{
    name = "Admins",
    author = "ZIFON",
    version = "1.0",
    url = "https://github.com/ZIFON"
};

public void OnPluginStart()
{
    RegConsoleCmd("sm_admins", Admins);


}

public Action Admins(int client, int args)
{
    Menu menu = new Menu(Menu_Admins);
    menu.SetTitle("ADMINS:");
    menu.AddItem("item1", "Онлайн админы");
    menu.AddItem("item2", "Главные Админы");
    menu.Display(client, 30);
    return Plugin_Handled;

}

public int Menu_Admins(Menu hMenu, MenuAction action, int iClient, int iItem)
{
    switch(action)
    {
        case MenuAction_Select:
        {
            if(iItem == 0)
            {
                char admins[128];
                for(new i = 1; i <= MaxClients; i++)
		        {
                    if(GetUserFlagBits(i) == ADMFLAG_ROOT)
                    {
                        GetClientName(i,admins, sizeof(admins[]));
                        
                    }
                    if(GetUserFlagBits(i) == ADMFLAG_GENERIC)
                    {
                        GetClientName(i,admins, sizeof(admins[]));
                    }
		        }
                Menu menu = new Menu(Menu_Admins);
                menu.SetTitle("Админы онлайн:");
                menu.GetItem(iItem, admins, sizeof(admins));
                menu.Display(iClient, 30);

            }
            if(iItem == 1)
            {


            }
        }
        case MenuAction_End:
        {
            delete hMenu;
        }



    }


}