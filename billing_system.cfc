<cfcomponent>

    <cffunction name="getMaxInvoiceId" access="private" returnType="numeric">
        <cfquery name="getMaxIdQuery" datasource="BillingSystem">
            SELECT invoice_id FROM vw_MaxinvoiceID;
        </cfquery>
        <cfreturn getMaxIdQuery.invoice_id>
    </cffunction>

    <cffunction name="inserttax" access="remote" returnType="any">
        <cfargument name="tax_amount" type="float" required="true">
        <cfargument name="status" type="string" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">

        <cfquery datasource="BillingSystem" name="insertTax">
            INSERT INTO taxes (tax_amount,status,Admin_ID)
            VALUES (<cfqueryparam value="#arguments.tax_amount#" cfsqltype="cf_sql_float">,
                    <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">)
        </cfquery>
         <cfreturn "Tax inserted successfully.">
    </cffunction>

    <cffunction name="getTaxes" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="getTaxesQuery" datasource="BillingSystem" returnType="array">
            SELECT id, tax_amount, status
            FROM taxes 
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn  serializeJSON(getTaxesQuery)>
    </cffunction>
    
    <cffunction name="deleteTax" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="deleteTax">
            DELETE FROM taxes
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Tax deleted successfully.">
    </cffunction>

    <cffunction name="updateTax" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="tax_amount" type="float" required="true">
        <cfargument name="status" type="string" required="true">
        <cfquery datasource="BillingSystem" name="updateTax">
            UPDATE taxes
            SET tax_amount = <cfqueryparam value="#arguments.tax_amount#" cfsqltype="cf_sql_float">,
                status = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Tax updated successfully.">
    </cffunction>

    <cffunction name="insertcategory" access="remote" returnType="any">
        <cfargument name="category_name" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">

        <cfquery datasource="BillingSystem" name="insertcategory">
            INSERT INTO category (category_name,status,Admin_ID)
            VALUES (<cfqueryparam value="#arguments.category_name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">)
        </cfquery>
         <cfreturn "Category inserted successfully.">
    </cffunction>

    
    <cffunction name="getCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="getCategoryQuery" datasource="BillingSystem" returnType="array">
            SELECT id, category_name, status
            FROM Category
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn  serializeJSON(getCategoryQuery)>
    </cffunction>

    <cffunction name="updateCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="category_name" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        <cfquery datasource="BillingSystem" name="updateCategory">
            UPDATE category
            SET category_name = <cfqueryparam value="#arguments.category_name#" cfsqltype="cf_sql_varchar">,
                status = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Category updated successfully.">
    </cffunction>

    <cffunction name="deleteCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="deleteCategory">
            DELETE FROM category
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Category deleted successfully.">
    </cffunction>

    <cffunction name="insertUnit" access="remote" returnType="any">
        <cfargument name="unit_name" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="insertunit">
            INSERT INTO unit (unit_name,status,Admin_ID)
            VALUES (<cfqueryparam value="#arguments.unit_name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">)
        </cfquery>
         <cfreturn "unit inserted successfully.">
    </cffunction>

    <cffunction name="getUnit" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="getUnitQuery" datasource="BillingSystem" returnType="array">
            SELECT id, unit_name, status
            FROM unit
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn  serializeJSON(getUnitQuery)>
    </cffunction>

    
    <cffunction name="updateUnit" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="unit_name" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        <cfquery datasource="BillingSystem" name="updateUnit">
            UPDATE unit
            SET unit_name = <cfqueryparam value="#arguments.unit_name#" cfsqltype="cf_sql_varchar">,
                status = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Unit updated successfully.">
    </cffunction>

    <cffunction name="deleteUnit" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="deleteUnit">
            DELETE FROM unit
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Unit deleted successfully.">
    </cffunction>

    <cffunction name="selectCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="selectCategoryQuery" datasource="BillingSystem" returnType="array">
            select id,category_name from category 
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer"> order by category_name asc 
        </cfquery>
        <cfreturn serializeJSON(selectCategoryQuery)>
    </cffunction>

    <cffunction name="selectUnit" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="selectUnitQuery" datasource="BillingSystem" returnType="array">
            select id,unit_name from unit 
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer"> order by unit_name asc 
        </cfquery>
        <cfreturn serializeJSON(selectUnitQuery)>
    </cffunction>

    <cffunction name="selectTax" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="selectTaxQuery" datasource="BillingSystem" returnType="array">
            select id,tax_amount from taxes 
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer"> order by tax_amount asc 
        </cfquery>
        <cfreturn serializeJSON(selectTaxQuery)>
    </cffunction>

    <cffunction name="insertSupplier" access="remote" returnType="any">
        <cfargument name="supplier_name" type="string" required="true">
        <cfargument name="contact" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="details" type="string" required="true">
        <cfargument name="credit_balance" type="float" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="insertsupplier">
            INSERT INTO suppliers (supplier_name,contact,address,details,credit_balance,Admin_ID)
            VALUES (<cfqueryparam value="#arguments.supplier_name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.contact#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.details#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.credit_balance#" cfsqltype="cf_sql_float">,
                    <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">)
        </cfquery>
         <cfreturn "Supplier inserted successfully.">
    </cffunction>

    <cffunction name="getSupplier" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="getSupplierQuery" datasource="BillingSystem" returnType="array">
            SELECT id,supplier_name,contact,address,details,credit_balance 
            FROM suppliers
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn  serializeJSON(getSupplierQuery)>
    </cffunction>

     
    <cffunction name="getSupplierById" access="remote" returntype="any" returnFormat="json">
        <cfargument name="id" type="numeric" required="true">
        <cfquery name="getSupplierQuery" datasource="BillingSystem"  returnType="array" >
            SELECT id, supplier_name, contact, address, details, credit_balance 
            FROM suppliers
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn serializeJSON(getSupplierQuery)> <!-- Return the first row of the query as a struct -->
    </cffunction>
    

    <cffunction name="updateSupplier" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="supplier_name" type="string" required="true">
        <cfargument name="contact" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="details" type="string" required="true">
        <cfargument name="credit_balance" type="float" required="true">

        <cfquery datasource="BillingSystem" name="updateUnit">
            UPDATE suppliers
            SET supplier_name = <cfqueryparam value="#arguments.supplier_name#" cfsqltype="cf_sql_varchar">,
                contact = <cfqueryparam value="#arguments.contact#" cfsqltype="cf_sql_varchar">,
                [address] = <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                details = <cfqueryparam value="#arguments.details#" cfsqltype="cf_sql_varchar">,
                credit_balance = <cfqueryparam value="#arguments.credit_balance#" cfsqltype="cf_sql_float">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Supplier updated successfully.">
    </cffunction>

    <cffunction name="deleteSupplier" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="deleteSupplier">
            DELETE FROM suppliers
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Supplier deleted successfully.">
    </cffunction>

    <cffunction name="selectSupplier" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="selectSupplierQuery" datasource="BillingSystem" returnType="array">
            select id,supplier_name from suppliers
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer"> order by supplier_name asc 
        </cfquery>
        <cfreturn serializeJSON(selectSupplierQuery)>
    </cffunction>

    <cffunction name="insertSub_Category" access="remote" returnType="any">
        <cfargument name="selectedCategoryId" type="integer" required="true">
        <cfargument name="selectedCategoryName" type="string" required="true">
        <cfargument name="subCategoryName" type="string" required="true">
        <cfargument name="status" type="string" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="insertunit">
            INSERT INTO sub_category (category_id,category_name,sub_category_name,status,Admin_ID)
            VALUES (<cfqueryparam value="#arguments.selectedCategoryId#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#arguments.selectedCategoryName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.subCategoryName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">)
        </cfquery>
         <cfreturn "sub-category inserted successfully.">
    </cffunction>

    <cffunction name="getSubCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="getSubCategoryQuery" datasource="BillingSystem" returnType="array">
            SELECT id, category_id,category_name,sub_category_name,status
            FROM sub_category
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn  serializeJSON(getSubCategoryQuery)>
    </cffunction>

    <cffunction name="getSubCategoryById" access="remote" returntype="any" returnFormat="json">
        <cfargument name="id" type="numeric" required="true">
        <cfquery name="getSubCategory_Query" datasource="BillingSystem"   >
            SELECT id, category_id,category_name,sub_category_name,status
            FROM sub_category
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn serializeJSON(getSubCategory_Query)> 
    </cffunction>

    
    <cffunction name="updateSubCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="Update_CategoryId" type="numeric" required="true">
        <cfargument name="Update_CategoryName" type="string" required="true">
        <cfargument name="updated_sub_category_name" type="string" required="true">
        <cfargument name="updated_status" type="string" required="true">
       
        <cfquery datasource="BillingSystem" name="updateSubCategory">
            UPDATE sub_category
            SET category_id = <cfqueryparam value="#arguments.Update_CategoryId#" cfsqltype="cf_sql_integer">,
                category_name = <cfqueryparam value="#arguments.Update_CategoryName#" cfsqltype="cf_sql_varchar">,
                sub_category_name = <cfqueryparam value="#arguments.updated_sub_category_name#" cfsqltype="cf_sql_varchar">,
                status = <cfqueryparam value="#arguments.updated_status#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Sub-Category updated successfully.">
    </cffunction>

    <cffunction name="deleteSubCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="deleteSubCategory">
            DELETE FROM sub_category
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Sub Category deleted successfully.">
    </cffunction>

    <cffunction name="selectSubCategoryInCategory" access="remote" returnType="any" returnFormat="json">
        <cfargument name="categoryId" type="integer" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
        
        <cfquery name="getSubCategories" datasource="BillingSystem" returnType="array">
            SELECT id, category_id, sub_category_name 
            FROM sub_category
            WHERE category_id = <cfqueryparam value="#arguments.categoryId#" cfsqltype="cf_sql_integer">
             AND Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn serializeJSON(getSubCategories)>

    </cffunction>

     <cffunction name="insertProduct" access="remote" returnType="any" returnformat="JSON">
        <cfargument name="productname" type="string" required="true">
        <cfargument name="serialnumber" type="string" required="true">
        <cfargument name="productmodel" type="string" required="true">
        <cfargument name="categoryselect" type="integer" required="true">
        <cfargument name="selectedcategoryname" type="string" required="true">
        <cfargument name="sellingprice" type="numeric" required="true">
        <cfargument name="unitselect" type="integer" required="true">
        <cfargument name="selectedunitname" type="string" required="true">
        <cfargument name="taxselect" type="integer" required="true">
        <cfargument name="selectedtaxamount" type="float" required="true">
        <cfargument name="supplierselect" type="integer" required="true">
        <cfargument name="selectedsupplier" type="string" required="true">
        <cfargument name="totalstock" type="numeric" required="true">
        <cfargument name="purchaseprice" type="string" required="true">
        <cfargument name="subcategoryselect" type="integer" required="true">
        <cfargument name="selectedsubcategory" type="string" required="true">
        <cfargument name="productimage" type="any" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
      
        <cffile action="upload" fileField="productimage" destination="#expandPath("./Assets/images/original_image")#" nameConflict="makeUnique" result="uploadResult">
        <cfset uploadedFileName = uploadResult.serverFile>
        <cfimage action="resize" source="#expandPath("./Assets/images/original_image/#uploadedFileName#")#" width="50" height="50" destination="#expandPath("./Assets/images/thumbnail_image/#uploadedFileName#")#">
         
        <cfquery datasource="BillingSystem" name="insertsupplier">
            INSERT INTO products (
                product_name, serial_number, product_model, category_id, catgeory_name, selling_price, unit_id, unit_name,
                tax_id, tax_amount, product_image, supplier_id, supplier_name, total_stock, purchase_price, sub_category_id, sub_Catgeory_name,Admin_ID
            )
            VALUES (
                <cfqueryparam value="#arguments.productname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.serialnumber#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.productmodel#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.categoryselect#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.selectedcategoryname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.sellingprice#" cfsqltype="cf_sql_decimal">,
                <cfqueryparam value="#arguments.unitselect#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.selectedunitname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.taxselect#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.selectedtaxamount#" cfsqltype="cf_sql_float">,
                <cfqueryparam value="#uploadedFileName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.supplierselect#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.selectedsupplier#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.totalstock#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.purchaseprice#" cfsqltype="cf_sql_decimal">,
                <cfqueryparam value="#arguments.subcategoryselect#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.selectedsubcategory#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">

            )
        </cfquery>
        <cfreturn "Product inserted successfully.">
    </cffunction>

    <cffunction name="getProduct" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="getproductQuery" returnType="array">
            select * from products 
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn serializeJSON(getproductQuery)>
    </cffunction>

    <cffunction name="getProductById" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="getproductbyidQuery" returnType="array">
            select * from products where id= <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">;
        </cfquery>
        <cfreturn serializeJSON(getproductbyidQuery)>
    </cffunction>

    <cffunction name="updateProduct" access="remote" returnType="any" returnformat="JSON">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="productname" type="string" required="true">
        <cfargument name="serialnumber" type="string" required="true">
        <cfargument name="productmodel" type="string" required="true">
        <cfargument name="categoryselect" type="integer" required="true">
        <cfargument name="selectedcategoryname" type="string" required="true">
        <cfargument name="sellingprice" type="numeric" required="true">
        <cfargument name="unitselect" type="integer" required="true">
        <cfargument name="selectedunitname" type="string" required="true">
        <cfargument name="taxselect" type="integer" required="true">
        <cfargument name="selectedtaxamount" type="float" required="true">
        <cfargument name="supplierselect" type="integer" required="true">
        <cfargument name="selectedsupplier" type="string" required="true">
        <cfargument name="totalstock" type="numeric" required="true">
        <cfargument name="purchaseprice" type="string" required="true">
        <cfargument name="subcategoryselect" type="integer" required="true">
        <cfargument name="selectedsubcategory" type="string" required="true">
        <cfargument name="productimage" type="any" required="true">
    
        <!--- Get the current image name from the database --->
        <cfquery datasource="BillingSystem" name="getProductImage">
            SELECT product_image
            FROM products
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfif getProductImage.recordCount>
            <cfset currentImage = getProductImage.product_image>
        </cfif>
    
        <!--- If a new image is uploaded, delete the old image and update with the new one --->
        <cfif structKeyExists(arguments, "productimage") and arguments.productimage neq "">
            <cfif currentImage neq "" and fileExists(expandPath("./Assets/images/original_image/#currentImage#"))>
                <cffile action="delete" file="#expandPath("./Assets/images/original_image/#currentImage#")#">
                <cffile action="delete" file="#expandPath("./Assets/images/thumbnail_image/#currentImage#")#">
            </cfif>
    
            <cffile action="upload" fileField="productimage" destination="#expandPath("./Assets/images/original_image")#" nameConflict="makeUnique" result="uploadResult">
            <cfset uploadedFileName = uploadResult.serverFile>
            <cfimage action="resize" source="#expandPath("./Assets/images/original_image/#uploadedFileName#")#" width="50" height="50" destination="#expandPath("./Assets/images/thumbnail_image/#uploadedFileName#")#">
        <cfelse>
            <cfset uploadedFileName = currentImage>
        </cfif>
    
        <cfquery datasource="BillingSystem" name="updateProduct">
            UPDATE products
            SET
            product_name =  <cfqueryparam value="#arguments.productname#" cfsqltype="cf_sql_varchar">,
            serial_number = <cfqueryparam value="#arguments.serialnumber#" cfsqltype="cf_sql_varchar">,
            product_model  =  <cfqueryparam value="#arguments.productmodel#" cfsqltype="cf_sql_varchar">,
            category_id  = <cfqueryparam value="#arguments.categoryselect#" cfsqltype="cf_sql_integer">,
            catgeory_name  = <cfqueryparam value="#arguments.selectedcategoryname#" cfsqltype="cf_sql_varchar">,
            selling_price =  <cfqueryparam value="#arguments.sellingprice#" cfsqltype="cf_sql_decimal">,
            unit_id  = <cfqueryparam value="#arguments.unitselect#" cfsqltype="cf_sql_integer">,
            unit_name = <cfqueryparam value="#arguments.selectedunitname#" cfsqltype="cf_sql_varchar">,
            tax_id =  <cfqueryparam value="#arguments.taxselect#" cfsqltype="cf_sql_integer">,
            tax_amount = <cfqueryparam value="#arguments.selectedtaxamount#" cfsqltype="cf_sql_float">,
            product_image = <cfqueryparam value="#uploadedFileName#" cfsqltype="cf_sql_varchar">,
            supplier_id = <cfqueryparam value="#arguments.supplierselect#" cfsqltype="cf_sql_integer">,
            supplier_name = <cfqueryparam value="#arguments.selectedsupplier#" cfsqltype="cf_sql_varchar">,
            total_stock  = <cfqueryparam value="#arguments.totalstock#" cfsqltype="cf_sql_varchar">,
            purchase_price = <cfqueryparam value="#arguments.purchaseprice#" cfsqltype="cf_sql_decimal">,
            sub_category_id  = <cfqueryparam value="#arguments.subcategoryselect#" cfsqltype="cf_sql_integer">,
            sub_Catgeory_name = <cfqueryparam value="#arguments.selectedsubcategory#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <cfset result = {
            "message": "Product updated successfully."
        }>
        <cfreturn serializeJSON(result)>
    </cffunction>

    <cffunction name="deleteProduct" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="deleteSubCategory">
            DELETE FROM products
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "Sub Category deleted successfully.">
    </cffunction>

    <cffunction name="getProductByName" access="remote" returntype="array" returnformat="JSON">
        <cfargument name="query" type="string" required="true">
        
        <cfquery datasource="BillingSystem" name="getProductByNameQuery" returnType="array">
            SELECT id, product_name FROM products WHERE product_name LIKE <cfqueryparam value="%#arguments.query#%" cfsqltype="cf_sql_varchar">;
        </cfquery>
        <cfreturn getProductByNameQuery>
    </cffunction>

    <cffunction name="getProductStock" access="remote" returnType="any" returnformat="json">
        <cfargument name="id" type="integer" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="getProductStock" returnType="array">
            SELECT total_stock,product_name
            FROM products
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            AND  Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getProductStock>
    </cffunction>

    <cffunction name="getProductTax" access="remote" returnType="any" returnformat="json">
        <cfargument name="productId" type="integer" required="true">
        <cfquery datasource="BillingSystem" name="getProductTax">
            SELECT tax_amount
            FROM products
            WHERE id = <cfqueryparam value="#arguments.productId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getProductTax>
    </cffunction>

    <cffunction name="updateStock" access="remote" returnType="any" returnformat="JSON">
        <cfargument name="items" type="string" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfset itemsArray = deserializeJSON(arguments.items)>
        <!--- Begin a transaction --->
            <cfloop array="#itemsArray#" index="item">
                <cfquery datasource="BillingSystem" name="getPreviousItem">
                    SELECT quantity 
                    FROM invoice_items 
                    WHERE id = <cfqueryparam value="#item.itemId#" cfsqltype="cf_sql_integer">
                </cfquery>

                <cfset previousQuantity = getPreviousItem.quantity>
                <cfset difference = previousQuantity - item.quantity>
                <cfif difference EQ 0>
                    <cfquery datasource="BillingSystem" name="deleteInvoiceItem">
                        UPDATE products
                        SET total_stock = total_stock + #difference#
                        WHERE id = <cfqueryparam value="#item.productId#" cfsqltype="cf_sql_integer">
                        And Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
                    </cfquery>
                </cfif>
                <cfif previousQuantity EQ  difference>
                    <cfquery datasource="BillingSystem" name="deleteInvoiceItem">
                        UPDATE products
                        SET total_stock = total_stock + #difference#
                        WHERE id = <cfqueryparam value="#item.productId#" cfsqltype="cf_sql_integer">
                        And Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
                    </cfquery>
                </cfif>
                <cfif item.quantity  GT previousQuantity >
                    <cfquery datasource="BillingSystem" name="deleteInvoiceItem">
                        UPDATE products
                        SET total_stock = total_stock + #difference#
                        WHERE id = <cfqueryparam value="#item.productId#" cfsqltype="cf_sql_integer">
                        And Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
                    </cfquery>
                </cfif>
                <cfif item.quantity  LT  previousQuantity >
                    <cfquery datasource="BillingSystem" name="deleteInvoiceItem">
                        UPDATE products
                        SET total_stock = total_stock + #difference#
                        WHERE id = <cfqueryparam value="#item.productId#" cfsqltype="cf_sql_integer">
                        And Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
                    </cfquery>
                </cfif>
            </cfloop>

        
        <cfreturn {status="success", message="Stock updated successfully."}>
    </cffunction>
    

    <cffunction name="addInvoice" access="remote" returntype="any">
        <cfargument name="customerName" type="string" required="true">
        <cfargument name="hidden_formattedDate" type="string" required="true">
        <cfargument name="totalAmount" type="numeric" required="true">
        <cfargument name="items" type="array" required="true">
        <cfargument name="Control_ID" type="numeric" required="true">

      
                <cfquery datasource="BillingSystem" name="insertInvoice">
                    INSERT INTO invoice (customerName, invoiceDateTime, totalAmount, Admin_ID)
                    VALUES (
                        <cfqueryparam value="#arguments.customerName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.hidden_formattedDate#" cfsqltype="cf_sql_timestamp">,
                        <cfqueryparam value="#arguments.totalAmount#" cfsqltype="cf_sql_float">,
                        <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
                    );
                </cfquery>
                 <cfset invoiceId  = getMaxInvoiceId()>
               
                <cfloop array="#arguments.items#" index="item">
                    <cfquery datasource="BillingSystem" name="insertInvoiceItem">
                        INSERT INTO invoice_items (customer_name, invoice_dateTime, product_id, quantity, unit_price, discount, tax, actual_amount, discount_amount, tax_amount, total_amount,Admin_ID,invoice_id)
                        VALUES (
                            <cfqueryparam value="#arguments.customerName#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#arguments.hidden_formattedDate#" cfsqltype="cf_sql_timestamp">,
                            <cfqueryparam value="#item.productId#" cfsqltype="cf_sql_integer">,
                            <cfqueryparam value="#item.quantity#" cfsqltype="cf_sql_integer">,
                            <cfqueryparam value="#item.unitPrice#" cfsqltype="cf_sql_numeric">,
                            <cfqueryparam value="#item.discount#" cfsqltype="cf_sql_float">,
                            <cfqueryparam value="#item.tax#" cfsqltype="cf_sql_float">,
                            <cfqueryparam value="#item.actualAmount#" cfsqltype="cf_sql_float">,
                            <cfqueryparam value="#item.discountAmount#" cfsqltype="cf_sql_float">,
                            <cfqueryparam value="#item.taxAmount#" cfsqltype="cf_sql_float">,
                            <cfqueryparam value="#item.totalItemPrice#" cfsqltype="cf_sql_float">,
                            <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">,
                            <cfqueryparam value="#invoiceId#" cfsqltype="cf_sql_integer">
                        );
                    </cfquery>
                </cfloop>
    </cffunction>
    
        
    <cffunction name="getSalesData" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="result" datasource="BillingSystem" returnType="array">
            SELECT 
                p.product_name AS Product,
                ii.quantity AS Quantity,
                ii.unit_price AS Price,
                ii.total_amount AS Total,
                ii.invoice_dateTime AS Date,
                ii.Admin_ID AS Admin_ID
            FROM 
                invoice_items ii
            JOIN 
                products p ON ii.product_id = p.id
           WHERE
                ii.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
            ORDER BY 
                ii.invoice_dateTime DESC
        </cfquery>
        <cfreturn result>
    </cffunction>

      <cffunction name="getInvoices" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="getproductQuery" returnType="array">
            select * from invoice
            WHERE Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn serializeJSON(getproductQuery)>
    </cffunction>

    <cffunction name="getViewInvoicess" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="invoiceId" type="numeric" required="true">
        
       
        <cfquery datasource="BillingSystem" name="getInvoice">
            SELECT customerName, invoiceDateTime, totalAmount
            FROM invoice
            WHERE id = <cfqueryparam value="#arguments.invoiceId#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfset result.CUSTOMERNAME = getInvoice.customerName>
        <cfset result.INVOICEDATETIME = getInvoice.invoiceDateTime>
        <cfset result.TOTALAMOUNT = getInvoice.totalAmount>
        
       
        <cfquery datasource="BillingSystem" name="getInvoiceItems">
            SELECT 
                p.product_name AS description,
                ii.quantity AS quantity,
                ii.unit_price AS unitPrice,
                ii.discount AS discount,
                ii.tax AS tax,
                ii.actual_amount AS actualAmount,
                ii.discount_amount AS discountAmount,
                ii.tax_amount AS taxAmount,
                ii.total_amount AS total
            FROM 
                invoice_items ii
            JOIN 
                products p ON ii.product_id = p.id
            WHERE 
                ii.invoice_id = <cfqueryparam value="#arguments.invoiceId#" cfsqltype="cf_sql_integer">
            ORDER BY 
                ii.invoice_dateTime DESC
        </cfquery>
        
        <cfset result.ITEMS = []>
        <cfloop query="getInvoiceItems">
            <cfset arrayAppend(result.ITEMS, {
                "description": getInvoiceItems.description,
                "quantity": getInvoiceItems.quantity,
                "unitPrice": getInvoiceItems.unitPrice,
                "discount": getInvoiceItems.discount,
                "tax": getInvoiceItems.tax,
                "actualAmount": getInvoiceItems.actualAmount,
                "discountAmount": getInvoiceItems.discountAmount,
                "taxAmount": getInvoiceItems.taxAmount,
                "total": getInvoiceItems.total
            })>
        </cfloop>
        
        <cfreturn result>
    </cffunction>
    
    <cffunction name="getEditInnvoices" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="invoiceId" type="numeric" required="true">
        
        
        <cfquery datasource="BillingSystem" name="getInvoice">
            SELECT customerName, invoiceDateTime, totalAmount
            FROM invoice
            WHERE id = <cfqueryparam value="#arguments.invoiceId#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfset result.CUSTOMERNAME = getInvoice.customerName>
        <cfset result.INVOICEDATETIME = getInvoice.invoiceDateTime>
        <cfset result.TOTALAMOUNT = getInvoice.totalAmount>
        
       
        <cfquery datasource="BillingSystem" name="getInvoiceItems">
            SELECT id, product_id, quantity, unit_price, discount, tax, actual_amount, discount_amount, tax_amount, total_amount
            FROM invoice_items
            WHERE invoice_id = <cfqueryparam value="#arguments.invoiceId#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfset result.ITEMS = []>
        <cfloop query="getInvoiceItems">
            <cfset arrayAppend(result.ITEMS, {
                "itemId": getInvoiceItems.id,
                "product_id": getInvoiceItems.product_id,
                "quantity": getInvoiceItems.quantity,
                "unitPrice": getInvoiceItems.unit_price,
                "discount": getInvoiceItems.discount,
                "tax": getInvoiceItems.tax,
                "actualAmount": getInvoiceItems.actual_amount,
                "discountAmount": getInvoiceItems.discount_amount,
                "taxAmount": getInvoiceItems.tax_amount,
                "total": getInvoiceItems.total_amount
            })>
        </cfloop>
        
        <cfreturn result>
    </cffunction>
    

    <cffunction name="UpdateInvoice" access="remote" returntype="any">
        <cfargument name="invoiceId" type="numeric" required="true">
        <cfargument name="customerName" type="string" required="true">
        <cfargument name="hidden_formattedDate" type="string" required="true">
        <cfargument name="totalAmount" type="numeric" required="true">
        <cfargument name="items" type="array" required="true">
    
        <!-- Update the invoice details -->
        <cfquery datasource="BillingSystem" name="updateInvoice">
            UPDATE invoice
            SET customerName = <cfqueryparam value="#arguments.customerName#" cfsqltype="cf_sql_varchar">,
                invoiceDateTime = <cfqueryparam value="#arguments.hidden_formattedDate#" cfsqltype="cf_sql_timestamp">,
                totalAmount = <cfqueryparam value="#arguments.totalAmount#" cfsqltype="cf_sql_float">
            WHERE id = <cfqueryparam value="#arguments.invoiceId#" cfsqltype="cf_sql_integer">
        </cfquery>
       
        <!-- Loop through each item in the invoice and update accordingly -->
        <cfloop array="#arguments.items#" index="item">
            <cfquery datasource="BillingSystem" name="updateInvoiceItem">
                UPDATE invoice_items
                SET product_id = <cfqueryparam value="#item.productId#" cfsqltype="cf_sql_integer">,
                    quantity = <cfqueryparam value="#item.quantity#" cfsqltype="cf_sql_integer">,
                    unit_price = <cfqueryparam value="#item.unitPrice#" cfsqltype="cf_sql_numeric">,
                    discount = <cfqueryparam value="#item.discount#" cfsqltype="cf_sql_float">,
                    tax = <cfqueryparam value="#item.tax#" cfsqltype="cf_sql_float">,
                    actual_amount = <cfqueryparam value="#item.actualAmount#" cfsqltype="cf_sql_float">,
                    discount_amount = <cfqueryparam value="#item.discountAmount#" cfsqltype="cf_sql_float">,
                    tax_amount = <cfqueryparam value="#item.taxAmount#" cfsqltype="cf_sql_float">,
                    total_amount = <cfqueryparam value="#item.totalItemPrice#" cfsqltype="cf_sql_float">
                WHERE id = <cfqueryparam value="#item.itemId#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfloop>
    </cffunction>
    
    <cffunction name="deleteInvoices" access="remote" returnType="any" returnFormat="json">
        <cfargument name="id" type="integer" required="true">
    
        <!-- First, delete the items associated with the invoice -->
        <cfquery datasource="BillingSystem" name="deleteInvoiceItems">
            DELETE FROM invoice_items
            WHERE invoice_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <!-- Then, delete the invoice -->
        <cfquery datasource="BillingSystem" name="deleteInvoice">
            DELETE FROM invoice
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <cfreturn "Invoice and associated items deleted successfully.">
    </cffunction>
    
    
    <cffunction name="getSalesDataaaa" access="remote" returntype="any" returnformat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfset var result = {}>
    
        <!--- Query to get today's sales --->
        <cfquery datasource="BillingSystem" name="getTodaySales">
            SELECT SUM(totalAmount) AS todaySales
            FROM invoice
            WHERE CAST(invoiceDateTime AS DATE) = CAST(GETDATE() AS DATE)
            AND Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfquery datasource="BillingSystem" name="getYesterdaySales">
            SELECT SUM(totalAmount) AS yesterdaySales
            FROM invoice
            WHERE CAST(invoiceDateTime AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)
            AND Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery> 

        <cfquery datasource="BillingSystem" name="getThisWeekSales">
            SELECT SUM(totalAmount) AS thisWeekSales
            FROM invoice
            WHERE DATEPART(week, invoiceDateTime) = DATEPART(week, GETDATE())
            AND DATEPART(year, invoiceDateTime) = DATEPART(year, GETDATE())
            AND Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery> 

        <cfquery datasource="BillingSystem" name="getLastWeekSales">
            SELECT SUM(totalAmount) AS lastWeekSales
            FROM invoice
            WHERE DATEPART(week, invoiceDateTime) = DATEPART(week, DATEADD(week, -1, GETDATE()))
            AND DATEPART(year, invoiceDateTime) = DATEPART(year, DATEADD(week, -1, GETDATE()))
            AND Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery> 

        <cfset result.todaySales= getTodaySales.todaySales>
        <cfset result.yesterdaySales= getYesterdaySales.yesterdaySales>
        <cfset result.thisWeekSales= getThisWeekSales.thisWeekSales>
        <cfset result.lastWeekSales= getLastWeekSales.lastWeekSales>
    
        <!--- Check if there are results --->
       <cfreturn serializeJSON(result)>
    </cffunction>


    <cffunction name="getMonthlySalesData" access="remote" returntype="any" returnformat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfset var result = []>
        <cfquery name="getSales" datasource="BillingSystem" >
            SELECT 
                DATENAME(month, invoiceDateTime) AS month,
                SUM(totalAmount) AS totalSales
            FROM 
                invoice
            WHERE 
                Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">    
            GROUP BY 
                DATENAME(month, invoiceDateTime),
                MONTH(invoiceDateTime)
               
            ORDER BY 
                MONTH(invoiceDateTime)
        </cfquery>
    
        <cfloop query="getSales">
            <cfset arrayAppend(result, {
                "month": getSales.month,
                "totalSales": getSales.totalSales
            })>
        </cfloop>
    
        <cfreturn serializeJSON(result)>
    </cffunction>

    <cffunction name="loginCheck" access="public" retrunType="query">
        <cfargument name="email_id" type="string" required="true" default="">
        <cfargument name="password" type="string" required="true" default="">
        <cfquery name="sign" dataSource="BillingSystem">
            SELECT UserID,Email,Password,ShopID,Role,ROW_NUMBER() OVER(ORDER BY UserID) AS COUNT FROM Users_BS
            WHERE Email = <cfqueryparam value="#arguments.email_id#" cfsqltype="cf_sql_nvarchar">
            AND Password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_nvarchar">
        </cfquery>
        <cfreturn sign>
    </cffunction>

    <cffunction name="registerUser" access="remote" returntype="any" >
        <cfargument name="name" type="string" required="true"/>
        <cfargument name="type_of_role" type="string" required="true"/>
        <cfargument name="email" type="string" required="true"/>
        <cfargument name="password" type="string" required="true"/>
        <cfargument name="shop_name" type="string" default=""/>
        <cfargument name="shop_logo" type="any" default=""/>
        <cfargument name="shop_name_select" type="any" required="true"/>

    
        <cfset var shopID = "">
        <cfset var uploadedFileName = "">

        <cfif arguments.type_of_role EQ "admin" AND structKeyExists(form, "shop_logo") AND len(form.shop_logo)>
            <cffile action="upload" fileField="shop_logo" destination="#expandPath('./Assets/images/original_image')#" nameConflict="makeUnique" result="uploadResult">
            <cfset uploadedFileName = uploadResult.serverFile>
            <cfimage action="resize" source="#expandPath('./Assets/images/original_image/#uploadedFileName#')#" width="50" height="50" destination="#expandPath('./Assets/images/thumbnail_image/#uploadedFileName#')#">
        </cfif>

       
        <cfif arguments.type_of_role EQ "admin">
            <cfquery name="insertShop" datasource="BillingSystem">
                INSERT INTO Shops (ShopName, ShopLogo)
                VALUES (
                    <cfqueryparam value="#arguments.shop_name#" cfsqltype="cf_sql_nvarchar">,
                    <cfqueryparam value="#uploadedFileName#" cfsqltype="cf_sql_nvarchar">
                )
            </cfquery>
            <cfset shopID = getMaxShopId()>
        </cfif>

       
        <cfquery name="insertUser" datasource="BillingSystem">
            INSERT INTO Users_BS (Name, Email, Password, Role, ShopID)
            VALUES (
                <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.type_of_role#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.type_of_role EQ 'admin' ? shopID : shop_name_select #" cfsqltype="cf_sql_integer" >
                
            )
        </cfquery>
    </cffunction>

    <cffunction name="getRigsterDetails" access="public" returnType="query">
        <cfset shopID = getMaxUserId()>
        <cfquery name="getRegisterlistquery" datasource="BillingSystem">
            SELECT UserID, Email, Password, ShopID, Role, ROW_NUMBER() OVER(ORDER BY UserID) AS COUNT
            FROM Users_BS
            WHERE UserID = <cfqueryparam value="#shopID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getRegisterlistquery>
    </cffunction>
    <cffunction name="getMaxUserId" access="private" returnType="numeric">
        <cfquery name="getMaxIdQuery" datasource="BillingSystem">
          SELECT user_id FROM vw_MaxUserID;
        </cfquery>
        <cfreturn getMaxIdQuery.user_id>
    </cffunction>
    
    <cffunction name="getMaxShopId" access="private" returnType="numeric">
        <cfquery name="getMaxIdQuery" datasource="BillingSystem">
            SELECT Shop_id FROM vw_MaxShopID;
        </cfquery>
        <cfreturn getMaxIdQuery.Shop_id>
    </cffunction>
    

    <cffunction name="getShopNames" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="getshopslistquery" datasource="BillingSystem" returntype="array">
            select ShopID,ShopName from Shops 
        </cfquery>
        <cfreturn serializeJSON(getshopslistquery)>

    </cffunction>

    <cffunction name="logout" access="public" returntype="string">
        <cfset structClear(session)>
        <cfreturn "success">
    </cffunction>
            
    <cffunction name="getShopDetails" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="user_id" type="any" required="true">
        <cfquery datasource="BillingSystem" name="getshopslistquery" returntype="array">
            SELECT 
                s.ShopName AS ShopName,
                UB.UserID AS UserID,
                UB.Name AS Name,
                UB.Email AS Email,
                UB.Password AS Password,
                UB.Role AS Role,
                UB.ShopID AS ShopID
            FROM 
                Users_BS UB
            JOIN 
            Shops s ON UB.ShopID = s.ShopID
            WHERE 
                UB.UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
            ORDER BY 
                UB.UserID DESC
        </cfquery>
        <cfreturn serializeJSON(getshopslistquery)>


    </cffunction>
    



    <cffunction name="getProfile" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="user_id" type="numeric" required="true">
        <cfset var result = {}>

        <cfquery name="userProfile" datasource="BillingSystem"  returntype="array">
            SELECT 
                u.Name AS userName, 
                u.Email AS email, 
                u.Password AS password, 
                s.ShopName AS shopName, 
                s.ShopLogo AS shopLogo,
                u.ProfileImageName As ProfileImageName,
                u.MobileNumber AS MobileNumber
                
            FROM 
                Users_BS u
            LEFT JOIN 
                Shops s 
            ON 
                u.ShopID = s.ShopID
            WHERE 
                u.UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>

    
        <cfreturn serializeJSON(userProfile)>
    </cffunction>

      


    <cffunction name="getProductCount" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="productCount" datasource="BillingSystem">
            SELECT COUNT(*) AS count
            FROM products
            WHERE  Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">  
        </cfquery>
        <cfreturn serializeJSON(productCount)>
    </cffunction>


    <cffunction name="getSalesCount" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="salesCount" datasource="BillingSystem">
            SELECT COUNT(*) AS count
            FROM invoice_items
            WHERE  Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">  
        </cfquery>
    
        <cfset result = {
            COLUMNS = ["COUNT"],
            DATA = [ [salesCount.count] ]
        }>
        <cfreturn serializeJSON(result)>
    </cffunction>


    <cffunction name="getSupplierCount" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="supplierCount" datasource="BillingSystem">
            SELECT COUNT(*) AS count
            FROM suppliers
            WHERE  Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">  
        </cfquery>

        <cfset result = {
            COLUMNS = ["COUNT"],
            DATA = [ [supplierCount.count] ]
        }>
        <cfreturn serializeJSON(result)>
    </cffunction>


    <cffunction name="getInvoiceCount" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="invoiceCount" datasource="BillingSystem">
            SELECT COUNT(*) AS count
            FROM invoice
            WHERE  Admin_ID =<cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">  
        </cfquery>

        <cfset result = {
            COLUMNS = ["COUNT"],
            DATA = [ [invoiceCount.count] ]
        }>
        <cfreturn serializeJSON(result)>
    </cffunction>

    <cffunction name="updateShopLogo" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="shopLogo" type="any" required="true">

        <cfquery datasource="BillingSystem" name="getshopLogoImage">
            SELECT ShopLogo
            FROM Shops
            WHERE ShopID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfif getshopLogoImage.recordCount>
            <cfset currentShopLogoImage = getshopLogoImage.ShopLogo>
        </cfif>
    
        <!--- If a new image is uploaded, delete the old image and update with the new one --->
        <cfif structKeyExists(arguments, "shopLogo") and arguments.shopLogo neq "">
            <cfif currentShopLogoImage neq "" and fileExists(expandPath("./Assets/images/original_image/#currentShopLogoImage#"))>
                <cffile action="delete" file="#expandPath("./Assets/images/original_image/#currentShopLogoImage#")#">
                <cffile action="delete" file="#expandPath("./Assets/images/thumbnail_image/#currentShopLogoImage#")#">
            </cfif>
    
            <cffile action="upload" fileField="shopLogo" destination="#expandPath("./Assets/images/original_image")#" nameConflict="makeUnique" result="uploadResult">
            <cfset uploadedFileName = uploadResult.serverFile>
            <cfimage action="resize" source="#expandPath("./Assets/images/original_image/#uploadedFileName#")#" width="50" height="50" destination="#expandPath("./Assets/images/thumbnail_image/#uploadedFileName#")#">
        <cfelse>
            <cfset uploadedFileName = currentShopLogoImage>
        </cfif>

        <cfquery datasource="BillingSystem" name="updateShopLogo">
            UPDATE Shops
            SET
            ShopLogo = <cfqueryparam value="#uploadedFileName#" cfsqltype="cf_sql_nvarchar">
            WHERE ShopID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <cfset result = {
            "message": "Shop Logo updated successfully."
        }>
        <cfreturn serializeJSON(result)>



    </cffunction>
        
    <cffunction name="updateProfileImage" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="profileImage" type="any" required="false">
    
      
        <cfquery datasource="BillingSystem" name="getProfileImage">
            SELECT ProfileImageName
            FROM Users_BS
            WHERE UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfif getProfileImage.recordCount>
            <cfset currentProfileImage = getProfileImage.ProfileImageName>
        </cfif>
    
       
        <cfif structKeyExists(arguments, "profileImage") and arguments.profileImage neq "">
            <cfif currentProfileImage neq "" and fileExists(expandPath("./Assets/images/original_image/#currentProfileImage#"))>
               
                <cffile action="delete" file="#expandPath("./Assets/images/original_image/#currentProfileImage#")#">
                <cffile action="delete" file="#expandPath("./Assets/images/thumbnail_image/#currentProfileImage#")#">
            </cfif>
    
           
            <cffile action="upload" fileField="profileImage" destination="#expandPath("./Assets/images/original_image")#" nameConflict="makeUnique" result="uploadResult">
            <cfset uploadedFileName = uploadResult.serverFile>
            
       
            <cfimage action="resize" source="#expandPath("./Assets/images/original_image/#uploadedFileName#")#" width="50" height="50" destination="#expandPath("./Assets/images/thumbnail_image/#uploadedFileName#")#">
            
        <cfelse>
           
            <cfset uploadedFileName = currentProfileImage>
        </cfif>
    
        <!--- If both current image and new image are empty, set to NULL --->
      <!---   <cfif currentProfileImage eq "" and arguments.profileImage eq "">
            <cfset uploadedFileName = "NULL">
        </cfif>
     --->
        <!--- Update the database with the new profile image or NULL --->
        <cfquery datasource="BillingSystem" name="updateProfileImage">
            UPDATE Users_BS
            SET ProfileImageName = <cfqueryparam value="#uploadedFileName#" cfsqltype="cf_sql_nvarchar">
            WHERE UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <!--- Return a success message --->
        <cfset result = {
            "message": "Profile Image updated successfully."
        }>
        <cfreturn serializeJSON(result)>
    </cffunction>

    <cffunction name="updateProfileName" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="userName" type="string" required="true">
        <cfquery name="getUpdateProfileName" datasource="BillingSystem">
            UPDATE Users_BS
            SET Name = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
            WHERE UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <cffunction name="updateShopName" access="remote"  returntype="any" returnformat="JSON">
        <cfargument name="shopName" type="string" required="yes">
        <cfargument name="user_id" type="numeric" required="yes">
        <cfquery name="updateShopName" datasource="BillingSystem">
            UPDATE Shops
            SET ShopName = <cfqueryparam value="#arguments.shopName#" cfsqltype="cf_sql_varchar">
            WHERE ShopID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <cffunction name="updateEmail"  access="remote"  returntype="any" returnformat="JSON">
        <cfargument name="email" type="string" required="yes">
        <cfargument name="user_id" type="numeric" required="yes">
        <cfquery datasource="BillingSystem">
            UPDATE Users_BS
            SET Email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
            WHERE UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
    
    <cffunction name="updatePassword" access="remote"  returntype="any" returnformat="JSON">
        <cfargument name="password" type="string" required="true">
        <cfargument name="user_id" type="numeric" required="true">
     
        <cfquery datasource="BillingSystem">
            UPDATE Users_BS
            SET Password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_nvarchar">
            WHERE UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <cffunction name="updateMobileNumber"  access="remote"  returntype="any" returnformat="JSON">
        <cfargument name="mobileNumber" type="string" required="yes">
        <cfargument name="user_id" type="numeric" required="yes">
        <cfset var result = { success = false, message = "" }>
    
       
        <cfquery datasource="BillingSystem">
            UPDATE Users_BS
            SET MobileNumber = <cfqueryparam value="#arguments.mobileNumber#" cfsqltype="cf_sql_varchar">
            WHERE UserID = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <cfset result.success = true />
        <cfset result.message = "Mobile number updated successfully." />
    
        <cfreturn result />
    </cffunction>
    <cffunction name="getCustomerDetails" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery name="CustomerDetails" datasource="BillingSystem" returnType="array">
            SELECT 
                i.invoiceDateTime AS Date,
                i.customerName AS CustomerName,
                COUNT(ii.product_id) AS PurchaseProducts,
                SUM(ii.total_amount) AS PurchaseAmount,
                i.id AS InvoiceID
            FROM 
                invoice i
            INNER JOIN 
                invoice_items ii ON i.id = ii.invoice_id
            WHERE 
                i.Admin_ID = <cfqueryparam value="#Control_ID#" cfsqltype="cf_sql_integer">
            GROUP BY 
                i.invoiceDateTime, i.customerName, i.id
            ORDER BY 
                i.invoiceDateTime DESC;
        </cfquery>

       
        <cfreturn serializeJSON(CustomerDetails)>
    </cffunction>



    <cffunction name="getProfitData" access="remote" returntype="any" returnformat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfset var result = {}>

        <!---  today's profit --->
        <cfquery datasource="BillingSystem" name="getTodayProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS todayProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE CAST(ii.invoice_dateTime AS DATE) = CAST(GETDATE() AS DATE)
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!---  yesterday's profit --->
        <cfquery datasource="BillingSystem" name="getYesterdayProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS yesterdayProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE CAST(ii.invoice_dateTime AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- this week's profit --->
        <cfquery datasource="BillingSystem" name="getThisWeekProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS thisWeekProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE DATEPART(week, ii.invoice_dateTime) = DATEPART(week, GETDATE())
            AND DATEPART(year, ii.invoice_dateTime) = DATEPART(year, GETDATE())
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- last week's profit --->
        <cfquery datasource="BillingSystem" name="getLastWeekProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS lastWeekProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE DATEPART(week, ii.invoice_dateTime) = DATEPART(week, DATEADD(week, -1, GETDATE()))
            AND DATEPART(year, ii.invoice_dateTime) = DATEPART(year, DATEADD(week, -1, GETDATE()))
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- this month's profit --->
        <cfquery datasource="BillingSystem" name="getThisMonthProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS thisMonthProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE MONTH(ii.invoice_dateTime) = MONTH(GETDATE())
            AND YEAR(ii.invoice_dateTime) = YEAR(GETDATE())
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!---  last month's profit --->
        <cfquery datasource="BillingSystem" name="getLastMonthProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS lastMonthProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE MONTH(ii.invoice_dateTime) = MONTH(GETDATE()) - 1
            AND YEAR(ii.invoice_dateTime) = YEAR(GETDATE())
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- this year's profit --->
        <cfquery datasource="BillingSystem" name="getThisYearProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS thisYearProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE YEAR(ii.invoice_dateTime) = YEAR(GETDATE())
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!---  get last year's profit --->
        <cfquery datasource="BillingSystem" name="getLastYearProfit">
            SELECT SUM(ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS lastYearProfit
            FROM invoice_items ii
            INNER JOIN invoice i ON ii.invoice_id = i.id
            INNER JOIN products p ON ii.product_id = p.id
            WHERE YEAR(ii.invoice_dateTime) = YEAR(GETDATE()) - 1
            AND i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>

      
        <cfset result.todayProfit = getTodayProfit.todayProfit>
            <cfset result.yesterdayProfit = getYesterdayProfit.yesterdayProfit>
            <cfset result.thisWeekProfit = getThisWeekProfit.thisWeekProfit>
            <cfset result.lastWeekProfit = getLastWeekProfit.lastWeekProfit>
            <cfset result.thisMonthProfit = getThisMonthProfit.thisMonthProfit>
            <cfset result.lastMonthProfit = getLastMonthProfit.lastMonthProfit>
            <cfset result.thisYearProfit = getThisYearProfit.thisYearProfit>
            <cfset result.lastYearProfit = getLastYearProfit.lastYearProfit>

            <cfreturn serializeJSON(result)>
    </cffunction>

    
    
    
<!---     <cffunction name="getInvoiceDetails" access="remote" returntype="any" returnformat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfquery datasource="BillingSystem" name="invoiceDetailsQuery" returnType="array">
            SELECT 
                i.id AS invoiceID,
                ii.total_amount AS totalPurchaseAmount,
                ii.discount_amount AS discountAmount,
                ii.tax_amount AS taxAmount,
                ii.quantity AS quantity,
                p.product_name AS productName,
                p.purchase_price AS purchasePrice,
                p.selling_price AS sellingPrice,
                ii.invoice_dateTime AS DateTime,
                (ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS profitAmount
            FROM 
                invoice_items ii
            INNER JOIN
                invoice i ON ii.invoice_id = i.id
            INNER JOIN
                products p ON ii.product_id = p.id
            WHERE 
                i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <cfreturn serializeJSON(invoiceDetailsQuery)>
    </cffunction> --->
    <cffunction name="getInvoiceDetails" access="remote" returntype="any" returnformat="json">
        <cfargument name="Control_ID" type="numeric" required="true">
        <cfargument name="filter" type="string" required="false" default="">
        
        <cfset var startDate = "" />
        <cfset var endDate = "" />
        
       
        <cfif arguments.filter EQ "today">
            <cfset startDate = DateFormat(Now(), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(Now(), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "yesterday">
            <cfset startDate = DateFormat(DateAdd("d", -1, Now()), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(DateAdd("d", -1, Now()), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "this_week">
            <cfset startDate = DateFormat(DateAdd("d", -DatePart("w", Now()) + 1, Now()), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(DateAdd("d", 7 - DatePart("w", Now()), Now()), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "last_week">
            <cfset startDate = DateFormat(DateAdd("w", -DatePart("w", Now()) - 6, Now()), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(DateAdd("w", -DatePart("w", Now()), Now()), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "this_month">
            <cfset startDate = DateFormat(CreateDate(Year(Now()), Month(Now()), 1), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(DateAdd("m", 1, CreateDate(Year(Now()), Month(Now()), 1)), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "last_month">
            <cfset startDate = DateFormat(CreateDate(Year(Now()), Month(Now()) - 1, 1), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(DateAdd("d", -1, CreateDate(Year(Now()), Month(Now()), 1)), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "this_year">
            <cfset startDate = DateFormat(CreateDate(Year(Now()), 1, 1), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(CreateDate(Year(Now()) + 1, 1, 1), "yyyy-mm-dd") & " 23:59:59" />
        <cfelseif arguments.filter EQ "last_year">
            <cfset startDate = DateFormat(CreateDate(Year(Now()) - 1, 1, 1), "yyyy-mm-dd") />
            <cfset endDate = DateFormat(CreateDate(Year(Now()), 1, 1), "yyyy-mm-dd") & " 23:59:59" />
        </cfif>
        
      
        <cfquery datasource="BillingSystem" name="invoiceDetailsQuery" returnType="array">
            SELECT 
                i.id AS invoiceID,
                ii.total_amount AS totalPurchaseAmount,
                ii.discount_amount AS discountAmount,
                ii.tax_amount AS taxAmount,
                ii.quantity AS quantity,
                p.product_name AS productName,
                p.purchase_price AS purchasePrice,
                p.selling_price AS sellingPrice,
                ii.invoice_dateTime AS DateTime,
                (ii.total_amount - ii.discount_amount - ii.tax_amount - (p.purchase_price * ii.quantity)) AS profitAmount
            FROM 
                invoice_items ii
            INNER JOIN
                invoice i ON ii.invoice_id = i.id
            INNER JOIN
                products p ON ii.product_id = p.id
            WHERE 
                i.Admin_ID = <cfqueryparam value="#arguments.Control_ID#" cfsqltype="cf_sql_integer">
            AND ii.invoice_dateTime BETWEEN <cfqueryparam value="#startDate#" cfsqltype="cf_sql_timestamp">
            AND <cfqueryparam value="#endDate#" cfsqltype="cf_sql_timestamp">
        </cfquery>
        
        
        <cfreturn serializeJSON(invoiceDetailsQuery)>
    </cffunction>

    <cffunction name="SignupCheck" access="public" retrunType="query">
        <cfargument name="mail_id" type="string" required="true" default="">
        <cfquery name="sign" dataSource="BillingSystem">
            SELECT UserID,Email,Password,ShopID,Role,ROW_NUMBER() OVER(ORDER BY UserID) AS COUNT FROM Users_BS
            WHERE Email = <cfqueryparam value="#arguments.mail_id#" cfsqltype="cf_sql_nvarchar">;
        </cfquery>
        <cfreturn sign>
    </cffunction>

    
    <cffunction name="getSubscriptionDetails" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="userID" type="numeric" required="true">
        
        <cfset currentDateTime = now()>

        <cfquery name="subscriptionData" datasource="BillingSystem" returntype="array">
            SELECT
                s.UserID,
                s.PlanID,
                s.StartDate,
                s.ExpirationDate,
                s.PaymentID,
                s.TransactionID,
                s.PayerID,
                p.PlanName,
                p.Cost,
                p.DurationDays
            FROM
                UserSubscriptions s
            INNER JOIN
                SubscriptionPlans p ON s.PlanID = p.PlanID
            WHERE
                s.UserID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">
                AND s.ExpirationDate > <cfqueryparam value="#currentDateTime#" cfsqltype="cf_sql_timestamp">
        </cfquery>
        
        <cfreturn serializeJSON(subscriptionData)>
    </cffunction>

    <cffunction name="subscribecheck" access="public" returnType="query">
        <cfargument name="currentDateTime" type="any" required="true">
        <cfquery datasource="BillingSystem" name="checksubscribe">
            SELECT * 
            FROM UserSubscriptions 
            WHERE UserID = <cfqueryparam value="#session.id#" cfsqltype="cf_sql_integer">
            AND ExpirationDate >= <cfqueryparam value="#arguments.currentDateTime#" cfsqltype="cf_sql_timestamp">
        </cfquery>
    
      
        <cfreturn checksubscribe>
    </cffunction>
    
    
    <cffunction name="expireSession" access="remote" returntype="any" returnformat="JSON">
        <cfif structKeyExists(session, "expire")>
            <cfset structDelete(session, "expire")>
        </cfif>
        <cfset message="session cleated successfully">
        <cfreturn serializeJSON(message)>
    </cffunction>

    <cffunction name="Subscription_Details" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="userID" type="numeric" required="true">
        <cfquery name="subscriptionData" datasource="BillingSystem" returntype="array">
            SELECT
                s.UserID,
                s.PlanID,
                s.StartDate,
                s.ExpirationDate,
                s.PaymentID,
                s.TransactionID,
                s.PayerID,
                p.PlanName,
                p.Cost,
                p.DurationDays
            FROM
                UserSubscriptions s
            INNER JOIN
                SubscriptionPlans p ON s.PlanID = p.PlanID
            WHERE
                s.UserID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <!--- Return the subscription data with expiration date --->
        <cfreturn serializeJSON(subscriptionData)>
    </cffunction>

    <cffunction name="getStockss" access="remote" returntype="any" returnformat="json">
        <cfargument name="userID" type="numeric" required="true">
        <cfquery name="stockData" datasource="BillingSystem" returnType="array">
            SELECT id, product_name, total_stock
            FROM products
            WHERE
                Admin_ID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">

        </cfquery>
   
        <cfreturn serializeJSON(stockData)>
    </cffunction>
    

    <cffunction name="updateStockss" access="remote"  returntype="any" returnformat="json">
        <cfargument name="product_id" type="numeric" required="true">
        <cfargument name="add_stock" type="numeric" required="true">
        <cfargument name="userID" type="numeric" required="true">

        <cfset var result ="">
        <cfset var newStock = 0>

        <cfquery name="currentStock" datasource="BillingSystem">
            SELECT total_stock
            FROM products
            WHERE id = <cfqueryparam value="#arguments.product_id#" cfsqltype="cf_sql_integer">
            And Admin_ID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfset newStock = currentStock.total_stock + arguments.add_stock>

        <cfquery datasource="BillingSystem">
            UPDATE products
            SET total_stock = <cfqueryparam value="#newStock#" cfsqltype="cf_sql_integer">
            WHERE id = <cfqueryparam value="#arguments.product_id#" cfsqltype="cf_sql_integer">
            And Admin_ID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfset result = "success" >
        <cfreturn result>
    </cffunction>


    <cffunction name="sendOTP" access="remote" returntype="any" returnformat="json">
        <cfargument name="email" type="string" required="true">
        <!--- Your logic to generate and send OTP --->
        <!--- Store OTP in session or database as needed --->
        <cfset otp = randRange(100000, 999999)>
        <cfset session.otps = otp>
        <cfset session.email = arguments.email>
        
        <cfmail to="#arguments.email#" from="your-email@example.com" subject="Your OTP for Password Reset" server="localhost">
            Hi,
            <br><br>
            Your OTP for password reset is: #otp#
            <br><br>
            Please enter this OTP on the website to reset your password.
            <br><br>
            Regards,<br>
            Billing System Support Team
        </cfmail>
        <cfset result="successsssss">
        
        <cfreturn serializeJSON(result)>
    </cffunction>

    <cffunction name="verifyOTP" access="remote" returntype="any" returnformat="json">
        <cfargument name="otp" type="numeric" required="true">
        <cfif arguments.otp EQ session.otps>
            <cfreturn "successllll">
        <cfelse>
            <cfset resultt=session.otp>
            <cfreturn resultt>
        </cfif>
    </cffunction>

    <cffunction name="resetPassword" access="remote" returntype="any" returnformat="json">
        <cfargument name="password" type="string" required="true">
        <cfargument name="confirm_password" type="string" required="true">
        
        <cfif arguments.password EQ arguments.confirm_password>
            <cfquery datasource="BillingSystem">
                UPDATE Users_BS
                SET Password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
                WHERE Email = <cfqueryparam value="#session.email#" cfsqltype="cf_sql_varchar">
            </cfquery>
            
            <cfset structClear(session)>
            <cfreturn "success">
        <cfelse>
            <cfreturn "Passwords do not match">
        </cfif>
    </cffunction>


    
    <cffunction name="updatestatus" access="remote" returntype="any" returnformat="json">
        <cfargument name="password" type="string" required="true">
        <cfargument name="confirm_password" type="string" required="true">
        
        <cfif arguments.password EQ arguments.confirm_password>
            <cfquery name="updaterestataus "datasource="BillingSystem">
                UPDATE  tblreferral set Status =<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
                where CaseID=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfset structClear(session)>
            <cfreturn "success">
        <cfelse>
            <cfreturn "Passwords do not match">
        </cfif>
    </cffunction>


    
    

    
    
    
        
    
</cfcomponent>      
