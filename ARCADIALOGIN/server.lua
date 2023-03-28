RegisterNetEvent('arcadia:registrar_player')
AddEventHandler('arcadia:registrar_player', function(rlogin,rsenha)
    MySQL.Async.execute('INSERT INTO users (login,password) VALUES (@rlogin,@rsenha)',
  { ['@rlogin'] = rlogin, ['@rsenha'] = rsenha },
  function(affectedRows)
    print(affectedRows)
  end)
end)