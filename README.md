# Cronobitly URL Shortener

I took (maybe too many) shortcuts because of time restraints and my Rails install breaking. On the bright side, I have a lot of room for improvement with the app visually as well as working on finer workings of optimizing the way links are both generated and subsequently the amount of bashing the database will take from heavy use at scale.

Setup
```
rails db:create
rails db:migrate 
rails s
```

Main meat of the app 

```
require 'uri'

class Shortener < ApplicationRecord
    validates :given_url, presence: true, :format => {:with => URI.regexp}

    before_save :generate_slug

    def generate_slug
        alpha_numeric_az_AZ_09 = [('a'..'z'),('A'..'Z'),(0 .. 9)].map{|i| i.to_a}.flatten
        self.slug = (0...8).map{ alpha_numeric_az_AZ_09[rand(alpha_numeric_az_AZ_09.length)]}.join
    end
end

```

Generates alphanumeric slug with 3.5 trillion possible permutations


### Problems 

- I had no webpacker and no postgres gem for this project, I was going to use hotwire to make the link appear. Instead I had to settle for redirecting to the index with all of the links.
- An invalid link will result in nothing happening, had planned to use a JS library to validate urls before being submitted. 
- I cheated and used a fake domain name that doesn't exist cronobitly.com for the given url link that appears on the index page, in a real app this would need to be routed correctly with all the challenges to already existing pages (home controllers, error pages, etc) on the site that brings. 









