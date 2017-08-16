<!--- 
==============================

==============================
More Details At:
https://cheddargetter.com/developers/

Available functions:
	CG_get_all_plans()
	CG_Get_a_Single_Pricing_Plan()
	CG_Get_All_Customers()
	CG_Get_a_Single_Customer()
	CG_Create_a_New_Customer()
	CG_Update_Customer_and_Subscription()
	CG_Update_a_Customer()
	CG_Update_Subscription_Only()
	CG_Delete_a_Customer()
	CG_Delete_All_Customer()
	CG_Cancel_a_Subscription()
	CG_Add_Item_Quantity()
	CG_Remove_Item_Quantity()
	CG_Set_Item_Quantity()
	CG_Add_Custom_Charge()
 --->




<!--- This is our CheddarGetter.com Account --->
<cfset request.your_product_code = "myproducts" >
<cfset request.CG_username = "test@test.com" >
<cfset request.CG_password ="password"  >







<!--- *************** --->
<!---  Gets all plans --->	
<!--- *************** --->		
<cffunction name="CG_get_all_plans" output="true" returntype="any" >			
    <cfhttp url="https://www.cheddargetter.com/xml/plans/get/productCode/#request.your_product_code#/" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="" >   
    </cfhttp>
    
    
    <cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >
</cffunction>




<!--- *************** --->
<!---  Gets a Single Price Plan --->	
<!--- *************** --->		
<cffunction name="CG_Get_a_Single_Pricing_Plan" output="true" returntype="any" >		
	<cfargument name="your_plan" required="yes" default="YOURPLAN-QUARTERLY" >	
	
    <cfhttp url="https://www.cheddargetter.com/xml/plans/get/productCode/#request.your_product_code#/code/#arguments.your_plan#" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="" >   
    </cfhttp>
    
    
    <cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >
</cffunction>



<!--- *************** --->
<!---  Gets all Customers --->	
<!--- *************** --->		
<cffunction name="CG_Get_All_Customers" output="true" returntype="any" >		
	
    <cfhttp url="https://www.cheddargetter.com/xml/customers/get/productCode/#request.your_product_code#" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="" >   
    </cfhttp>
    
    
    <cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >
</cffunction>




<!--- *************** --->
<!---  Gets a Single Customers --->	
<!--- *************** --->		
<cffunction name="CG_Get_a_Single_Customer" output="true" returntype="any" >		
	<cfargument name="user_id" required="yes" default="" >			
	
    <cfhttp url="https://www.cheddargetter.com/xml/customers/get/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="" >   
    </cfhttp>
    
    
    <cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >
</cffunction>




<!--- ************* --->
<!--- Adds New User --->
<!--- ************* --->			
<cffunction name="CG_Create_a_New_Customer" output="true" returntype="any" >	
	<cfargument name="your_plan" required="yes" default="FREE-MONTHLY-PLAN" >		
	<cfargument name="user_id" required="yes" default="000001" >	
	<cfargument name="firstName" required="yes" default="" >	
	<cfargument name="lastName" required="yes" default="" >	
	<cfargument name="email" required="yes" default="" >    	
	<cfargument name="ccNumber" required="no" default="4007000000027000" >
	<cfargument name="ccExpiration" required="no" default="0530" >
	<cfargument name="ccCardCode" required="no" default="123" >
	<cfargument name="ccFirstName" required="no" default="Dr." >
	<cfargument name="ccLastName" required="no" default="Evil" >
	<cfargument name="ccZip" required="no" default="05003" >
	<cfargument name="ccCompany" required="no" default="" >
	<cfargument name="ccCountry" required="no" default="" >
	<cfargument name="ccAddress" required="no" default="" >
	<cfargument name="ccCity" required="no" default="" >
	<cfargument name="ccState" required="no" default="" >
	<cfargument name="initialBillDate" required="no" default="#dateformat(now(), 'YYYY-MM-DD' )#" >
    <cfargument name="company" required="no" default="" >
	<cfargument name="notes" required="no" default="" >
    
    
            
	<!--- Add a Customer --->
    <cfhttp url="https://www.cheddargetter.com/xml/customers/new/productCode/#request.your_product_code#/" method="post" username="#request.CG_username#" password="#request.CG_password#" >

    <cfhttpparam type="FormField" name="code" value="#arguments.user_id#" >
    <cfhttpparam type="FormField" name="subscription[planCode]" value="#arguments.your_plan#" >
    <cfhttpparam type="FormField" name="firstName" value="#arguments.firstName#" >
    <cfhttpparam type="FormField" name="lastName" value="#arguments.lastName#" >
    <cfhttpparam type="FormField" name="email" value="#arguments.email#" >
    <cfhttpparam type="FormField" name="company" value="#arguments.company#" >
    <cfhttpparam type="FormField" name="notes" value="#arguments.notes#" >  
   	<cfhttpparam type="FormField" name="subscription[initialBillDate]" value="#dateformat(arguments.initialBillDate, 'YYYY-MM-DD' )#" >      
    <cfhttpparam type="FormField" name="subscription[ccNumber]" value="#arguments.ccNumber#" >
    <cfhttpparam type="FormField" name="subscription[ccExpiration]" value = "#arguments.ccExpiration#" >
    <cfhttpparam type="FormField" name="subscription[ccCardCode]" value = "#arguments.ccCardCode#" >
    <cfhttpparam type="FormField" name="subscription[ccFirstName]" value="#arguments.ccFirstName#" >
    <cfhttpparam type="FormField" name="subscription[ccLastName]" value="#arguments.ccLastName#" >
    <cfhttpparam type="FormField" name="subscription[ccZip]" value="#arguments.ccZip#" > 
    <cfhttpparam type="FormField" name="subscription[ccCountry]" value="#arguments.ccCountry#" > 
    <cfhttpparam type="FormField" name="subscription[ccAddress]" value="#arguments.ccAddress#" > 
    <cfhttpparam type="FormField" name="subscription[ccCity]" value="#arguments.ccCity#" > 
    <cfhttpparam type="FormField" name="subscription[ccState]" value="#arguments.ccState#" > 
     
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>







<!--- ************* --->
<!--- Update a Customer and Subscription --->
<!--- ************* --->			
<cffunction name="CG_Update_Customer_and_Subscription" output="true" returntype="any" >	
	<cfargument name="your_plan" required="yes" default="FREE-MONTHLY-PLAN" >		
	<cfargument name="user_id" required="yes" default="000001" >	
	<cfargument name="firstName" required="yes" default="" >	
	<cfargument name="lastName" required="yes" default="" >	
	<cfargument name="email" required="yes" default="" >    	
	<cfargument name="ccNumber" required="no" default="4007000000027000" >
	<cfargument name="ccExpiration" required="no" default="0530" >
	<cfargument name="ccCardCode" required="no" default="123" >
	<cfargument name="ccFirstName" required="no" default="Dr." >
	<cfargument name="ccLastName" required="no" default="Evil" >
	<cfargument name="ccZip" required="no" default="05003" >
	<cfargument name="ccCompany" required="no" default="" >
	<cfargument name="ccCountry" required="no" default="" >
	<cfargument name="ccAddress" required="no" default="" >
	<cfargument name="ccCity" required="no" default="" >
	<cfargument name="ccState" required="no" default="" >
	<cfargument name="company" required="no" default="" >
	<cfargument name="notes" required="no" default="" >
    
    
         
	<!--- Add a Customer --->
    <cfhttp url="https://www.cheddargetter.com/xml/customers/edit/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >

    <cfhttpparam type="FormField" name="subscription[planCode]" value="#arguments.your_plan#" >
    <cfhttpparam type="FormField" name="firstName" value="#arguments.firstName#" >
    <cfhttpparam type="FormField" name="lastName" value="#arguments.lastName#" >
    <cfhttpparam type="FormField" name="email" value="#arguments.email#" >
    <cfhttpparam type="FormField" name="company" value="#arguments.company#" >
    <cfhttpparam type="FormField" name="notes" value="#arguments.notes#" >  
    <cfhttpparam type="FormField" name="subscription[ccNumber]" value="#arguments.ccNumber#" >
    <cfhttpparam type="FormField" name="subscription[ccExpiration]" value = "#arguments.ccExpiration#" >
    <cfhttpparam type="FormField" name="subscription[ccCardCode]" value = "#arguments.ccCardCode#" >
    <cfhttpparam type="FormField" name="subscription[ccFirstName]" value="#arguments.ccFirstName#" >
    <cfhttpparam type="FormField" name="subscription[ccLastName]" value="#arguments.ccLastName#" >
    <cfhttpparam type="FormField" name="subscription[ccZip]" value="#arguments.ccZip#" > 
    <cfhttpparam type="FormField" name="subscription[ccCountry]" value="#arguments.ccCountry#" > 
    <cfhttpparam type="FormField" name="subscription[ccAddress]" value="#arguments.ccAddress#" > 
    <cfhttpparam type="FormField" name="subscription[ccCity]" value="#arguments.ccCity#" > 
    <cfhttpparam type="FormField" name="subscription[ccState]" value="#arguments.ccState#" > 
     
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>






<!--- ************* --->
<!--- Update a Customer --->
<!--- ************* --->			
<cffunction name="CG_Update_a_Customer" output="true" returntype="any" >		
	<cfargument name="user_id" required="yes" default="000001" >	
	<cfargument name="firstName" required="yes" default="" >	
	<cfargument name="lastName" required="yes" default="" >	
	<cfargument name="email" required="yes" default="" >    
	<cfargument name="company" required="no" default="" >
	<cfargument name="notes" required="no" default="" >
    	
    
	<!--- Add a Customer --->
    <cfhttp url="https://www.cheddargetter.com/xml/customers/edit-customer/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >

        <cfhttpparam type="FormField" name="code" value="#arguments.user_id#" >
        <cfhttpparam type="FormField" name="firstName" value="#arguments.firstName#" >
        <cfhttpparam type="FormField" name="lastName" value="#arguments.lastName#" >
        <cfhttpparam type="FormField" name="email" value="#arguments.email#" >
        <cfhttpparam type="FormField" name="company" value="#arguments.company#" >
        <cfhttpparam type="FormField" name="notes" value="#arguments.notes#" >    	  
   
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>






<!--- ************* --->
<!--- Update a Customer and Subscription --->
<!--- ************* --->			
<cffunction name="CG_Update_Subscription_Only" output="true" returntype="any" >	
	<cfargument name="your_plan" required="yes" default="" >		
	<cfargument name="user_id" required="yes" default="" >	  	
	<cfargument name="ccNumber" required="no" default="" >
	<cfargument name="ccExpiration" required="no" default="" >
	<cfargument name="ccCardCode" required="no" default="" >
	<cfargument name="ccFirstName" required="no" default="" >
	<cfargument name="ccLastName" required="no" default="" >
	<cfargument name="ccZip" required="no" default="" >
	<cfargument name="ccCompany" required="no" default="" >
	<cfargument name="ccCountry" required="no" default="" >
	<cfargument name="ccAddress" required="no" default="" >
	<cfargument name="ccCity" required="no" default="" >
	<cfargument name="ccState" required="no" default="" >
    
    
         
	<!--- Add a Customer --->
    <cfhttp url="https://www.cheddargetter.com/xml/customers/edit-subscription/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >

    <cfhttpparam type="FormField" name="subscription[planCode]" value="#arguments.your_plan#" >
    
    <cfhttpparam type="FormField" name="subscription[ccNumber]" value="#arguments.ccNumber#" >
    <cfhttpparam type="FormField" name="subscription[ccExpiration]" value = "#arguments.ccExpiration#" >
    <cfhttpparam type="FormField" name="subscription[ccCardCode]" value = "#arguments.ccCardCode#" >
    <cfhttpparam type="FormField" name="subscription[ccFirstName]" value="#arguments.ccFirstName#" >
    <cfhttpparam type="FormField" name="subscription[ccLastName]" value="#arguments.ccLastName#" >
    <cfhttpparam type="FormField" name="subscription[ccZip]" value="#arguments.ccZip#" > 
    <cfhttpparam type="FormField" name="subscription[ccCountry]" value="#arguments.ccCountry#" > 
    <cfhttpparam type="FormField" name="subscription[ccAddress]" value="#arguments.ccAddress#" > 
    <cfhttpparam type="FormField" name="subscription[ccCity]" value="#arguments.ccCity#" > 
    <cfhttpparam type="FormField" name="subscription[ccState]" value="#arguments.ccState#" > 
     
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>





<!--- ************* --->
<!--- Delete a Customer --->
<!--- ************* --->			
<cffunction name="CG_Delete_a_Customer" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	  
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/delete/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="test" >      
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>



<!--- ************* --->
<!--- Delete All Customer --->
<!--- ************* --->			
<cffunction name="CG_Delete_All_Customer" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	  
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/delete/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="test" >      
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >
</cffunction>





<!--- ************* --->
<!--- Cancel a Customer's Subscription --->
<!--- ************* --->			
<cffunction name="CG_Cancel_a_Subscription" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	 
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/cancel/productCode/#request.your_product_code#/code/#arguments.user_id#" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="test" value="test" >      
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>



<!--- ************* --->
<!--- Add Item Quantity --->
<!--- Increment a customer's current usage of a single item in the product --->
<!--- ************* --->			
<cffunction name="CG_Add_Item_Quantity" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	 	 		
	<cfargument name="item_code" required="yes" default="" >			 		
	<cfargument name="quantity" required="yes" default="" >  
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/add-item-quantity/productCode/#request.your_product_code#/code/#arguments.user_id#/itemCode/#arguments.item_code#/" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="quantity" value="#arguments.quantity#" >    
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>



<!--- ************* --->
<!--- Remove Item Quantity --->
<!--- Decrement a customer's current usage of a single item in the product --->
<!--- ************* --->			
<cffunction name="CG_Remove_Item_Quantity" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	 	 		
	<cfargument name="item_code" required="yes" default="" >			 		
	<cfargument name="quantity" required="yes" default="" >  
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/remove-item-quantity/productCode/#request.your_product_code#/code/#arguments.user_id#/itemCode/#arguments.item_code#/" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="quantity" value="#arguments.quantity#" >    
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>



<!--- ************* --->
<!--- Set Item Quantity --->
<!--- Set a customer's current usage of a single item in the product --->
<!--- ************* --->			
<cffunction name="CG_Set_Item_Quantity" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	 	 		
	<cfargument name="item_code" required="yes" default="" >		 		
	<cfargument name="quantity" required="yes" default="" > 
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/set-item-quantity/productCode/#request.your_product_code#/code/#arguments.user_id#/itemCode/#arguments.item_code#/" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="quantity" value="#arguments.quantity#" >      
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>





<!--- ************* --->
<!--- Add a Custom Charge/Credit --->
<!--- Add an arbitrary charge or credit to the 
      customer's current invoice in the product --->
<!--- ************* --->			
<cffunction name="CG_Add_Custom_Charge" output="true" returntype="any" >	 		
	<cfargument name="user_id" required="yes" default="" >	 	 		
	<cfargument name="item_code" required="yes" default="" >		 		
	<cfargument name="chargeCode" required="yes" default="" > 	 		
	<cfargument name="quantity" required="yes" default="" > 	 		
	<cfargument name="eachAmount" required="yes" default="" >  		
	<cfargument name="description" required="yes" default="" > 
    
    <cfhttp url="https://www.cheddargetter.com/xml/customers/add-charge/productCode/#request.your_product_code#/code/#arguments.user_id#/itemCode/#arguments.item_code#/" method="post" username="#request.CG_username#" password="#request.CG_password#" >
        <cfhttpparam type="FormField" name="chargeCode" value="#arguments.chargeCode#" >   
        <cfhttpparam type="FormField" name="quantity" value="#arguments.quantity#" >   
        <cfhttpparam type="FormField" name="eachAmount" value="#arguments.eachAmount#" >   
        <cfhttpparam type="FormField" name="description" value="#arguments.description#" >   
    </cfhttp>

	<cfset did_it_work = trim(cfhttp.fileContent) >
    <cfdump var="#did_it_work#" >

</cffunction>









<!--- ************* --->
<!--- TESTING  --->
<!--- ************* --->
<cfoutput>#CG_Add_Custom_Charge("testguy@test.com", "item", "charge-39399393", "1", "99", "Monthly charge for phone support" )#</cfoutput>

