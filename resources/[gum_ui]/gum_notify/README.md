<b>Natives infromation from Framework</b> : http://gum-framework.eu/natives/
</br></br></br></br>



# Gum_Framework Notification</br></br>
- Notification is maked in NUI
- Style / Graphic is editable
- Icons will be loaded from Inventory Icon
  

<img src="https://cdn.discordapp.com/attachments/944656734134370344/992037843453095966/Untitled.png"></img></br></br>
</br>

Client-Side
<code>

    exports['gum_notify']:DisplayLeftNotification("Title", "Text like</br>new Line", "iconName", 2000)

</code>
</br></br></br>
Server-side
<code>

    TriggerClientEvent("gum_notify:notify", source, "Title", "Text like</br>new Line", "iconName", 2000)
</code>
