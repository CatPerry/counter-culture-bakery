require "sinatra"
require 'sendgrid-ruby'

include SendGrid

from = Email.new(email: '000.perry@gmail.com')
to = Email.new(email: '000.perry@gmail.com')

get "/" do
  erb :index
end

get "/cupcakes" do
  @cupcakes = true
  erb :cupcakes, :layout => :cupcakes_landing
end

get "/donuts" do
  erb :donuts
  erb :donuts, :layout => :donuts_landing
end

get "/cakes" do
  erb :cakes
  erb :cakes, :layout => :cakes_landing
end

post "/" do
  sg = SendGrid::API.new(api_key: ENV["API_KEY"])
  subject = params[:name]
  content = Content.new(type: 'text/html', 
    value: 
    '<p><strong>COUNTER CULTURE BAKERY CATALOG</strong><br>
    Feel free to reach out with any questions or for quotes for your upcoming event.</p>
    
    <p><strong>CUPCAKES</strong></p>
    <p><a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/qg2szwxn1/snowball-cupcakes.jpg" alt="snowball-cupcakes"/></a><br>
    Name: Snowball Cupcake, Price: $4 <br> 
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/6y85jxaz1/butterscotch-cupcakes.jpg" alt="butterscotch-cupcakes"/></a><br>
    Name: Butterscotch Cupcake, Price: $4 <br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/cmegatn19/chocolate-fairy-cupcake.jpg" alt="chocolate-fairy-cupcake"/></a><br>
    Name: Chocolate Fairy Cupcake, Price: $4 <br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/wtrw34zy5/easy-galaxy-cucakes.jpg" alt="easy-galaxy-cucakes"/></a><br>
    Name: Easy Galaxy Cupcake, Price: $4 <br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/wtrw357nx/panda-oreo-cupcakes.jpg" alt="panda-oreo-cupcakes"/></a><br>
    Name: Panda Oreo Cupcake, Price: $4<br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/4gweco6i5/green-tea-cupcake.jpg" alt="green-tea-cupcake"/></a><br>
    Name: Green Tea Cupcake, Price: $4 <br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/xjaofifx9/minion-cupcakes.jpg" alt="minion-cupcakes"/></a><br>
    Name: Minion Cupcake, Price: $4 <br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/up7j22lgt/paloma-cupcakes.jpg" alt="paloma-cupcakes"/></a><br>
    Name: Paloma Cupcake, Price: $4 <br>
    <a href="http://localhost:4567/cupcakes" target="_blank"><img src="https://s14.postimg.cc/cmegavcrh/graffiti_cupcakes_by_igasm.jpg" alt="graffiti_cupcakes_by_igasm"/></a><br>
    Name: Grafitti Cupcake, Price: $4 <br></p>

    <p><strong>DONUTS</strong></p>
    <p><a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/46ovtomul/funetti.jpg" alt="funetti"/></a><br>
    Name: Funetti Confetti Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/6o0n0xz19/glazed-waffle.jpg" alt="glazed-waffle"/></a><br>
    Name: Glazed Waffle Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/9uv6klm25/pistachio-pumpkin.jpg" alt="pistachio-pumpkin"/></a><br>
    Name: Pistachio Pumpkin Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/cc6xruy8t/nutella.jpg" alt="nutella"/></a><br>
    Name: Nutella Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/d1pq46w7h/baked-maple.jpg" alt="baked-maple"/></a><br>
    Name: Baked Maple Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/5lqgif3d9/smoresbaked.jpg" alt="smoresbaked"/></a><br>
    Name: Smores Bake Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/6o0n0z9bx/vegan-sprinkles.jpg" alt="vegan-sprinkles"/></a><br>
    Name: Vegan Sprinkles Donut, Price: $2.50  <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/vha71lxh9/lemon-poppyseed.jpg" alt="lemon-poppyseed"/></a><br>
    Name: Lemon Poppyseed Donut, Price: $2.50 <br>
    <a href="http://localhost:4567/donuts" target="_blank"><img src="https://s14.postimg.cc/m9hyky0pp/snickerdoodle.jpg" alt="snickerdoodle"/></a><br>
    Name: Snickerdoodle Donut, Price: $2.50 <br></p>
    
    <p><strong>CAKE</stong></p>
    <p><a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/mz44zs4ez/classic-victoria-sponge-cake.jpg" alt="classic-victoria-sponge-cake"/></a><br>
    Name: Victoria Sponge Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/tpkm9870b/fresh-strawberry-cake.jpg" alt="fresh-strawberry-cake"/></a><br>
    Name: Strawberry Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/p3oi0vdrf/lemon-lava-cakes.jpg" alt="lemon-lava-cakes"/></a><br>
    Name: Lemon Lava Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/7qe7m15ln/matcha-mille-crepe-cake.jpg" alt="matcha-mille-crepe-cake"/></a><br>
    Name: Matcha Mille Crepe Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/qiq2pmhff/molten-chocolate-cake.jpg" alt="molten-chocolate-cake"/></a><br>
    Name: Molten Chocolate Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/6bcmxbzdn/rainbow-surprise-inside-cake.jpg" alt="rainbow-surprise-inside-cake"/></a><br>
    Name: Rainbow Surprise Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/6bcmxbrnv/tuscan-apple-cake.jpg" alt="tuscan-apple-cake"/></a><br>
    Name: Tuscan Apple Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/qvhgvscjv/red-velvet-cake.jpg" alt="red-velvet-cake"/></a><br>
    Name: Red Velvet Cake, Price: $27 <br>
    <a href="http://localhost:4567/cakes" target="_blank"><img src="https://s9.postimg.cc/uf3elmpkb/vegan-lemon-bluberry-swirl-cheesecake.jpg" alt="vegan-lemon-bluberry-swirl-cheesecake"/></a><br>
    Name: Vegan Lemon Cake, Price: $27</p>'
    )
    
  # # create mail object with from, subject, to and content
  mail = Mail.new(from, subject, to, content)
  # sends the email
  response = sg.client.mail._('send').post(request_body: mail.to_json)

  # display http response code
  puts response.status_code

  # display http response body
  puts response.body

  # display http response headers
  puts response.headers

  redirect "/"  
end


