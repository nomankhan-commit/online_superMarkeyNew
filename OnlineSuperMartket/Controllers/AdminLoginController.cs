using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineSuperMartket.Models;
namespace OnlineSuperMartket.Controllers
{
    public class AdminLoginController : Controller
    {
        online_superMarket_systemEntities db = new online_superMarket_systemEntities();
        // GET: AdminLogin
        public ActionResult Index()
        {
            ViewBag.products = db.Products.ToList();
            ViewBag.brands = db.Brands.ToList();
            ViewBag.category = db.Categories.ToList();
            ViewBag.Vendor = db.users.Where(x => x.role_ID == 1).ToList();
            return View();
        }

        public JsonResult Login_form(user form_data)
        {
            var Login_checker = "Fail";
            var rorid = "";
            var db_result = db.users.Where(x => x.email == form_data.email && x.password == form_data.password && x.is_active == true).FirstOrDefault();

            if (db_result != null)
            {
                Session["UserID"] = db_result.userID.ToString();
                Session["Email"] = db_result.email.ToString();
                Session["FullName"] = db_result.first_name.ToString() + " " + db_result.last_name.ToString();
                Session["last_name"] = db_result.last_name.ToString();
                Session["Role_ID"] = db_result.role_ID.ToString();
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

    }
}