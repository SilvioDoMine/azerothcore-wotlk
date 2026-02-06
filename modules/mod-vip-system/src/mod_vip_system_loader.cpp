// Forward declarations from individual script files
void AddVipSystemPlayerScript();
void AddVipSystemWorldScript();
void AddVipSystemCommandScript();

// Called by AzerothCore module auto-loader (name derived from module folder)
void Addmod_vip_systemScripts()
{
    AddVipSystemWorldScript();
    AddVipSystemPlayerScript();
    AddVipSystemCommandScript();
}
