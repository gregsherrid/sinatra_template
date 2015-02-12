#!/bin/env ruby
# encoding: utf-8

class Hash
	def map_values( &trans )
		out_map = {}
		self.each do |key, val|
			out_map[key] = trans.call( val )
		end
		return out_map
	end

	def sorted_pairs
		self.to_a.sort_by do |pair|
			pair[1]
		end.reverse
	end
end

class Array
	def map_to_hash( &trans )
		out_map = {}
		self.each do |val|
			out_map[val] = trans.call( val )
		end
		return out_map
	end

	def move_to_front!( element, a=self )
		i = a.index( element )
		a.unshift( a.delete_at( i ) ) if i
		a
	end

	def move_to_front( element )
		move_to_front!( element, self.clone )
	end

	def frequencies( &trans )
		trans ||= lambda {|i| i}
		out_map = {}
		self.each do |val|
			t_val = trans.call( val )
			out_map[t_val] = out_map[t_val].to_i + 1
		end
		return out_map
	end

	def element_after( val )
		index = index( val )
		return nil if index.nil?
		return self[ index + 1 ]
	end

	##Rails
	def sum(identity = 0, &block)
		if block_given?
			map(&block).sum(identity)
		else
			inject { |sum, element| sum + element } || identity
		end
	end
end

class String
	def alphanumeric_and_spaces
		self.gsub(/[^0-9A-Za-z\s]/, '')
	end

	def squish_me
		#replace new lines, tabs, nbsp and then compressing to single spaces
		self.gsub( "\n", " " ).gsub( "\r", " " ).gsub( "\t", " " ).gsub(" ", " ").squeeze(" ")
	end

	def blank?
		respond_to?(:empty?) ? !!empty? : !self
	end

	def strip_whitespace
		self.gsub( "\n", "" ).gsub( "\r", "" ).gsub( "\t", "" ).gsub( " ", "" ).gsub(" ", " ")
	end
end

class Float
	def as_percent(rnd=1)
		(self * 100).round(rnd).to_s + "%"
	end
end 
