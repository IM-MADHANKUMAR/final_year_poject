from flask import Flask,render_template,request,redirect,url_for
import mysql.connector
#import hashlib
import os

UPLOAD_FOLDER = 'static/file/'
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

mydb = mysql.connector.connect(host="localhost",user="root",password="",database="land")
mycursor = mydb.cursor()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/buyer')
def buyer():
    return render_template('buyer.html')

@app.route('/seller')
def seller():
    return render_template('seller.html')

@app.route('/admin')
def admin():
    return render_template('admin.html')

@app.route('/kings')
def kings():
    sql = 'SELECT * FROM `products`'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    return render_template('image_view.html',data=result)

@app.route('/buy_reg')
def buy_reg():
    return render_template('buyer_reg.html')

@app.route('/sell_reg')
def sell_reg():
    return render_template('seller_reg.html')

@app.route('/buyerreg',methods=['POST','GET'])
def buyerreg():
    if request.method == 'POST':
        name = request.form.get('username')
        gender = request.form.get('gender')
        mail = request.form.get('mail')
        phone = request.form.get('phone')
        password = request.form.get('password')
        sql = "INSERT INTO buyer (`name`, `gender`, `mail`, `phone`, `password`) VALUES (%s, %s, %s, %s, %s)"
        val = (name, gender, mail, phone, password)
        mycursor.execute(sql, val)
        mydb.commit()
        return render_template('buyer.html')

@app.route('/sellerreg',methods=['POST','GET'])
def sellerreg():
    if request.method == 'POST':
        name = request.form.get('username')
        gender = request.form.get('gender')
        mail = request.form.get('mail')
        phone = request.form.get('phone')
        password = request.form.get('password')
        # accno = request.form.get('accno')
        bran = request.form.get('bran')
        # image = request.form.get('img')
        sql = "INSERT INTO seller (`name`, `gender`, `mail`, `phone`, `password`) VALUES (%s, %s, %s, %s, %s)"
        val = (name, gender, mail, phone, password)
        mycursor.execute(sql, val)
        mydb.commit()
        return render_template('seller.html')

@app.route('/buyerval',methods=['POST','GET'])
def buyerval():
    global uname
    if request.method == 'POST':
        uname = request.form.get('username')
        upass = request.form.get('password')
        sql = 'SELECT * FROM `buyer` WHERE `name` = %s AND `password` = %s'
        val = (uname, upass)
        mycursor.execute(sql, val)
        result = mycursor.fetchone()
        if result:
            return redirect(url_for('buy_dash'))
        else:
            return render_template('buyer.html', msg = 'Invalid Data')

@app.route('/sellerval',methods=['POST','GET'])
def sellerval():
    global uname
    if request.method == 'POST':
        uname = request.form.get('username')
        upass = request.form.get('password')
        sql = 'SELECT * FROM `seller` WHERE `name` = %s AND `password` = %s'
        val = (uname, upass)
        mycursor.execute(sql, val)
        result = mycursor.fetchone()
        if result:
            return redirect(url_for('sell_dash'))
        else:
            return render_template('seller.html', msg = 'Invalid Data')

@app.route('/adminval',methods=['POST','GET'])
def adminval():
    if request.method == 'POST':
        uname = request.form.get('username')
        upass = request.form.get('password')
        if uname == 'admin' and upass == '1234':
            return redirect(url_for('admin_dash'))
        else:
            return render_template('admin.html', msg = 'Invalid Data')

@app.route('/buy_dash')
def buy_dash():
    sql = 'SELECT * FROM `products`'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    sql = 'SELECT `amount` FROM `account` WHERE `name` = %s'
    val = (uname,)
    mycursor.execute(sql, val)
    result1 = mycursor.fetchone()
    if result1:
        return render_template('buy_dashboard.html', value = result1[0], data = result)
    else:
        return render_template('buy_dashboard.html', value = 0, data = result)

@app.route('/admin_dash')
def admin_dash():
    return render_template('admin_dashboard.html')

@app.route('/buy_detail')
def buy_detail():
    sql = 'SELECT * FROM `buyer`'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    return render_template('data.html', data = result)

@app.route('/sell_dash')
def sell_dash():
    sql = 'SELECT `gender` FROM `seller` WHERE `name` = %s'
    val = (uname,)
    mycursor.execute(sql,val)
    result = mycursor.fetchone()
    return render_template('sell_dashboard.html',value = result[0])

# @app.route('/purchase',methods=['POST','GET'])
# def purchase():
#     if request.method == 'POST':
#         name = request.form.get('product')
#         seller = request.form.get('seller')
#         rate = request.form.get('rate')
#         sql = "INSERT INTO purchase (`seller`, `buyer`, `name`, `rate`) VALUES (%s, %s, %s, %s)"
#         val = (seller, uname, name, rate)
#         mycursor.execute(sql, val)
#         mydb.commit()
#         sql = 'SELECT `amount` FROM `account` WHERE `name` = %s'
#         val = (uname,)
#         mycursor.execute(sql, val)
#         result = mycursor.fetchone()
#         num = int(result[0])-int(rate)
#         sql = 'UPDATE `account` SET `amount` = %s WHERE `name` = %s'
#         val = (num, uname)
#         mycursor.execute(sql, val)
#         mydb.commit()
#         sql = 'SELECT `bal` FROM `seller` WHERE `name` = %s'
#         val = (seller,)
#         mycursor.execute(sql, val)
#         result = mycursor.fetchone()
#         num = int(result[0])+int(rate)
#         sql = 'UPDATE `seller` SET `bal` = %s WHERE `name` = %s'
#         val = (num, seller)
#         mycursor.execute(sql, val)
#         mydb.commit()
#         return redirect(url_for('buy_dash'))

# @app.route('/p_prod')
# def p_prod():
#     sql = 'SELECT * FROM `purchase` WHERE `buyer` = %s'
#     val = (uname,)
#     mycursor.execute(sql, val)
#     result = mycursor.fetchall()
#     sql = 'SELECT `amount` FROM `account` WHERE `name` = %s'
#     val = (uname,)
#     mycursor.execute(sql, val)
#     result1 = mycursor.fetchone()
#     if result1:
#         return render_template('purchased.html', data = result, value = result1[0])
#     else:
#         return render_template('purchased.html', data = result, value = 0)

# @app.route('/acc')
# def acc():
#     sql = 'SELECT `acc` FROM `buyer` WHERE `name`=%s'
#     val = (uname,)
#     mycursor.execute(sql, val)
#     result = mycursor.fetchone()
#     if result[0] == 'no':
#         sql = 'SELECT `amount` FROM `account` WHERE `name` = %s'
#         val = (uname,)
#         mycursor.execute(sql, val)
#         result1 = mycursor.fetchone()
#         if result1:
#             return render_template('account.html', view = 'style=display:block', value = result1[0])
#         else:
#             return render_template('account.html', view = 'style=display:block', value = 0)

#     else:
#         sql = 'SELECT * FROM `account` WHERE `name`=%s'
#         val = (uname,)
#         mycursor.execute(sql, val)
#         result = mycursor.fetchall()
#         sql = 'SELECT `amount` FROM `account` WHERE `name` = %s'
#         val = (uname,)
#         mycursor.execute(sql, val)
#         result1 = mycursor.fetchone()
#         if result1:
#             return render_template('account.html', view1 = 'style=display:block', data = result, value = result1[0])
#         else:
#             return render_template('account.html', view1 = 'style=display:block', data = result, value = 0)

# @app.route('/acc_details',methods = ['POST','GET'])
# def acc_details():
#     if request.method == 'POST':
#         name = request.form.get('name')
#         accno = request.form.get('accno')
#         bran = request.form.get('bran')
#         amt = request.form.get('amt')
#         sql = 'INSERT INTO `account` (`name`, `acc`, `branch`, `amount`) VALUES (%s, %s, %s, %s)'
#         val = (name, accno, bran, amt)
#         mycursor.execute(sql, val)
#         mydb.commit()
#         sql = 'UPDATE `buyer` SET `acc` = %s WHERE `name` = %s'
#         val = ('yes', uname)
#         mycursor.execute(sql, val)
#         mydb.commit()
#         return redirect(url_for('acc'))

@app.route('/add_prod',methods = ['POST','GET'])
def add_prod():
    if request.method == 'POST':
        name = uname
        land_type = request.form.get('land_type')
        img = request.files['img']
        cnum = request.form.get('cnum')

        snum = request.form.get('snum')
        taluk = request.form.get('taluk')
        district = request.form.get('district')
        state = request.form.get('state')
        amount = request.form.get('amt')
        area = request.form.get('area')
        desc = request.form.get('desc')
        prod_img = os.path.join(app.config['UPLOAD_FOLDER'], img.filename)
        img.save(prod_img)
        #hashid = hashlib.sha256(prod_type.encode()).hexdigest()
        hashid = 'none'
        # data = request.files['img'].read()
        # cursor.execute('INSERT INTO images (name, data) VALUES (?, ?)', (file.filename, data))
        # conn.commit()
        #     return 'File uploaded successfully'
        sql = 'INSERT INTO `products` (`name`, `land`, `img`, `cnum`, `snum`, `taluk`, `district`, `state`, `amt`, `area`, `desc`) VALUES (%s, %s, %s, %s, %s, %s,%s,%s,%s,%s, %s)'
        val = ( name, land_type, prod_img, cnum, snum,taluk,district,state,amount,area, desc)
        mycursor.execute(sql, val)
        mydb.commit()
        # sql = 'SELECT `bal` FROM `seller` WHERE `name` = %s'
        # val = (uname,)
        # mycursor.execute(sql,val)
        # result = mycursor.fetchone()
        #  value = result[0]
        return render_template('sell_dashboard.html',msg = 'Product Added')

@app.route('/sell_acc')
def sell_acc():
    sql = 'SELECT * FROM `seller` WHERE `name` = %s'
    val = (uname,)
    mycursor.execute(sql, val)
    result1 = mycursor.fetchall()
    sql = 'SELECT `gender` FROM `seller` WHERE `name` = %s'
    val = (uname,)
    mycursor.execute(sql,val)
    result = mycursor.fetchone()
    return render_template('sell_acc.html',data = result1, value = result[0])

@app.route('/view')
def view():

    sql = 'SELECT * FROM `bet` WHERE `name` = %s'
    val = (uname,)
    mycursor.execute(sql, val)
    result1 = mycursor.fetchall()
    sql = 'SELECT `gender` FROM `seller` WHERE `name` = %s'
    val = (uname,)
    mycursor.execute(sql,val)
    result = mycursor.fetchone()
    return render_template('view.html',data = result1, value = result[0])

@app.route('/viewed',methods = ['POST','GET'])
def view2():
    if request.method == 'POST':
        row_id = request.form.get('row_id')

        sql = 'SELECT * FROM `buyer` WHERE `name` = %s'
        val = (row_id,)
        mycursor.execute(sql, val)
        result1 = mycursor.fetchall()

        return render_template('view2.html',data = result1)

@app.route('/sell_detail')
def sell_detail():
    sql = 'SELECT * FROM `seller`'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    return render_template('data.html', data = result)

@app.route('/betp',methods = ['POST','GET'])
def betp():
    if request.method == 'POST':
        pamt = request.form.get('pamt')
        row_id = request.form.get('row_id')
        sql = "SELECT * FROM product WHERE row_id = %s"
        val = (row_id,)
        mycursor.execute(sql, val)
        row = mycursor.fetchall()
        if row is not None:
            # update the row with the input amount
            query = "UPDATE table_name SET pamt = %s WHERE row_id = %s"
            mycursor.execute(query, (pamt, row_id))
            mydb.commit()
            message = "Successfully updated row %s" % row_id
        else:
            message = "Row not found"
        return render_template('buyer.html',message=message)

@app.route('/betam',methods = ['POST','GET'])
def betam():
    pamt = request.form.get('pamt')
    name = request.form.get('name')
    contact = request.form.get('contact')
    survey = request.form.get('survey')
    amount = request.form.get('amount')

    sql = "SELECT * FROM products WHERE name = %s AND cnum = %s  AND snum = %s AND amt = %s"
    val = (name,contact,survey,amount)
    mycursor.execute(sql, val)
    row = mycursor.fetchall()
    print(row)

    if row:
        # If the row was found, insert the data into a new table
        print(row[0])
        insert_sql = 'INSERT INTO `bet` (`id`,`name`, `land`, `img`, `cnum`, `snum`, `taluk`, `district`, `state`, `amt`, `area`, `desc`,`bamount`,`uname`) VALUES (%s,%s, %s, %s, %s, %s, %s,%s,%s,%s,%s, %s,%s,%s)'
        insert_val = row[0] + (pamt,uname)
        mycursor.execute(insert_sql, insert_val)
        mydb.commit()
        return render_template('buyer.html')
    else:
        return "No matching row found"

@app.route('/super',methods = ['POST','GET'])
def super():
    pic = request.form.get('imgs')
    print(pic)
    return render_template('image.html',imgs=pic)

if __name__ == '__main__':
    app.run(debug=True,port=9000)