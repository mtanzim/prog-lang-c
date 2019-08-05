# University of Washington, Programming Languages, Homework 7, 
# hw7testsprovided.rb

require "./hw7.rb"

# Will not work completely until you implement all the classes and their methods

# Will print only if code has errors; prints nothing if all tests pass

# These tests do NOT cover all the various cases, especially for intersection

#Constants for testing
ZERO = 0.0
ONE = 1.0
TWO = 2.0
THREE = 3.0
FOUR = 4.0
FIVE = 5.0
SIX = 6.0
SEVEN = 7.0
TEN = 10.0

#Point Tests
a = Point.new(THREE,FIVE)
# line segment test
a_ls = LineSegment.new(THREE,FIVE, FIVE,FIVE)
a_ls_intersect = a.intersect(a_ls)
if not a_ls_intersect.is_a? Point
	puts "Line seg with point not working"
end
if not (a_ls_intersect.x==THREE and a_ls_intersect.y == FIVE)
	puts "Line seg with point not working"
end
a_ls = LineSegment.new(THREE,FIVE, FIVE,FIVE)
a_ls_intersect_rev = a_ls.intersect(a)
if not a_ls_intersect_rev.is_a? Point
	puts "Line seg with point not working"
end
if not (a_ls_intersect_rev.x==THREE  and a_ls_intersect.y == FIVE)
	puts "Line seg with point not working"
end
a_ls_intersect_neg = a_ls.intersect(Point.new(ZERO,ZERO))
if not a_ls_intersect_neg.is_a? NoPoints
	puts "Line seg with point not working for negative case"
end


if not (a.x == THREE and a.y == FIVE)
	puts "Point is not initialized properly"
end
if not (a.eval_prog([]) == a)
	puts "Point eval_prog should return self"
end
if not (a.preprocess_prog == a)
	puts "Point preprocess_prog should return self"
end
a1 = a.shift(THREE,FIVE)
if not (a1.x == SIX and a1.y == TEN)
	puts "Point shift not working properly"
end
a2 = a.intersect(Point.new(THREE,FIVE))
if not (a2.x == THREE and a2.y == FIVE)
	puts "Point intersect not working properly"
end 
a3 = a.intersect(Point.new(FOUR,FIVE))
if not (a3.is_a? NoPoints)
	puts "Point intersect not working properly"
end


#Line Tests
puts "Line + LineSeg tests"
b = Line.new(THREE,FIVE)
# Line segment test
b_orig = Line.new(ONE,ZERO)
b_ls = LineSegment.new(THREE,THREE, FIVE,FIVE)
l_int_ls = b_orig.intersect(b_ls)
puts l_int_ls.is_a? LineSegment
puts l_int_ls.x1
puts l_int_ls.y1
puts l_int_ls.x2
puts l_int_ls.y2
l_int_ls_rev = b_ls.intersect(b_orig)
puts l_int_ls_rev.is_a? LineSegment
puts l_int_ls_rev.x1
puts l_int_ls_rev.y1
puts l_int_ls_rev.x2
puts l_int_ls_rev.y2
b_neg = Line.new(THREE,ZERO)
l_int_ls_neg = b_ls.intersect(b_neg)
puts l_int_ls_neg.is_a? NoPoints
puts "Line + LineSeg tests END"


if not (b.m == THREE and b.b == FIVE)
	puts "Line not initialized properly"
end
if not (b.eval_prog([]) == b)
	puts "Line eval_prog should return self"
end
if not (b.preprocess_prog == b)
	puts "Line preprocess_prog should return self"
end

b1 = b.shift(THREE,FIVE) 
if not (b1.m == THREE and b1.b == ONE)
	puts "Line shift not working properly"
end

b2 = b.intersect(Line.new(THREE,FIVE))
if not (((b2.is_a? Line)) and b2.m == THREE and b2.b == FIVE)
	puts "Line intersect not working properly"
end
b3 = b.intersect(Line.new(THREE,FOUR))
if not ((b3.is_a? NoPoints))
	puts "Line intersect not working properly"
end

# ADDED: line point intersect
# b: y = 3x + 5
b_lp_a = b.intersect(Point.new(ZERO,FIVE))
if not ((b_lp_a.is_a? Point))
	puts "Line intersect with point not working properly"
end
if not (b_lp_a.x == ZERO and b_lp_a.y == FIVE)
	puts "Line intersect with point not working properly"
end
b_lp_a_rev = Point.new(ZERO,FIVE).intersect(b)
if not ((b_lp_a_rev.is_a? Point))
	puts "Point intersect with Line not working properly"
end
if not (b_lp_a_rev.x == ZERO and b_lp_a_rev.y == FIVE)
	puts "Line intersect with point not working properly"
end

b_lp_b = Point.new(THREE,FIVE).intersect(b)
if not ((b_lp_b.is_a? NoPoints))
	puts "Point intersect with Line not working properly"
end
b_lp_b_rev = b.intersect(Point.new(THREE,FIVE))
if not ((b_lp_b_rev.is_a? NoPoints))
	puts "Point intersect with Line not working properly"
end

#VerticalLine Tests
c = VerticalLine.new(THREE)
puts "VertLine + LineSeg tests"
# Line segment tests
c_ls = LineSegment.new(THREE,THREE, THREE,FIVE)
c_ls_vl_int = c_ls.intersect(c)
puts c_ls_vl_int.is_a? LineSegment
puts c_ls_vl_int.x1
c_ls_vl_int_rev = c.intersect(c_ls)
puts c_ls_vl_int_rev.is_a? LineSegment
puts c_ls_vl_int_rev.x1
c_ls_vl_int_neg = VerticalLine.new(FOUR).intersect(c_ls)
puts c_ls_vl_int_neg.is_a? NoPoints
puts "VertLine + LineSeg tests END"
puts ""
puts ""
puts ""

if not (c.x == THREE)
	puts "VerticalLine not initialized properly"
end

if not (c.eval_prog([]) == c)
	puts "VerticalLine eval_prog should return self"
end
if not (c.preprocess_prog == c)
	puts "VerticalLine preprocess_prog should return self"
end
c1 = c.shift(THREE,FIVE)
if not (c1.x == SIX)
	puts "VerticalLine shift not working properly"
end
c2 = c.intersect(VerticalLine.new(THREE))
if not ((c2.is_a? VerticalLine) and c2.x == THREE )
	puts "VerticalLine intersect not working properly"
end
c3 = c.intersect(VerticalLine.new(FOUR))
if not ((c3.is_a? NoPoints))
	puts "VerticalLine intersect not working properly"
end

# ADDED: test vline against point
# c: x=3
c3_vlp = c.intersect(Point.new(THREE,FIVE))
if not ((c3_vlp.is_a? Point))
	puts "VerticalLine intersect with Point not working properly"
end
if not (c3_vlp.x == THREE and c3_vlp.y == FIVE)
	puts "VerticalLine intersect with point not working properly"
end
c3_vlp_rev = Point.new(THREE,FIVE).intersect(c)
if not ((c3_vlp_rev.is_a? Point))
	puts "VerticalLine intersect with Point not working properly"
end
if not (c3_vlp_rev.x == THREE and c3_vlp_rev.y == FIVE)
	puts "VerticalLine intersect with point not working properly"
end
c3_vlp_neg = Point.new(ZERO,FIVE).intersect(c)
if not ((c3_vlp_neg.is_a? NoPoints))
	puts "VerticalLine intersect with Point not working properly"
end
c3_vlp_neg_rev = c.intersect(Point.new(ZERO,FIVE))
if not ((c3_vlp_neg_rev.is_a? NoPoints))
	puts "VerticalLine intersect with Point not working properly"
end

# ADDED: test vline against line
# c: x=3
# b: y = 3x + 5
# intersection: Point(3,14)
# all lines intersect with vertical lines
c4_line_vl = c.intersect(b)
if not ((c4_line_vl.is_a? Point))
	puts "VerticalLine intersect with Point not working properly"
end
if not (c4_line_vl.x == THREE and c4_line_vl.y == TEN+FOUR)
	puts "VerticalLine intersect with point not working properly"
end
c4_line_vl_rev = b.intersect(c)
if not ((c4_line_vl_rev.is_a? Point))
	puts "VerticalLine intersect with Point not working properly"
end
if not (c4_line_vl_rev.x == THREE and c4_line_vl_rev.y == TEN+FOUR)
	puts "VerticalLine intersect with point not working properly"
end

#LineSegment Tests
d = LineSegment.new(ONE,TWO,-THREE,-FOUR)
if not (d.eval_prog([]) == d)
	puts "LineSegement eval_prog should return self"
end
d1 = LineSegment.new(ONE,TWO,ONE,TWO)
d2 = d1.preprocess_prog
if not ((d2.is_a? Point)and d2.x == ONE and d2.y == TWO) 
	puts "LineSegment preprocess_prog should convert to a Point"
	puts "if ends of segment are real_close"
end

d = d.preprocess_prog
if not (d.x1 == -THREE and d.y1 == -FOUR and d.x2 == ONE and d.y2 == TWO)
	puts "LineSegment preprocess_prog should make x1 and y1"
	puts "on the left of x2 and y2"
end

d3 = d.shift(THREE,FIVE)
if not (d3.x1 == ZERO and d3.y1 == ONE and d3.x2 == FOUR and d3.y2 == SEVEN)
	puts "LineSegment shift not working properly"
end

d4 = d.intersect(LineSegment.new(-THREE,-FOUR,ONE,TWO))
if not (((d4.is_a? LineSegment)) and d4.x1 == -THREE and d4.y1 == -FOUR and d4.x2 == ONE and d4.y2 == TWO)	
	puts "LineSegment intersect 1 not working properly"
end
d5 = d.intersect(LineSegment.new(TWO,THREE,FOUR,FIVE))
if not ((d5.is_a? NoPoints))
	puts "LineSegment intersect 2 not working properly"
end

#Intersect Tests
i = Intersect.new(LineSegment.new(-ONE,-TWO,THREE,FOUR), LineSegment.new(THREE,FOUR,-ONE,-TWO))
i1 = i.preprocess_prog.eval_prog([])
if not (i1.x1 == -ONE and i1.y1 == -TWO and i1.x2 == THREE and i1.y2 == FOUR)
	puts "Intersect eval_prog should return the intersect between e1 and e2"
end

#Var Tests
v = Var.new("a")
v1 = v.eval_prog([["a", Point.new(THREE,FIVE)]])
if not ((v1.is_a? Point) and v1.x == THREE and v1.y == FIVE)
	puts "Var eval_prog is not working properly"
end 
if not (v.preprocess_prog == v)
	puts "Var preprocess_prog should return self"
end

#Let Tests
l = Let.new("a", LineSegment.new(-ONE,-TWO,THREE,FOUR),
             Intersect.new(Var.new("a"),LineSegment.new(THREE,FOUR,-ONE,-TWO)))
l1 = l.preprocess_prog.eval_prog([])
if not (l1.x1 == -ONE and l1.y1 == -TWO and l1.x2 == THREE and l1.y2 == FOUR)
	puts "Let eval_prog should evaluate e2 after adding [s, e1] to the environment"
end

#Let Variable Shadowing Test
# l2 = Let.new("a", LineSegment.new(-ONE, -TWO, THREE, FOUR),
#               Let.new("b", LineSegment.new(THREE,FOUR,-ONE,-TWO), Intersect.new(Var.new("a"),Var.new("b"))))
# l2 = l2.preprocess_prog.eval_prog([["a",Point.new(0,0)]])
# if not (l2.x1 == -ONE and l2.y1 == -TWO and l2.x2 == THREE and l2.y2 == FOUR)
# 	puts "Let eval_prog should evaluate e2 after adding [s, e1] to the environment"
# end


#Shift Tests
s = Shift.new(THREE,FIVE,LineSegment.new(-ONE,-TWO,THREE,FOUR))
s1 = s.preprocess_prog.eval_prog([])
if not (s1.x1 == TWO and s1.y1 == THREE and s1.x2 == SIX and s1.y2 == 9)
	puts "Shift should shift e by dx and dy"
end



