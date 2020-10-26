﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineSuperMartket.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class online_superMarket_systemEntities : DbContext
    {
        public online_superMarket_systemEntities()
            : base("name=online_superMarket_systemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AddToCart> AddToCarts { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Discount> Discounts { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<order> orders { get; set; }
        public virtual DbSet<Payement_Type> Payement_Type { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<statement> statements { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<userRole> userRoles { get; set; }
        public virtual DbSet<user> users { get; set; }
    
        public virtual int ActiveProducts(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActiveProducts", idParameter);
        }
    
        public virtual int ActiveVendor(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ActiveVendor", idParameter);
        }
    
        public virtual int completeOrder(Nullable<int> vendrid, Nullable<int> orderid)
        {
            var vendridParameter = vendrid.HasValue ?
                new ObjectParameter("vendrid", vendrid) :
                new ObjectParameter("vendrid", typeof(int));
    
            var orderidParameter = orderid.HasValue ?
                new ObjectParameter("orderid", orderid) :
                new ObjectParameter("orderid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("completeOrder", vendridParameter, orderidParameter);
        }
    
        public virtual ObjectResult<customerDetails_Result> customerDetails(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<customerDetails_Result>("customerDetails", idParameter);
        }
    
        public virtual int deletCart(Nullable<int> product_ID)
        {
            var product_IDParameter = product_ID.HasValue ?
                new ObjectParameter("Product_ID", product_ID) :
                new ObjectParameter("Product_ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("deletCart", product_IDParameter);
        }
    
        public virtual int deleteproducts(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("deleteproducts", idParameter);
        }
    
        public virtual int InActiveProducts(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InActiveProducts", idParameter);
        }
    
        public virtual int InActiveVendor(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InActiveVendor", idParameter);
        }
    
        public virtual int makeorder(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("makeorder", idParameter);
        }
    
        public virtual ObjectResult<sp_ActiveProductsAgainstVendorID_Result> sp_ActiveProductsAgainstVendorID(Nullable<bool> isActive, Nullable<int> sellorID)
        {
            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("isActive", isActive) :
                new ObjectParameter("isActive", typeof(bool));
    
            var sellorIDParameter = sellorID.HasValue ?
                new ObjectParameter("sellorID", sellorID) :
                new ObjectParameter("sellorID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_ActiveProductsAgainstVendorID_Result>("sp_ActiveProductsAgainstVendorID", isActiveParameter, sellorIDParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual ObjectResult<sp_CategryVisProducts_Result> sp_CategryVisProducts(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_CategryVisProducts_Result>("sp_CategryVisProducts", idParameter);
        }
    
        public virtual ObjectResult<sp_CategryVisProductsForVendor_Result> sp_CategryVisProductsForVendor(Nullable<int> id, Nullable<int> cetegoryID)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            var cetegoryIDParameter = cetegoryID.HasValue ?
                new ObjectParameter("cetegoryID", cetegoryID) :
                new ObjectParameter("cetegoryID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_CategryVisProductsForVendor_Result>("sp_CategryVisProductsForVendor", idParameter, cetegoryIDParameter);
        }
    
        public virtual ObjectResult<sp_CountofTotalCategory_Result> sp_CountofTotalCategory(Nullable<bool> idAdmin, Nullable<int> id)
        {
            var idAdminParameter = idAdmin.HasValue ?
                new ObjectParameter("idAdmin", idAdmin) :
                new ObjectParameter("idAdmin", typeof(bool));
    
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_CountofTotalCategory_Result>("sp_CountofTotalCategory", idAdminParameter, idParameter);
        }
    
        public virtual ObjectResult<sp_CountofTotalProducts_Result> sp_CountofTotalProducts(Nullable<bool> idAdmin, Nullable<int> id)
        {
            var idAdminParameter = idAdmin.HasValue ?
                new ObjectParameter("idAdmin", idAdmin) :
                new ObjectParameter("idAdmin", typeof(bool));
    
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_CountofTotalProducts_Result>("sp_CountofTotalProducts", idAdminParameter, idParameter);
        }
    
        public virtual ObjectResult<sp_CountofTotalVendor_Result> sp_CountofTotalVendor()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_CountofTotalVendor_Result>("sp_CountofTotalVendor");
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_Products_Result> sp_Products(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Products_Result>("sp_Products", idParameter);
        }
    
        public virtual ObjectResult<sp_ProductsAll_Result> sp_ProductsAll(Nullable<bool> isActive)
        {
            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("isActive", isActive) :
                new ObjectParameter("isActive", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_ProductsAll_Result>("sp_ProductsAll", isActiveParameter);
        }
    
        public virtual ObjectResult<sp_ProductsAll__Result> sp_ProductsAll_()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_ProductsAll__Result>("sp_ProductsAll_");
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual ObjectResult<sp_sellAcctoCategory_Result> sp_sellAcctoCategory()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_sellAcctoCategory_Result>("sp_sellAcctoCategory");
        }
    
        public virtual ObjectResult<sp_sellAcctocategoryforVender_Result> sp_sellAcctocategoryforVender(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_sellAcctocategoryforVender_Result>("sp_sellAcctocategoryforVender", idParameter);
        }
    
        public virtual ObjectResult<sp_sellAcctoproducts_Result> sp_sellAcctoproducts()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_sellAcctoproducts_Result>("sp_sellAcctoproducts");
        }
    
        public virtual ObjectResult<sp_sellAcctoproductsforVender_Result> sp_sellAcctoproductsforVender(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_sellAcctoproductsforVender_Result>("sp_sellAcctoproductsforVender", idParameter);
        }
    
        public virtual ObjectResult<sp_sellAcctoVendor_Result> sp_sellAcctoVendor()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_sellAcctoVendor_Result>("sp_sellAcctoVendor");
        }
    
        public virtual ObjectResult<sp_sellAcctoVendorforVender_Result> sp_sellAcctoVendorforVender(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_sellAcctoVendorforVender_Result>("sp_sellAcctoVendorforVender", idParameter);
        }
    
        public virtual int sp_updateProduct(Nullable<int> product_ID, Nullable<int> category_ID, Nullable<int> brand_ID, string product_name, string product_disc, Nullable<int> whole_sale_price, Nullable<int> product_code, Nullable<int> retail_price, Nullable<int> stock, string imgPath, Nullable<System.DateTime> create_at, Nullable<System.DateTime> update_at, Nullable<bool> is_active)
        {
            var product_IDParameter = product_ID.HasValue ?
                new ObjectParameter("Product_ID", product_ID) :
                new ObjectParameter("Product_ID", typeof(int));
    
            var category_IDParameter = category_ID.HasValue ?
                new ObjectParameter("category_ID", category_ID) :
                new ObjectParameter("category_ID", typeof(int));
    
            var brand_IDParameter = brand_ID.HasValue ?
                new ObjectParameter("brand_ID", brand_ID) :
                new ObjectParameter("brand_ID", typeof(int));
    
            var product_nameParameter = product_name != null ?
                new ObjectParameter("Product_name", product_name) :
                new ObjectParameter("Product_name", typeof(string));
    
            var product_discParameter = product_disc != null ?
                new ObjectParameter("Product_disc", product_disc) :
                new ObjectParameter("Product_disc", typeof(string));
    
            var whole_sale_priceParameter = whole_sale_price.HasValue ?
                new ObjectParameter("whole_sale_price", whole_sale_price) :
                new ObjectParameter("whole_sale_price", typeof(int));
    
            var product_codeParameter = product_code.HasValue ?
                new ObjectParameter("Product_code", product_code) :
                new ObjectParameter("Product_code", typeof(int));
    
            var retail_priceParameter = retail_price.HasValue ?
                new ObjectParameter("retail_price", retail_price) :
                new ObjectParameter("retail_price", typeof(int));
    
            var stockParameter = stock.HasValue ?
                new ObjectParameter("stock", stock) :
                new ObjectParameter("stock", typeof(int));
    
            var imgPathParameter = imgPath != null ?
                new ObjectParameter("imgPath", imgPath) :
                new ObjectParameter("imgPath", typeof(string));
    
            var create_atParameter = create_at.HasValue ?
                new ObjectParameter("create_at", create_at) :
                new ObjectParameter("create_at", typeof(System.DateTime));
    
            var update_atParameter = update_at.HasValue ?
                new ObjectParameter("update_at", update_at) :
                new ObjectParameter("update_at", typeof(System.DateTime));
    
            var is_activeParameter = is_active.HasValue ?
                new ObjectParameter("is_active", is_active) :
                new ObjectParameter("is_active", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_updateProduct", product_IDParameter, category_IDParameter, brand_IDParameter, product_nameParameter, product_discParameter, whole_sale_priceParameter, product_codeParameter, retail_priceParameter, stockParameter, imgPathParameter, create_atParameter, update_atParameter, is_activeParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<sp_VendorVisProducts_Result> sp_VendorVisProducts(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_VendorVisProducts_Result>("sp_VendorVisProducts", idParameter);
        }
    
        public virtual int update_brand(Nullable<int> brand_ID1, string brand_name, Nullable<System.DateTime> update_at1)
        {
            var brand_ID1Parameter = brand_ID1.HasValue ?
                new ObjectParameter("brand_ID1", brand_ID1) :
                new ObjectParameter("brand_ID1", typeof(int));
    
            var brand_nameParameter = brand_name != null ?
                new ObjectParameter("brand_name", brand_name) :
                new ObjectParameter("brand_name", typeof(string));
    
            var update_at1Parameter = update_at1.HasValue ?
                new ObjectParameter("update_at1", update_at1) :
                new ObjectParameter("update_at1", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("update_brand", brand_ID1Parameter, brand_nameParameter, update_at1Parameter);
        }
    
        public virtual int update_category(Nullable<int> category_ID1, string category1_name, Nullable<System.DateTime> update_at1)
        {
            var category_ID1Parameter = category_ID1.HasValue ?
                new ObjectParameter("category_ID1", category_ID1) :
                new ObjectParameter("category_ID1", typeof(int));
    
            var category1_nameParameter = category1_name != null ?
                new ObjectParameter("category1_name", category1_name) :
                new ObjectParameter("category1_name", typeof(string));
    
            var update_at1Parameter = update_at1.HasValue ?
                new ObjectParameter("update_at1", update_at1) :
                new ObjectParameter("update_at1", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("update_category", category_ID1Parameter, category1_nameParameter, update_at1Parameter);
        }
    
        public virtual int updatStock(Nullable<int> id, Nullable<int> stock)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            var stockParameter = stock.HasValue ?
                new ObjectParameter("stock", stock) :
                new ObjectParameter("stock", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("updatStock", idParameter, stockParameter);
        }
    }
}