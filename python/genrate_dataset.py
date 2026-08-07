# import pandas as pd
# import random
# import numpy as np
# from faker import Faker
# from datetime import datetime, timedelta


# -----------------------------
# Configuration
# -----------------------------

# fake = Faker("en_IN")

# random.seed(42)
# np.random.seed(42)
# Faker.seed(42)


# DATA_PATH = "../Data/"


# -----------------------------
# 1. Generate Categories
# -----------------------------

# def generate_categories():

#     categories = [
#         "Electronics",
#         "Fashion",
#         "Books",
#         "Home & Kitchen",
#         "Furniture",
#         "Sports",
#         "Beauty",
#         "Grocery",
#         "Toys",
#         "Automotive",
#         "Health",
#         "Office Supplies",
#         "Pet Supplies",
#         "Jewelry",
#         "Music"
#     ]

#     df = pd.DataFrame({
#         "category_id": range(1, len(categories)+1),
#         "category_name": categories
#     })

#     df.to_csv(DATA_PATH + "categories.csv", index=False)

#     print("Categories generated")


# -----------------------------
# 2. Generate Suppliers
# -----------------------------

# def generate_suppliers():

#     supplier_names = [
#         "Apple",
#         "Samsung",
#         "Dell",
#         "HP",
#         "Lenovo",
#         "Sony",
#         "LG",
#         "Nike",
#         "Adidas",
#         "Puma",
#         "Boat",
#         "OnePlus",
#         "Philips",
#         "Logitech",
#         "Penguin Books",
#         "Canon",
#         "Asus",
#         "Acer",
#         "Xiaomi",
#         "Titan"
#     ]


#     suppliers = []

#     for i,name in enumerate(supplier_names,1):

#         suppliers.append({

#             "supplier_id":i,
#             "supplier_name":name,
#             "contact_person":fake.name(),
#             "email":f"{name.lower().replace(' ','')}@gmail.com",
#             "phone":fake.unique.msisdn()[:10],
#             "city":fake.city(),
#             "state":fake.state(),
#             "country":"India"

#         })


#     df = pd.DataFrame(suppliers)

#     df.to_csv(DATA_PATH+"suppliers.csv",index=False)

#     print("Suppliers generated")



# -----------------------------
# 3. Generate Customers
# -----------------------------

# def generate_customers(total=10000):

#     customers=[]


#     for i in range(1,total+1):

#         customers.append({

#             "customer_id":i,
#             "first_name":fake.first_name(),
#             "last_name":fake.last_name(),
#             "email":fake.unique.email(),
#             "phone":fake.unique.msisdn()[:10],
#             "gender":random.choice(
#                 ["Male","Female"]
#             ),
#             "city":fake.city(),
#             "state":fake.state(),
#             "country":"India",
#             "signup_date":fake.date_between(
#                 start_date="-3y",
#                 end_date="today"
#             )

#         })


#     df=pd.DataFrame(customers)

#     df.to_csv(
#         DATA_PATH+"customers.csv",
#         index=False
#     )

#     print("Customers generated")



# -----------------------------
# 4. Generate Products
# -----------------------------

# def generate_products(total=2000):

#     product_names=[

#         "iPhone 16",
#         "Samsung Galaxy S26",
#         "Dell XPS Laptop",
#         "HP Pavilion Laptop",
#         "Sony Headphones",
#         "Nike Running Shoes",
#         "Adidas Jacket",
#         "SQL Complete Guide",
#         "Office Chair",
#         "Gaming Keyboard",
#         "Smart Watch",
#         "Bluetooth Speaker"

#     ]


#     products=[]


#     for i in range(1,total+1):

#         products.append({

#             "product_id":i,

#             "product_name":
#             random.choice(product_names)
#             +" "+str(i),

#             "category_id":
#             random.randint(1,15),

#             "supplier_id":
#             random.randint(1,20),

#             "price":
#             round(random.uniform(500,150000),2),

#             "stock":
#             random.randint(0,500),

#             "launch_date":
#             fake.date_between(
#                 "-5y",
#                 "today"
#             )

#         })


#     df=pd.DataFrame(products)

#     df.to_csv(
#         DATA_PATH+"products.csv",
#         index=False
#     )

#     print("Products generated")



# -----------------------------
# 5. Generate Orders
# -----------------------------

# def generate_orders(total=50000):

#     orders=[]


#     for i in range(1,total+1):

#         orders.append({

#             "order_id":i,

#             "customer_id":
#             random.randint(1,10000),

#             "order_date":
#             fake.date_time_between(
#                 "-2y",
#                 "now"
#             ),

#             "order_status":
#             random.choice([
#                 "Pending",
#                 "Processing",
#                 "Shipped",
#                 "Delivered",
#                 "Cancelled"
#             ]),

#             "shipping_address":
#             fake.address().replace("\n"," "),

#             "total_amount":
#             round(random.uniform(500,200000),2)

#         })


#     df=pd.DataFrame(orders)

#     df.to_csv(
#         DATA_PATH+"orders.csv",
#         index=False
#     )

#     print("Orders generated")



# -----------------------------
# 6. Generate Order Items
# -----------------------------

# def generate_order_items(total_orders=50000):

#     items=[]

#     item_id=1


#     for order in range(1,total_orders+1):

#         number_of_products=random.randint(1,5)


#         for _ in range(number_of_products):

#             items.append({

#                 "order_item_id":item_id,

#                 "order_id":order,

#                 "product_id":
#                 random.randint(1,2000),

#                 "quantity":
#                 random.randint(1,5),

#                 "unit_price":
#                 round(
#                     random.uniform(
#                         500,
#                         150000
#                     ),2
#                 )

#             })

#             item_id+=1


#     df=pd.DataFrame(items)

#     df.to_csv(
#         DATA_PATH+"order_items.csv",
#         index=False
#     )


#     print("Order Items generated")



# -----------------------------
# 7. Generate Payments
# -----------------------------

# def generate_payments(total=50000):

#     payments=[]


#     for i in range(1,total+1):

#         payments.append({

#             "payment_id":i,

#             "order_id":i,

#             "payment_date":
#             fake.date_time_between(
#                 "-2y",
#                 "now"
#             ),

#             "payment_method":
#             random.choice([
#                 "UPI",
#                 "Credit Card",
#                 "Debit Card",
#                 "Net Banking",
#                 "Wallet",
#                 "Cash On Delivery"
#             ]),

#             "payment_status":
#             random.choice([
#                 "Success",
#                 "Failed",
#                 "Pending",
#                 "Refunded"
#             ]),

#             "amount":
#             round(
#                 random.uniform(
#                     500,
#                     200000
#                 ),2
#             ),

#             "transaction_id":
#             fake.uuid4()

#         })


#     df=pd.DataFrame(payments)

#     df.to_csv(
#         DATA_PATH+"payments.csv",
#         index=False
#     )


#     print("Payments generated")



# -----------------------------
# 8. Generate Returns
# -----------------------------

# def generate_returns(total=4000):

#     returns=[]


#     for i in range(1,total+1):

#         returns.append({

#             "return_id":i,

#             "order_id":
#             random.randint(
#                 1,
#                 50000
#             ),

#             "return_date":
#             fake.date_between(
#                 "-1y",
#                 "today"
#             ),

#             "reason":
#             random.choice([
#                 "Damaged Product",
#                 "Wrong Product",
#                 "Defective Product",
#                 "Late Delivery",
#                 "Size Issue",
#                 "Customer Changed Mind"
#             ]),

#             "refund_amount":
#             round(
#                 random.uniform(
#                     500,
#                     50000
#                 ),2
#             ),

#             "return_status":
#             random.choice([
#                 "Requested",
#                 "Approved",
#                 "Rejected",
#                 "Completed"
#             ])

#         })


#     df=pd.DataFrame(returns)

#     df.to_csv(
#         DATA_PATH+"returns.csv",
#         index=False
#     )


#     print("Returns generated")



# -----------------------------
# Run All Generators
# -----------------------------

# generate_categories()
# generate_suppliers()
# generate_customers()
# generate_products()
# generate_orders()
# generate_order_items()
# generate_payments()
# generate_returns()


# print("ALL DATASETS GENERATED SUCCESSFULLY")





#Checking row counts using Python:
# import pandas as pd

# files = [
#     "categories",
#     "suppliers",
#     "customers",
#     "products",
#     "orders",
#     "order_items",
#     "payments",
#     "returns"
# ]

# for file in files:
#     df = pd.read_csv(f"../Data/{file}.csv")
#     print(file, ":", len(df))






