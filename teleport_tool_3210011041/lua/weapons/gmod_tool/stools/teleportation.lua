AddCSLuaFile()

-- Устанавливаем категорию и название инструмента
TOOL.Category = "Construction"
TOOL.Name = "Teleportation"

-- Устанавливаем информацию о действии
TOOL.Information = {
    { name = "info", stage = 1 },
    { name = "left" }
}


function TOOL:LeftClick(trace)
    if CLIENT then return true end 
    if not trace.HitPos then return false end 

    local ply = self:GetOwner()
    local pos = trace.HitPos


    if IsValid(trace.Entity) then
        
        local dir = (trace.HitPos - ply:GetPos()):GetNormalized()
        pos = trace.HitPos + dir * -10 
    end

    ply:SetPos(pos) 

    return true 
end

if CLIENT then

    language.Add("tool.Teleportation.name", "Teleportation")
    language.Add("tool.Teleportation.desc", "Use this tool to teleport to a position.")


    language.Add("tool.Teleportation.left", "Teleport")
end


/*
| Copyright © diopop1 - 2024 |

[ diopop1 - development. ]
[ ChatGPT - assistance in writing code. ]

All rights reserved, but you can improve the addon and release it as an improved version but with me as the author of the original addon.
*/
