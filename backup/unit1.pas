unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFormMenuMakanan }

  TFormMenuMakanan = class(TForm)
    ButtonTampil: TButton;
    ButtonKeluar: TButton;
    dagingCheck: TCheckBox;
    ayamCheck: TCheckBox;
    HasilPrint: TMemo;
    TotalHarga: TEdit;
    HargaDaging: TEdit;
    HargaAyam: TEdit;
    HargaIkan: TEdit;
    HargaTahu: TEdit;
    HargaTempe: TEdit;
    Total: TLabel;
    ikanCheck: TCheckBox;
    tahuCheck: TCheckBox;
    tempeCheck: TCheckBox;
    laukCheckGroup: TCheckGroup;
    HargaMinuman: TEdit;
    minumComboBox: TComboBox;
    EditHargaNasi: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    nasiRadioGroup: TRadioGroup;
    nasiPutih: TRadioButton;
    nasiUduk: TRadioButton;
    nasiKuning: TRadioButton;
    nasiLiwet: TRadioButton;
    nasiGoreng: TRadioButton;
    procedure ayamCheckChange(Sender: TObject);
    procedure ButtonKeluarClick(Sender: TObject);
    procedure ButtonTampilClick(Sender: TObject);
    procedure dagingCheckChange(Sender: TObject);
    procedure HargaDagingChange(Sender: TObject);
    procedure HitungTotal;
    procedure HargaIkanChange(Sender: TObject);
    procedure TotalClick(Sender: TObject);
    procedure ikanCheckChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure minumComboBoxChange(Sender: TObject);
    procedure nasiGorengChange(Sender: TObject);
    procedure nasiKuningChange(Sender: TObject);
    procedure nasiLiwetChange(Sender: TObject);
    procedure nasiPutihChange(Sender: TObject);
    procedure nasiUdukChange(Sender: TObject);
    procedure tahuCheckChange(Sender: TObject);
    procedure tempeCheckChange(Sender: TObject);
    procedure TotalHargaChange(Sender: TObject);
  private

  public

  end;

var
  FormMenuMakanan: TFormMenuMakanan;

implementation

{$R *.lfm}

{ TFormMenuMakanan }

procedure TFormMenuMakanan.HitungTotal;
var
  jumlah: Integer;
begin
  jumlah := 0;

  // Tambahkan harga nasi yang dipilih
  if EditHargaNasi.Text <> '' then
    jumlah := jumlah + StrToInt(EditHargaNasi.Text);

  // Tambahkan harga minuman yang dipilih
  if HargaMinuman.Text <> '' then
    jumlah := jumlah + StrToInt(HargaMinuman.Text);

  // Tambahkan harga lauk yang dipilih
  if dagingCheck.Checked then
    jumlah := jumlah + StrToInt(HargaDaging.Text);
  if ayamCheck.Checked then
    jumlah := jumlah + StrToInt(HargaAyam.Text);
  if ikanCheck.Checked then
    jumlah := jumlah + StrToInt(HargaIkan.Text);
  if tahuCheck.Checked then
    jumlah := jumlah + StrToInt(HargaTahu.Text);
  if tempeCheck.Checked then
    jumlah := jumlah + StrToInt(HargaTempe.Text);

  // Tampilkan total harga di kolom TotalHarga
  TotalHarga.Text := IntToStr(jumlah);
end;

procedure TFormMenuMakanan.nasiPutihChange(Sender: TObject);
begin
   EditHargaNasi.Text := '5000';
   HitungTotal;
end;

procedure TFormMenuMakanan.nasiKuningChange(Sender: TObject);
begin
    EditHargaNasi.Text := '8000';
    HitungTotal;
end;

procedure TFormMenuMakanan.nasiGorengChange(Sender: TObject);
begin
    EditHargaNasi.Text := '10000';
    HitungTotal;
end;

procedure TFormMenuMakanan.Label2Click(Sender: TObject);
begin

end;

procedure TFormMenuMakanan.dagingCheckChange(Sender: TObject);
begin
  if dagingCheck.Checked then
    HargaDaging.Text := '15000'
  else
    HargaDaging.Clear;
  HitungTotal;
end;

procedure TFormMenuMakanan.HargaDagingChange(Sender: TObject);
begin

end;

procedure TFormMenuMakanan.HargaIkanChange(Sender: TObject);
begin

end;

procedure TFormMenuMakanan.TotalClick(Sender: TObject);
begin

end;

procedure TFormMenuMakanan.ikanCheckChange(Sender: TObject);
begin
  if ikanCheck.Checked then
    HargaIkan.Text := '8000'
  else
    HargaIkan.Clear;
  HitungTotal;
end;

procedure TFormMenuMakanan.ayamCheckChange(Sender: TObject);
begin
  if ayamCheck.Checked then
    HargaAyam.Text := '10000'
  else
    HargaAyam.Clear;
  HitungTotal;
end;

procedure TFormMenuMakanan.ButtonKeluarClick(Sender: TObject);
begin
  close;
end;

procedure TFormMenuMakanan.ButtonTampilClick(Sender: TObject);
begin
  HasilPrint.Clear;
  HasilPrint.Lines.Add('=== Pemesanan ===');

  // Nasi yang dipilih
  HasilPrint.Lines.Add('Nasi: ');
  if nasiPutih.Checked then
    HasilPrint.Lines.Add('  ' + nasiPutih.Caption + ' = ' + EditHargaNasi.Text);
  if nasiUduk.Checked then
    HasilPrint.Lines.Add('  ' + nasiUduk.Caption + ' = ' + EditHargaNasi.Text);
  if nasiKuning.Checked then
    HasilPrint.Lines.Add('  ' + nasiKuning.Caption + ' = ' + EditHargaNasi.Text);
  if nasiLiwet.Checked then
    HasilPrint.Lines.Add('  ' + nasiLiwet.Caption + ' = ' + EditHargaNasi.Text);
  if nasiGoreng.Checked then
    HasilPrint.Lines.Add('  ' + nasiGoreng.Caption + ' = ' + EditHargaNasi.Text);

  // Minuman yang dipilih
  if minumComboBox.ItemIndex >= 0 then
    HasilPrint.Lines.Add('Minuman = ' + minumComboBox.Items[minumComboBox.ItemIndex] + ' ' + HargaMinuman.Text[minumComboBox.ItemIndex])
  else
    HasilPrint.Lines.Add('Minuman = Tidak ada');

  // Lauk yang dipilih
  HasilPrint.Lines.Add('Lauk:');
  if dagingCheck.Checked then
    HasilPrint.Lines.Add('  Daging = ' + HargaDaging.Text);
  if ayamCheck.Checked then
    HasilPrint.Lines.Add('  Ayam = ' + HargaAyam.Text);
  if ikanCheck.Checked then
    HasilPrint.Lines.Add('  Ikan = ' + HargaIkan.Text);
  if tahuCheck.Checked then
    HasilPrint.Lines.Add('  Tahu = ' + HargaTahu.Text);
  if tempeCheck.Checked then
    HasilPrint.Lines.Add('  Tempe = ' + HargaTempe.Text);

  // Total harga
  HasilPrint.Lines.Add('Total Harga = ' + TotalHarga.Text);
end;

procedure TFormMenuMakanan.minumComboBoxChange(Sender: TObject);
begin
     case minumComboBox.ItemIndex of
    0: HargaMinuman.Text := '5000';  // Air Mineral
    1: HargaMinuman.Text := '5000';  // Es Teh Manis
    2: HargaMinuman.Text := '7000';  // Es Jeruk
    3: HargaMinuman.Text := '4000';  // Teh Anget
    4: HargaMinuman.Text := '3000';  // Es Teh Tawar
    5: HargaMinuman.Text := '4000';  // Es Kopi
  else
    HargaMinuman.Text := '0';  // Jika tidak ada pilihan yang dipilih
  end;
     HitungTotal;
end;

procedure TFormMenuMakanan.nasiLiwetChange(Sender: TObject);
begin
    EditHargaNasi.Text := '9000';
    HitungTotal;
end;

procedure TFormMenuMakanan.nasiUdukChange(Sender: TObject);
begin
    EditHargaNasi.Text := '7000';
    HitungTotal;
end;

procedure TFormMenuMakanan.tahuCheckChange(Sender: TObject);
begin
  if tahuCheck.Checked then
    HargaTahu.Text := '3000'
  else
    HargaTahu.Clear;
  HitungTotal;
end;

procedure TFormMenuMakanan.tempeCheckChange(Sender: TObject);
begin
  if tempeCheck.Checked then
    HargaTempe.Text := '3000'
  else
    HargaTempe.Clear;
  HitungTotal;
end;

procedure TFormMenuMakanan.TotalHargaChange(Sender: TObject);
begin
  HitungTotal;
end;

end.
