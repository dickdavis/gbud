# Copyright 2016 Richard Davis
#
# This file is part of gbud.
#
# gbud is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# gbud is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with gbud.  If not, see <http://www.gnu.org/licenses/>.

module GBud
  class ProjectMetadata
    attr_reader :name,
                :summary,
                :description,
                :authors,
                :email,
                :url,
                :version,
                :license

    def initialize
      @version = '0.0.1'
      @license = 'GPL-3.0'
    end

    def name= name
      @name = name unless validate_name(name).nil?
    end

    def authors= authors
      @authors = authors.split(', ')
    end

    def email= email
      @email = email unless validate_email(email).nil?
    end

    def url= url
      @url = url unless validate_url(url).nil?
    end

    def summary= summary
      @summary = summary
    end

    def description= description
      @description = description
    end

    def to_hash
      {
        name: @name,
        authors: @authors,
        email: @email,
        url: @url,
        summary: @summary,
        description: @description,
        version: @version,
        license: @license
      }
    end

    def validate_name name
      /\A[a-z][a-z0-9_\-]*\Z/i =~ name
    end

    def validate_email email
      /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i =~ email
    end

    def validate_url url
      /https?:\/\/[\S]+/ =~ url
    end
  end
end
