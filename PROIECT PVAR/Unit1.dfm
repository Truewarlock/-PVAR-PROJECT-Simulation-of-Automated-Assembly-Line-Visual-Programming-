object Form1: TForm1
  Left = 295
  Top = 214
  Width = 928
  Height = 480
  HorzScrollBar.Position = 20
  Caption = '0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = -20
    Top = 8
    Width = 1369
    Height = 746
    AutoSize = True
  end
  object Image2: TImage
    Left = 792
    Top = 448
    Width = 161
    Height = 105
  end
  object Shape1: TShape
    Left = 1032
    Top = 456
    Width = 89
    Height = 65
  end
  object Label1: TLabel
    Left = 1040
    Top = 464
    Width = 78
    Height = 13
    Caption = 'Obiecte produse'
  end
  object Label2: TLabel
    Left = 1064
    Top = 496
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1timer
    Left = 720
    Top = 288
  end
end
