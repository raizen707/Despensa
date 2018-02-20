using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LoginUDEO.Models;

namespace LoginUDEO.Controllers
{
    public class bodegaProductosController : Controller
    {
        private DespensaEntities1 db = new DespensaEntities1();

        // GET: bodegaProductos
        public ActionResult Index()
        {
            var bodegaProducto = db.bodegaProducto.Include(b => b.Bodega).Include(b => b.estado1).Include(b => b.Producto);
            return View(bodegaProducto.ToList());
        }

        // GET: bodegaProductos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bodegaProducto bodegaProducto = db.bodegaProducto.Find(id);
            if (bodegaProducto == null)
            {
                return HttpNotFound();
            }
            return View(bodegaProducto);
        }

        // GET: bodegaProductos/Create
        public ActionResult Create()
        {
            ViewBag.idBodega = new SelectList(db.Bodega, "idBodega", "nombre");
            ViewBag.estado = new SelectList(db.estado, "idEstado", "nombreEstado");
            ViewBag.idProducto = new SelectList(db.Producto, "idProducto", "nombre");
            return View();
        }

        // POST: bodegaProductos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProducto,idBodega,cantidad,estado")] bodegaProducto bodegaProducto)
        {
            if (ModelState.IsValid)
            {
                db.bodegaProducto.Add(bodegaProducto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idBodega = new SelectList(db.Bodega, "idBodega", "nombre", bodegaProducto.idBodega);
            ViewBag.estado = new SelectList(db.estado, "idEstado", "nombreEstado", bodegaProducto.estado);
            ViewBag.idProducto = new SelectList(db.Producto, "idProducto", "nombre", bodegaProducto.idProducto);
            return View(bodegaProducto);
        }

        // GET: bodegaProductos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bodegaProducto bodegaProducto = db.bodegaProducto.Find(id);
            if (bodegaProducto == null)
            {
                return HttpNotFound();
            }
            ViewBag.idBodega = new SelectList(db.Bodega, "idBodega", "nombre", bodegaProducto.idBodega);
            ViewBag.estado = new SelectList(db.estado, "idEstado", "nombreEstado", bodegaProducto.estado);
            ViewBag.idProducto = new SelectList(db.Producto, "idProducto", "nombre", bodegaProducto.idProducto);
            return View(bodegaProducto);
        }

        // POST: bodegaProductos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProducto,idBodega,cantidad,estado")] bodegaProducto bodegaProducto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bodegaProducto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idBodega = new SelectList(db.Bodega, "idBodega", "nombre", bodegaProducto.idBodega);
            ViewBag.estado = new SelectList(db.estado, "idEstado", "nombreEstado", bodegaProducto.estado);
            ViewBag.idProducto = new SelectList(db.Producto, "idProducto", "nombre", bodegaProducto.idProducto);
            return View(bodegaProducto);
        }

        // GET: bodegaProductos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bodegaProducto bodegaProducto = db.bodegaProducto.Find(id);
            if (bodegaProducto == null)
            {
                return HttpNotFound();
            }
            return View(bodegaProducto);
        }

        // POST: bodegaProductos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            bodegaProducto bodegaProducto = db.bodegaProducto.Find(id);
            db.bodegaProducto.Remove(bodegaProducto);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
