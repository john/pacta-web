Create Organization

rails g scaffold organization name:string description:string status:string

Organization has_many Users
Organization has_many Portfolios
Organization has_many Reports

User belongs_to Organization
User has_many Portfolios
User has_many Reports

Portfolios belong_to Organization
Portfolios belong_to User

Reports belong_to Organization
Report belong_to User (Reports should also be able to be auto-generated and marked as such)

Add paranoid deletes