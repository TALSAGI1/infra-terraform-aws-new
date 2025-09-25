output "vpc_id" {
  value = aws_vpc.main.id
}

# אם את יוצרת כמה סאבטים ציבוריים במשאב aws_subnet.public (עם count/for_each):
output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

# אם יש רק סאבט ציבורי יחיד:
# output "public_subnet_id" {
#   value = aws_subnet.public.id
# }
