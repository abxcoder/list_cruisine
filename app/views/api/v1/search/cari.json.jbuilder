json.food @food.each do |foods|
    json.name foods.name
    json.type foods.jenis
    json.from foods.origin
    json.menus foods.menus.each do |menu|
        json.name menu.name
        json.harga menu.harga
        json.image menu.image
        json.restoran menu.restoran
    end
end

