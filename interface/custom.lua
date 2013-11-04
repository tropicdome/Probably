
ProbablyEngine.rotation.list_custom = (function()
  local classId = select(3, UnitClass("player"))
  local mySpecId, _, _, _, _, _ = GetSpecializationInfo(GetSpecialization())


  info = { }
  info.isTitle = false
  info.notCheckable = true
  info.text = '|cff2c9800Rotation Manager|r'
  info.func = function()
    ProbablyEngine.interface.manager()
  end
  UIDropDownMenu_AddButton(info)


  info = { }
  info.isTitle = true
  info.notCheckable = true
  info.text = 'Default Rotations'
  UIDropDownMenu_AddButton(info)

  for specId,_ in pairs(ProbablyEngine.rotation.rotations) do
    if specId == mySpecId then
      info = { }
      info.text = ProbablyEngine.rotation.specId[specId]
      info.value = info.text
      info.checked = (ProbablyEngine.rotation.currentStringComp == info.text or ProbablyEngine.rotation.currentStringComp == "")
      info.func = function()
        local text = ProbablyEngine.rotation.specId[specId]
        ProbablyEngine.rotation.currentStringComp = text
        ProbablyEngine.rotation.activeRotation = ProbablyEngine.rotation.rotations[specId]
        if ProbablyEngine.rotation.oocrotations[ProbablyEngine.module.player.specId] then
          ProbablyEngine.rotation.activeOOCRotation = ProbablyEngine.rotation.oocrotations[ProbablyEngine.module.player.specId]
        else
          ProbablyEngine.rotation.activeOOCRotation = false
        end
        ProbablyEngine.print('Switched active rotation to: ' .. text)
      end
      UIDropDownMenu_AddButton(info)
    end
  end

  info = { }
  info.isTitle = true
  info.notCheckable = true
  info.text = 'Custom Rotations'
  UIDropDownMenu_AddButton(info)

  if ProbablyEngine.rotation.custom[mySpecId] then
    for _,rotation in pairs(ProbablyEngine.rotation.custom[mySpecId]) do
      info = { }
      info.text = rotation.desc
      info.value = info.text
      info.checked = (ProbablyEngine.rotation.currentStringComp == info.text)
      info.func = function()
        local text = rotation.desc
        ProbablyEngine.rotation.currentStringComp = text
        ProbablyEngine.rotation.activeRotation = rotation.spellTable
        if rotation.oocrotation then
          ProbablyEngine.rotation.activeOOCRotation = rotation.oocrotation
        else
          ProbablyEngine.rotation.activeOOCRotation = false
        end
        ProbablyEngine.print('Switched active rotation to: ' .. text)
      end
      UIDropDownMenu_AddButton(info)
    end
  else
    info = { }
    info.isTitle = false
    info.notCheckable = true
    info.text = 'No Custom Rotations Loaded'
    UIDropDownMenu_AddButton(info)
  end



end)
