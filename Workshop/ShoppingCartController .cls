public class ShoppingCartController {
   	public static final Integer LIMIT_SIZE = 10;
    
    public List<ProductWrapper> availableProduct {get; set;}
    public List<ProductWrapper> cartItems {get; set;}
    public List<PurchaseHistoryWrapper> historyDisplay {get; set;}
    public List<Purchase__c> listOfpurchase {get; set;}
    public List<PurchaseHistoryWrapper> listOfPurchaseHistory {get; set;}
    public List<Product2> listOfAvailableProduct {get; set;}
    public List<ProductWrapper> listOfProduct {get; set;}
    public List<ProductWrapper> searchedProduct {get; set;}
    
    public Boolean addProduct {get; set;}
    public Boolean check {get; set;}
    public Boolean historyPage {get; set;}
    public Boolean noProduct {get; set;}
    public Boolean noHistory {get; set;}
    public Boolean productPage {get; set;}
    public Boolean showCart {get; set;}
    public Boolean showFinalCart {get; set;}
    
    public String error{get; set;}
    public String historyNotAvailable{get; set;}
    public String itemToBeSearch {get; set;}
    public String productNotAvailable{get; set;}
    public String productId {get; set;}
    public String purchaseDate{get; set;}
    public String[] status = new String[]{'Error : Quantity is too high','Error : Invalid entry of Quantity',
        										'Attention : No History Records','Attention : No Products to buy','Pending'};
    
    public Decimal total {get; set;}
    public Integer noOfHistoryRecords = 0;
    public Integer noOfProductRecords = 0;
    public Integer noOfHistoryPages{get; set;}
    public Integer noOfProductPages{get; set;}
    public Integer offsetSize {get; set;}
    public Integer offset2 {get; set;}  
    public Integer pageNumberOfHistotry{get; set;}
    public Integer pageNumberOfProduct{get; set;}
    
    /*Constructor of ShoppingController Class
*/
    public ShoppingCartController() {
        addProduct = true;
        check = false;
        historyPage = true;
        itemToBeSearch = null;
        noHistory = false;
        noProduct = false;
        offsetSize = 0;
        offset2 = 0;
        productId = null;
        productPage = false;
        PurchaseHistorySelector purchaseRecords = new PurchaseHistorySelector();
        ProductsSelector productRecords = new ProductsSelector();
        purchaseDate = date.today().format();
        showCart = false;
        showFinalCart = false;
		noOfHistoryRecords = purchaseRecords.getNoOfHistoryRecords();
        noOfProductRecords = productRecords.getNoOfProductRecords();
        
        if(noOfHistoryRecords == 0){
            noHistory = true;
            historyPage = false;
            historyNotAvailable = status[2];
        }
        
        noOfHistoryPages = noOfHistoryRecords/10 + 1;
        listOfpurchase = new List<Purchase__c>();
        listOfpurchase = purchaseRecords.selectAllProduct();
        listOfPurchaseHistory = new List<PurchaseHistoryWrapper>();
        
        for (Purchase__c previousPurchase : listOfpurchase) {
            listOfPurchaseHistory.add(new PurchaseHistoryWrapper(String.valueOf(previousPurchase.Id),
                                                                 String.valueOf(previousPurchase.Price__c),
                                                                 String.valueOf(previousPurchase.Order_Status__c)));
        } 
        getHistory();
        
        listOfAvailableProduct = new List<Product2> ();
        listOfAvailableProduct = productRecords.selectAllProduct();
        if (listOfAvailableProduct == null) {
            
        }
        listOfProduct = new List<ProductWrapper>();
        
        for (Product2 products : listOfAvailableProduct) {
            listOfProduct.add(new ProductWrapper(String.valueOf(products.Id) , String.valueOf(products.Name),
                                                          String.valueOf(products.ProductCode),
                                                          String.valueOf(products.Description),
                                                          products.Quantity_available__c, products.PricebookEntries[0].unitprice));
        }
    }
    
    /*Get the history records for pagination
*/
    public void getHistory() {
        historyDisplay = new List<PurchaseHistoryWrapper>();
        for (Integer i = offsetSize; ( i < offsetSize + 10 && i < noOfHistoryRecords); i++ ){
            historyDisplay.add(listOfPurchaseHistory[i]);   
        }
        pageNumberOfHistotry = OffsetSize/LIMIT_SIZE + 1;
    }
       
    /*Wrapper Class for getting Purchase_History__c data
*/
    public Class PurchaseHistoryWrapper {
        public String purchaseId {get; set;}
        public String orderPrice {get; set;}
        public String orderStatus {get; set;}
       
        public PurchaseHistoryWrapper (String purchaseId, String orderPrice, String orderStatus) {
            this.purchaseId = purchaseId;
            this.orderPrice = orderPrice;
            this.orderStatus = orderStatus;
        } 
    }
    
    /*Wrapper Class for getting Product2 data
*/
    public Class ProductWrapper {
        public String description {get; set;}
        public String productId {get; set;}
        public String productName {get; set;}
        public String productCode {get; set;}
        public Decimal price {get; set;}
        public Decimal quantity {get; set;}
        public Decimal total {get; set;}
        public Boolean isSelected {get; set;}
        
        
        public ProductWrapper (String productId, String productName, String productCode, String description, 
                                        Decimal quantity, Decimal price) {
            this.productId = productId;
            this.productName = productName;
            this.productCode = productCode;
            this.description = description;
            this.quantity = quantity;
            this.price = price;
            this.isSelected = False;
        }
    }
    
    /*Function to find the products according to search
*/
    public void findProduct() {
        
        if (noOfProductRecords == 0){
        	noProduct = True;
            productNotAvailable = status[4];
        }
        else{
            offset2 = 0;
        	productPage = True;
        	searchProduct();
        }
    }        
    
    /*Get the list of records for pagination
*/    
    public void searchProduct() {
        availableProduct = new List<ProductWrapper>();
        searchedProduct = new List<ProductWrapper>();
        
        if (itemToBeSearch == null) {
            
            for (ProductWrapper product :  listOfProduct){
                if(productId == product.productId){
                    product.isSelected = False;
                }
                availableProduct.add(product);
            }
            
            for (Integer i = offset2 ; i < offset2 + 10 && i < availableProduct.size(); i++){
                searchedProduct.add(listOfProduct[i]);
            }
        }
        
        else {
            
            for (ProductWrapper product :  listOfProduct){
                
                if (product.productName.contains(itemToBeSearch)){
                    if(productId == product.productId){
                    	product.isSelected = False;
                	}
                	availableProduct.add(product);
                }
            }
            
            for (Integer i = offset2 ; i < offset2 + 10 && i < availableProduct.size(); i++){
                searchedProduct.add(listOfProduct[i]);
            }
        }
        
        if (math.mod(availableProduct.size(),LIMIT_SIZE) == 0)
        	noOfProductPages = availableProduct.size()/LIMIT_SIZE;
        else
            noOfProductPages = availableProduct.size()/LIMIT_SIZE + 1;
        
        pageNumberOfProduct = offset2/LIMIT_SIZE +1;
        
        if(productId != null){
            showCart();
        }
    }  
    
    /*Function to shot the item in Cart
*/
    public void showCart() {
        check = false;
        showCart = true;
        cartItems = new List<ProductWrapper>();
        
        for (ProductWrapper product : listOfProduct) {
     
            if (product.isSelected == true && product.quantity != 0) {
                cartItems.add(new ProductWrapper(product.productId, product.productName, product.productCode, 
                                                          product.description, 1, product.price));
            }
        }
        
        for (ProductWrapper item : cartItems) {
            item.total = item.quantity * item.price;
        }
        productId = null;
        if(cartItems.size() == 0){
            showCart = false;
        }
	}   
    
    public void validation(){
        check = false;
        showFinalCart = false;
        try{
            for (ProductWrapper item : cartItems) {
                if(item.quantity < 1){
                    error = status[1];
                    check = true;
                    break;
                }
            	for (ProductWrapper product : listOfProduct) {
                	if (product.productId == item.productId) {
                    	if (product.quantity < item.quantity) {
                        	check = true;
                        	error = status[0];
                    	}
                	}
        		}
        	}
        }catch(Exception e){
            error = status[1];
            check = true;
            System.debug(Error);
        }
        
        if(check == false){
            itemsInCart();
        }
    }

    public void itemsInCart() {
        showFinalCart = True;
                
        for (ProductWrapper item : cartItems) {
       	    item.total = item.quantity * item.price;
       	} 
        total = 0;
        
        for (ProductWrapper item : cartItems) {
            total += item.total;
        }
    }
    
    /*Function to hide all the pages except Product History page and also to insert our purchase data to history
*/
    public void placeOrder() {
        productPage = False;
        showCart = False;
        showFinalCart = False;
        
        list<Product2> updatedlist = DmlDataClass.getAvailableProduct();
    
        for (Product2 products : updatedlist){
            
            for (ProductWrapper item : cartItems) {
                if (String.valueOf(products.Id) == item.productId) {
                    products.Quantity_available__c -= item.quantity; 
                }
        	}
        }
        update updatedlist;
        Purchase__c newRecord = new Purchase__c ( Price__c = total, Order_Status__c = status[4]);
        insert newRecord;
        offsetSize = 0;
       
		listOfAvailableProduct = DmlDataClass.getAvailableProduct();
        getHistory();  
    }
    
    /*Function to select First Page
*/
   public void first() {
		OffsetSize = 0;
        getHistory(); 
	}
	
    /*Function to select Previous Page
*/
    public void previous() {
		OffsetSize = OffsetSize - LIMIT_SIZE;
        getHistory(); 
        
	}
    
    /*Function to select Next Page
*/
    public void next() {
		OffsetSize = OffsetSize + LIMIT_SIZE;
        getHistory(); 
	}
    
    public void last() {
		OffsetSize = noOfHistoryRecords - math.mod(noOfHistoryRecords,LIMIT_SIZE);
        getHistory(); 
	}
	
    /*Function to check if previous is available or not
*/
    public boolean getprev() {
		if (OffsetSize == 0)
			return true;
		else
			return false;
	}
	
    /*Function to check if next is available or not
*/
    public boolean getnxt() {
		if ((OffsetSize + LIMIT_SIZE) > noOfHistoryRecords)
			return true;
		else
			return false;
	}
    
    /*Function to select First Page
*/
    public void first2() {
		Offset2 = 0;
        searchProduct(); 
	}

    /*Function to select Previous Page
*/
    public void previous2() {
		Offset2 = Offset2 - LIMIT_SIZE;
        searchProduct();
	}
    
    /*Function to select Next Page
*/
    public void next2() {
		Offset2 = Offset2 + LIMIT_SIZE;
        searchProduct();
	}
    
    /*Function to select Last Page
*/
    public void last2() {
		Offset2 = noOfProductRecords - math.mod(noOfProductRecords,LIMIT_SIZE);
        searchProduct(); 
	}
	
    /*Function to check if previous is available or not
*/
    public boolean getprev2() {
        if (Offset2 == 0){
			return true;
        }
        else{
			return false;
        }
	}
	
    /*Function to check if next is available or not
*/
    public boolean getnxt2() {
        if ((Offset2 + LIMIT_SIZE) > searchedProduct.size()){
			return true;
        }
        else{
			return false;
        }
	}
}
