json.kategori @kategori.each do |data|
    json.name data.name
    json.type data.jenis
    json.origin data.origin
    json.foods data.foods.each do |food|
        json.name food.name
        json.type food.jenis
        json.origin food.origin
        json.menus food.menus.each do |menu|
            json.name menu.name
            json.harga menu.harga
            json.image menu.image
            json.restoran menu.restoran
            # json.resto menu.restoran.name
            
        end
    end
end