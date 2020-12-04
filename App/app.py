from flask import Flask, render_template, request
import mariadb
def get_conn():
   config = {
      'host': 'db',
      'port': 3306,
      'user': 'root',
      'password': 'P@ss1234',
      'database': 'QLBH'
   }
   conn = mariadb.connect(**config)
   return conn
# create the flask app
app = Flask(__name__,template_folder='Templates')

@app.route('/', methods=['GET'])
def index():
   return render_template('index.html')

@app.route('/users', methods=['GET'])
def users_info():
   conn = get_conn()
   cur = conn.cursor()
   cur.execute("select * from Users")
   data = cur.fetchall()
   conn.close()
   return render_template('user_table.html', data=data)

@app.route('/users', methods=['POST'])
def users_info_post():
   id = request.form['text']
   conn = get_conn()
   cur = conn.cursor()
   queryMess = """ DELETE FROM Users WHERE maKH="{}" ;""".format(id)
   cur.execute(queryMess)
   conn.commit()
   cur.execute("select * from Users")
   data = cur.fetchall()
   conn.close()
   return render_template('user_table.html',data=data)

@app.route('/create_users', methods=['GET','POST'])
def create_users():
   error = None
   conn = get_conn()
   cur = conn.cursor()
   if request.method =='POST':
        maKH = request.form['maKH']
        hoten = request.form['hoten']
        dchi = request.form['dchi']
        sodt = request.form['sodt']
        ngSinh = request.form['ngSinh']
        queryMess = """insert into Users (maKH,hoten,dchi,sodt,ngSinh,ngDK,doanhSo)
                        values('{}','{}','{}','{}','{}','1980-10-2',0);""".format(maKH,hoten,dchi,sodt,ngSinh)
        cur.execute(queryMess)
        conn.commit()
        conn.close()
   return render_template('create_users.html', error=error)

@app.route('/items',methods = ['GET'])
def sp_info():
   conn = get_conn()
   cur = conn.cursor()
   cur.execute("select * from SanPhams")
   data = cur.fetchall()
   conn.close()
   return render_template('item_table.html',data=data)

@app.route('/items', methods=['POST'])
def sp_info_post():
   id = request.form['text']
   conn = get_conn()
   cur = conn.cursor()
   queryMess = """ DELETE FROM SanPhams WHERE maSP="{}" ;""".format(id)
   cur.execute(queryMess)
   conn.commit()
   cur.execute("select * from SanPhams")
   data = cur.fetchall()
   conn.close()
   return render_template('item_table.html',data=data)

@app.route('/create_items', methods=['GET','POST'])
def create_items():
   error = None
   conn = get_conn()
   cur = conn.cursor()
   if request.method =='POST':
        maSP = request.form['maSP']
        tenSP = request.form['tenSP']
        dvt = request.form['dvt']
        gia = request.form['gia']
        loai_sp_masp = request.form['loai_sp_masp']
        queryMess = """insert into SanPhams (maSP,tenSP,dvt,gia,loai_sp_masp)
                        values('{}','{}','{}','{}','{}','1980-10-2',0);""".format(maSP,tenSP,dvt,gia,loai_sp_masp)
        cur.execute(queryMess)
        conn.commit()
        conn.close()
   return render_template('create_items.html', error=error)
@app.route('/loaisp', methods=['GET'])
def loaisp_info():
   conn = get_conn()
   cur = conn.cursor()
   cur.execute("select * from LoaiSPs")
   data = cur.fetchall()
   conn.close()
   return render_template('loaisp_table.html',data=data)
@app.route('/create_loaisp', methods=['GET','POST'])
def create_loaisp():
   error = None
   conn = get_conn()
   cur = conn.cursor()
   if request.method =='POST':
        maLoaiSp = request.form['loai_sp_masp']
        xuatXu = request.form['xuatXu']
        queryMess = """insert into SanPhams (loai_sp_masp,xuatXu)
                        values('{}','{}');""".format(maLoaiSp,xuatXu)
        cur.execute(queryMess)
        conn.commit()
        conn.close()
   return render_template('create_loaisp.html', error=error) 
@app.route('/hoadon', methods=['GET'])
def hoadon_info():
   conn = get_conn()
   cur = conn.cursor()
   cur.execute("select * from HoaDons")
   data = cur.fetchall()
   conn.close()
   return render_template('hoadon_table.html',data=data)
@app.route('/cthd', methods=['GET'])
def cthd_info():
   conn = get_conn()
   cur = conn.cursor()
   cur.execute("select * from CTHDs")
   data = cur.fetchall()
   conn.close()
   return render_template('cthd_table.html',data=data)
if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)
