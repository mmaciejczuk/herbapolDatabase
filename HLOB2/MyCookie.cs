using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HLOB2
{
    public class MyCookie
    {
        public static string pobierzCookie(string cookieName)
        {
            string cookieVal = String.Empty;
            cookieVal = HttpContext.Current.Request.Cookies[cookieName].Value;
            return cookieVal;
        }

        public static void stworzCookie(string cookieName, string value, int? expirationDays)
        {
            HttpCookie Cookie = new HttpCookie(cookieName, value);
            if (expirationDays.HasValue)
                Cookie.Expires = DateTime.Now.AddDays(expirationDays.Value);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }

        public static void usunCookie(string cookieName)
        {
            HttpCookie Cookie = HttpContext.Current.Request.Cookies[cookieName];
            if (Cookie != null)
            {
                Cookie.Expires = DateTime.Now.AddDays(-2);
                HttpContext.Current.Response.Cookies.Add(Cookie);
            }
        }

        public static bool czyIstniejeCookie(string cookieName)
        {
            bool exists = false;
            HttpCookie cookie = HttpContext.Current.Request.Cookies[cookieName];
            if (cookie != null)
                exists = true;
            return exists;
        }

        public static Dictionary<string, string> pobierzWszystkieCookies()
        {
            Dictionary<string, string> cookies = new Dictionary<string, string>();
            foreach (string key in HttpContext.Current.Request.Cookies.AllKeys)
            {
                cookies.Add(key, HttpContext.Current.Request.Cookies[key].Value);
            }
            return cookies;
        }

        public static void usunWszystkieCookies()
        {
            var x = HttpContext.Current.Request.Cookies;
            foreach (HttpCookie cook in x)
            {
                usunCookie(cook.Name);
            }
        }
    }
}