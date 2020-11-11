using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineSuperMartket.Models;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using Newtonsoft.Json;

namespace OnlineSuperMartket.Controllers
{
    public class vendorController : Controller
    {
        bool status = false;
        online_superMarket_systemEntities db = new online_superMarket_systemEntities();
        // GET: vendor
        public ActionResult signup()
        {
            ViewBag.products = db.Products.ToList();
            ViewBag.brands = db.Brands.ToList();
            ViewBag.category = db.Categories.ToList();
            ViewBag.Vendor = db.users.Where(x => x.role_ID == 1).ToList();
            return View();
        }
        [HttpPost]
        public ActionResult getRegister(user formData) {


            status = false;
         

            var db_result = db.users.Where(x => x.email == formData.email).FirstOrDefault();

            if (db_result == null)
            {

                formData.role_ID = 1;
                formData.is_active = false;
                formData.create_at = DateTime.Now;

                db.users.Add(formData);
                db.SaveChanges();

                var db_result_ = db.users.Where(x => x.email == formData.email).FirstOrDefault();
                var isactive = db_result_.is_active == true ? "true" : "false";
                Session["UserID"] = db_result_.userID.ToString();
                Session["FullName"] = db_result_.first_name.ToString() + " " + db_result_.last_name.ToString();
                Session["last_name"] = db_result_.last_name.ToString();
                Session["Role_ID"] = db_result_.role_ID.ToString();
                Session["userDetails"] = Convert.ToString(db_result_);
                Session["isActive"] = isactive;

                status = true;
                //Emai(string subject, string reciever, string message);
                //string emailBody = "<h2>Sellor Registeration Alert</h2></br><h5>Id</h5>"+ Session["UserID"].ToString() + "</br><h5>Email</h5>"+ db_result_ .email.ToString()+ ""; 
                string emailBody = "new "+db_result_.email.ToString()+ " vendor has registered. please approve/reject to enable his access level in the application. http://localhost:31574/Accounts/login_signup '";

                string email_ = ConfigurationManager.AppSettings["Email"];
                Emai("testing", email_ , emailBody);

            }

            if (db_result != null)
            {

                status = false;

            }


            ///---------------

            // return Json(new { status, isInternalUser}, JsonRequestBehavior.AllowGet);
            return Json(status, JsonRequestBehavior.AllowGet);
        }

        public JsonResult checkAvailability(string shopname) {
            string[] response  ;
            var db_result = db.users.Where(x => x.shopname == shopname).FirstOrDefault();

            if (db_result != null)
            {
                response = new string[] {"shopname","present"} ;
                return Json(response, JsonRequestBehavior.AllowGet);

            }
            else
            {
                response = new string[] { "shopname", "not present" };
                return Json(response, JsonRequestBehavior.AllowGet);
            }

              

        }

        public JsonResult Login_form(user form_data)
        {
            var Login_checker = "Fail";
            var rorid = "";
            var db_result = db.users.Where(x => x.email == form_data.email && x.password == form_data.password && x.is_active == true).FirstOrDefault();
            //  if (db_result != null && db_result.role_ID != 4)
            if (db_result != null && db_result.role_ID == 1)
            {
                Session["UserID"] = db_result.userID.ToString();
                Session["Email"] = db_result.email.ToString();
                Session["FullName"] = db_result.first_name.ToString() + " " + db_result.last_name.ToString();
                Session["last_name"] = db_result.last_name.ToString();
                Session["Role_ID"] = db_result.role_ID.ToString();
                Session["isActive"] = db_result.is_active == true ? "true" : "false";
                //Session["userDetails"] = Convert.ToString(db_result);
                //if (db_result.role_ID.ToString()=="1")
                //{
                //    button = "<a href='@Url.Action('CreateUsers', 'Accounts')' target='_blank'>Create Users</a>";
                //}

                //if (db_result.role_ID.ToString() == "2")
                //{
                //    //
                //    button = "<a href='@Url.Action('CreateUsers', 'Accounts')' target='_blank' style='display: none'>Create Users</a>";
                //}

                //if (db_result.role_ID.ToString() == "3")
                //{
                //    button = "<a href='@Url.Action('CreateUsers', 'Accounts')' target='_blank' style='display: none'>Create Users</a>";
                //}

                //if (db_result.role_ID.ToString() == "4")
                //{
                //    button = "<a href='@Url.Action('CreateUsers', 'Accounts')' target='_blank' style='display: none'>Create Users</a>";
                //}

                //if (db_result.role_ID.ToString() == "5")
                //{
                //    button = "<a href='@Url.Action('CreateUsers', 'Accounts')' target='_blank' style='display: none'>Create Users</a>";
                //}


                //  return Json(new { success = false, responseText = "Your Password or email is incorrect." }, JsonRequestBehavior.AllowGet);
                Login_checker = "Success";
                rorid = Session["Role_ID"].ToString();
            }




            object[] dataaaa = { Login_checker, rorid };

            return Json(dataaaa, JsonRequestBehavior.AllowGet);


        }
        public ActionResult firstScreen()
        {

            return View();
        }


        public ActionResult orderslist() {

            int userID = Convert.ToInt32(Session["UserID"]);
            ViewBag.brands = db.Brands.Where(x => x.is_active == true).ToList();
            ViewBag.category = db.Categories.Where(x => x.is_active == true).ToList();
            ViewBag.products = db.Products.Where(x => x.is_active == true).ToList();
            ViewBag.sp_products = db.sp_Products(userID).ToList();
            ViewBag.Vendor = db.users.Where(x => x.role_ID == 1).ToList();

            ViewBag.orders =  db.orders.Where(x => x.venderid == userID).ToList();
            return View();

        }


        public JsonResult customerDetails(int ? id) {

            //var details = db.users.Where(x=>x.userID == id).ToList();

            //var details_ = details[0].email + "," + details[0].first_name + " " + details[0].last_name + "," + details[0].Mobile + "," + details[0].Address.Replace(","," "); 


            var list = db.customerDetails(id).ToList();



            var list_ = JsonConvert.SerializeObject(list);

            return Json(list_, JsonRequestBehavior.AllowGet);


        }

        public ActionResult makeDispatch(int ? id) {

            if (string.IsNullOrEmpty(Session["UserID"] as string))
            {
                return Redirect("~/vendor/signup");
            }
            else
            {
                int userID = Convert.ToInt32(Session["UserID"]);
                db.completeOrder(userID,id);
                return Redirect("~/vendor/orderslist");
            }
        }

        public void Emai(string subject, string reciever,string message) {
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