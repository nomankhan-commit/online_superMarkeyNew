﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineSuperMartket.Models;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using Newtonsoft.Json;

namespace OnlineSuperMartket.Controllers
{
    public class find_productController : Controller
    {
        int num = 0;
        public static int user_id { get; set; }
        online_superMarket_systemEntities db = new online_superMarket_systemEntities();
        AddToCart insertData = new AddToCart();
        
        
        // GET: find_product
        public ActionResult addToCart(int id)
        {
            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else if (Session["Role_ID"].ToString() == "1" || Session["Role_ID"].ToString() == "1009")
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else
            {

                var userid = Convert.ToInt32(Session["UserID"]);
                ViewBag.brands = db.Brands.Where(x => x.is_active == true).ToList();
                ViewBag.category = db.Categories.Where(x => x.is_active == true).ToList();
                ViewBag.products = db.Products.Where(x => x.is_active == true).ToList();
                ViewBag.sp_products = db.sp_Products(userid).ToList();
                ViewBag.Vendor = db.users.Where(x => x.role_ID == 1).ToList();
                user_id = Convert.ToInt32(Session["UserID"]);
                var id_user_ = Session["UserID"];

                if (id_user_ != null)
                {
                    var iddint = Convert.ToInt16(id_user_.ToString());

                    AddToCart  isAddtoCart =  db.AddToCarts.Where(x => x.Product_ID == id  && x.user_id_ == iddint && x.makeorder == false ).ToList().FirstOrDefault();
                    if (isAddtoCart == null)
                    {
                        // dynamic db_resutl = db.Products.Where(x => x.Product_ID == id && x.is_active == true).ToList().FirstOrDefault();

                        var db_resutl = db.Products.Where(x => x.Product_ID == id && x.is_active == true).ToList();

                        insertData.user_id_ = user_id;
                        insertData.Product_ID = db_resutl[0].Product_ID;
                        insertData.category_ID = db_resutl[0].category_ID;
                        insertData.brand_ID = db_resutl[0].brand_ID;
                        insertData.Product_name = db_resutl[0].Product_name;

                        insertData.Product_disc = db_resutl[0].Product_disc;
                        insertData.Product_code = db_resutl[0].Product_code;
                        insertData.whole_sale_price = db_resutl[0].whole_sale_price;
                        insertData.retail_price = db_resutl[0].retail_price;
                        insertData.stock = db_resutl[0].stock;

                        insertData.imgPath = db_resutl[0].imgPath;
                        insertData.create_at = db_resutl[0].create_at;
                        insertData.update_at = db_resutl[0].update_at;
                        insertData.is_active = db_resutl[0].is_active;
                        insertData.makeorder = false;

                        db.AddToCarts.Add(insertData);
                        db.SaveChanges();
                        num++;
                    }
                    else
                    {
                        return Json("already Addtocart", JsonRequestBehavior.AllowGet);
                    }
                    
                }
                else
                {

                    //return Redirect("~/Accounts/login_signup");
                    return Json("nullsession", JsonRequestBehavior.AllowGet);
                }
                var len = db.AddToCarts.Where(x => x.user_id_ == user_id && x.makeorder == false ).ToArray();
                var a = 0;
                for (int i = 0; i < len.Length; i++)
                {
                    a++;
                }
                int a_ = a;
                ViewBag.num_atc = a_;
                Session["count"] = a_.ToString();
                Session["count_"] = num;
                return Json(a_.ToString(), JsonRequestBehavior.AllowGet);
                //return View();

            }

            
        }


        public ActionResult cartView() {
            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else if (Session["Role_ID"].ToString() == "1" || Session["Role_ID"].ToString() == "1009")
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else
            {
                var userid = Convert.ToInt32(Session["UserID"]);
                ViewBag.brands = db.Brands.Where(x => x.is_active == true).ToList();
                ViewBag.category = db.Categories.Where(x => x.is_active == true).ToList();
                ViewBag.products = db.Products.Where(x => x.is_active == true).ToList();
                ViewBag.sp_products = db.sp_Products(userid).ToList();
                ViewBag.Vendor = db.users.Where(x => x.role_ID == 1).ToList();
                user_id = Convert.ToInt32(Session["UserID"]);

                var len = db.AddToCarts.Where(x => x.user_id_ == user_id && x.makeorder == false).ToList();
                int a = 0;
                var idddd = db.AddToCarts.Select(x=> new {x.Product_ID}).ToArray();
                foreach (var item in len)
                {
                    a += (int)item.retail_price;
                }
                if (user_id != null && user_id != 0)
                {
                    ViewBag.productidList = string.Join(",", db.AddToCarts.Select(p => new { p.Product_ID}).ToString());
                    ViewBag.data = len;
                    ViewBag.amount = a;
                    return View("cartProducts");

                }

                return Redirect("~/Accounts/login_signup");
            }


           


        }

        //-----------------//

     

            public ActionResult overQtyCheck(string [] idarray_, string [] qtyarray_)
        {

            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else if (Session["Role_ID"].ToString() == "1" || Session["Role_ID"].ToString() == "1009")
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else
            {

                AddToCart addtocart_ = new AddToCart();
                List<AddToCart> filterbyid = new List<AddToCart>();
                List<AddToCart> filterbyqty_ = new List<AddToCart>();

                var dbData = db.AddToCarts.ToList();

                for (int i = 0; i < idarray_.Length; i++)
                {
                    var idddd = idarray_[i];
                    var iddddqtt = qtyarray_[i] == "" ? "1" : qtyarray_[i];
                    List<AddToCart> sorted = dbData.Where(x => x.AddToCart_id == Convert.ToInt16(idddd) && x.stock < Convert.ToInt16(iddddqtt)).ToList();

                    foreach (var item in sorted)
                    {
                        AddToCart addtocart = new AddToCart();
                        addtocart.Product_name = item.Product_name;
                        addtocart.AddToCart_id = item.AddToCart_id;
                        addtocart.stock = item.stock;
                        filterbyid.Add(addtocart);
                    }

                }

                var json = JsonConvert.SerializeObject(filterbyid);

                return Json(json, JsonRequestBehavior.AllowGet);
                
            }

        }


        //----------------//
        public ActionResult carDelete(int id)
        {

            //if (Session["UserID"] == null || Session["UserID"].ToString() == "1" || Session["UserID"].ToString() == "1009")
            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else if ( Session["Role_ID"].ToString() == "1" || Session["Role_ID"].ToString() == "1009")
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else
            {
                var userid = Convert.ToInt32(Session["UserID"]);
                ViewBag.brands = db.Brands.Where(x => x.is_active == true).ToList();
                ViewBag.category = db.Categories.Where(x => x.is_active == true).ToList();
                ViewBag.products = db.Products.Where(x => x.is_active == true).ToList();
                ViewBag.sp_products = db.sp_Products(userid).ToList();
                ViewBag.Vendor = db.users.Where(x => x.role_ID == 1 ).ToList();
                user_id = Convert.ToInt32(Session["UserID"]);

                var len = db.AddToCarts.Where(x => x.user_id_ == user_id && x.makeorder == false).ToList();

                db.deletCart(id);

                int a = 0;

                foreach (var item in len)
                {
                    a += (int)item.retail_price;
                }
                if (user_id != null && user_id != 0)
                {
                    ViewBag.data = len;
                    ViewBag.amount = a;
                    return View("cartProducts");

                }

                return Redirect("~/Accounts/login_signup");

            }
                


        }


        public ActionResult makeorder(string [] pids, string amount, string  qty, string [] idQtyArray) {
            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            else if (Session["Role_ID"].ToString() == "1" || Session["Role_ID"].ToString() == "1009")
            {
                Session["UserID"] = null;
                Session["FullName"] = null;
                Session["last_name"] = null;
                Session["Role_ID"] = null;
                Session["userDetails"] = null;

                Session.Clear();
                Session.Abandon();
                return Redirect("~/Accounts/login_signup");
            }
            
            else
            {
                try
                {
                    List<Product> productsdetails = new List<Product>();
                    
                    var productsIDs = pids;
                    var useridd = int.Parse(Session["UserID"].ToString());
                    var customerDetails = db.users.Where(x => x.userID == useridd).ToList();
                    for (int i = 0; i < pids.Length; i++)
                    {
                        var aa = int.Parse(pids[i]);
                         productsdetails = db.Products.Where(x => x.Product_ID == aa).ToList();
                        string body = "You have an order against this products (product id = " + productsdetails[0].Product_ID + " ) \n products name (" + productsdetails[0].Product_name + ") \n amount = ( " + productsdetails[0].retail_price + ").\n Customer Address is (" + customerDetails[0].Address + ")";
                        var amt = 0;
                        var qtymil = (idQtyArray[i] == "0" ? 1 : Convert.ToInt16(idQtyArray[i]));
                        amt = productsdetails[0].retail_price * qtymil ;



                        var vQty = Convert.ToInt16(idQtyArray[i]) ;
                        order order = new order();

                        order.venderid = productsdetails[0].sellorID;
                        order.categoryid = productsdetails[0].category_ID;
                        order.productsid = productsdetails[0].Product_ID;
                        order.createAt = DateTime.Now;
                        order.productsAmount = amt; 
                        order.prductsname = productsdetails[0].Product_name;
                        order.categoryname = productsdetails[0].Category.category_name;
                        order.venderoname = productsdetails[0].sellorName;
                        order.customerid = useridd;
                        order.customernam = customerDetails[0].email;
                        order.isDispatch = false;
                        order.qty = Convert.ToInt16(idQtyArray[i] == "0" ? "1" : vQty.ToString());

                        db.orders.Add(order);
                        db.SaveChanges();
                        //db.updatStock(productsdetails[0].Product_ID,);
                        db.makeorder(useridd);
                        Emai("Order Notificationi ", productsdetails[0].sellorName.ToString(), body);
                        //  Emai("Order Notificationi ", "my@gmail.com", body);

                        string[] qtyarray = qty.Split(',');

                        for (int j = 0; j < qtyarray.Length; j++)
                        {
                            var abb = productsdetails[0].stock - Convert.ToInt16(qtyarray[i]);


                            
                            db.updatStock(productsdetails[0].Product_ID, abb);
                        }

                    }


                   

                    return Json(true, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(ex.ToString(), JsonRequestBehavior.AllowGet);
                }
            }
            

           

        }
        public void Emai(string subject, string reciever, string message)
        {
            string password_ = ConfigurationManager.AppSettings["passwordEmail"];
            string email = ConfigurationManager.AppSettings["Email"];
            try
            {
                if (ModelState.IsValid)
                {
                    var senderEmail = new MailAddress(email);
                    var receiverEmail = new MailAddress(reciever);
                    var password = password_;
                    var sub = subject;
                    var body = message;
                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(senderEmail.Address, password)
                    };
                    using (var mess = new MailMessage(senderEmail, receiverEmail)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(mess);
                    }

                }
            }
            catch (Exception)
            {
                ViewBag.Error = "Some Error";
            }
        }
    }
}