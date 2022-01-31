require 'uri'


class Shortener < ApplicationRecord
    validates :given_url, presence: true, :format => {:with => URI.regexp}

    before_save :generate_slug

    def generate_slug
        alpha_numeric_az_AZ_09 = [('a'..'z'),('A'..'Z'),(0 .. 9)].map{|i| i.to_a}.flatten
        self.slug = (0...8).map{ alpha_numeric_az_AZ_09[rand(alpha_numeric_az_AZ_09.length)]}.join
    end
end
