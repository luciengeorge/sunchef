namespace :selling_point do
  desc "Create selling points"
  task create: [:environment] do
    [
      {
        name: "Mint Basic Market"
      },
      {
        name: "Liv Good"
      },
      {
        name: "Emak Urban Spa"
      },
      {
        name: "A New Earth Store"
      },
      {
        name: "Amat Beirut"
      },
      {
        name: "Convivio"
      },
      {
        name: "Le Panier du Coin"
      },
      {
        name: "Tusk Bakery"
      },
      {
        name: "Fine Bouche"
      },
      {
        name: "La Vie Claire"
      },
      {
        name: "En Fraicheur"
      },
      {
        name: "Chi Tabi3i"
      },
      {
        name: "Akiki Frere"
      },
      {
        name: "Deir el Oumara"
      }
    ].each do |selling_point|
      SellingPoint.create(selling_point)
    end
  end
end
