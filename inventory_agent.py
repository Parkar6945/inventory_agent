import datetime

def inventory_agent():
    print("Welcome to the Interactive Inventory Management Agent.")
    threshold = 20
    
    while True:
        try:
            stock_input = input("Warehouse Manager, please enter the current stock level (or type 'exit' to quit): ")
            
            if stock_input.lower() == 'exit':
                print("Exiting agent. Goodbye!")
                break
                
            stock_level = int(stock_input)
            
            if stock_level < threshold:
                timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                print(f"[{timestamp}] ACTION: Reorder triggered! Stock level ({stock_level}) is below the threshold ({threshold}).")
            else:
                timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                print(f"[{timestamp}] ACTION: Wait. Stock level ({stock_level}) is sufficient.")
                
        except ValueError:
            print("Invalid input. Please enter a valid integer for the stock level.")

if __name__ == "__main__":
    inventory_agent()
