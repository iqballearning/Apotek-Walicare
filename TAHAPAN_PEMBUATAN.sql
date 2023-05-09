-- MEMBUAT DATABASE
create database apotekwalicare;

-- MELIHAT DATABASE YANG TELAH DIBUAT
show databases;

-- MEMAKAI/MENGAKSES DATABASE YANG TELAH DIBUAT
use apotekwalicare;

-- MEMBUAT TABEL (5 Tabel)

-- TABEL SUPPLIER DENGAN MENAMBAHKAN PRIMARY KEY
create table supplier(
kode_supplier varchar(7) not null,
nama_supplier varchar(30) not null,
no_telepon varchar(14) not null,
alamat varchar(250) not null,
primary key (kode_supplier)
);
-- UNTUK MELIHAT DESKRIPSI TABEL SUPPLIER
desc supplier;


-- TABEL OBAT DENGAN MENAMBAHKAN PRIMARY KEY
create table produkobat(
kode_obat varchar(7) not null,
nama_obat varchar(30) not null,
stok int not null,
satuan varchar(20) not null,
harga_beli decimal(10,2) not null,
harga_jual decimal(10,2) not null,
tanggal_kadaluarsa date not null,
primary key (kode_obat)
);
-- UNTUK MELIHAT DESKRIPSI TABEL PRODUK OBAT
desc produkobat;


-- TABEL PEMBELIAN DENGAN MENAMBAHKAN PRIMARY KEY
create table pembelian(
nomor_faktur varchar(10) not null,
tanggal_beli date not null,
total_pembelian decimal(10,2) not null,
kode_supplier varchar(7) not null,
nama_supplier varchar(30) not null,
primary key (nomor_faktur)
);


-- TABEL PEMBELIAN DETAIL DENGAN MENAMBAHKAN PRIMARY KEY
create table pembelian_detail(
kode_pembelian varchar(7) not null,
kode_obat varchar(7) not null,
nama_obat varchar(30) not null,
quantity_beli int not null,
harga_beli decimal(10,2) not null,
nomor_faktur varchar(10) not null,
primary key (kode_pembelian)
);

-- TABEL PENJUALAN
create table penjualan(
kode_obat varchar(7) not null,
nama_obat varchar(30) not null,
total_penjualan decimal(10,2) not null,
primary key(kode_obat)
);


-- TABEL PENJUALAN DETAIL DENGAN MENAMBAHKAN PRIMARY KEY
create table penjualan_detail(
nomor_nota int not null,
kode_penjualan varchar(7) not null,
kode_obat varchar(7) not null,
nama_obat varchar(30) not null,
quantity_jual int not null,
harga_jual decimal(10,2) not null,
tanggal_jual date not null,
primary key (nomor_nota, kode_penjualan)
);
-- UNTUK MELIHAT DESKRIPSI TABEL PENJUALAN DETAIL
desc penjualan_detail;


-- MENAMBAHKAN FOREIGN KEY KOLOM KODE_SUPPLIER PADA TABEL PEMBELIAN
alter table pembelian
add foreign key (kode_supplier) references supplier(kode_supplier);
-- UNTUK MELIHAT DESKRIPSI TABEL PEMBELIAN
desc pembelian;


-- MENAMBAHKAN FOREIGN KEY KOLOM NOMOR_FAKTUR PADA TABEL PEMBELIAN DETAIL
alter table pembelian_detail
add foreign key (nomor_faktur) references pembelian(nomor_faktur);
-- UNTUK MELIHAT DESKRIPSI TABEL PEMBELIAN DETAIL
desc pembelian_detail;

-- MENAMBAHKAN FOREIGN KEY KOLOM KODE OBAT PADA TABEL PENJUALAN DETAIL
alter table penjualan_detail
add foreign key (kode_obat) references penjualan(kode_obat);
-- UNTUK MELIHAT DESKRIPSI TABEL PEMBELIAN DETAIL
desc penjualan_detail;

