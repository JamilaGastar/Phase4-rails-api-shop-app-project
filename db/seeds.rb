# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = [ "Black Tigermist Strapless Dress", "Black Mini Skirt", "Tigermist Floral Summer Dress", "Tony Bianco Knee High Boots", "Long Silk White Skirt", "Long Silk White Skirt", "Meski Brown Cardigan", "Lioness Official Checkered Mini Dress", "Platform Docs", "Pink Ribbed Long Sleeved dress", "Faux leather, loose fit. Selling because they're too big for me"]
descriptions = ["Tigermist brand, only worn once, still in good condition.", "Mini Skirt with side slit, low waist fit. Never been worn so is still in great condition with tags", "Red floral dress with ruffled sleeves. Zips at the back.", "Faux leather, loose fit. Selling because they're too big for me", "Zips at the back, stretch fit.", "Selling as I no longer wear this. Stretch fit.", "Zips at the back. Selling because style doesn't suit me", "Orginal platform docs that I no longer wear", "Tight fit" ]
conditions = ["New - with tags", "New - without tags", "Used - Excellent", "Used - Good", "Used"]


user = User.create!([
{
    first_name: "Jemilla", 
    username: "jmila8000", 
    password: "secretP9!", 
    phone_number: "0423181333", 
    email_address: "jmila890@gmail.com", 
    location: "St Kilda East, 3183",
    bio: "Items from my wardrobe I no longer use/need. Prices negotiable", 
    image_url: ""
},
{
    first_name: "Gia", 
    username: "gigi2000", 
    password: "@gigi1993", 
    phone_number: "0450188000", 
    email_address: "gia@gmail.com", 
    location: "Prahran, 3181",
    bio: "FREE SHIPPING IF YOU BUY 3 ITEMS OR MORE. Pick up only.", 
    image_url: ""
},
{
first_name: "Maybes", 
username: "maybelline88", 
password: "$appLe1!8", 
phone_number: "0401555390", 
email_address: "maybelline.j@gmail.com", 
location: "Balaclava, 3183",
bio: "One girl, too many clothes..", 
image_url: ""
}
])


